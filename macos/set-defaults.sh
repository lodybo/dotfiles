# Here's the place for some macos stuff...
# See also: https://github.com/kevinSuttle/macOS-Defaults/blob/master/REFERENCE.md
# inspiration:
# https://github.com/anishathalye/dotfiles-local/blob/mac/macos
# https://github.com/holman/dotfiles/blob/master/macos/set-defaults.sh
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://github.com/caarlos0/dotfiles/blob/master/macos/set-defaults.sh
#

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# From Zach Holman (https://github.com/holman/dotfiles/blob/master/macos/install.sh)
# There's a nifty command line interface to handle updates and installables in the Mac App Store, that we can use to just install everything, so
# yeah, let's do that.
echo "  › Would you like to run macOS Software Update?"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Updating macos software"
  sudo softwareupdate -i -a
fi
unset response

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
# General UI/UX                                                               #
###############################################################################

echo "General settings"
echo ""

# Set computer name
echo "  › Would you like to set your computer name (as done via System Preferences ›› Sharing)?  (y/n)"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "What would you like it to be?"
  read -r COMPUTER_NAME
  sudo scutil --set ComputerName "$COMPUTER_NAME"
  sudo scutil --set HostName "$COMPUTER_NAME"
  sudo scutil --set LocalHostName "$COMPUTER_NAME"
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPUTER_NAME"
fi
unset "$response"

# Enable touch ID for shell elevation
echo "  › Would you like to set up touch ID for shell elevation? (Requires password) (y/n)"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source "$DOTFILES/macos/set-pam-touch-id.sh"
fi

# disable keyboard press and hold popup
echo "  › disable keyboard press and hold popup"
defaults write -g ApplePressAndHoldEnabled -bool false

# expand print panel by default
echo "  › expand print panel by default"
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

# expand save panel by default
echo "  › expand save panel by default"
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

# disable warning when changing file extension
echo "  › disable warning when changing file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# touch bar shows expanded control strip
echo "  › touch bar shows expanded control strip"
defaults write com.apple.touchbar.agent PresentationModeGlobal fullControlStrip

# Save to disk (not to iCloud) by default
echo "  › Save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
echo "  › Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
echo "  › Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "  › Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "  › Set dark interface style"
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Specify the preferences directory
echo "  › Specify iTerm2 preferences directory"
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/macos/iterm2"

# Tell iTerm2 to use the custom preferences in the directory
echo "  › Tell iTerm2 to use the custom preferences in the directory"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

echo "Trackpad, mouse, keyboard, Bluetooth accessories, and input"

# Increase sound quality for Bluetooth headphones/headsets
echo "  › Increase sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
echo "  › Enable full keyboard access for all controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

###############################################################################
# Screen                                                                      #
###############################################################################

echo "Screen"

# Save screenshots to the desktop
echo "  › Save screenshots to the desktop"
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
echo "  › Enable subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 1

###############################################################################
# Finder                                                                      #
###############################################################################

echo "Finder"

# Finder: show status bar
echo "  › Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
echo "  › Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
echo "  › Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
echo "  › When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
echo "  › Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
echo "  › Avoid creating .DS_Store files on network or USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
echo "  › Use list view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder
echo "  › Show the ~/Library folder"
chflags nohidden ~/Library

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

echo "Dock, Dashboard, and hot corners"

# Enable highlight hover effect for the grid view of a stack (Dock)
echo "  › Enable highlight hover effect for the grid view of a stack (Dock)"
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Automatically hide and show the Dock
echo "  › Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
echo "  › Make Dock icons of hidden applications translucent"
defaults write com.apple.dock showhidden -bool true

###############################################################################
# Mail                                                                        #
###############################################################################

echo "Mail"

# Disable send and reply animations in Mail.app
echo "  › Disable send and reply animations in Mail.app"
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com›` in Mail.app
echo "  › Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com›' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
echo "  › Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app"
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

# Display emails in threaded mode, sorted by date (oldest at the top)
echo "  › Display emails in threaded mode, sorted by date (oldest at the top)"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

# Disable inline attachments (just show the icons)
echo "  › Disable inline attachments (just show the icons)"
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

###############################################################################
# Safari                                                                      #
###############################################################################

echo "Safari"

# Set up Safari for development.
echo "  › Set up Safari for development."
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

###############################################################################
# Mac App Store                                                               #
###############################################################################

echo "Mac App Store"

# Enable the WebKit Developer Tools in the Mac App Store
echo "  › Enable the WebKit Developer Tools in the Mac App Store"
defaults write com.apple.appstore WebKitDeveloperExtras -bool false

# Enable Debug Menu in the Mac App Store
echo "  › Enable Debug Menu in the Mac App Store"
defaults write com.apple.appstore ShowDebugMenu -bool false

# Enable the automatic update check
echo "  › Enable the automatic update check"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
echo "  › Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
echo "  › Download newly available updates in background"
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
echo "  › Install System data files & security updates"
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
echo "  › Automatically download apps purchased on other Macs"
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Turn on app auto-update
echo "  › Turn on app auto-update"
defaults write com.apple.commerce AutoUpdate -bool true

# Allow the App Store to reboot machine on macOS updates
echo "  › Allow the App Store to reboot machine on macOS updates"
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################

echo "Kill affected applications"

for app in "cfprefsd" \
	"Dock" \
	"Finder" \
	"Google Chrome Canary" \
	"Google Chrome" \
	"Mail" \
	"Messages" \
	"Photos" \
	"Safari" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
