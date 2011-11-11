Date: 2011-09-09
Title: OSX Lion Pro Settings

To configure these settings open up Terminal.app (found in Applications/Utilities/Terminal.app) and paste the lines starting with `default` into the prompt, followed by the enter key. You may be asked for a password, this is you OSX account password.

### Settings that make OSX snappier

2D Dock

![](http://ss.solberg.is/3b72931f9f.png)

    defaults write com.apple.dock no-glass -bool true

Disable Safari's thumbnail cache for History and Top Sites

    defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

Disable window animations

    defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

Disable send and reply animations in Mail.app

    defaults write com.apple.Mail DisableReplyAnimations -bool true
    defaults write com.apple.Mail DisableSendAnimations -bool true

### Annoyances

Expanded save panel

    defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

Disable auto-correct

    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
