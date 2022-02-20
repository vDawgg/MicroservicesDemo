#!/bin/bash -eu
#
# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START gke_frontend_genproto]

#PATH=$PATH:$GOPATH/bin
protodir=../../pb

# Modified to generate demo_grpc.pb.go and demo.pb.go with protoc-gen-go@v1.26
# https://grpc.io/docs/languages/go/quickstart/
protoc --go_out=./genproto --go_opt=paths=source_relative --go_opt=Mdemo.proto=./genproto \
    --go-grpc_out=./genproto --go-grpc_opt=paths=source_relative -I $protodir $protodir/demo.proto

protoc --go_out=./genproto/reviewservice --go_opt=paths=source_relative --go_opt=Mdemo.proto=./genproto/reviewservice \
    --go-grpc_out=./genproto/reviewservice --go-grpc_opt=paths=source_relative -I $protodir $protodir/reviewservice.proto


# [END gke_frontend_genproto]
