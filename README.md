# EKS-Infrastructure-with-Prometheus-and-Grafana-Monitoring

This repository contains Terraform code to create an Amazon EKS cluster with integrated Prometheus and Grafana monitoring. The infrastructure is deployed across three Availability Zones (AZs) for high availability.

## Architecture Diagram

![EKS Architecture](![image](https://github.com/user-attachments/assets/8b4bbe81-662a-4eef-9e86-dabfe88a0433)
)

## Overview

The infrastructure consists of the following components:

- **Amazon EKS Cluster**: Managed Kubernetes cluster.
- **VPC**: Virtual Private Cloud with public and private subnets across three AZs.
- **NAT Gateway**: Allows instances in the private subnets to access the internet.
- **Load Balancer**: Distributes incoming traffic to the EKS cluster.
- **Ingress**: Manages external access to the services in the EKS cluster.
- **Fluent-bit**: Collects logs from the cluster and sends them to OpenSearch for aggregation.
- **Node Exporter**: Exposes hardware and OS metrics to Prometheus.
- **Prometheus**: Collects and stores metrics from the cluster.
- **Grafana**: Visualizes metrics collected by Prometheus
