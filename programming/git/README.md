# Git

A version-control system.

## Useful commands

1. [Undo most recent commit](#undo-commit)

### Undo commit

```bash
git commit -m "Bad commit"
git reset HEAD~ # undo recent commit
git add ... # add to a new commit
```

If change already pushed and you have overwrite permissions (rebase):

```bash
git push origin master --force
```

## Other

- [Udacity Git Commit guide](https://udacity.github.io/git-styleguide/)
