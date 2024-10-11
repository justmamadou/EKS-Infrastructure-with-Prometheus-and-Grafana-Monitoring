resource "helm_release" "monitoring" {
  name = "monitoring"

  repository = "https://grafana.github.io/helm-charts"
  chart = "loki-stack"
  namespace = "monitoring"
  create_namespace = true

  values = [ file("${path.module}/values/loki-stack-values.yml") ]

  depends_on = [ aws_eks_node_group.general ]
}