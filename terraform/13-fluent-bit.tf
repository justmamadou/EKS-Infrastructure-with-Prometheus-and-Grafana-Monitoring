resource "helm_release" "metrics_server" {
  name = "monitoring"

  repository = "https://fluent.github.io/helm-charts"
  chart = "fluent-bit"
  namespace = "fluent"
  create_namespace = true

  values = [ file("${path.module}/values/fluent-bit-values.yml") ]

  depends_on = [ aws_eks_node_group.general ]
}