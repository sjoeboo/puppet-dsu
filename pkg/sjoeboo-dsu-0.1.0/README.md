# dsu

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with dsu](#setup)
    * [What dsu affects](#what-dsu-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with dsu](#beginning-with-dsu)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Sets up Dell System Update (repository and installs the dsu tool), optionally installs Openmanager (srvadmin) packages and services

## Setup

### What dsu affects **OPTIONAL**

* (Optional) DSU repos (os depentant and os independant)
* dsu
* (optional) Openmanage (srvadmin) packages and services.

### Beginning with dsu

`puppet module install sjoeboo-dsu`


## Usage

`include ::dsu`

## Reference

`manage_repo`: *Boolean*, should this module manage the (yum) repos for the dsu installation. *Default*: **true**

`repo`: *String*, Base path to repo to install *Default* **'http://linux.dell.com/repo/hardware/dsu/'**

`repo_name`: *String*, Name of repo to install (appends os-(in)dependentå) *Default* **'dell-system-update'**

`repo_gpgkey`: *String*, *Default* Path/url to gpgkey to use **"${repo}/public.key"**

`package_name`: *String*, Name of dsu package to install *Default* **'dell-system-update'**

`package_version`: *String*, Version string of dsu package to install (installed, lastest, $version, absent, etc)*Default* **'installed'**

`srvadmin`: *Boolean*, Toggle installation of Openmanage(srvadmin)*Default* **true**

`srvadmin_package`: *String*, Name of srvadmin package to install *Default* **'srvadmin-all'**

`srvadmin_version`: *String*, Version string of srvadmin package to install (installed, lastest, $version, absent, etc) *Default* **'installed'**

`srvadmin_services`:  *Array*, List of srdadmin services to manage. *Default* **['dataeng','dsm_om_connsvc','dsm_om_shrsvc','instsvcdrv']**

`srvadmin_services_enable`: *Boolean*, Toggle enabling srvadmin services *Default* **true**

`srvadmin_services_ensure`: *String* State of srvadmin services to ensure *Default* **'running'**

## Limitations

Currently supports RHEL based systems (CentOS,etc), v6 + 7 only.
