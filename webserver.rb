require 'socket'
require_relative 'request'
require_relative 'response'
# require_relative 'httpConfig'
# require_relative 'mimeType'

class WebServer
  attr_reader :options

  DEFAULT_PORT = 56789

  def initialize(options={})
      @options = options
  end
    

  # def initialize(options={})
  #   @options = options
  # end

  def start

    # @httpd_config = HttpConfig.new(read_config_file("httpd.conf"))
    # @mime_types = MimeType.new(read_config_file("mime.types"))

    server = TCPServer.open @options 

    loop do
      puts "Opening server socket on options #{@options} to listen for connections"
      
      client = server.accept

      # client_request = client.gets
      
      #Request.new(client_request).parse 
      http_request = Request.new(client).parse 

      # puts "Writing message"

      client.puts Response.new(http_request).to_s
      client.close
    end
  end

  # def server
  #   @server ||= TCPServer.open(options.fetch(:options, DEFAULT_PORT))
  # end

  # private def read_config_file(config_file)

  #   config_path = "config/" << config_file

  #   config_array = Array.new
  #   File::open(config_path, "r") do |file|
  #       file.each do |line|
  #           config_array.push line
  #       end
  #   end
  #   config_array 
  # end        
end