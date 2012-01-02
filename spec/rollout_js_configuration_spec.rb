require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe RolloutJs do
  before do
    @redis   = Redis.new
    @rollout = Rollout.new(@redis)

    RolloutJs.redis   = @redis
    RolloutJs.rollout = @rollout
  end

  it "properly fetches features" do
    RolloutJs.fetch_features.should == []
    @rollout.activate_group(:chat, :all)
    RolloutJs.fetch_features.should == ['chat']
  end
end
