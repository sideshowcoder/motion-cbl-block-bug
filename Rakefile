# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'motion-cbl-block-bug'

  # Make sure the CouchbaseLite Headers are found
  # this makes CocoaPods kind of redundant but currently is the only way this works
  #
  # http://equip9.org/2014/03/06/adding-couchbase-in-a-rubymotion-app.html
  # https://groups.google.com/forum/#!topic/rubymotion/wVqdLWQ5uao
  #
  app.vendor_project('vendor/Pods/couchbase-lite-ios/CouchbaseLite.framework',
                     :static,
                     products: ['CouchbaseLite'],
                     headers_dir: 'Headers')

  app.pods do
    pod 'couchbase-lite-ios', '~> 1.0'
  end

end
