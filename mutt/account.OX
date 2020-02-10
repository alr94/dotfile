set from="email@address.com"
set sendmail = "msmtp -a OX"

# Set folders
set spoolfile="+OX/OX-inbox"
set postponed="+OX/OX-drafts"
set record="+OX/OX-sent"
set trash="+OX/OX-trash"

# alternate email adresses
alternates ^email@adress.com$

color status red default

# Sync this account
macro index o "<shell-escape>mbsync OX<enter>" "run mbsync to sync mail for this account"

macro index,pager J \
  "<enter-command>set my_old_resolve=\$resolve noresolve<enter>\
  <tag-prefix><clear-flag>n<enter-command>set resolve=\$my_old_resolve<enter>\
  <save-message>+OX/OX-trash<enter>" \
  "mark as read and move to junk folder"

macro index,pager i \
  "<save-message>+OX/INBOX<enter>"  \
  "move message to the inbox"
