module Fog
  module XenServer
    class Compute
      class Real
        def set_memory_dynamic_range_server(ref, min, max)
          @connection.request({ :parser => Fog::XenServer::Parsers::Base.new, :method => "VM.set_memory_dynamic_range" }, ref, min, max)
        end

        alias_method :set_memory_dynamic_range_vm, :set_memory_dynamic_range_server
      end
    end
  end
end
