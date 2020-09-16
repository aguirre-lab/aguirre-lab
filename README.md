# Aguirre Lab - onboarding & workflow

## Contents
- [GitHub](#github)
- [Slack](#slack)
- [Meetings](#meetings)
- [Data](#data)
- [Compute](#compute)
- [Office space](#office-space)
- [Roster](https://paper.dropbox.com/doc/aguirre-lab-roster-lGQvFINrQ1ZQ6A6GnMpkp)


## GitHub

As a biomedical data science group, we use GitHub for most of our workflow.

### Getting started
1. DO NOT SHARE PHI!
1. Do not share code via Dropbox, email, or any other mechanism than GitHub.
1. Our GitHub organization is [`https://github.com/aguirre-lab`](https://github.com/aguirre-lab).
1. If you do not have a GitHub account, create one, add your full name, and ask someone via Slack to add you.
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
Name your branch with your initials, a description, and dashes between words:

```bash
git checkout -B er-fix-grid-ecg-plot
```

### Commit messages
We do not enforce strict commit message style, but try to follow good practices as described in this blog post: https://chris.beams.io/posts/git-commit/#capitalize.

### Pull requests (PRs)
To contribute code or documentation changes from your branch to the `master` branch in the repo, open a PR.

New PRs follow our [template](.github/pull_request_template.md).

List the issues your PR closes. This should auto-populated the "linked issues" section on the right nav bar.

Describe the major changes.

Assign at least one reviewer.

Reviewers approve PRs before code merges to `master`. They have 48 hours. If a review is stale, remind the reviewer.

When PRs are approved, all commits are "squash merged", e.g. combine all commits from the head branch into a single commit in the base branch. Also, the branch is automatically deleted.

## Slack
Join [`aguirre-lab.slack.com`](aguirre-lab.slack.com) with your MGH email.

Slack is for conversation and notifications from GitHub.

DO NOT SHARE PHI VIA SLACK.

Emails are for important decisions, record-keeping, and communication with people not in our Slack workspace. You may email PHI with your MGH account, but do so only if absolutely necessary, and use [send secure](https://rc.partners.org/kb/article/2939).

## Meetings

Start on time, prepare with agendas, end with action items, and finish early or on time.

Every meeting has (1) an MGH calendar invite, and (2) a Zoom link.

The calendar event is ground truth unless you hear otherwise.

### Standup
The `ml4icu` technical team meets for 15 min every few days to sync on progress and blockers.

### Group meeting
Every week our lab meets to update research progress, give a research talk, present a paper or method, etc.

Our schedule is at this [Dropbox Paper link](https://paper.dropbox.com/doc/aguirre-lab-meeting-schedule--A7ss1A2g95~fn8JP6NEZdXj3Ag-HMHxFEmeMlrELTZaCxR3z).

## Data
Our data live in several places:
1. `mad3` and/or `landmark4`: MGB archival storage servers
1. Workstations (see compute)
1. Dropbox

### Dropbox
PHI may be stored on Dropbox, but we prefer to store data on our MGH workstations.

Request a Dropbox account at https://rc.partners.org/kb/article/2750.

If you sync your Dropbox account to your local machine, it must be in compliance with MGH policies, encrypted, etc.

Do not store code on Dropbox. Code belongs on GitHub.

## Compute
Our compute inventory is at this [Dropbox Paper link](https://paper.dropbox.com/doc/aguirre-lab-pc-inventory--A7v~CM2jXCa06LGcCwmufIwZAg-miOikxSGYPyo6GkP8Zv5Y).

We remotely access our workstations via VPN and SSH.

We recommend you use a Mac or Linux machine and a terminal.

## MGH logistics
1. Request VPN access
    1. You need to log in to the Partners VPN if you SSH to a Partners machine, query the EDW, etc.. Request access at https://rc.partners.org/kb/article/2894
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
    1. Be added to the correct IRB
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
- [Broad Institute Data Sciences Platform](https://g.page/broad-institute-105b?share)
    - Erik's office
- [Health Transformation Lab at MGH](https://goo.gl/maps/PfJg39PFCjtZ9zch8)
    - Our GPU workstations and more desk space