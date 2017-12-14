j# Setting up a new workstation

This guide is completely biased towards my own preferences and is intended for
setting up a new macOS workstation. Installation relies on a number of bash
scripts.

## Before installation

The first thing that should be done after a new installation of macOS is to
check for and install all updates. You can either do this from the Mac App Store
or from the terminal by running: `sudo softwareupdate -ir --verbose`

You will probably have to restart your computer after this. Maybe a few times!

## Bootstrap (almost) all of the things!

Run the bootstrap script: `./script/bootstrap.sh`

## Finish setting up workstation

Add additional desktops to Spaces and then enable keyboard shortcuts for
accessing them in: `System Prefernces > Keyboard / Shortcuts`

Update some miscellaneous system preferences (that couldn't be automated):
- Set `Recent items` to `none` in `General`
- Set `Delay Until Repeat` to `Short` in `Keyboard`
- Update modifier keys so that `Caps Lock` doubles for `Control` in `Keyboard`

Add SSH keys/configuration:
https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

Add SSH key to GitHub (use new "pubkey" alias to copy it to your clipboard):
https://github.com/settings/keys

### Software preferences

These are pretty solidly relevant only to me, but it's part of how I set up a
new workstation.

#### Dropbox

Open Dropbox, log in, and sync files. This could take a few minutes. You'll
probably need to get your Dropbox password from 1Password somewhere.

#### 1Password

Open 1Password and sync with Dropbox.

#### Alfred

Open the Alfred preferences and activate the Powerpack. This license is in
1Password.

Disable `Show Spotlight search` keyboard shortcut at `System Preferences >`
`Keyboard > Shortcuts / Spotlight`.

Then sync with Dropbox. Themes and some settings are not synced so we need to
manually check the following:

Set `cmd-Space` (replacing Spotlight search) as the `Alfred Hotkey`; then in the
`Appearance` tab select the `Alfred macOS` theme; then click `Options` and make
sure `Hide hat on Alfred window` and `Hide menu bar icon` are checked.

#### Visual Studio Code

Open Visual Studio Code and install the Settings Sync extension by Shan Khan.

You will need to access your `Personal access token` and Gist identifier from
1Password.  Look under "Visual Studio Code - Settings Sync".

Once installed run:
- `Sync: Download Settings`
- `Sync: Advanced Options / Sync: Toggle Auto-Upload On Settings Change`
- `Sync: Advanced Options / Sync: Toggle Auto-Download on Startup`

Once this is done restart the application.

Next install Fira Code font (or the font situation here is going to be
unpleasant):
- Download (and extract) from: https://github.com/tonsky/FiraCode
- Install by opening Font Book and clicking the `+` button

Once installed Code should look right.

### What else?

Other software, settings, preferences will need to be configured. This can all
be done as needed.
