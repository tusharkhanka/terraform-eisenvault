# Eisenvault On ScaleWay

This project is for spining up an Eisenvault instance on ScaleWay with minimal effort. It automates the creation of server installing dependenceis, configuration by bash scripts.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Things you need to install the software and how to install them

```
Terraform
Scaleway Account

```

### Installing

A step by step series of examples that tell you how to get a development env running

Clone this project

Instaling terraform 

```
Go to install-terraform.sh 

Run install-terraform.sh
$ sudo bash install-terraform.sh
```
Once the terraform is installed run the following steps

Step 1
```
make changes in raw/ev-install.properties as required
if ssl is enabled then Update the customer.crt, customer.key, and customer.ca-bundle 
```

Step 2 
```
Make chnages in variable.tf for your credentials, api token, key id, etc
```

Step 3 Run the following Terraform commands to launch an instance

```
$ terraform init
$ terraform plan 
$ terraform apply
```

There will be an output that will shw the Ip of the server point you domain to that ip

## Authors

* **Tushar Khnaka** - *Initial work* - [GitHub](https://github.com/tusharkhanka)
* **Hiten Rastogi** - *Reviewer* - [GitHub](https://github.com/rastoh)

