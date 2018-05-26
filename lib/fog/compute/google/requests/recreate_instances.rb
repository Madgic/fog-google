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
          request = ::Google::Apis::ComputeV1::InstanceGroupManagersAbandonInstancesRequest.new(
            :instances => instances.map{|x| x.self_link}
          )
          if instance_group_manager.zone
            zone = instance_group_manager.zone.split("/")[-1]
            @compute.recreate_instance_group_manager_instances(@project, zone, instance_group_manager.name, request)
          else
            region = instance_group_manager.region.split("/")[-1]
            @compute.recreate_region_instance_group_manager_instances(@project, region, instance_group_manager.name, request)
          end
        end
      end
    end
  end
end
