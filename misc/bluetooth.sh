#
# Storing these commands so I have them somewhere for reference
#	e.g. GNOME bluetooth does not need this, but without a DE this needs to be done manually
#

# rfkill for some is set to block bluetooth, it needs to be unblocked and hci0 set enabled
rfkill unblock bluetooth
sudo hciconfig hci0 up

# i think it is already loaded, but if not run this
pactl load-module bluetooth-service-discover

# not sure sink indices are correct, but this is the cmd to change
#	maybe can come up with a way to retrieve them programmatically later
pactl set-sink-input 5 1
