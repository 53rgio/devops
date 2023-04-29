locals {
  cluster_name                 = "public-k8s.henriques.live"
  master_autoscaling_group_ids = [aws_autoscaling_group.control-plane-us-east-1a-masters-public-k8s-henriques-live.id, aws_autoscaling_group.control-plane-us-east-1b-masters-public-k8s-henriques-live.id, aws_autoscaling_group.control-plane-us-east-1c-masters-public-k8s-henriques-live.id]
  master_security_group_ids    = [aws_security_group.masters-public-k8s-henriques-live.id]
  masters_role_arn             = aws_iam_role.masters-public-k8s-henriques-live.arn
  masters_role_name            = aws_iam_role.masters-public-k8s-henriques-live.name
  node_autoscaling_group_ids   = [aws_autoscaling_group.nodes-us-east-1a-public-k8s-henriques-live.id, aws_autoscaling_group.nodes-us-east-1b-public-k8s-henriques-live.id, aws_autoscaling_group.nodes-us-east-1c-public-k8s-henriques-live.id]
  node_security_group_ids      = [aws_security_group.nodes-public-k8s-henriques-live.id]
  node_subnet_ids              = [aws_subnet.us-east-1a-public-k8s-henriques-live.id, aws_subnet.us-east-1b-public-k8s-henriques-live.id, aws_subnet.us-east-1c-public-k8s-henriques-live.id]
  nodes_role_arn               = aws_iam_role.nodes-public-k8s-henriques-live.arn
  nodes_role_name              = aws_iam_role.nodes-public-k8s-henriques-live.name
  region                       = "us-east-1"
  route_table_public_id        = aws_route_table.public-k8s-henriques-live.id
  subnet_us-east-1a_id         = aws_subnet.us-east-1a-public-k8s-henriques-live.id
  subnet_us-east-1b_id         = aws_subnet.us-east-1b-public-k8s-henriques-live.id
  subnet_us-east-1c_id         = aws_subnet.us-east-1c-public-k8s-henriques-live.id
  vpc_cidr_block               = aws_vpc.public-k8s-henriques-live.cidr_block
  vpc_id                       = aws_vpc.public-k8s-henriques-live.id
  vpc_ipv6_cidr_block          = aws_vpc.public-k8s-henriques-live.ipv6_cidr_block
  vpc_ipv6_cidr_length         = local.vpc_ipv6_cidr_block == null ? null : tonumber(regex(".*/(\\d+)", local.vpc_ipv6_cidr_block)[0])
}

output "cluster_name" {
  value = "public-k8s.henriques.live"
}

output "master_autoscaling_group_ids" {
  value = [aws_autoscaling_group.control-plane-us-east-1a-masters-public-k8s-henriques-live.id, aws_autoscaling_group.control-plane-us-east-1b-masters-public-k8s-henriques-live.id, aws_autoscaling_group.control-plane-us-east-1c-masters-public-k8s-henriques-live.id]
}

output "master_security_group_ids" {
  value = [aws_security_group.masters-public-k8s-henriques-live.id]
}

output "masters_role_arn" {
  value = aws_iam_role.masters-public-k8s-henriques-live.arn
}

output "masters_role_name" {
  value = aws_iam_role.masters-public-k8s-henriques-live.name
}

output "node_autoscaling_group_ids" {
  value = [aws_autoscaling_group.nodes-us-east-1a-public-k8s-henriques-live.id, aws_autoscaling_group.nodes-us-east-1b-public-k8s-henriques-live.id, aws_autoscaling_group.nodes-us-east-1c-public-k8s-henriques-live.id]
}

output "node_security_group_ids" {
  value = [aws_security_group.nodes-public-k8s-henriques-live.id]
}

output "node_subnet_ids" {
  value = [aws_subnet.us-east-1a-public-k8s-henriques-live.id, aws_subnet.us-east-1b-public-k8s-henriques-live.id, aws_subnet.us-east-1c-public-k8s-henriques-live.id]
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes-public-k8s-henriques-live.arn
}

output "nodes_role_name" {
  value = aws_iam_role.nodes-public-k8s-henriques-live.name
}

output "region" {
  value = "us-east-1"
}

output "route_table_public_id" {
  value = aws_route_table.public-k8s-henriques-live.id
}

output "subnet_us-east-1a_id" {
  value = aws_subnet.us-east-1a-public-k8s-henriques-live.id
}

output "subnet_us-east-1b_id" {
  value = aws_subnet.us-east-1b-public-k8s-henriques-live.id
}

output "subnet_us-east-1c_id" {
  value = aws_subnet.us-east-1c-public-k8s-henriques-live.id
}

