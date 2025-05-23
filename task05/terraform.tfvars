resource_groups = {
  rg1 = {
    name     = "cmaz-5uxy4opu-mod5-rg-01"
    location = "westus"
  }
  rg2 = {
    name     = "cmaz-5uxy4opu-mod5-rg-02"
    location = "westus2"
  }
  rg3 = {
    name     = "cmaz-5uxy4opu-mod5-rg-03"
    location = "centralus"
  }
}
 
app_service_plans = {
  asp1 = {
    name         = "cmaz-5uxy4opu-mod5-asp-01"
    sku          = "P0v3"
    worker_count = 2
  }
  asp2 = {
    name         = "cmaz-5uxy4opu-mod5-asp-02"
    sku          = "P1v3"
    worker_count = 1
  }
}
 
app_services = {
  app1 = {
    name = "cmaz-5uxy4opu-mod5-app-01"
  }
  app2 = {
    name = "cmaz-5uxy4opu-mod5-app-02"
  }
}
 
traffic_manager = {
  name           = "cmaz-5uxy4opu-mod5-traf"
  routing_method = "Performance"
}
 
tags = {
  Creator = "tarunkumar_singh@epam.com"
}
 
ip_restrictions = [
  {
    name       = "allow-ip"
    priority   = 100
    ip_address = "18.153.146.156/32"
  },
  {
    name        = "allow-tm"
    priority    = 200
    service_tag = "AzureTrafficManager"
  }
]
