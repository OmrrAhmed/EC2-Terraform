This simple Terraform script deploys the following infrastructure:

1- Create a VPC: A Virtual Private Cloud (VPC) will be created to host the resources.

2- Create 3 Subnets:

    - Two public subnets, each in a different Availability Zone.
	
    - One private subnet in a separate Availability Zone.
	
2- Create an Internet Gateway: The internet gateway will be associated with the two public subnets via a route table.

3- Create a Security Group: This will define specific inbound rules for access control.

4- Deploy 2 EC2 Instances:

    - One EC2 instance will be deployed in the public subnet.
	
    - The other EC2 instance will be deployed in the private subnet. Access to the EC2 instance in the private subnet 
      will be facilitated by a bastion host deployed in the public subnet.
