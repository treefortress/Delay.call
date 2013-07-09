[license]: https://github.com/treefortress/CallLater/raw/master/license.txt

CallLater
=========

An alternative to setTimeout, which gives you control over the time elapsed, and ability to easily remove scheduled calls. 

It also provides convenience methods for clearing all existing Calls, for example, when your player has died, you might want to release any pending calls.

### USAGE

**Basic Usage**
* CallLater.add(myFunction, 1000, [arg1, arg2]);
* CallLater.remove(myFunction);

**Updating** 

CallLater is updated manually, you pass in the time elapsed, giving you full control:
* CallLater.update(deltaTime);

Perhaps your game has a slowMotion mode, you can have all callbacks take that into effect:
* CallLater.update(deltaTime * Game.slowFactor);

### License
[WTFPL][license]