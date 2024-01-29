option = {
  max_count = {}, -- not ready yet
  enable_on = {
    "html",
    "typescript",
    "php",
  }, -- set the file types you want the plugin to work on
  file_extensions = {
    "html",
    "css",
    "sass",
    "less",
    "php",
    "js",
    "ts",
  }, -- set the local filetypes from which you want to derive classes
  style_sheets = {
    -- example of remote styles, only css no js for now
    "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
    "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
  },
}
