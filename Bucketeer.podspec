Pod::Spec.new do |s|
  s.name     = "Bucketeer"
  s.version  = "1.19.0" # replace this at CI
  s.summary  = "Bucketeer Feature Flag & A/B Testing Service"
  s.homepage = "https://github.com/ca-dp/bucketeer-ios-sdk"

  s.ios.deployment_target = "10.0"
  s.tvos.deployment_target = "10.0"
  s.swift_version = "5.0"

  s.author = {
    "Bucketeer team" => "bucketeer@cyberagent.co.jp"
  }

  s.source_files = "Bucketeer/Sources/**/*.{swift,h,m}"
  s.source = {
      :git => "https://github.com/ca-dp/bucketeer-ios-sdk.git",
      :tag => "v#{s.version}",
  }

  s.dependency "gRPC-Swift", "1.0.0-alpha.19"

  s.license = {
    :type => "Apache License, Version 2.0",
    :text => <<-LICENSE
      Copyright (c) 2020 Bucketeer

      Licensed under the Apache License, Version 2.0 (the "License");
      you may not use this file except in compliance with the License.
      You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

      Unless required by applicable law or agreed to in writing, software
      distributed under the License is distributed on an "AS IS" BASIS,
      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
      See the License for the specific language governing permissions and
      limitations under the License.
    LICENSE
  }
end
