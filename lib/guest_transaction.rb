class GuestTransaction

  def initialize(object)
    @object  = object
  end

  def commit_bindurl
    access = AccessNode.create!(@object)
    #logger.info @object 
    Auth.create!(auth_type:"radius",auth_device:false,access_node_id:access.id)
    Conf.create!(access_node_id:access.id)
  end

end
