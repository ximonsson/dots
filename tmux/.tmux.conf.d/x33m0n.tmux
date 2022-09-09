# Status update interval
set -g status-interval 1

# Basic status bar colors
set -g status-style fg=colour240,bg=default

# Left side of status bar
set -g status-left-style fg=white
set -g status-left-length 0
set -g status-left "#[fg=#16acba]#S | #[fg=default]"

# Right side of status bar
set -g status-right ""

# Window status
set -g window-status-format "#[fg=color255]#I#[fg=default] #W     "
set -g window-status-current-format "#[fg=color255]#I #[fg=color255]#W#[fg=default]     "

# Current window status
set -g window-status-current-style fg=colour166

# Window with activity status
set -g window-status-activity-style fg=#c6235a

# Window separator
set -g window-status-separator ""

# Window status alignment
set -g status-justify left

# Pane border
set -g pane-border-style bg=default,fg=colour238

# Active pane border
set -g pane-active-border-style bg=default,fg=#c6235a

# Pane number indicator
set -g display-panes-colour colour233
set -g display-panes-active-colour colour245

# Clock mode
set -g clock-mode-colour colour130
set -g clock-mode-style 24

# Message
set -g message-style bg=#14929e,fg=black

# Command message
set -g message-command-style bg=colour233,fg=black

# Mode
set -g mode-style bg=#14929e,fg=colour232
