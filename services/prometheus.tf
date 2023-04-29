resource "helm_release" "kube_prometheus" {
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"

  chart = "kube-prometheus-stack"

  namespace = "monitoring"
  create_namespace = true

  values = [
    # customize values here
  ]
}