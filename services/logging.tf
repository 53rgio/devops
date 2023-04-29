resource "helm_release" "eck" {
  name       = "eck"
  namespace  = "eck-operator"
  repository = "https://helm.elastic.co"
  chart      = "eck-operator"
  force_update = true
  dependency_update = true
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "helm_release" "elasticsearch" {
  name       = "elasticsearch"
  namespace  = "logging"
  repository = "https://helm.elastic.co"
  chart      = "elasticsearch"
  force_update = true
  dependency_update = true
  create_namespace = true
  values     = [file("${path.module}/values/es-values.yaml")]
}


resource "helm_release" "kibana" {
  name       = "kibana"
  namespace  = "logging"
  repository = "https://helm.elastic.co"
  chart      = "kibana"
  force_update = true
  dependency_update = true
  create_namespace = true
  values     = [file("${path.module}/values/kibana-values.yaml")]
}

resource "helm_release" "logstash" {
  name       = "logstash"
  namespace  = "logging"
  repository = "https://helm.elastic.co"
  chart      = "logstash"
  force_update = true
  dependency_update = true
  create_namespace = true
  values     = [file("${path.module}/values/logstash-values.yaml")]
}


resource "helm_release" "filebeat" {
  name       = "filebeat"
  namespace  = "logging"
  repository = "https://helm.elastic.co"
  chart      = "filebeat"
  force_update = true
  dependency_update = true
  create_namespace = true
  values     = [file("${path.module}/values/filebeat-values.yaml")]
}