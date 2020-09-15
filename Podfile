platform :ios, '10.0'
use_frameworks!

workspace 'Bucketeer'

def shared_pods
    pod 'gRPC-Swift', '1.0.0-alpha.19'
end

target 'Bucketeer' do
    shared_pods
end

target 'BucketeerTVOS' do
    platform :tvos, '10.0'
    shared_pods
end

target 'BucketeerTests' do
    shared_pods
end

target 'Example' do
    shared_pods
end

target 'ExampleTVOS' do
    platform :tvos, '10.0'
    shared_pods
end
