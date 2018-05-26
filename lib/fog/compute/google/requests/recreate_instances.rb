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
          zone = instance_group_manager.zone.split("/")[-1]
          request = ::Google::Apis::ComputeV1::InstanceGroupManagersAbandonInstancesRequest.new(
            :instances => instances.map{|x| x.self_link}
          )
          @compute.recreate_instance_group_manager_instances(@project, zone, instance_group_manager.name, request)
        end
      end
    end
  end
end
