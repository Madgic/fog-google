module Fog
  module Compute
    class Google
      class Mock
        def recreate_instances(instance_group_manager, instances)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def recreate_instances(instance_group_manager, instances)
          api_method = @compute.instance_group_managers.recreate_instances
          parameters = {
            "project" => @project,
            "zone" => instance_group_manager.zone.split("/")[-1],
            "instanceGroupManager" => instance_group_manager.name,
          }

          body_object = {
            "instances" => instances.map{|x| x.self_link},
          }

          request(api_method, parameters, body_object = body_object)
        end
      end
    end
  end
end
