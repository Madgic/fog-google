module Fog
  module Compute
    class Google
      class Mock
        def set_instance_template(instance_group_manager, instance_template)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def set_instance_template(instance_group_manager, instance_template)
          api_method = @compute.instance_group_managers.set_instance_template
          parameters = {
            "project" => @project,
            "zone" => instance_group_manager.zone.split("/")[-1],
            "instanceGroupManager" => instance_group_manager.name,
          }

          body_object = {
            "instanceTemplate" => instance_template.self_link,
          }

          request(api_method, parameters, body_object = body_object)
        end
      end
    end
  end
end
