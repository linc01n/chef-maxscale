# maxscale Cookbook [![Build Status](https://travis-ci.org/DennisBP/chef-maxscale.svg?branch=master)](https://travis-ci.org/DennisBP/chef-maxscale)

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
| `node['maxscale']['monitor']['user']`    | `String`    | `myuser`  | Currently valid options for all monitors are: mysqlmon and galeramon |
| `node['maxscale']['monitor']['pwd']`     | `String`    | `mypwd`   |                                         |
| `node['maxscale']['monitor']['interval']`| `Integer`   | `10000`   |                                         |
| `node['maxscale']['monitor']['backend_connect_timeout']`  | `Integer` | `''` |                               |
| `node['maxscale']['monitor']['backend_read_timeout']`     | `Integer` | `''` |                               |
| `node['maxscale']['monitor']['backend_write_timeout']`    | `Integer` | `''` |                               |
| `node['maxscale']['monitor']['detect_replication_lag']`   | `Integer` | `''` |                               |
| `node['maxscale']['monitor']['detect_stale_master']`      | `Integer` | `''` |                               |
| `node['maxscale']['monitor']['disable_master_failback']`  | `Integer` | `''` |                               |

### Server Definition
| attribute                                            | Type      | Default     | description                   |
|:-----------------------------------------------------|:---------:|:-----------:|:------------------------------|
| `node['maxscale']['server']`                         | `Array`   | `[]`        | Please see usage              |
| `node['maxscale']['databag']['server']['enabled']`   | `Boolen`  | `false`     | Enable Data Bags support      |
| `node['maxscale']['databag']['server']['name']`      | `String`  | `maxscale`  | Data Bag name                 |
| `node['maxscale']['databag']['server']['item_name']` | `String`  | `server`    | Data Bag Item name            |

### Filter Definition
| attribute                                            | Type      | Default     | description                   |
|:-----------------------------------------------------|:---------:|:-----------:|:------------------------------|
| `node['maxscale']['filter']`                         | `Array`   | `[]`        | Please see usage              |
| `node['maxscale']['databag']['filter']['enabled']`   | `Boolen`  | `false`     | Enable Data Bags support      |
| `node['maxscale']['databag']['filter']['name']`      | `String`  | `maxscale`  | Data Bag name                 |
| `node['maxscale']['databag']['filter']['item_name']` | `String`  | `filter`    | Data Bag Item name            |

### Listener Definition
| attribute                                              | Type      | Default     | description                   |
|:-------------------------------------------------------|:---------:|:-----------:|:------------------------------|
| `node['maxscale']['filter']`                           | `Array`   | `[]`        | Please see usage              |
| `node['maxscale']['databag']['listener']['enabled']`   | `Boolen`  | `false`     | Enable Data Bags support      |
| `node['maxscale']['databag']['listener']['name']`      | `String`  | `maxscale`  | Data Bag name                 |
| `node['maxscale']['databag']['listener']['item_name']` | `String`  | `listener`  | Data Bag Item name            |

### Router Definition
| attribute                                            | Type      | Default     | description                   |
|:-----------------------------------------------------|:---------:|:-----------:|:------------------------------|
| `node['maxscale']['filter']`                         | `Array`   | `[]`        | Please see usage              |
| `node['maxscale']['databag']['router']['enabled']`   | `Boolen`  | `false`     | Enable Data Bags support      |
| `node['maxscale']['databag']['router']['name']`      | `String`  | `maxscale`  | Data Bag name                 |
| `node['maxscale']['databag']['router']['item_name']` | `String`  | `router`    | Data Bag Item name            |

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
