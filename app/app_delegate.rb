class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    manager = CBLManager.sharedInstance
    error_ptr = Pointer.new(:object)
    @database = manager.databaseNamed("something", error: error_ptr)
    puts "unabled to get database" unless @database

    doc = @database.createDocument
    properties = { "type" => "foo" }
    doc.putProperties properties, error: error_ptr

    myViewQuery.run(error_ptr).each { |value| puts value.document.properties }

    true
  end

  def myViewQuery
    view = @database.viewNamed("myview")
    setupMapBlockforView(view) unless view.mapBlock
    view.createQuery
  end

  def setupMapBlockforView view
    mapBlock = lambda { |doc, emit| emit.call(doc["type"], nil) }
    view.setMapBlock(mapBlock, reduceBlock: nil, version: "1")
  end
end
