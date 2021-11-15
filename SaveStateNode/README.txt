Directions:
- Load SnapshotManager.gd as an autoload (Project > Project Settings > AutoLoad)
- Add an instance of SnapshotTarget as a child of any nodes that should be able
  to save/load states.

Usage:
- Call or emit the save_state/load_state functions or signals on
  SnapshotManager, passing a key value. The key can be anything, and if you're
  only saving one state, it can just be a constant lmao.

Caveats:
- Not super fast.
- Each node tracks its own state, so if nodes are actually destroyed, they
  won't be recreated. If you want you can "fake destroy" the node by having some
  kind of "enabled" bool on it. If you're doing object pooling you'll alread
  have this.
- Saving and loading states is a global operation, although it shouldn't be hard
  to modify it so you can save/load states for any selection of nodes (ie. save
  the state for all nodes in a certain group, etc.).
