#!/usr/bin/env bats

@test "chef-client found in PATH" {
  run which chef-client
  [ "$status" -eq 0 ]
}
