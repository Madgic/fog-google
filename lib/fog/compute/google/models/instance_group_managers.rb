module Fog
  module Compute
    class Google
      class InstanceGroupManagers < Fog::Collection
        model Fog::Compute::Google::InstanceGroupManager

        def all(filters = {})
          if filters[:zone]
            data = service.list_instance_group_manager(filters[:zone]).body
          else
            data = []
            service.list_aggregated_instance_group_managers.body["items"].each_value do |group|
              data.concat(group["instanceGroupManagers"]) if group["instanceGroupManagers"]
            end
          end

          load(data)
        end

      end
    end
  end
end