output "vpc_cidr_block" {
  value = aws_vpc.public-k8s-henriques-live.cidr_block
}

output "vpc_id" {
  value = aws_vpc.public-k8s-henriques-live.id
}

output "vpc_ipv6_cidr_block" {
  value = aws_vpc.public-k8s-henriques-live.ipv6_cidr_block
}

output "vpc_ipv6_cidr_length" {
  value = local.vpc_ipv6_cidr_block == null ? null : tonumber(regex(".*/(\\d+)", local.vpc_ipv6_cidr_block)[0])
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "files"
  region = "us-east-1"
}

resource "aws_autoscaling_group" "control-plane-us-east-1a-masters-public-k8s-henriques-live" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.control-plane-us-east-1a-masters-public-k8s-henriques-live.id
    version = aws_launch_template.control-plane-us-east-1a-masters-public-k8s-henriques-live.latest_version
  }
  max_instance_lifetime = 0
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "control-plane-us-east-1a.masters.public-k8s.henriques.live"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "public-k8s.henriques.live"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "control-plane-us-east-1a.masters.public-k8s.henriques.live"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/control-plane"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "control-plane-us-east-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/public-k8s.henriques.live"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1a-public-k8s-henriques-live.id]
}

resource "aws_autoscaling_group" "control-plane-us-east-1b-masters-public-k8s-henriques-live" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.control-plane-us-east-1b-masters-public-k8s-henriques-live.id
    version = aws_launch_template.control-plane-us-east-1b-masters-public-k8s-henriques-live.latest_version
  }
  max_instance_lifetime = 0
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "control-plane-us-east-1b.masters.public-k8s.henriques.live"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "public-k8s.henriques.live"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "control-plane-us-east-1b.masters.public-k8s.henriques.live"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/control-plane"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "control-plane-us-east-1b"
  }
  tag {
    key                 = "kubernetes.io/cluster/public-k8s.henriques.live"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1b-public-k8s-henriques-live.id]
}

resource "aws_autoscaling_group" "control-plane-us-east-1c-masters-public-k8s-henriques-live" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.control-plane-us-east-1c-masters-public-k8s-henriques-live.id
    version = aws_launch_template.control-plane-us-east-1c-masters-public-k8s-henriques-live.latest_version
  }
  max_instance_lifetime = 0
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "control-plane-us-east-1c.masters.public-k8s.henriques.live"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "public-k8s.henriques.live"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "control-plane-us-east-1c.masters.public-k8s.henriques.live"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/control-plane"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "control-plane-us-east-1c"
  }
  tag {
    key                 = "kubernetes.io/cluster/public-k8s.henriques.live"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1c-public-k8s-henriques-live.id]
}

resource "aws_autoscaling_group" "nodes-us-east-1a-public-k8s-henriques-live" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-us-east-1a-public-k8s-henriques-live.id
    version = aws_launch_template.nodes-us-east-1a-public-k8s-henriques-live.latest_version
  }
  max_instance_lifetime = 0
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "nodes-us-east-1a.public-k8s.henriques.live"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "public-k8s.henriques.live"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-us-east-1a.public-k8s.henriques.live"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-east-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/public-k8s.henriques.live"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1a-public-k8s-henriques-live.id]
}

resource "aws_autoscaling_group" "nodes-us-east-1b-public-k8s-henriques-live" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-us-east-1b-public-k8s-henriques-live.id
    version = aws_launch_template.nodes-us-east-1b-public-k8s-henriques-live.latest_version
  }
  max_instance_lifetime = 0
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "nodes-us-east-1b.public-k8s.henriques.live"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "public-k8s.henriques.live"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-us-east-1b.public-k8s.henriques.live"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-east-1b"
  }
  tag {
    key                 = "kubernetes.io/cluster/public-k8s.henriques.live"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1b-public-k8s-henriques-live.id]
}

resource "aws_autoscaling_group" "nodes-us-east-1c-public-k8s-henriques-live" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-us-east-1c-public-k8s-henriques-live.id
    version = aws_launch_template.nodes-us-east-1c-public-k8s-henriques-live.latest_version
  }
  max_instance_lifetime = 0
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "nodes-us-east-1c.public-k8s.henriques.live"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "public-k8s.henriques.live"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-us-east-1c.public-k8s.henriques.live"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-east-1c"
  }
  tag {
    key                 = "kubernetes.io/cluster/public-k8s.henriques.live"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-east-1c-public-k8s-henriques-live.id]
}

