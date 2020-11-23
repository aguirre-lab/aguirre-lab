# Aguirre Lab - onboarding & workflow

## Contents
- [Stack](#stack)
- [GitHub](#github)
- [Wiki](#Wiki)
- [Slack](#slack)
- [Meetings](#meetings)
- [Data](#data)
- [Compute](#compute)
- [MGH logistics](#mgh-logistics)
- [Office space](#office-space)
- [Roster](https://paper.dropbox.com/doc/aguirre-lab-roster-lGQvFINrQ1ZQ6A6GnMpkp)
- [IRB coverage](https://paper.dropbox.com/doc/IRB-coverage--A7uo~yh4R0BWfUIVP3aAtb_MAg-ypV58gm96PA8WeNy09XLM)

## Stack
In the technology world, a "stack" is the set of tools, libraries, and packages one or one's team uses.

Read [`the missing semester of your CS education`](https://missing.csail.mit.edu) to learn basic proficiency with the tools we use every day.

We use macOS and Ubuntu Linux. Our GPU workstations and servers run the latter.

We interact with our workstations and servers through the command line. [`iTerm2`](https://iterm2.com) is especially good for macOS. To manage sessions and panes, we like `tmux`. We do not use graphical remote desktop software.

Most of our technical work and project management is in GitHub: version control, documentation, code review, issues, etc.

We use Dropbox to store results, smaller data sets, manuscripts, etc. [`Here is a guide`](dropbox.md) to setting up Dropbox on a Linux machine.

We use Keynote for presentations.

We communicate via Slack, email, and Zoom.

We schedule meetings on our MGH calendars (Outlook).

## GitHub

As a biomedical data science group, we use GitHub for most of our workflow.

### Getting started
1. DO NOT SHARE PHI ON GITHUB!
1. Do not share code via Dropbox, email, or any other mechanism than GitHub.
1. Our GitHub organization is [`https://github.com/aguirre-lab`](https://github.com/aguirre-lab).
1. Every project has a (1) repo (`$PROJECT_NAME`), (2) board (see below), (3) Slack channel to discuss the project (`#$PROJECT_NAME`), and (4) Slack channel for GitHub notifications for that repo (`#PROJECT_NAME-repo`).
1. Every repo starts out private. Open-sourcing of code requires a discussion with Aaron.
1. Every repo has a `README`.
1. Every repo has a [BSD 3-clause license](https://choosealicense.com/licenses/bsd-3-clause/).

### Issues
Every task has an issue, and each issue is labeled to help us stay organized.

New issues are created using one of our three [issue templates](.github/ISSUE_TEMPLATE): 1) new feature request or enhancement, 2) bug report, or 3) question.

Good issues are clearly written and small enough to be addressed in one sprint of work (1-5 days).

Issues should have an assignee who owns completion.

Issues should be labeled so they are easier to organize.

We usually close issues via PR.

### Boards
We track issues and PRs on Kanban-style [project boards](https://github.com/orgs/aguirre-lab/projects).

If a new issue is low priority, it is added to the `To do (backlog)` column.

If a new issue is high priority, it is added to the `To do (current sprint)` column and addressed the current week.

Issues that are being actively worked on are moved to the `In progress (issues)` column.

Issues do not go in `In review (PRs)` column. Only PRs go there.

### Branches
Generally, create a branch for each issue and work on it until the code is ready to be merged with the master.
Name your branch with your initials, a description related to the issue, and dashes between words. 

To create the branch and push it to the repo, follow these two steps:

```bash
$ git checkout -b er-fix-grid-ecg-plot
$ git push -u origin er-fix-grid-ecg-plot
```

### Commit messages
Commit changes by adding the corresponding files and commit them. If you also want to see the changes on the repo, push them:
```bash
$ git add <file_1> <file2_> <file_n>
$ git commit -m <message>
$ git push 
```
We do not enforce strict commit message style, but try to follow good practices as described in this blog post: https://chris.beams.io/posts/git-commit/#capitalize.
Moreover, it is strongly encouraged to add the issue id at each commit message, so commits are tracked within the issue:
```bash
$ git commit -m <<message> Ref #<issue id>>
```

### Pre-commit hooks
The repo is setup so that whenever you commit a file, the linting pipeline is run.
If the tests are passed, then the files are commited. If they aren't the files won't be allowed to be commited.

#### Linting
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
test of the pipeline at any time, you can run: 

```pre-commit run <name of the test>```


#### Dealing with the hooks
Normally, all tests should pass before you commit. However, sometimes
tests are too strict or they ask for somethings that can't be made in
a particular situation. Some tests may even contradict each other.

If you find yourself in one of these situations, you can to skip a particular test run by doing:

```$ SKIP=pylint git commit -m 'this is a special commit' ```

To skip multiple tests:
```$ SKIP=pylint,flake8 git commit -m 'this is a special commit' ```

To skip all the tests (this should hardly ever happen):
```$ git commit -m 'this is a very special commit' --no-verify ```

### Pull requests (PRs)
To contribute code or documentation changes from your branch to the `master` branch in the repo, open a PR.

New PRs follow our [template](.github/pull_request_template.md).

List the issues your PR closes. This should auto-populated the "linked issues" section on the right nav bar.

Describe the major changes in bullet points.

Always start your PR as a draft. Do not convert the draft into a full PR until your work is finalized and ready for review. This is for two reasons. First, automated code tests run on full PRs and consume the finite amount of run time that GitHub provides us. Second, reviewers should only dedicate time for reviewing your PR when it is ready.

Assign at least one reviewer.

Reviewers approve PRs before code merges to `master`. They have 48 hours. If a review is stale, remind the reviewer.

When PRs are approved, all commits are "squash merged", e.g. combine all commits from the head branch into a single commit in the base branch. Also, the branch is automatically deleted.

We encourage small and fast PRs that solve one or a few issues. They are easier to write, review, and merge. Hence, they are also less likely to introduce catastrophic bugs.

### Code reviews
Reviewing other's code, and having your code reviewed by others, is an important part of ensuring our code is excellent. It also helps us improve how we communicate ideas -- in code, in comments as a reviewer, and in responses to reviewer comments.

Code reviewers focus on implementation and style that are not caught by debugging or `pre-commit` hooks.

A few key points:
1. Are variables clearly named and self-explanatory? We avoid short names or acronyms that lack description.
1. Are arguments type-hinted?
1. Is code appropriately modularized? If code is repeated, should it be a function instead?
1. Is code in the appropriate scope for that script? Should the function be somewhere else in the repo?
1. Is the functionality performant? Is there a faster but not substantially more challenging implementation?

The onus for code to work is on the developer who submits the PR. Automated tests also help with this.

Reviewing code is hard until you spend some time with our group to understand our style. We recommend you look at the reviews from old merged PRs to understand what is expected of a reviewer.

## Wiki
Our [Wiki](https://github.com/aguirre-lab/ml4c3/wiki) contains the documentation related to the work done in aguirre-lab repos, 
specially `ml4c3` repo. There, information about data sources, flows and storage, as well as all modes, tools and scripts is presented.

If you are interested in contributing to our wiki, you can do so. However, consider the following:

**MOST IMPORTANT: Do not add changes directly into the wiki**

If you want to add or change the documentation on the wiki, use our [wiki repository](https://github.com/aguirre-lab/ml4c3-wiki/)
From there, create an issue, a branch and commit your changes. Once the changes are merged with master via a pull request,
an automated pipeline will synchronize those changes with our wiki.

If you don't have push access to our wiki repo, fork it and submit a pull request. We will review it and add your changes.


## Slack
Join [`aguirre-lab.slack.com`](aguirre-lab.slack.com) with your MGH email.

Slack is for conversation and notifications from GitHub.

DO NOT SHARE PHI VIA SLACK.

Emails are for important decisions, record-keeping, and communication with people not in our Slack workspace. You may email PHI with your MGH account, but do so only if absolutely necessary, and use [send secure](https://rc.partners.org/kb/article/2939).

## Meetings

Every meeting has (1) an MGH calendar invite, and (2) a Zoom link.

The calendar event is ground truth.

### Standup
The `ml4icu` technical team meets for 15 min every few days to sync on progress and blockers.

### Group meeting schedule
Every week we meet to give a research talk, present a paper or method, etc.

```
| Date        | Speaker    |
|-------------|------------|
| 2020 Nov 16 | Anand      |
| 2020 Nov 23 | No meeting |
| 2020 Nov 30 | Roger      |
| 2020 Dec 07 | Eric       |
| 2020 Dec 14 | Raimon     |
| 2020 Dec 21 | Erik       |
| 2020 Dec 28 | Steven     |
| 2021 Jan 04 | Yirong     |
| 2021 Jan 11 | Anand      |
| 2021 Jan 18 | Eric       |
| 2021 Jan 25 | Ridwan     |
| 2021 Feb 01 | Roger      |
| 2021 Feb 08 | Erik       |
| 2021 Feb 15 | Raimon     |
| 2021 Feb 22 | Steven     |
| 2021 Mar 01 |            |
| 2021 Mar 08 |            |
| 2021 Mar 15 |            |
| 2021 Mar 22 |            |
| 2021 Mar 29 |            |
| 2021 Apr 05 |            |
```

## Data
Our data live in several places, all of which comply with MGH data security protocols:
1. `mad3` and/or `landmark4`: MGB archival storage servers
1. Workstations (see compute)
1. Dropbox

### Dropbox
PHI may be stored on Dropbox, but we prefer to store data on our MGH workstations.

Request a Dropbox account at https://rc.partners.org/kb/article/2750.

If you sync your Dropbox account to your local machine, it must be in compliance with MGH policies, encrypted, etc.

Do not store code on Dropbox. Code belongs on GitHub.

Instructions for installing and configuring dropbox on our linux workstations is documnted here: [`dropbox instructions`](/dropbox.md)

## Compute
Our compute inventory is at this [Dropbox Paper link](https://paper.dropbox.com/doc/aguirre-lab-pc-inventory--A7v~CM2jXCa06LGcCwmufIwZAg-miOikxSGYPyo6GkP8Zv5Y).

We remotely access our workstations via VPN and SSH.

We recommend you use a Mac or Linux machine and a terminal.

ERISOne is the MGB research computing cluster. We do not usually use it, but have documented how to set it up for a data science workflow: [`erisone documentation`](/erisone.md)

### Workstation benchmarking tests
Test and log your workstation's RAM, CPU, and GPU usage, power consumption, and heat load.

This can be helpful if a machine is crashing and you suspect a hardware failure.

To run the benchmark tests:
1. Install all dependencies and tools:
    ```bash
    $ git clone git@github.com:aguirre-lab/aguirre-lab.git
    $ cd aguirre-lab/workstation_benchmarking_tests
    $ ./install_benchmarks.sh
    ```
    You will be asked several questions as the script finds thermal sensors. Say `yes` to all of them.
    
    Finally, you will be asked if you have a GPU. Say `yes` or `no` depending on your workstation.
    
2. Run the desired tests:
    ```bash
    $ cd workstation_benchmarking_tests
    $ ./run_benchmarks.sh
    ```
   It will ask for the tests you want to run as well as how many time you want them to last. Possible options for tests are:
   `ram`, `cpu`, `gpu` and `all`.

3. Results of GPU, CPU and RAM usage, thermal load, and power consumption will be logged in `./workstation_benchmarking_tests/result_logs`.

## MGH logistics
1. Request VPN access
    1. You need to log in to the Partners VPN if you SSH to a Partners machine, query the EDW, etc.. Request access at https://rc.partners.org/kb/article/2894
    1. After you set up your MGH account on your iOS device, open the Partners App Catalog and download Okta Verify. This enables two-factor authentication via a push notification on your mobile device, instead of having to get an SMS passcode.
1. Complete CITI training
    1. Go to https://www.citiprogram.org/
    1. Click on the “Register” tab
    1. Enter “Massachusetts General Hospital” under the organization affiliation, and agree to the terms of service
    1. Complete the personal information to complete your registration
    1. Login using your Partners username and password
    1. Under the main menu, you may see courses listed under “Massachusetts General Hospital Courses”.
        1. If you see “Biomedical Research Investigators and Key Personnel” course, select it.
        1. If not, click on “Add a Course”
        1. Select “Will you be working with humans (IRB courses)?” and click next
        1. Select “Biomedical Research” and click next
    1. You should now see the Biomedical Research Investigators and Key Personnel module listed on the main menu
    1. Complete the training module and retain the completion certificates for your records
1. Be added to the correct IRB. *You must be on the appropriate IRB before you access data for that project!*
1. Request access to Electronic Data Warehouse (EDW), the MGH database for medical record data, via https://enterpriseanalytics.partners.org/Access/

## Office space
_Not relevant now since we work from home due to COVID-19_

- [Simches 3](https://goo.gl/maps/ZRyEoxg1nNSkUBe87)
    - Aaron's office
    - Nick's office
    - Some workstations
    - Some desk space
- [Simches 5](https://goo.gl/maps/ZRyEoxg1nNSkUBe87)
    - Aaron's wet lab space
- [Health Transformation Lab at MGH](https://goo.gl/maps/PfJg39PFCjtZ9zch8)
    - Our GPU workstations and more desk space
