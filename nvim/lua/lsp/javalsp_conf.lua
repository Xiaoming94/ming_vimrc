vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = vim.fn.expand("~/.cache/jdtls/") .. project_name
		local lombok_jar = vim.fn.expand("~/.local/lib/lombok.jar")

		local cmd = { "jdtls", "-data", workspace_dir }
		if vim.fn.filereadable(lombok_jar) == 1 then
			vim.list_extend(cmd, { "--jvm-arg=-javaagent:" .. lombok_jar })
		end

		require("jdtls").start_or_attach({
			cmd = cmd,
			root_dir = require("jdtls.setup").find_root({
				"gradlew",
				"mvnw",
				"pom.xml",
				"build.gradle",
				"build.gradle.kts",
				".git",
			}),
		})
	end,
})
