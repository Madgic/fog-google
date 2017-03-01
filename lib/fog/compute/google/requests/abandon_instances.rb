module Fog
  module Compute
    class Google
      class Mock
        def abandon_instances(instance_group_manager, instances)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def abandon_instances(instance_group_manager, instances)
          if instance_group_manager.zone
            api_method = @compute.instance_group_managers.abandon_instances
            parameters = {
              "project" => @project,
              "zone" => instance_group_manager.zone.split("/")[-1],
              "instanceGroupManager" => instance_group_manager.name,
            }
          else
            api_method = @compute.region_instance_group_managers.abandon_instances
            parameters = {
              "project" => @project,
              "region" => instance_group_manager.region.split("/")[-1],
              "instanceGroupManager" => instance_group_manager.name,
            }
          end

          body_object = {
            "instances" => instances.map{|x| x.self_link},
          }

          request(api_method, parameters, body_object = body_object)
        end
      end
    end
  end
end
