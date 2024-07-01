import {
  id = "locations/${var.region_name}/namespaces/${var.project_id}/services/staging-application-alessadelisio"
  to = module.staging_application.google_cloud_run_service.service
}

import {
  id = "locations/${var.region_name}/namespaces/${var.project_id}/services/production-application-alessadelisio"
  to = module.production_application.google_cloud_run_service.service
}
