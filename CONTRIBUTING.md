This page describes how to contribute to the `ml4c3` repo.

## Table of Contents
1. [:octocat: Workflow](#octocat-workflow)
1. [:warning: Issues](#warning-issues)
1. [:evergreen_tree: Branches](#evergreen_tree-branches)
1. [:speech_balloon: Commit messages](#speech_balloon-commit-messages)
1. [:white_check_mark: Pre-commit hooks](#white_check_mark-pre-commit-hooks)
1. [:rocket: Pull requests](#rocket-pull-requests)
1. [:construction: Code reviews](#construction-code-reviews)
1. [:globe_with_meridians: Wiki](#globe_with_meridians-wiki)

## :octocat: Workflow
You have an idea for a new way to visualize data. Or, you identified a bug in some machine learning infrastructure. Or, you want to speed up tensorization with a new Python package.

1. Open an issue (or, take ownership of an existing issue).
    - When you begin working on an issue, move it to `in progress` on the board.
1. Check out a branch:
    ```bash
    git commit -B er-fix-tensorflow-error
    ```
1. Commit changes early and often!
1. When the code is ready for review, submit a PR. Your goal is to merge your work into `master`.

The rest of the documentation describes each step in more detail.

## :warning: Issues
Every task has an issue, and each issue has 1+ labels.

New issues are created with our [issue templates](.github/ISSUE_TEMPLATE): 1) new feature request or enhancement, 2) data or modeling task, 3) question ,or 4) bug report.

Good issues are clearly written and small enough to be addressed in a few days. Several small tasks can be bundled into one issue.

Issues (aside from questions) should have one person who owns responsibility for completion.

We prefer to close issues via pull request (PR; see below).

We organize issues and PRs by project using [boards](https://github.com/orgs/aguirre-lab/projects).

Boards are incredibly powerful because it allows anyone on the team to quickly understand what everyone else is working on, identify blockers, and assess progress.

New issues go to the `To do (backlog)` column.

If a new issue is a priority, it is moved to the `To do (current sprint)` column and addressed that week.

Issues that are actively being worked on are moved to the `In progress (issues)` column.

Issues do not go in `In review (PRs)` column. Only PRs go there.

## :evergreen_tree: Branches
When you start to work on an issue, create a new branch and work on it until the code is ready to be merged with the master.

Name your branch with your initials, a description related to the issue, and dashes between words:
```bash
$ git checkout -b er-fix-grid-ecg-plot
$ git push -u origin er-fix-grid-ecg-plot
```

## :speech_balloon: Commit messages
1. Use the present tense ("Add feature" not "Added feature")
1. Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
1. Limit the first line to 72 characters or less
1. Reference issues and pull requests liberally after the first line

## :white_check_mark: Pre-commit hooks
We use `pre-commit` to automate a linting pipeline to run each time you call `git commit`.

`pre-commit` hooks must all pass (or the user must ignore them via the `-n` flag) for
files to be committed.

### Linting
Linting the code means keeping the code readable and in a good format (Similar to
what [PEP8](https://www.python.org/dev/peps/pep-0008/) dictates). To do that,
a pipeline has been configured to run formatting tests. This pipeline will
check your code for formatting mistakes. It will also reformat some of your
code automatically so that you don't have to do it yourself, but some
modifications will still need to be done manually.

The following tests compose the linting pipeline:

| Test name                       | Short description                                                           |
|---------------------------------|-----------------------------------------------------------------------------|
| check-executables-have-shebangs | Ensures that (non-binary) executables have a shebang.                       |
| check-symlinks                  | Checks for symlinks which do not point to anything.                         |
| check-toml                      | This hook checks xml files for parseable syntax.                            |
| check-yaml                      | This hook checks yaml files for parseable syntax.                           |
| debug-statements                | Check for debugger imports and py37+ `breakpoint()` calls in python source. |
| end-of-file-fixer               | Ensures that a file is either empty, or ends with one newline.              |
| mixed-line-ending               | Replaces ; endings bu \n                                                    |
| name-tests-test                 | This verifies that test files are named correctly                           |
| no-commit-to-branch             | Don't commit to branch (master)                                             |
| trailing-whitespace             | This hook trims trailing whitespace.                                        |
| python-use-type-annotations     | Enforce that python3.6+ type annotations are used instead of type comments  |
| python-no-log-warn              | A quick check for the deprecated `.warn()` method of python loggers         |
| rst-backticks                   | Detect common mistake of using single backticks when writing rst            |
| isort                           | Check and reorders imports                                                  |
| seed-isort-config               | Automatic configuration for third party packages for isort                  |
| black                           | Popular linter. Checks and reformats code                                   |
| docformatter                    | Reformats docstrings                                                        |
| pydocstyle                      | Checks docstrings' format                                                   |
| markdownlint                    | Checks markdown syntax                                                      |
| flake8                          | Popular linter. Checks the code more deeply than black                      |
| pylint                          | Most popular linter and also the most strict                                |
| mypy                            | Checks python's typing                                                      |
| gitlint                         | Checks commit messages                                                      |

This pipeline is called on every commit. However, if you want to pass a particular 
test of the pipeline at any time, you can run

```
pre-commit run <name of the test>
```

### `pre-commit` hooks
Normally, all tests should pass before you commit. However, sometimes
tests are too strict or they ask for somethings that can't be made in
a particular situation. Some tests may even contradict each other.

If you find yourself in one of these situations, you can to skip a particular test run by doing:

```
$ SKIP=pylint git commit -m 'this is a special commit'
```

To skip multiple tests:
```
$ SKIP=pylint,flake8 git commit -m 'this is a special commit'
```

To skip all the tests (this should hardly ever happen):
```
$ git commit -m 'this is a very special commit' --no-verify
```

## :rocket: Pull requests
To contribute code or documentation changes from your branch to the `master` branch in the repo, open a PR.

Before you submit a PR, review these [best practices for participating in a code review](https://mtlynch.io/code-review-love/).

New PRs follow our [template](.github/pull_request_template.md):
- List the issues your PR closes. This auto-populates the "linked issues" section on the right nav bar.
- Describe the major changes in bullet points.
- Ensure you check all of the quality control boxes.

Start your PR as a draft. When your PR is finalized and ready for review, convert it from a draft to a pull PR.

Assign at least one reviewer.

Reviewers approve PRs before code merges to `master`. Our team strives for a turnaround time of 24-48 hours. If a review is stale, remind the reviewer. If the review is too complex for this turnaround time, the PR is too large and should be divided into smaller PRs.

When PRs are approved, all commits are "squash merged", e.g. combine all commits from the head branch into a single commit in the base branch. Also, the branch is automatically deleted.

We encourage small and fast PRs that solve one or a few issues. They are easier to write, review, and merge. Hence, they are also less likely to introduce catastrophic bugs.

## :construction: Code reviews
Reviewing other's code, and having your code reviewed by others, is an important part of ensuring our code is excellent. It also helps us improve how we communicate ideas -- in code, in comments as a reviewer, and in responses to reviewer comments.

Code reviewers focus on implementation and style that are not caught by debugging or `pre-commit` hooks:
1. Are variables clearly named and self-explanatory? We avoid short names or acronyms that lack description.
1. Are arguments type-hinted?
1. Is code appropriately modularized? If code is repeated, should it be a function instead?
1. Is code in the appropriate scope for that script? Should the function be somewhere else in the repo?
1. Is the functionality performant? Is there a faster but not substantially more challenging implementation?

The developer who submits the PR is responsible for code to run without errors, and to
not break other functionality in the repo. Automated tests also help with this.

To learn how to review code, you must spend some time with our group to understand our
style. We recommend you look at the reviews from merged PRs to understand expectations.

## :globe_with_meridians: Wiki
`ml4c3` and all related data resources are documented in the repo's [wiki](https://github.com/aguirre-lab/ml4c3/wiki).

Do not directly edit the `ml4c3` wiki! Instead, submit issues and PRs to the [wiki repo](https://github.com/aguirre-lab/ml4c3-wiki/).
The `ml4c3` wiki is automatically updated from the `ml4c3-wiki` repo via Travis.
