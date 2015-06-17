# maxscale Cookbook [![Build Status](https://travis-ci.org/DennisBP/chef-maxscale.svg?branch=master)](https://travis-ci.org/DennisBP/chef-maxscale)

This cookbook installs and configure maxscale from the MariaDB repositroy.

## Requirements

### Supported Platforms

The following 64-bit platforms are supported:

* CentOS 5.0 - 7.0
* Ubuntu 14.04 LTS
* Debian 7.8

### Cookbooks

* [apt](https://supermarket.getchef.com/cookbooks/apt) Chef LWRP Cookbook
* [yum](https://supermarket.getchef.com/cookbooks/yum) Chef LWRP Cookbook

## Attributes

| attribute                                | Type      | Default    | description                              |
|:-----------------------------------------|:---------:|:----------:|:-----------------------------------------|
| `node['maxscale']['config']`             | `Hash`    | `{}`       | Maxscale config                          |
| `node['maxscale']['databag']['enabled']` | `Boolen`  | `false`    | Enable Data Bag support                  |
| `node['maxscale']['databag']['name']`    | `String`  | `maxscale` | Data Bag name                            |
| `node['maxscale']['databag']['item']`    | `String`  | `config`   | Data Bag item name                       |

## Usage

Just write your config to the `node['maxscale']['config']` attribute or use a Data Bag. See `.kitchen.yml` for
more examples.

```
default['maxscale']['config'] = {
  maxscale: {
    threads: 2
  }
  server1: {
    type: 'server',
    address: '127.0.0.1',
    port: 3306,
    protocol: 'MySQLBackend'
  }
  server2: {
    type: 'server',
    address: '127.0.0.1',
    port: 3306,
    protocol: 'MySQLBackend'
  }
  ...
  ...
  ...
}
```

#### Data Bag support is also available.

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Copyright 2015, Dennis Pattmann

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
