require 'socket'
require_relative 'request'
require_relative 'response'

class WebServer
  attr_reader :options

  DEFAULT_PORT = 56789

  def initialize(options={})
    @options = options
  end

  def start
    loop do
      puts "Opening server socket to listen for connections"
      client = server.accept

      client_request = client.gets
      
      Request.new(client_request).parse 

      puts "Writing message"
      client.puts Response.new.to_s
      client.close
    end
  end

  def server
    @server ||= TCPServer.open(options.fetch(:port, DEFAULT_PORT))
  end
end