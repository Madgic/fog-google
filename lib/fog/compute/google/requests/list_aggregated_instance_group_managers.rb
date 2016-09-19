module Fog
  module Compute
    class Google
      class Mock
        def list_aggregated_instance_group_managers(_options = {})
          Fog::Mock.not_implemented
        end
      end

      class Real
        def list_aggregated_instance_group_managers(options = {})
          api_method = @compute.instance_group_managers.aggregated_list
          parameters = {
            "project" => @project
          }
          parameters["filter"] = options[:filter] if options[:filter]

          request(api_method, parameters)
        end
      end
    end
  end
end
