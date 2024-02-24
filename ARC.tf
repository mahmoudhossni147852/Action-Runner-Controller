locals {
  ARC_namespace = "action"
  ARC_version   = "0.23.7"
  ARC_chart     = "actions-runner-controller"
  ARC_repository= "https://actions-runner-controller.github.io/actions-runner-controller"
}
provider "kubernetes" {
  host                   = "https://127.0.0.1:58416"
}
provider "helm" {
  kubernetes {
    config_path = "C:\\Users\\Lenovo\\.kube\\config"  # Adjust this path if needed
  
  }
}
resource "helm_release" "actions_runner_controller" {
  name       = "actions-runner-controller"
  repository = local.ARC_repository
  chart      = local.ARC_chart
  namespace  = local.ARC_namespace
  version    = local.ARC_version
  
  values = [
    templatefile("${path.module}/ARC.yaml", {})
  ]
}
#The values attribute within the helm_release block allows you to specify a list of values to be passed to 
#the Helm chart during installation. These values are typically defined in a separate YAML file 
#that contains configuration settings for the Helm chart.


