# Resource Groups
module "resource_group_1" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_groups.rg1.name
  location            = var.resource_groups.rg1.location
  tags                = var.tags
}

module "resource_group_2" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_groups.rg2.name
  location            = var.resource_groups.rg2.location
  tags                = var.tags
}

module "resource_group_3" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_groups.rg3.name
  location            = var.resource_groups.rg3.location
  tags                = var.tags
}

# App Service Plans
module "app_service_plan_1" {
  source                = "./modules/app_service_plan"
  app_service_plan_name = var.app_service_plans.asp1.name
  resource_group_name   = module.resource_group_1.resource_group_name
  location              = module.resource_group_1.resource_group_location
  sku_name              = var.app_service_plans.asp1.sku
  worker_count          = var.app_service_plans.asp1.worker_count
  tags                  = var.tags

  depends_on = [
    module.resource_group_1
  ]
}

module "app_service_plan_2" {
  source                = "./modules/app_service_plan"
  app_service_plan_name = var.app_service_plans.asp2.name
  resource_group_name   = module.resource_group_2.resource_group_name
  location              = module.resource_group_2.resource_group_location
  sku_name              = var.app_service_plans.asp2.sku
  worker_count          = var.app_service_plans.asp2.worker_count
  tags                  = var.tags

  depends_on = [
    module.resource_group_2
  ]
}

# App Services
module "app_service_1" {
  source              = "./modules/app_service"
  app_service_name    = var.app_services.app1.name
  resource_group_name = module.resource_group_1.resource_group_name
  location            = module.resource_group_1.resource_group_location
  app_service_plan_id = module.app_service_plan_1.app_service_plan_id
  ip_restrictions     = var.ip_restrictions
  tags                = var.tags

  depends_on = [
    module.resource_group_1,
    module.app_service_plan_1
  ]
}

module "app_service_2" {
  source              = "./modules/app_service"
  app_service_name    = var.app_services.app2.name
  resource_group_name = module.resource_group_2.resource_group_name
  location            = module.resource_group_2.resource_group_location
  app_service_plan_id = module.app_service_plan_2.app_service_plan_id
  ip_restrictions     = var.ip_restrictions
  tags                = var.tags

  depends_on = [
    module.resource_group_2,
    module.app_service_plan_2
  ]
}

# Traffic Manager
module "traffic_manager" {
  source               = "./modules/traffic_manager"
  traffic_manager_name = var.traffic_manager.name
  resource_group_name  = module.resource_group_3.resource_group_name
  routing_method       = var.traffic_manager.routing_method
  endpoints = [
    {
      name           = var.app_services.app1.name
      app_service_id = module.app_service_1.app_service_id
      weight         = 1
    },
    {
      name           = var.app_services.app2.name
      app_service_id = module.app_service_2.app_service_id
      weight         = 1
    }
  ]
  tags = var.tags

  depends_on = [
    module.resource_group_3,
    module.app_service_1,
    module.app_service_2
  ]
}
