# Settings to Change on New Computer:

### General Settings
* Change startup programs
    * Stand
* Date, weekday, and seconds in the menu bar are configured by `scripts/.macos` (delete once confirmed)
* Change Display to be 'More Space'
* Bluetooth > Show Bluetooth in menu bar
* Standard F1, F2, etc. keys are configured by `scripts/.macos` (delete once confirmed)
* Screenshot App > Options > Change Save Location to Onedrive folder (Double check - should be done by running .macos)
* Turn off Notifications for Messages
* Sign in to the App Store, then run `scripts/brew.sh` (delete once confirmed)
    * Install Bitwarden manually.
    * Installed from the Mac App Store with `mas`
        * Xcode
        * Amphetamine
        * Klack
        * Due
        * Session Pomodoro Focus Timer
        * Outread
        * Blurred is disabled for now; find a maintained, free, open-source alternative
    * Installed as Homebrew casks
        * FluidVoice
        * Bitwarden
        * OneDrive
        * Google Drive
        * Stand
        * Microsoft Excel
        * Microsoft Word

### Trackpad/Mouse
* Light click and three-finger drag are configured by `scripts/.macos` (delete once confirmed)

### File Syncing
* Onedrive
    * Sign in and let the sync folder initialize
    * Add Temp folder to the Finder favorites sidebar
* Sign in to Google Drive

### Iterm
* Sync settings with Dropbox
    * Preferences > Load Preferences From a custom folder or URL > Point to Onedrive > Apps and Backups
* Activate theme
    1. iTerm2 > Preferences > Profiles > Colors Tab
    2. Open the Color Presets... drop-down in the bottom right corner
    3. Select Import... from the list
    4. Select the itermcolors file from Dotfiles/fonts/
    5. Select the 'Solarized Dark' theme from Color Presets...
* [Enable Session Restoration](https://www.iterm2.com/documentation-restoration.html)
* Powerlevel10k is installed by `scripts/zsh.sh`, and its configuration is linked by `./install`.
    * To change the prompt, run `p10k configure` and commit the updated `p10k.zsh`.

### Ghostty
* `./install` links `ghostty/config` to `~/.config/ghostty/config`
* Ghostty carries over the font, Solarized Dark theme, and session restoration;
  other terminal behavior uses Ghostty's defaults.
* Reload the config with `Command-Shift-,` after editing it.

### Github/Gitlab
* Generate SSH key pair and add to Github/Gitlab

### Vim (TODO - get rid of old plugins)
* Install Plugins via Vundle by running :PluginInstall

### Alfred (TODO)
* Register Powerpack License
* Disable Spotlight, replace with Alfred 3
    * Remove Spotlight shortcut by opening Keyboard > Shortcuts > Spotlight > Show Spotlight Search
    * Change Alfred hotkey to command + space
* Exclude folders from Spotlight search. Spotlight > Privacy
    * go, golang, Github, CS 6310- TA folders
* Change Appearance to Alfred Dark
* Set up Settings Syncing
    * Advanced > Syncing > Set Sync Folder > (Use Dropbox)

### BetterTouchTool
* Load license and import settings from Dropbox

### Rescuetime (TODO - replace with open source)
* Launch and login

### Calendar:
* Add Google Account
* Monday as the first day of the week is configured by `scripts/.macos` (delete once confirmed)
* Uncheck Google Calendars: Contacts, Visits, Birthdays (Other)
* Preferences -> Alerts -> Birthdays (Set to None)
* Change Preferences -> 'Default Calendar'

### Brave/Chrome
* Make default browser, start using sync to load history, extensions, etc
* Settings > Appearance > Use wide address bar
* Settings > Social Media Blocking > Allow Google login buttons on third party sites > Disable
* Settings > Social Media Blocking > Allow Facebook logins and embedded posts > Disable
* Settings > Social Media Blocking > Allow LinkedIn embedded posts > Disable
* Turn on Warn Before Quitting
* Asking where to save each download is configured by `scripts/.macos` (delete once confirmed)

#### Vimium
* Sync settings from file syncing service (Onedrive/Temp)

#### Custom Search Engines
```
# Wikipedia
w: http://en.wikipedia.org/wiki/Special:Search?search=%s
# YouTube
y: http://www.youtube.com/results?search_query=%s
# Amazon
a: http://www.amazon.com/s/?field-keywords=%s
# Goodreads
gr: https://www.goodreads.com/search?q=%s
# Google Maps
m: https://www.google.com/maps/search/%s?hl=en
# Yelp
ye: https://www.yelp.com/search?find_desc=%s&src=opensearch
```

### Backup Settings
* Check your Git repos for any uncommitted changes
* Check Downloads folders
* Check open browser tabs for ALL profiles
* Go through app list and see if there's any local data that hasn't been backed up
* Back up zsh history
