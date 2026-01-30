resource_groups = {
  rg1 = { name = "cmaz-12nxowyz-mod5-rg-01", location = "francecentral" }
  rg2 = { name = "cmaz-12nxowyz-mod5-rg-02", location = "germanywestcentral" }
  rg3 = { name = "cmaz-12nxowyz-mod5-rg-03", location = "uaenorth" }
}

app_configs = {
  app1 = {
    asp_name     = "cmaz-12nxowyz-mod5-asp-01"
    sku          = "S1"
    worker_count = 2
    app_name     = "cmaz-12nxowyz-mod5-app-01"
    rg_key       = "rg1"
  }
  app2 = {
    asp_name     = "cmaz-12nxowyz-mod5-asp-02"
    sku          = "S1"
    worker_count = 1
    app_name     = "cmaz-12nxowyz-mod5-app-02"
    rg_key       = "rg2"
  }
}

tm_name         = "cmaz-12nxowyz-mod5-traf"
verification_ip = "18.153.146.156"
common_tags     = { Creator = "onur_atalik@epam.com" }