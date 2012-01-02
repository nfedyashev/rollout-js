module RolloutJs
  module Configuration
    def self.included(base)
      base.extend ClassMethods

      base.send :private_class_method, :redis
      base.send :private_class_method, :rollout
    end

    module ClassMethods
      def redis
        @redis ||= ::Redis.new
      end

      def redis=(redis)
        @redis = redis
      end

      def rollout
        @rollout || ::Rollout.new(redis)
      end

      def rollout=(rollout)
        @rollout = rollout
      end
    end
  end
end
