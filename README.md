# TencentCloud SSL Terraform module

Terraform module which creates SSL buckets on TencentCloud.

## Features

This module aims to implement ALL combinations of arguments supported by TencentCloud and latest stable version of Terraform:

- Create SSL Certificate

If there is a missing feature or a bug - [open an issue](https://github.com/StarUbiquitous/terraform-module-tencentcloud-ssl/issues/new).

## Terraform versions

Recommended use Terraform 1.0 or later version of this module.

## Usage

```terraform
locals {
  domains = [
    {
      name = "starubiquitous.com",
    }
  ]
}

module "domains" {
  source = "StarUbiquitous/tencentcloud-ssl/module"

  for_each = {
  for domain in local.domains : domain.name => {
    cert = can(domain.cert) ? domain.cert : join("\n", compact(split("\n", file("./${domain.name}/fullchain.cer"))))
    key  = can(domain.key) ? domain.key : join("\n", compact(split("\n", file("./${domain.name}/${domain.name}.key"))))
    type = can(domain.type) ? domain.type : "SVR"
  }
  }
  name = each.key
  cert = each.value.cert
  key  = each.value.key
  type = each.value.type
}
```

## Outputs

WIP

## License

The code in this repository, unless otherwise noted, is under the terms of both the [Anti 996](https://github.com/996icu/996.ICU/blob/master/LICENSE) License and the [Apache License (Version 2.0)](./LICENSE-APACHE).
