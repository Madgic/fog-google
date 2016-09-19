module Fog
  module Compute
    class Google
      class Mock
        def get_instance_template(_name)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def get_instance_template(name)
          api_method = @compute.instance_templates.get
          parameters = {
            "project" => @project,
            "instanceTemplate" => name,
          }

          request(api_method, parameters)
        end
      end
    end
  end
end
