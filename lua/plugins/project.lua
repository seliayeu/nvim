return {
  'ahmedkhalf/project.nvim',
  dependencies = {
    'nvim-tree/nvim-tree.lua',
  },
  config = function()
    require("project_nvim")
  end
}
