source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.3'

use_frameworks!

def ui
    pod 'SVProgressHUD'
    pod 'SDWebImage'
end

def orm
    pod 'RealmSwift'
end

def networking
    pod 'Contentful'
end

target 'Desafio Globosat' do
    ui
    orm
    networking
end

target 'Desafio GlobosatTests' do
    orm
end
