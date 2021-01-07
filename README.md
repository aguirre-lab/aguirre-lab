# Aguirre Lab handbook

This documentation describes how our group operates, what resources we use, and how you access them.

Before you go any further, read [`the missing semester of your CS education`](https://missing.csail.mit.edu) to learn the basics of the tools we use every day.

## Contents
- [GitHub](#github)
- [Communication](#communication)
- [Meetings](#meetings)
- [Compute](#compute)
- [Data](#data)
- [MGH logistics](#mgh-logistics)
- [Office space](#office-space)
- [Roster (link to external doc)](https://paper.dropbox.com/doc/aguirre-lab-roster-lGQvFINrQ1ZQ6A6GnMpkp)
- [IRB coverage (link to external doc)](https://paper.dropbox.com/doc/IRB-coverage--A7uo~yh4R0BWfUIVP3aAtb_MAg-ypV58gm96PA8WeNy09XLM)

## GitHub
As a data science group, we spend most of our time collaboratively writing code via GitHub.
Here are some of our general practices:
1. DO NOT SHARE DATA ON GITHUB!
1. Code is stored and shared via GitHub. Do not share code via Dropbox, email, or any other mechanism.
1. Our GitHub organization is [`https://github.com/aguirre-lab`](https://github.com/aguirre-lab).
1. Our main repo is [`ml4c3`](https://github.com/aguirre-lab/ml4c3). You contribute to the team and your projects by submitting a PR that merges into `master`. 
1. If you think your work is out of scope for `ml4c3`, discuss with the team. If the consensus is that the work is out of scope, open a new private repo in `aguirre-lab`.
1. Repos are private. Open-sourcing requires a discussion with the PI and their collaborating PIs.
1. Code is documented in each repo's `README` and/or wiki.
1. We use the [BSD 3-clause license](https://choosealicense.com/licenses/bsd-3-clause/).
1. Create branches, push commits, and submit PRs as early as possible.

## Communication
Communication around tasks is primarily via GitHub. We do this to document shareable conversations, link discussions to code, and avoid interrupting "deep work". [Read more about why aysnchronous communication is good](https://blog.doist.com/asynchronous-communication/).

Sometimes sychronous communication is good. We chat on Slack and meet on Zoom, but we minimize email. This excerpt from the above blog post explains why:

> Don’t use email internally. While email can be used asynchronously, it also locks information inside people’s inboxes where no one else can find it. When people can’t find the information they need, collaboration becomes much less efficient.

Join [`aguirre-lab.slack.com`](aguirre-lab.slack.com) with your MGH email.

DO NOT SHARE PHI VIA SLACK!

## Meetings

Every meeting has (1) an MGH calendar invite, and (2) a Zoom link. 
The calendar event is ground truth.

### Standup
Our technical team meets for a 15 min standup twice a week in front of the `ml4c3` project board.

Each team member shares:
1. What did I accomplish since the prior standup?
1. What am I working on now?
1. What is blocking me? What do I need help with?

### Group meeting schedule
We meet weekly. A group member presents a research talk, paper, or method.

```
| Date        | Speaker |
|-------------|---------|
| 2020 Dec 07 | Roger        |
| 2020 Dec 14 | Eric         |
| 2020 Dec 21 | --           |
| 2020 Dec 28 | --           |
| 2021 Jan 04 | Raimon       |
| 2021 Jan 11 | Team updates |
| 2021 Jan 18 | Erik         |
| 2021 Jan 25 | Yirong       |
| 2021 Feb 01 | Roger        |
| 2021 Feb 08 | Anand        |
| 2021 Feb 15 | Ridwan       |
| 2021 Feb 22 | Steven       |
| 2021 Mar 01 | Eric         |
| 2021 Mar 08 | Raimon       |
| 2021 Mar 15 | Erik         |
| 2021 Mar 22 | Yirong       |
| 2021 Mar 29 | Roger        |
| 2021 Apr 05 | Anand        |
| 2021 Apr 12 | Ridwan       |
| 2021 Apr 19 | Steven       |
| 2021        | Eric         |
| 2021        | Raimon       | 
```

## Compute
Our workstations and servers run Ubuntu.

We remotely access our workstations and servers via VPN and `ssh`. [`iTerm2`](https://iterm2.com) is especially good for macOS. To manage sessions and panes, many of us use `tmux`. We do not use graphical remote desktop software.

Our compute inventory is at this [Dropbox Paper link](https://paper.dropbox.com/doc/aguirre-lab-pc-inventory--A7v~CM2jXCa06LGcCwmufIwZAg-miOikxSGYPyo6GkP8Zv5Y).

ERISOne is the MGB research computing cluster. We do not usually use it, but have [documented how to set up a data science workflow](/erisone.md).

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

## Data
Data live in several places, all of which comply with MGH data security protocols:
1. `mad3` and/or `landmark4`: MGB archival storage servers
1. Workstations (see compute)
1. Dropbox

### Dropbox
We use Dropbox to store results, smaller data sets, manuscripts, etc.

Dropbox a) lets us share PHI, b) backs up files automatically, and c) syncs files across machines.

PHI may be stored on Dropbox, but we prefer to store data on our MGH workstations.

Request a Dropbox account at https://rc.partners.org/kb/article/2750.

If you sync your Dropbox account to your local machine, it must be in compliance with MGH policies, encrypted, etc.

Instructions for installing and configuring dropbox on our linux workstations is documnted here: [`dropbox instructions`](/dropbox.md)

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
_We currently work remotely due to COVID-19_

- [Simches 3](https://goo.gl/maps/ZRyEoxg1nNSkUBe87)
    - Aaron's office
    - Nick's office
    - Some workstations
    - Some desk space
- [Simches 5](https://goo.gl/maps/ZRyEoxg1nNSkUBe87)
    - Aaron's wet lab space
- [Health Transformation Lab at MGH](https://goo.gl/maps/PfJg39PFCjtZ9zch8)
    - Our GPU workstations and more desk space
