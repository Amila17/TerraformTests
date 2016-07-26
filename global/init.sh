#!/bin/bash

terraform remote config -backend=consul -backend-config="path=platform/test/infrastructure/global/state" -backend-config="address=10.36.0.70:8500" -backend-config="access_token=f47ba9d0-4a83-11e6-aa04-000d3a2014e9"