resource "aws_ebs_volume" "a-etcd-events-public-k8s-henriques-live" {
  availability_zone = "us-east-1a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "a.etcd-events.public-k8s.henriques.live"
    "k8s.io/etcd/events"                              = "a/a,b,c"
    "k8s.io/role/control-plane"                       = "1"
    "k8s.io/role/master"                              = "1"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "a-etcd-main-public-k8s-henriques-live" {
  availability_zone = "us-east-1a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "a.etcd-main.public-k8s.henriques.live"
    "k8s.io/etcd/main"                                = "a/a,b,c"
    "k8s.io/role/control-plane"                       = "1"
    "k8s.io/role/master"                              = "1"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "b-etcd-events-public-k8s-henriques-live" {
  availability_zone = "us-east-1b"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "b.etcd-events.public-k8s.henriques.live"
    "k8s.io/etcd/events"                              = "b/a,b,c"
    "k8s.io/role/control-plane"                       = "1"
    "k8s.io/role/master"                              = "1"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "b-etcd-main-public-k8s-henriques-live" {
  availability_zone = "us-east-1b"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "b.etcd-main.public-k8s.henriques.live"
    "k8s.io/etcd/main"                                = "b/a,b,c"
    "k8s.io/role/control-plane"                       = "1"
    "k8s.io/role/master"                              = "1"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "c-etcd-events-public-k8s-henriques-live" {
  availability_zone = "us-east-1c"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "c.etcd-events.public-k8s.henriques.live"
    "k8s.io/etcd/events"                              = "c/a,b,c"
    "k8s.io/role/control-plane"                       = "1"
    "k8s.io/role/master"                              = "1"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "c-etcd-main-public-k8s-henriques-live" {
  availability_zone = "us-east-1c"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "c.etcd-main.public-k8s.henriques.live"
    "k8s.io/etcd/main"                                = "c/a,b,c"
    "k8s.io/role/control-plane"                       = "1"
    "k8s.io/role/master"                              = "1"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_iam_instance_profile" "masters-public-k8s-henriques-live" {
  name = "masters.public-k8s.henriques.live"
  role = aws_iam_role.masters-public-k8s-henriques-live.name
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "masters.public-k8s.henriques.live"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
}

resource "aws_iam_instance_profile" "nodes-public-k8s-henriques-live" {
  name = "nodes.public-k8s.henriques.live"
  role = aws_iam_role.nodes-public-k8s-henriques-live.name
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "nodes.public-k8s.henriques.live"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
}

resource "aws_iam_role" "masters-public-k8s-henriques-live" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_masters.public-k8s.henriques.live_policy")
  name               = "masters.public-k8s.henriques.live"
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "masters.public-k8s.henriques.live"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
}

resource "aws_iam_role" "nodes-public-k8s-henriques-live" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_nodes.public-k8s.henriques.live_policy")
  name               = "nodes.public-k8s.henriques.live"
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "nodes.public-k8s.henriques.live"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
}

resource "aws_iam_role_policy" "masters-public-k8s-henriques-live" {
  name   = "masters.public-k8s.henriques.live"
  policy = file("${path.module}/data/aws_iam_role_policy_masters.public-k8s.henriques.live_policy")
  role   = aws_iam_role.masters-public-k8s-henriques-live.name
}

resource "aws_iam_role_policy" "nodes-public-k8s-henriques-live" {
  name   = "nodes.public-k8s.henriques.live"
  policy = file("${path.module}/data/aws_iam_role_policy_nodes.public-k8s.henriques.live_policy")
  role   = aws_iam_role.nodes-public-k8s-henriques-live.name
}

resource "aws_internet_gateway" "public-k8s-henriques-live" {
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "public-k8s.henriques.live"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
  vpc_id = aws_vpc.public-k8s-henriques-live.id
}

resource "aws_launch_template" "control-plane-us-east-1a-masters-public-k8s-henriques-live" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 64
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.masters-public-k8s-henriques-live.id
  }
  image_id      = "ami-0172070f66a8ebe63"
  instance_type = "t3.medium"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 3
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "control-plane-us-east-1a.masters.public-k8s.henriques.live"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.masters-public-k8s-henriques-live.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                                     = "public-k8s.henriques.live"
      "Name"                                                                                                  = "control-plane-us-east-1a.masters.public-k8s.henriques.live"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/control-plane"                                                                             = "1"
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1a"
      "kubernetes.io/cluster/public-k8s.henriques.live"                                                       = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                                     = "public-k8s.henriques.live"
      "Name"                                                                                                  = "control-plane-us-east-1a.masters.public-k8s.henriques.live"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/control-plane"                                                                             = "1"
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1a"
      "kubernetes.io/cluster/public-k8s.henriques.live"                                                       = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                                     = "public-k8s.henriques.live"
    "Name"                                                                                                  = "control-plane-us-east-1a.masters.public-k8s.henriques.live"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
    "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
    "k8s.io/role/control-plane"                                                                             = "1"
    "k8s.io/role/master"                                                                                    = "1"
    "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1a"
    "kubernetes.io/cluster/public-k8s.henriques.live"                                                       = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_control-plane-us-east-1a.masters.public-k8s.henriques.live_user_data")
}

resource "aws_launch_template" "control-plane-us-east-1b-masters-public-k8s-henriques-live" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 64
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.masters-public-k8s-henriques-live.id
  }
  image_id      = "ami-0172070f66a8ebe63"
  instance_type = "t3.medium"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 3
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "control-plane-us-east-1b.masters.public-k8s.henriques.live"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.masters-public-k8s-henriques-live.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                                     = "public-k8s.henriques.live"
      "Name"                                                                                                  = "control-plane-us-east-1b.masters.public-k8s.henriques.live"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/control-plane"                                                                             = "1"
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1b"
      "kubernetes.io/cluster/public-k8s.henriques.live"                                                       = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                                     = "public-k8s.henriques.live"
      "Name"                                                                                                  = "control-plane-us-east-1b.masters.public-k8s.henriques.live"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/control-plane"                                                                             = "1"
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1b"
      "kubernetes.io/cluster/public-k8s.henriques.live"                                                       = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                                     = "public-k8s.henriques.live"
    "Name"                                                                                                  = "control-plane-us-east-1b.masters.public-k8s.henriques.live"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
    "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
    "k8s.io/role/control-plane"                                                                             = "1"
    "k8s.io/role/master"                                                                                    = "1"
    "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1b"
    "kubernetes.io/cluster/public-k8s.henriques.live"                                                       = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_control-plane-us-east-1b.masters.public-k8s.henriques.live_user_data")
}

