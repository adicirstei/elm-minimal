module Random.Extras (random) where

import Task
import Native.Random

random : Task.Task x Float
random = Native.Random.random
