# Settings to Change on New Computer:

### General Settings
* Change startup programs
    * Stand
* Show date and day of week in menu bar. Date & Time > Clock > Show Date, Show the day of the week
* Change Display to be 'More Space'
* Bluetooth > Show Bluetooth in menu bar
* Keyboard > Use F1, F2, etc. keys as standard function key
* Screenshot App > Options > Change Save Location to Onedrive folder
* Turn off Notifications for Messages
* [Display time with seconds. System Preferences > Dock & Menu Bar > Clock and check "Display the time with seconds"](https://apple.stackexchange.com/questions/417686/how-can-i-show-seconds-on-macos-bigsurs-menu-bar-clock#:~:text=On%20macOS%20Big%20Sur%2C%20go,Display%20the%20time%20with%20seconds%22.)
* Download from App Store
    * Xcode
    * Amphetamine
    * Helium
    * Due
    * Effortless
    * Negative PDF Reader
    * Onedrive
* No Casks Available
    * Stand
    * Microsoft Office

### Trackpad/Mouse
* Trackpad > Click > Light
* [Enable 3 finger drag](https://support.apple.com/en-us/HT204609)

### File Syncing
* Onedrive
    * Add Temp folder to favorites sidebar
* Dropbox

### Iterm
* Sync settings with Dropbox
    * Preferences > Load Preferences From a custom folder or URL > Point to Dropbox folder
* Activate theme
    1. iTerm2 > Preferences > Profiles > Colors Tab
    2. Open the Color Presets... drop-down in the bottom right corner
    3. Select Import... from the list
    4. Select the itermcolors file
    5. Select the theme from Color Presets...
* [Enable Session Restoration](https://www.iterm2.com/documentation-restoration.html)
* Configure zsh theme run `p10k configure`

### Github/Gitlab
* Generate SSH key pair and add to Github/Gitlab

### Vim
* Install Plugins via Vundle by running :PluginInstall

### Alfred
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

### Rescuetime
* Launch and login

### Calendar:
* Add Google Account
* Preferences > General > Start Week on: Monday
* Uncheck Google Calendars: Contacts, Visits, Birthdays (Other)
* Preferences -> Alerts -> Birthdays (Set to None)

### Brave/Chrome
* Make default browser, sign in to load history, extensions, etc
* Settings > Appearance > Use wide address bar
* Settings > Social Media Blocking > Allow Google login buttons on third party sites > Disable
* Settings > Social Media Blocking > Allow Facebook logins and embedded posts > Disable
* Settings > Social Media Blocking > Allow LinkedIn embedded posts > Disable
* Turn on Warn Before Quitting
* Turn on Ask where to save each file before downloading

#### Vimium
* Sync settings from dropbox
* Remove f in Characters used for link hints

#### Great Suspender
* Automatically suspend tabs after: 30 minutes
* Dark Theme
* Disable Add The Great Suspender to right-click context menu

#### Timer
* Add shift+cmd+c shortcut

#### Custom Search Engines
```
# Wikipedia
w: http://en.wikipedia.org/wiki/Special:Search?search=%s
# Stack Overflow
so: http://stackoverflow.com/search?q=%s
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

#### Google Dictionary
* Uncheck "Display pop-up when I double-click a word"
* Check " Display pop-up when I select a word or phrase".  Make sure trigger key is Command.
* Change trigger key when Display pop-up when I double-click a word

### Backup Settings
* Check your Git repos for any uncommitted changes
* Check Downloads folders
* Check open browser tabs for ALL profiles
* Go through app list and see if there's any local data that hasn't been backed up
* Back up zsh history
