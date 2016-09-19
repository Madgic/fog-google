module Fog
  module Compute
    class Google
      class Mock
        def list_instance_group_managers(_zone)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def list_instance_group_managers(zone)
          api_method = @compute.instance_group_managers.list
          parameters = {
            "project" => @project,
            "zone" => zone
          }

          request(api_method, parameters)
        end
      end
    end
  end
end
