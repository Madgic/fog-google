module Fog
  module Compute
    class Google
      class InstanceGroupManagers < Fog::Collection
        model Fog::Compute::Google::InstanceGroupManager

        def all(filters = {})
          if filters[:zone]
            data = Array(service.list_aggregated_instance_group_managers(filters[:zone]))
          else
            data = []
            service.list_aggregated_instance_group_managers.items.each_value do |group|
              data.concat(group.instance_group_managers) if group.instance_group_managers
            end
          end

          load(data.map(&:to_h))
        end

      end
    end
  end
end
