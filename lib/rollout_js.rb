$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__))) unless $LOAD_PATH.include?(File.expand_path(File.dirname(__FILE__)))

require 'json'
require 'rollout_js/configuration'
require 'rollout_js/redis_middleware'

module RolloutJs
  include RolloutJs::Configuration
  include RolloutJs::RedisMiddleware

  def self.generate(user)
    content = File.read(File.dirname(__FILE__) + "/assets/rollout.js")

    hsh = features(user)
    if hsh.count.zero?
      content.gsub!("FEATURES", "{}") 
    else
      content.gsub!("FEATURES", "JSON.parse('#{hsh.to_json}')") 
    end
    content
  end

  def self.features(user)
    result = {}
    fetch_features.each do |feature|
      result.merge!({feature.to_sym => rollout.active?(feature, user)})
    end
    result
  end

  private_class_method :features
end
