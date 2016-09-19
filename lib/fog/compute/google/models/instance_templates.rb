module Fog
  module Compute
    class Google
      class InstanceTemplates < Fog::Collection
        model Fog::Compute::Google::InstanceTemplate

         def all
          data = service.list_instance_templates
          instance_templates = data.body["items"] || []
          load(instance_templates)
        end

        def get(identity)
          if instance_template = service.get_instance_template(identity).body
            new(instance_template)
          end
        rescue Fog::Errors::NotFound
          nil
        end

      end
    end
  end
end