resource "aws_launch_template" "control-plane-us-east-1c-masters-public-k8s-henriques-live" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 64
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.masters-public-k8s-henriques-live.id
  }
  image_id      = "ami-0172070f66a8ebe63"
  instance_type = "t3.medium"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 3
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "control-plane-us-east-1c.masters.public-k8s.henriques.live"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.masters-public-k8s-henriques-live.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                                     = "public-k8s.henriques.live"
      "Name"                                                                                                  = "control-plane-us-east-1c.masters.public-k8s.henriques.live"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/control-plane"                                                                             = "1"
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1c"
      "kubernetes.io/cluster/public-k8s.henriques.live"                                                       = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                                     = "public-k8s.henriques.live"
      "Name"                                                                                                  = "control-plane-us-east-1c.masters.public-k8s.henriques.live"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/control-plane"                                                                             = "1"
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1c"
      "kubernetes.io/cluster/public-k8s.henriques.live"                                                       = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                                     = "public-k8s.henriques.live"
    "Name"                                                                                                  = "control-plane-us-east-1c.masters.public-k8s.henriques.live"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
    "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
    "k8s.io/role/control-plane"                                                                             = "1"
    "k8s.io/role/master"                                                                                    = "1"
    "kops.k8s.io/instancegroup"                                                                             = "control-plane-us-east-1c"
    "kubernetes.io/cluster/public-k8s.henriques.live"                                                       = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_control-plane-us-east-1c.masters.public-k8s.henriques.live_user_data")
}

resource "aws_launch_template" "nodes-us-east-1a-public-k8s-henriques-live" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-public-k8s-henriques-live.id
  }
  image_id      = "ami-0172070f66a8ebe63"
  instance_type = "t2.medium"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-us-east-1a.public-k8s.henriques.live"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.nodes-public-k8s-henriques-live.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "public-k8s.henriques.live"
      "Name"                                                                       = "nodes-us-east-1a.public-k8s.henriques.live"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1a"
      "kubernetes.io/cluster/public-k8s.henriques.live"                            = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "public-k8s.henriques.live"
      "Name"                                                                       = "nodes-us-east-1a.public-k8s.henriques.live"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1a"
      "kubernetes.io/cluster/public-k8s.henriques.live"                            = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "public-k8s.henriques.live"
    "Name"                                                                       = "nodes-us-east-1a.public-k8s.henriques.live"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1a"
    "kubernetes.io/cluster/public-k8s.henriques.live"                            = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-us-east-1a.public-k8s.henriques.live_user_data")
}

