module Fog
  module Compute
    class Google
      class InstanceTemplate < Fog::Model
        identity :name

        attribute :kind
        attribute :self_link, :aliases => "selfLink"
        attribute :description
        attribute :properties

        def save
          requires :name
          requires :properties

          data = service.insert_instance_template(name, properties, description)
          operation = Fog::Compute::Google::Operations.new(:service => service).get(data.body["name"])
          operation.wait_for { !pending? }
          reload
        end

        def destroy(async = true)
          requires :name
          operation = service.delete_instance_template(name)
          unless async
            # wait until "DONE" to ensure the operation doesn't fail, raises
            # exception on error
            Fog.wait_for do
              operation.body["status"] == "DONE"
            end
          end
          operation
        end

        def resource_url
          "#{service.project}/global/instanceTemplates/#{name}"
        end
      end
    end
  end
end
