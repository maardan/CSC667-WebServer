require 'socket' 

class Request
  attr_reader :method, :uri, :version, :headers, :body, :stream
  
  def initialize(args)
    @stream = args
  end
  
  def parse
    # request = @stream.gets
    # print "request: ", request
    
    # request_parse = request.split(" ")
    # path, query = fullpath[1].split("?")
    
    # @method = request_parse[0]
    # @uri = request_parse[1]
    # @version = request_parse[2]
    @headers = Hash.new
    # @body = "body"
    
    while next_line_readable?(@stream) 

        case line = @stream.gets.chomp
        when /^[A-Z]* \/.* HTTP\/[0-9].[0-9]$/
            @verb, @uri, @version = line.split
        when /^[A-Z].*: .*$/
            key, value = line.split(": ")
            @headers[key] = value
        when /^<[a-z]*>.*<\/[a-z]*>$/
            @body = line
        end
    end
    
    # print the parsing string
    str_builder =  "#{@verb} #{@uri} #{@version}<br>\n"
    @headers.each do |key, value|
      puts "#{key}: #{value}"
    end

    puts "\n#{str_builder}\n"

    # print "\r\n"
    # puts "#{@body}"

    return str_builder

  end

    private def next_line_readable?(socket)
        readfds, writefds, exceptfds = select([socket], nil, nil, 0.1)
        readfds
    end
end