resource "aws_launch_template" "nodes-us-east-1b-public-k8s-henriques-live" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-public-k8s-henriques-live.id
  }
  image_id      = "ami-0172070f66a8ebe63"
  instance_type = "t2.medium"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-us-east-1b.public-k8s.henriques.live"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.nodes-public-k8s-henriques-live.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "public-k8s.henriques.live"
      "Name"                                                                       = "nodes-us-east-1b.public-k8s.henriques.live"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1b"
      "kubernetes.io/cluster/public-k8s.henriques.live"                            = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "public-k8s.henriques.live"
      "Name"                                                                       = "nodes-us-east-1b.public-k8s.henriques.live"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1b"
      "kubernetes.io/cluster/public-k8s.henriques.live"                            = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "public-k8s.henriques.live"
    "Name"                                                                       = "nodes-us-east-1b.public-k8s.henriques.live"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1b"
    "kubernetes.io/cluster/public-k8s.henriques.live"                            = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-us-east-1b.public-k8s.henriques.live_user_data")
}

resource "aws_launch_template" "nodes-us-east-1c-public-k8s-henriques-live" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-public-k8s-henriques-live.id
  }
  image_id      = "ami-0172070f66a8ebe63"
  instance_type = "t2.medium"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-us-east-1c.public-k8s.henriques.live"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.nodes-public-k8s-henriques-live.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "public-k8s.henriques.live"
      "Name"                                                                       = "nodes-us-east-1c.public-k8s.henriques.live"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1c"
      "kubernetes.io/cluster/public-k8s.henriques.live"                            = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "public-k8s.henriques.live"
      "Name"                                                                       = "nodes-us-east-1c.public-k8s.henriques.live"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1c"
      "kubernetes.io/cluster/public-k8s.henriques.live"                            = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "public-k8s.henriques.live"
    "Name"                                                                       = "nodes-us-east-1c.public-k8s.henriques.live"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-us-east-1c"
    "kubernetes.io/cluster/public-k8s.henriques.live"                            = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-us-east-1c.public-k8s.henriques.live_user_data")
}

resource "aws_route" "route-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.public-k8s-henriques-live.id
  route_table_id         = aws_route_table.public-k8s-henriques-live.id
}

resource "aws_route" "route-__--0" {
  destination_ipv6_cidr_block = "::/0"
  gateway_id                  = aws_internet_gateway.public-k8s-henriques-live.id
  route_table_id              = aws_route_table.public-k8s-henriques-live.id
}

resource "aws_route_table" "public-k8s-henriques-live" {
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "public-k8s.henriques.live"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
    "kubernetes.io/kops/role"                         = "public"
  }
  vpc_id = aws_vpc.public-k8s-henriques-live.id
}

resource "aws_route_table_association" "us-east-1a-public-k8s-henriques-live" {
  route_table_id = aws_route_table.public-k8s-henriques-live.id
  subnet_id      = aws_subnet.us-east-1a-public-k8s-henriques-live.id
}

resource "aws_route_table_association" "us-east-1b-public-k8s-henriques-live" {
  route_table_id = aws_route_table.public-k8s-henriques-live.id
  subnet_id      = aws_subnet.us-east-1b-public-k8s-henriques-live.id
}

resource "aws_route_table_association" "us-east-1c-public-k8s-henriques-live" {
  route_table_id = aws_route_table.public-k8s-henriques-live.id
  subnet_id      = aws_subnet.us-east-1c-public-k8s-henriques-live.id
}

resource "aws_s3_object" "cluster-completed-spec" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_cluster-completed.spec_content")
  key      = "public-k8s.henriques.live/cluster-completed.spec"
  provider = aws.files
}

resource "aws_s3_object" "etcd-cluster-spec-events" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_etcd-cluster-spec-events_content")
  key      = "public-k8s.henriques.live/backups/etcd/events/control/etcd-cluster-spec"
  provider = aws.files
}

resource "aws_s3_object" "etcd-cluster-spec-main" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_etcd-cluster-spec-main_content")
  key      = "public-k8s.henriques.live/backups/etcd/main/control/etcd-cluster-spec"
  provider = aws.files
}

resource "aws_s3_object" "kops-version-txt" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_kops-version.txt_content")
  key      = "public-k8s.henriques.live/kops-version.txt"
  provider = aws.files
}

resource "aws_s3_object" "manifests-etcdmanager-events-control-plane-us-east-1a" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_manifests-etcdmanager-events-control-plane-us-east-1a_content")
  key      = "public-k8s.henriques.live/manifests/etcd/events-control-plane-us-east-1a.yaml"
  provider = aws.files
}

resource "aws_s3_object" "manifests-etcdmanager-events-control-plane-us-east-1b" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_manifests-etcdmanager-events-control-plane-us-east-1b_content")
  key      = "public-k8s.henriques.live/manifests/etcd/events-control-plane-us-east-1b.yaml"
  provider = aws.files
}

resource "aws_s3_object" "manifests-etcdmanager-events-control-plane-us-east-1c" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_manifests-etcdmanager-events-control-plane-us-east-1c_content")
  key      = "public-k8s.henriques.live/manifests/etcd/events-control-plane-us-east-1c.yaml"
  provider = aws.files
}

