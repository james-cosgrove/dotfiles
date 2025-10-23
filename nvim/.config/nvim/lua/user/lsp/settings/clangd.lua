return {
  settings = {
    cmd = { "clangd" },
    filetypes = { "swift", "objective-c", "objective-cpp" },
    root_dir = "/usr/bin/clangd",
    ['*'] = {
      compilationDatabaseDirectory = "build";
      index = {
        threads = 0;
      },
      clangdFileStatus = true;
    },
    cpp = {
      excludeArgs = {"-fno-gnu-like-long-double"};
      hints = {
        arraySubsetThreshold = 1000;
        varDeclExcludePrefixes = {"ui_", "m_"};
      },
    },
  }
}
