# terraform-templete

First you need to install terraform in local computer by following this site https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli. this is the example of installing terraform in OS ubuntu.
Ensure that your system is up to date, and you have the gnupg, software-properties-common, and curl packages installed. You will use these packages to verify HashiCorp's GPG signature, and install HashiCorp's Debian package repository

# clone repository to local computer

After terraform instalation has done. you can clone this github repository to your local computer. This terraform configuration will be provisioning infrastucture with alicloud platform.

# terraform description

In the main.tf file, there are few configuration to create Instance in ali cloud. for this configuraton, Instance will use existing vpc and vswith. To run the terraform configuration, you need to create access_key and secret_key from your console alicloud account. Go to your alicloud console , search for accesskey management. then create you access accesskey. Then in vaiables.tf file, define your access_key, secret_key and region of your alicloud.

# Running terraform configuraton

To running terraform, first running command terraform init for initialition.

```bash
terraform init
```

Then you can see planning of provisioning by running command below. this command will ask you to input your access_key, secret_key and the region. for the region you need to define based on the region that you want to provisioning.

```bash
terraform plan
```

Then aplly your terraform configuration by running command below. dont forger to input your access_key, secret_key and region. then confirm by tiping yes and then enter

```bash
terraform apply
```

https://blog.gruntwork.io/how-to-create-reusable-infrastructure-with-terraform-modules-25526d65f73d