resource "aws_s3_object" "manifests-etcdmanager-main-control-plane-us-east-1a" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_manifests-etcdmanager-main-control-plane-us-east-1a_content")
  key      = "public-k8s.henriques.live/manifests/etcd/main-control-plane-us-east-1a.yaml"
  provider = aws.files
}

resource "aws_s3_object" "manifests-etcdmanager-main-control-plane-us-east-1b" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_manifests-etcdmanager-main-control-plane-us-east-1b_content")
  key      = "public-k8s.henriques.live/manifests/etcd/main-control-plane-us-east-1b.yaml"
  provider = aws.files
}

resource "aws_s3_object" "manifests-etcdmanager-main-control-plane-us-east-1c" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_manifests-etcdmanager-main-control-plane-us-east-1c_content")
  key      = "public-k8s.henriques.live/manifests/etcd/main-control-plane-us-east-1c.yaml"
  provider = aws.files
}

resource "aws_s3_object" "manifests-static-kube-apiserver-healthcheck" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_manifests-static-kube-apiserver-healthcheck_content")
  key      = "public-k8s.henriques.live/manifests/static/kube-apiserver-healthcheck.yaml"
  provider = aws.files
}

resource "aws_s3_object" "nodeupconfig-control-plane-us-east-1a" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_nodeupconfig-control-plane-us-east-1a_content")
  key      = "public-k8s.henriques.live/igconfig/control-plane/control-plane-us-east-1a/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_s3_object" "nodeupconfig-control-plane-us-east-1b" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_nodeupconfig-control-plane-us-east-1b_content")
  key      = "public-k8s.henriques.live/igconfig/control-plane/control-plane-us-east-1b/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_s3_object" "nodeupconfig-control-plane-us-east-1c" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_nodeupconfig-control-plane-us-east-1c_content")
  key      = "public-k8s.henriques.live/igconfig/control-plane/control-plane-us-east-1c/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_s3_object" "nodeupconfig-nodes-us-east-1a" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_nodeupconfig-nodes-us-east-1a_content")
  key      = "public-k8s.henriques.live/igconfig/node/nodes-us-east-1a/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_s3_object" "nodeupconfig-nodes-us-east-1b" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_nodeupconfig-nodes-us-east-1b_content")
  key      = "public-k8s.henriques.live/igconfig/node/nodes-us-east-1b/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_s3_object" "nodeupconfig-nodes-us-east-1c" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_nodeupconfig-nodes-us-east-1c_content")
  key      = "public-k8s.henriques.live/igconfig/node/nodes-us-east-1c/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_s3_object" "public-k8s-henriques-live-addons-aws-cloud-controller-addons-k8s-io-k8s-1-18" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_public-k8s.henriques.live-addons-aws-cloud-controller.addons.k8s.io-k8s-1.18_content")
  key      = "public-k8s.henriques.live/addons/aws-cloud-controller.addons.k8s.io/k8s-1.18.yaml"
  provider = aws.files
}

resource "aws_s3_object" "public-k8s-henriques-live-addons-aws-ebs-csi-driver-addons-k8s-io-k8s-1-17" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_public-k8s.henriques.live-addons-aws-ebs-csi-driver.addons.k8s.io-k8s-1.17_content")
  key      = "public-k8s.henriques.live/addons/aws-ebs-csi-driver.addons.k8s.io/k8s-1.17.yaml"
  provider = aws.files
}

resource "aws_s3_object" "public-k8s-henriques-live-addons-bootstrap" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_public-k8s.henriques.live-addons-bootstrap_content")
  key      = "public-k8s.henriques.live/addons/bootstrap-channel.yaml"
  provider = aws.files
}

resource "aws_s3_object" "public-k8s-henriques-live-addons-coredns-addons-k8s-io-k8s-1-12" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_public-k8s.henriques.live-addons-coredns.addons.k8s.io-k8s-1.12_content")
  key      = "public-k8s.henriques.live/addons/coredns.addons.k8s.io/k8s-1.12.yaml"
  provider = aws.files
}

resource "aws_s3_object" "public-k8s-henriques-live-addons-dns-controller-addons-k8s-io-k8s-1-12" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_public-k8s.henriques.live-addons-dns-controller.addons.k8s.io-k8s-1.12_content")
  key      = "public-k8s.henriques.live/addons/dns-controller.addons.k8s.io/k8s-1.12.yaml"
  provider = aws.files
}

