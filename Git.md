
git add, commit, push, pull
git reset — undo commits
git restore --staged — unstage files
git stash / git stash pop — temporarily shelve changes
git branch, git checkout -b — branching
git merge vs git rebase — know the difference conceptually
git log --oneline — clean history view
git diff — see what changed


Will overwrite local files:
git checkout <branch> — switches branch, overwrites local files to match that branch
git restore <filename> — discards local changes, reverts file to last commit. No undo.
git reset --hard — resets everything to a commit, wipes all local changes. No undo.
git pull — if there are conflicts it can overwrite local work

Safe — never touches local files:
git reset HEAD~1 (default/mixed) — undoes commit, keeps files
git restore --staged — just unstages, files untouched
git stash — saves changes away safely, files revert but recoverable with git stash pop
git add, git commit, git push — never destructive to local files
git log, git diff, git status — read only
