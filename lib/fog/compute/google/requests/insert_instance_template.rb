module Fog
  module Compute
    class Google
      class Mock
        def insert_instance_template(_name, _properties, _description)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def insert_instance_template(name, properties, description)
          instance_template = ::Google::Apis::ComputeV1::InstanceTemplate.new(
            :description => description,
            :name => name,
            :properties => properties,
          )

          @compute.insert_instance_template(@project, instance_template)
        end
      end
    end
  end
end
