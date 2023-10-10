local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local lspconfig = require("lspconfig")

-- python LSP configuration
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

-- Java LSP configuration
-- lspconfig.jdtls.setup({
--   cmd = {
--     "java",
--         "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--         "-Dosgi.bundles.defaultStartLevel=4",
--         "-Declipse.product=org.eclipse.jdt.ls.core.product",
--         "-Dlog.level=ALL",
--         "-Xmx1G",
--         --add-modules=ALL-SYSTEM \
--         --add-opens java.base/java.util=ALL-UNNAMED \
--         --add-opens java.base/java.lang=ALL-UNNAMED \
--         "-javaagent:", "$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar",
--         "-jar", vim.fn.glob("$HOME/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
--         "-configuration",  "$HOME/.local/share/nvim/mason/packages/jdtls/config_linux/",
--         "-data", vim.fn.expand("$HOME/jdtls-workspace/") .. workspace_dir,
--   },
--     root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "build.gradle", ".classpath"),
--     on_attach = on_attach,
--     capabilities = capabilities
-- })

lspconfig.jdtls.setup({
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.level=ALL",
    "-Xmx1G",
    "-javaagent:", "$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar",
    "-jar", vim.fn.glob("$HOME/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",  "$HOME/.local/share/nvim/mason/packages/jdtls/config_linux/",
    "-data", vim.fn.expand("$HOME/jdtls-workspace/") .. workspace_dir,
  },
    root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "build.gradle", ".classpath"),
    on_attach = on_attach,
    capabilities = capabilities
})

