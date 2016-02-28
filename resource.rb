class Resource
  attr_reader :uri, :http_conf, :mime_type

  def initialize (uri, http_conf, mime_type)
    @uri = uri
    @http_conf = http_conf
    @mime_type = mime_type
  end 

  def resolve
    
  end

  def mime_type
    
  end

  def script
  end 
end
