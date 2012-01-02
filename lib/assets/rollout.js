var Rollout = {};

Rollout.is_active = function(feature) {
  var features = FEATURES;
  return features.hasOwnProperty(feature) && features[feature];
}
