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

| attribute                    | Type      | Default | description                              |
|:-----------------------------|:---------:|:-------:|:-----------------------------------------|
| `node['maxscale']['threads']`| `Integer` | `4`     | Number of worker threads in MaxScale     |


### Definition of the monitor
| attribute                                | Type        | Default   | description                             |
|:-----------------------------------------|:-----------:|:---------:|:----------------------------------------|
| `node['maxscale']['monitor']['module']`  | `String`    | `mysqlmon`|                                         |
| `node['maxscale']['monitor']['user']`    | `String`    | `myuser`  | Currently valid options for all monitors are: mysqlmon|galeramon |
| `node['maxscale']['monitor']['pwd']`     | `String`    | `mypwd`   |                                         |
| `node['maxscale']['monitor']['interval']`| `Integer`   | `10000`   |                                         |
| `node['maxscale']['monitor']['backend_connect_timeout']`  | `Integer` | `''` |                               |
| `node['maxscale']['monitor']['backend_read_timeout']`     | `Integer` | `''` |                               |
| `node['maxscale']['monitor']['backend_write_timeout']`    | `Integer` | `''` |                               |
| `node['maxscale']['monitor']['detect_replication_lag']`   | `Integer` | `''` |                               |
| `node['maxscale']['monitor']['detect_stale_master']`      | `Integer` | `''` |                               |
| `node['maxscale']['monitor']['disable_master_failback']`  | `Integer` | `''` |                               |

### Read Connection Router Config
| attribute                                               | Type      | Default  | description             |
|:--------------------------------------------------------|:---------:|:--------:|:------------------------|
| `node['maxscale']['read_connection_router']['enabled']` | `Boolen`  | `true`   |                         |
| `node['maxscale']['read_connection_router']['user']`    | `String`  | `myuser` |                         |
| `node['maxscale']['read_connection_router']['pwd']`     | `String`  | `mypwd`  |                         |
| `node['maxscale']['read_connection_router']['option']`  | `String`  | `slave`  | master|slave|synced     |

### RW Split Router Conifg
| attribute                                        | Type      | Default |
|:-------------------------------------------------|:---------:|:-------:|
| `node['maxscale']['rw_split_router']['enabled']` | `Boolen`  | `true`  |
| `node['maxscale']['rw_split_router']['user']`    | `String`  | `myuser`|
| `node['maxscale']['rw_split_router']['pwd']`     | `String`  | `mypwd` |

### Read Connection Listener Config
| attribute                                                 | Type      | Default      |
|:----------------------------------------------------------|:---------:|:------------:|
| `node['maxscale']['read_connection_listener']['enabled']` | `Boolen`  | `true`       |
| `node['maxscale']['read_connection_listener']['address']` | `String`  | `127.0.0.1`  |
| `node['maxscale']['read_connection_listener']['port']`    | `Integer` | `4008`       |

### RW Split Listener Config
| attribute                                          | Type      | Default     |
|:---------------------------------------------------|:---------:|:-----------:|
| `node['maxscale']['rw_split_listener']['enabled']` | `Boolen`  | `true`      |
| `node['maxscale']['rw_split_listener']['address']` | `String`  | `127.0.0.1` |
| `node['maxscale']['rw_split_listener']['port']`    | `Integer` | `4406`      |

### Debug Listener Config
| attribute                                       | Type      | Default      |
|:------------------------------------------------|:---------:|:------------:|
| `node['maxscale']['debug_listener']['enabled']` | `Boolen`  | `true`       |
| `node['maxscale']['debug_listener']['address']` | `String`  | `127.0.0.1`  |
| `node['maxscale']['debug_listener']['port']`    | `Integer` | `4442`       |

### CLI Listener Config
| attribute                                     | Type      | Default     |
|:----------------------------------------------|:---------:|:-----------:|
| `node['maxscale']['cli_listener']['enabled']` | `Boolen`  | `true`      |
| `node['maxscale']['cli_listener']['address']` | `String`  | `127.0.0.1` |
| `node['maxscale']['cli_listener']['port']`    | `Integer` | `6603`      |

### Server Definition
| attribute                      | Type      | Default     | description             |
|:-------------------------------|:---------:|:-----------:|:------------------------|
| `node['maxscale']['server']`   | `Array`   | `[]`         | Please see usage        |

### Filter Definition
| attribute                     | Type      | Default     | description             |
|:------------------------------|:---------:|:-----------:|:------------------------|
| `node['maxscale']['server']`  | `Array`   | `[]`        |  Please see usage       |

## Usage

Include your server in your `node attributes`:

```
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

You can create filter like this:

```
['maxscale']['filter'] = [
  { name: 'qla', module: 'qlafilter', options: '/tmp/QueryLog' },
  { name: 'fetch', module: 'regexfilter', match: 'fetch', replace: 'select' },
  { name: 'topf', module: 'topfilter', count: 10, filebase: '/var/log/myapp/session' },
  { name: 'teef', module: 'teefilter', match: 'insert.*HighScore.*values', service: 'Cassandra' }
]
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
