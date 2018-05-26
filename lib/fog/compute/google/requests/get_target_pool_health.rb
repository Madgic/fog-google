module Fog
  module Compute
    class Google
      class Mock
        def get_target_pool_health(_target_pool, _region, _instance)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def get_target_pool_health(target_pool)
          api_method = @compute.target_pools.get_health
          parameters = {
            "project" => @project,
            "targetPool" => target_pool.name,
            "region" => target_pool.region.split("/")[-1]
          }

          health_results = target_pool.instances.map do |instance|
            begin
              body = { 'instance' => instance }
              resp = request(api_method, parameters, body_object=body)
              [instance, resp.data[:body]['healthStatus']]
            rescue
              [instance, nil]
            end
          end
          Hash[health_results]
        end
      end
    end
  end
end
