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
          zone = instance_group_manager.zone.split("/")[-1]
          request = ::Google::Apis::ComputeV1::InstanceGroupManagersSetInstanceTemplateRequest.new(
            :instance_template => instance_template.self_link
          )
          @compute.set_instance_group_manager_instance_template(@project, zone, instance_group_manager.name, request)
        end
      end
    end
  end
end
