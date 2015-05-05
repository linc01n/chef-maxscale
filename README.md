maxscale Cookbook
=================

This cookbook installs and configure maxscale from the MariaDB repositroy.

## Requirements

### Supported Platforms

The following 64-bit platforms are supported:

* CentOS 7.0
* Ubuntu 14.04 LTS

### Cookbooks

* [apt](https://supermarket.getchef.com/cookbooks/apt) Chef LWRP Cookbook
* [yum](https://supermarket.getchef.com/cookbooks/yum) Chef LWRP Cookbook

## Attributes

* `['maxscale']['threads']`
  - Number of worker threads in MaxScale

### Definition of the monitor
* `['maxscale']['monitor']['module']`
  - Currently valid options for all monitors are: mysqlmon|galeramon
* `['maxscale']['monitor']['user']`
* `['maxscale']['monitor']['pwd']`
* `['maxscale']['monitor']['interval']`

### Read Connection Router Config
* `['maxscale']['read_connection_router']['enabled']`
* `['maxscale']['read_connection_router']['user']`
* `['maxscale']['read_connection_router']['pwd']`
* `['maxscale']['read_connection_router']['option']`
  - router_options = master|slave|synced

### RW Split Router Conifg
* `['maxscale']['rw_split_router']['enabled']`
* `['maxscale']['rw_split_router']['user']`
* `['maxscale']['rw_split_router']['pwd']`

### Read Connection Listener Config
* `['maxscale']['read_connection_listener']['enabled']`
* `['maxscale']['read_connection_listener']['address']`
* `['maxscale']['read_connection_listener']['port']`

### RW Split Listener Config
* `['maxscale']['rw_split_listener']['enabled']`
* `['maxscale']['rw_split_listener']['address']`
* `['maxscale']['rw_split_listener']['port']`

### Debug Listener Config
* `['maxscale']['debug_listener']['enabled']`
* `['maxscale']['debug_listener']['address']`
* `['maxscale']['debug_listener']['port']`

### CLI Listener Config
* `['maxscale']['cli_listener']['enabled']`
* `['maxscale']['cli_listener']['address']`
* `['maxscale']['cli_listener']['port']`

### Server Definition
* `['maxscale']['server']`

## Usage

Include your server in your `node attributes`:

```json
['maxscale']['server'] = [
  { name: 'Server1', type: 'server', address: '10.0.0.1', port: 3000, protocol: 'MySQLBackend' },
  { name: 'Server2', type: 'server', address: '10.0.0.2', port: 3000, protocol: 'MySQLBackend' },
  { name: 'Server3', type: 'server', address: '10.0.0.3', port: 3000, protocol: 'MySQLBackend' }
]

```

and include `maxscale` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[maxscale]"
  ]
}
```

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
