module RolloutJs
  module RedisMiddleware
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def fetch_features
        redis.keys.select {|e| e.include? 'feature'}.collect {|e| e.scan(/feature:([\S]+):/) }.flatten
      end
    end
  end
end
