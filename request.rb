require 'socket' 

class Request
  attr_reader :method, :uri, :version, :headers, :body, :stream
  
  def initialize(args)
    @stream = args
  end
  
  def parse
    request = @stream.gets
    print "request: ", request
    
    request_parse = request.split(" ")
    path, query = fullpath[1].split("?")
    
    @method = request_parse[0]
    @uri = request_parse[1]
    @version = request_parse[2]
    @headers = Hash.new
    @body = "body"
    
    while (request_headers = @stream.gets) != "\r\n"
      key, value = header.split(": ")
      @headers.store(key, value)
    end
    
    # print the parsing string
    @headers.each do |key, value|
      puts "#{key}: #{value}"
    end
    print "\r\n"
    puts "#{@body}"
    
  end
end