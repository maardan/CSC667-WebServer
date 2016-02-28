require 'socket' 

class Response # generates generic OK response to send to the client
  attr_reader :version, :response_code, :response_phrase, :headers, :body
  
  def initialize(body)
    @body            = "Request string sent!"
    @version         = 1.1
    @response_code   = 200
    @response_phrase = "OK"
    @headers         = {"Content-Type" => "text/plain",
                       "Content-Length" => "#{@body.bytesize}",
                       "Connection" => "close"}
  end
  
  def to_s
    return "#{@version} #{@response_code} #{@response_phrase}\r\n" +
           "Content-Type: #{@headers["Content-Type"]}\r\n" +
           "Content-Length: #{@headers["Content-Length"]}\r\n" +
           "Connection: #{@headers["Connection"]}\r\n" +
           "Server: CSC 667 Server Project\n" +
           "Date: #{Time.now}\n" +
           "Last-Modified: #{Time.now}\n\n" + 
           "\r\n" +
           "#{@body}\r\n"
  end
end