class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    manager = CBLManager.sharedInstance
    error_ptr = Pointer.new(:object)
    @database = manager.databaseNamed("something", error: error_ptr)
    puts "unabled to get database" unless @database

    myViewQuery

    true
  end

  def myViewQuery
    view = @database.viewNamed("myview")
    setupMapBlockforView(view) unless view.mapBlock
    view.createQuery
  end

  def setupMapBlockforView view
    mapBlock = lambda { |doc, emit| emit(doc["type"], nil) }
    view.setMapBlock(mapBlock, reduceBlock: nil, version: "1")
  end

end
