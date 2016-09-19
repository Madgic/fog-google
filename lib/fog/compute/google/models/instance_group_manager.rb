module Fog
  module Compute
    class Google
      class InstanceGroupManager < Fog::Model
        identity :name

        attribute :kind
        attribute :self_link, :aliases => "selfLink"
        attribute :zone
        attribute :instance_group, :aliases => "instanceGroup"
        attribute :instance_template, :aliases => "instanceTemplate"

        def set_instance_template instance_template
          service.set_instance_template self, instance_template
        end

        def resource_url
          "#{service.project}/global/instanceGroupManagers/#{name}"
        end
      end
    end
  end
end
