resource "helm_release" "loki" {
  name = "loki"

  repository = "https://grafana.github.io/helm-charts"
  chart = "loki-stack"
  namespace = "loki"
  create_namespace = true

  #values = [ file("${path.module}/values/loki-stack-values.yml") ]

  set {
    name = "grafana.enabled"
    value = true
  }

  set {
    name = "fluent-bit.enabled"
    value = true 
  }

  depends_on = [ aws_eks_node_group.general ]
}