resource "aws_s3_object" "public-k8s-henriques-live-addons-kops-controller-addons-k8s-io-k8s-1-16" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_public-k8s.henriques.live-addons-kops-controller.addons.k8s.io-k8s-1.16_content")
  key      = "public-k8s.henriques.live/addons/kops-controller.addons.k8s.io/k8s-1.16.yaml"
  provider = aws.files
}

resource "aws_s3_object" "public-k8s-henriques-live-addons-kubelet-api-rbac-addons-k8s-io-k8s-1-9" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_public-k8s.henriques.live-addons-kubelet-api.rbac.addons.k8s.io-k8s-1.9_content")
  key      = "public-k8s.henriques.live/addons/kubelet-api.rbac.addons.k8s.io/k8s-1.9.yaml"
  provider = aws.files
}

resource "aws_s3_object" "public-k8s-henriques-live-addons-limit-range-addons-k8s-io" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_public-k8s.henriques.live-addons-limit-range.addons.k8s.io_content")
  key      = "public-k8s.henriques.live/addons/limit-range.addons.k8s.io/v1.5.0.yaml"
  provider = aws.files
}

resource "aws_s3_object" "public-k8s-henriques-live-addons-networking-projectcalico-org-k8s-1-25" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_public-k8s.henriques.live-addons-networking.projectcalico.org-k8s-1.25_content")
  key      = "public-k8s.henriques.live/addons/networking.projectcalico.org/k8s-1.25.yaml"
  provider = aws.files
}

resource "aws_s3_object" "public-k8s-henriques-live-addons-storage-aws-addons-k8s-io-v1-15-0" {
  bucket   = "sergio-kops"
  content  = file("${path.module}/data/aws_s3_object_public-k8s.henriques.live-addons-storage-aws.addons.k8s.io-v1.15.0_content")
  key      = "public-k8s.henriques.live/addons/storage-aws.addons.k8s.io/v1.15.0.yaml"
  provider = aws.files
}

resource "aws_security_group" "masters-public-k8s-henriques-live" {
  description = "Security group for masters"
  name        = "masters.public-k8s.henriques.live"
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "masters.public-k8s.henriques.live"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
  vpc_id = aws_vpc.public-k8s-henriques-live.id
}

resource "aws_security_group" "nodes-public-k8s-henriques-live" {
  description = "Security group for nodes"
  name        = "nodes.public-k8s.henriques.live"
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "nodes.public-k8s.henriques.live"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
  vpc_id = aws_vpc.public-k8s-henriques-live.id
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-masters-public-k8s-henriques-live" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-public-k8s-henriques-live.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-nodes-public-k8s-henriques-live" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.nodes-public-k8s-henriques-live.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-443to443-masters-public-k8s-henriques-live" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-public-k8s-henriques-live.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "from-__--0-ingress-tcp-22to22-masters-public-k8s-henriques-live" {
  from_port         = 22
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-public-k8s-henriques-live.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-__--0-ingress-tcp-22to22-nodes-public-k8s-henriques-live" {
  from_port         = 22
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "tcp"
  security_group_id = aws_security_group.nodes-public-k8s-henriques-live.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-__--0-ingress-tcp-443to443-masters-public-k8s-henriques-live" {
  from_port         = 443
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-public-k8s-henriques-live.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "from-masters-public-k8s-henriques-live-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.masters-public-k8s-henriques-live.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-public-k8s-henriques-live-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.masters-public-k8s-henriques-live.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-public-k8s-henriques-live-ingress-all-0to0-masters-public-k8s-henriques-live" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-public-k8s-henriques-live.id
  source_security_group_id = aws_security_group.masters-public-k8s-henriques-live.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-masters-public-k8s-henriques-live-ingress-all-0to0-nodes-public-k8s-henriques-live" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-public-k8s-henriques-live.id
  source_security_group_id = aws_security_group.masters-public-k8s-henriques-live.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-public-k8s-henriques-live-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-public-k8s-henriques-live.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-public-k8s-henriques-live-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-public-k8s-henriques-live.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-public-k8s-henriques-live-ingress-4-0to0-masters-public-k8s-henriques-live" {
  from_port                = 0
  protocol                 = "4"
  security_group_id        = aws_security_group.masters-public-k8s-henriques-live.id
  source_security_group_id = aws_security_group.nodes-public-k8s-henriques-live.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-public-k8s-henriques-live-ingress-all-0to0-nodes-public-k8s-henriques-live" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-public-k8s-henriques-live.id
  source_security_group_id = aws_security_group.nodes-public-k8s-henriques-live.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-public-k8s-henriques-live-ingress-tcp-1to2379-masters-public-k8s-henriques-live" {
  from_port                = 1
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-public-k8s-henriques-live.id
  source_security_group_id = aws_security_group.nodes-public-k8s-henriques-live.id
  to_port                  = 2379
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-public-k8s-henriques-live-ingress-tcp-2382to4000-masters-public-k8s-henriques-live" {
  from_port                = 2382
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-public-k8s-henriques-live.id
  source_security_group_id = aws_security_group.nodes-public-k8s-henriques-live.id
  to_port                  = 4000
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-public-k8s-henriques-live-ingress-tcp-4003to65535-masters-public-k8s-henriques-live" {
  from_port                = 4003
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-public-k8s-henriques-live.id
  source_security_group_id = aws_security_group.nodes-public-k8s-henriques-live.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-public-k8s-henriques-live-ingress-udp-1to65535-masters-public-k8s-henriques-live" {
  from_port                = 1
  protocol                 = "udp"
  security_group_id        = aws_security_group.masters-public-k8s-henriques-live.id
  source_security_group_id = aws_security_group.nodes-public-k8s-henriques-live.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_subnet" "us-east-1a-public-k8s-henriques-live" {
  availability_zone                           = "us-east-1a"
  cidr_block                                  = "172.20.32.0/19"
  enable_resource_name_dns_a_record_on_launch = true
  private_dns_hostname_type_on_launch         = "resource-name"
  tags = {
    "KubernetesCluster"                                   = "public-k8s.henriques.live"
    "Name"                                                = "us-east-1a.public-k8s.henriques.live"
    "SubnetType"                                          = "Public"
    "kops.k8s.io/instance-group/control-plane-us-east-1a" = "true"
    "kops.k8s.io/instance-group/nodes-us-east-1a"         = "true"
    "kubernetes.io/cluster/public-k8s.henriques.live"     = "owned"
    "kubernetes.io/role/elb"                              = "1"
    "kubernetes.io/role/internal-elb"                     = "1"
  }
  vpc_id = aws_vpc.public-k8s-henriques-live.id
}

