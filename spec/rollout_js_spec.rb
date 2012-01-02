require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe RolloutJs do
  before do
    @redis   = Redis.new
    @rollout = Rollout.new(@redis)

    RolloutJs.redis   = @redis
    RolloutJs.rollout = @rollout
  end

  describe "when there is no features" do
    it "block evaluates to false" do
      evaljs(RolloutJs.generate(stub(:id => 5)))
      evaljs("Rollout.is_active('chat')").should be_false
    end
  end

  describe "when a group is activated" do
    before do
      @rollout.define_group(:fivesonly) { |user| user.id == 5 }
      @rollout.activate_group(:chat, :fivesonly)
    end

    it "the feature is active for users for which the block evaluates to true" do
      evaljs(RolloutJs.generate(stub(:id => 5)))
      evaljs("Rollout.is_active('chat')").should be_true
    end

    it "is not active for users for which the block evaluates to false" do
      evaljs(RolloutJs.generate(stub(:id => 1)))
      evaljs("Rollout.is_active('chat')").should be_false
    end
  end
end

