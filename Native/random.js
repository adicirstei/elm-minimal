Elm.Native.Random = {};
Elm.Native.Random.make = function(localRuntime) {
  localRuntime.Native = localRuntime.Native || {};
	localRuntime.Native.Random = localRuntime.Native.Random || {};
  if (localRuntime.Native.Random.values)
	{
		return localRuntime.Native.Random.values;
	}

	var Task = Elm.Native.Task.make(localRuntime);

	var random = Task.asyncFunction(function(callback) {
		return callback(Task.succeed(Math.random()));
	});

	return localRuntime.Native.Random.values = {
		random: random
	};
}