resource "aws_subnet" "us-east-1b-public-k8s-henriques-live" {
  availability_zone                           = "us-east-1b"
  cidr_block                                  = "172.20.64.0/19"
  enable_resource_name_dns_a_record_on_launch = true
  private_dns_hostname_type_on_launch         = "resource-name"
  tags = {
    "KubernetesCluster"                                   = "public-k8s.henriques.live"
    "Name"                                                = "us-east-1b.public-k8s.henriques.live"
    "SubnetType"                                          = "Public"
    "kops.k8s.io/instance-group/control-plane-us-east-1b" = "true"
    "kops.k8s.io/instance-group/nodes-us-east-1b"         = "true"
    "kubernetes.io/cluster/public-k8s.henriques.live"     = "owned"
    "kubernetes.io/role/elb"                              = "1"
    "kubernetes.io/role/internal-elb"                     = "1"
  }
  vpc_id = aws_vpc.public-k8s-henriques-live.id
}

resource "aws_subnet" "us-east-1c-public-k8s-henriques-live" {
  availability_zone                           = "us-east-1c"
  cidr_block                                  = "172.20.96.0/19"
  enable_resource_name_dns_a_record_on_launch = true
  private_dns_hostname_type_on_launch         = "resource-name"
  tags = {
    "KubernetesCluster"                                   = "public-k8s.henriques.live"
    "Name"                                                = "us-east-1c.public-k8s.henriques.live"
    "SubnetType"                                          = "Public"
    "kops.k8s.io/instance-group/control-plane-us-east-1c" = "true"
    "kops.k8s.io/instance-group/nodes-us-east-1c"         = "true"
    "kubernetes.io/cluster/public-k8s.henriques.live"     = "owned"
    "kubernetes.io/role/elb"                              = "1"
    "kubernetes.io/role/internal-elb"                     = "1"
  }
  vpc_id = aws_vpc.public-k8s-henriques-live.id
}

resource "aws_vpc" "public-k8s-henriques-live" {
  assign_generated_ipv6_cidr_block = true
  cidr_block                       = "172.20.0.0/16"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "public-k8s.henriques.live"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "public-k8s-henriques-live" {
  domain_name         = "ec2.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    "KubernetesCluster"                               = "public-k8s.henriques.live"
    "Name"                                            = "public-k8s.henriques.live"
    "kubernetes.io/cluster/public-k8s.henriques.live" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "public-k8s-henriques-live" {
  dhcp_options_id = aws_vpc_dhcp_options.public-k8s-henriques-live.id
  vpc_id          = aws_vpc.public-k8s-henriques-live.id
}

terraform {
  required_version = ">= 0.15.0"
  required_providers {
    aws = {
      "configuration_aliases" = [aws.files]
      "source"                = "hashicorp/aws"
      "version"               = ">= 4.0.0"
    }
  }
}
