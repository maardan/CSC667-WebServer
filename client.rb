require 'socket'

DEFAULT_PORT = 56789

c = TCPSocket.open 'localhost', DEFAULT_PORT

while line = c.gets
    puts line
end

c.close