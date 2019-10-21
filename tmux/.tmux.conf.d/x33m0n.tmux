# Status update interval
set -g status-interval 1

# Basic status bar colors
set -g status-style fg=colour240 #,bg=colour233

# Left side of status bar
set -g status-left-style fg=colour243
set -g status-left-length 10
set -g status-left "#[fg=colour232,bg=colour130,bold] #S #[fg=colour130,bg=default,nobold]"

# Right side of status bar
set -g status-right ""

# Window status
set -g window-status-format "  #I #W  "
set -g window-status-current-format "#[fg=colour166,bg=colour239,nobold] #I #W #[fg=colour233,bg=default,nobold]"

# Current window status
set -g window-status-current-style bg=colour130,fg=colour235

# Window with activity status
set -g window-status-activity-style bg=colour233,fg=colour245

# Window separator
set -g window-status-separator ""

# Window status alignment
set -g status-justify centre

# Pane border
set -g pane-border-style bg=default,fg=colour238

# Active pane border
set -g pane-active-border-style bg=default,fg=colour130

# Pane number indicator
set -g display-panes-colour colour233
set -g display-panes-active-colour colour245

# Clock mode
set -g clock-mode-colour colour130
set -g clock-mode-style 24

# Message
set -g message-style bg=colour130,fg=black

# Command message
set -g message-command-style bg=colour233,fg=black

# Mode
set -g mode-style bg=colour130,fg=colour232
