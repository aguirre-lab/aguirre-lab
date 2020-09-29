# Dropbox installation and configuration on linux workstations

Since we connect via ssh to our linux workstations, we install and interact with dropbox via the command line.

## Install

The easiest way to install dropbox is through the dropbox management script. This is a python script that serves as the command line interface for dropbox.

To download the dropbox command line interface:
```bash
cd
wget https://linux.dropbox.com/packages/dropbox.py
chmod +x dropbox.py
```

To make the dropbox interface available to all users, place the dropbox script in a location common to all user PATHs, like `/usr/local/bin`. This requires `sudo` access:
```bash
sudo mv dropbox.py /usr/local/bin/dropbox
```

To install the actual dropbox service, use the following command:
```bash
echo y | dropbox start -i
```

## Configure

To sync with your dropbox account, dropbox needs to be configured. The command below should print a dialogue to link the computer to a specific account. Follow the link.
```bash
dropbox start
```

If you follow the link, it should bring you to a page that looks like this:
![](/images/dropbox/link-dropbox-account.png)

The most obvious thing is to enter your email in the box that is front and center. **Don't do that.** Using the most obvious box will not work (because why would it, right?). More specifically, because our dropbox accounts are business accounts that use single sign-on (SSO), after you sign it, it redirects you to a page that asks you to input a code into the dropbox installer. However, because we're using the command line interface, there is no installer.

Instead of entering your email in the main box, click the `sign in` option in the top right corner. Enter your MGH email in the prompt that opens. It should bring you to a MGB SSO page where you can sign in with your MGH email and password. It will redirect you back to the account linkage step where you should press `connect`.
![](/images/dropbox/link-dropbox-account-correct.png)

You can check if installation was successful or generally check the status of dropbox with:
```bash
dropbox status
```

## Usage

To see a full list of available commands, use:
```bash
dropbox help
```
