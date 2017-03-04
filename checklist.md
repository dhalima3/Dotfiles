# Settings to Change on New Computer:

### General Settings
* Show battery percentage
* Change startup programs
    * Lastpass

### Keyboard/Mouse
* Move trackpad tracking speed to fastest setting
* Enable one finger tap to click
* Click > Light
* Use Seil to switch caps lock key with escape
    * Change the caps lock key > Change the caps lock key > keycode > 53
    * Other Keys > Change Escape > keycode > 57
* [Enable 3 finger drag](https://support.apple.com/en-us/HT204609)

### File Syncing
* Odrive
    * Add temp folder to favorites sidebar
* Dropbox

### Iterm
* Sync settings with Dropbox
    * Preferences > Load Preferences From a custom folder or URL > Point to Dropbox folder
* [Enable Session Restoration](https://www.iterm2.com/documentation-restoration.html)

### Vim
* Install Plugins via Vundle by running :PluginInstall

### Alfred
* Register Powerpack License
* Disable Spotlight, replace with Alfred 3
    * Remove Spotlight shortcut by opening Keyboard > Shortcuts > Spotlight > Show Spotlight Search
    * Change Alfred hotkey to command + space
* Set up Settings Syncing
    * Advanced > Syncing > Set Sync Folder

### BetterTouchTool
* Load license and import settings from Odrive/Encrypted folder

### Rescuetime
* Launch and login

### Calendar:
* Add Google Account
* Uncheck Google Calendars: Contacts, Visits, Birthdays (Other)
* Preferences -> Alerts -> Birthdays (Set to None)

### Chrome
* Make default browser, sign in to load history, extensions, etc
#### Vimium
* Excluded URLs and keys

**Patterns**|**Keys**
:-----:|:-----:
|`http*://mail.google.com/*`|giojkr/p|
|`http*://inbox.google.com/*`|giojkr/p|
|`https://www.reddit.com/*`|aszxhjk|

* Custom Key Mappings
```
map w removeTab
map W restoreTab
unmap x
unmap X
map I LinkHints.activateModeToOpenIncognito
map O moveTabToNewWindow
map z visitPreviousTab
map <c-]> passNextKey
map <c-f> LinkHints.activateModeWithQueue
map <c-m> toggleMuteTab
```

* Custom Search Engines
```
# Wikipedia
w: http://en.wikipedia.org/wiki/Special:Search?search=%s
# Stack Overflow
so: http://stackoverflow.com/search?q=%s
# YouTube
y: http://www.youtube.com/results?search_query=%s
```
* Remove f in Characters used for link hints

#### Google Dictionary
* Uncheck "Display pop-up when I double-click a word"
* Check " Display pop-up when I select a word or phrase".  Make sure trigger key is Command.
* Change trigger key when Display pop-up when I double-click a word
