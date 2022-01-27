# github_flutter_bloc_issue_3174

Example app for https://github.com/felangel/bloc/issues/3174

**Problem**: how to call one bloc from another?

**Context**:
- `Bloc 1` allows to add a new item into some storage
- `Bloc 2` allows to render a list of the present items
- **Question**: how to trigger a refresh of `Bloc 2` when `Bloc 1` completes the insertion of the item?
- This should actually happen in `_AddItemDialogState` on line `37`.
