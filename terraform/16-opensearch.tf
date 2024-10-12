/*********************** with Command line ********************/
# helm upgrade -i opensearch-master  opensearch/opensearch --namespace opensearch --create-namespace -f ./values/opensearch-master.yaml
# helm upgrade -i opensearch-data  opensearch/opensearch --namespace opensearch --create-namespace -f ./values/opensearch-data.yaml
# helm upgrade -i opensearch-dashboard  opensearch/opensearch --namespace opensearch --create-namespace -f ./values/opensearch-datashboard.yaml

/*************************** OR *****************/

resource "helm_release" "opensearch-master" {
  name = "opensearch-master"

  repository = "https://opensearch-project.github.io/helm-charts/"
  chart = "opensearch"
  namespace = "opensearch"
  create_namespace = true
  values = [ file("${path.module}/values/opensearch-master.yaml") ]

  depends_on = [ aws_eks_node_group.general ]
}

resource "helm_release" "opensearch-data" {
  name = "opensearch-data"

  repository = "https://opensearch-project.github.io/helm-charts/"
  chart = "opensearch"
  namespace = "opensearch"
  create_namespace = true
  values = [ file("${path.module}/values/opensearch-data.yaml") ]

  depends_on = [ aws_eks_node_group.general ]
}

resource "helm_release" "opensearch-dashboard" {
  name = "opensearch-dashboard"

  repository = "https://opensearch-project.github.io/helm-charts/"
  chart = "opensearch"
  namespace = "opensearch"
  create_namespace = true
  values = [ file("${path.module}/values/opensearch-dashboard.yaml") ]

  depends_on = [ aws_eks_node_group.general ]
}