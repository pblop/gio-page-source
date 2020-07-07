#!/bin/sh

# Thanks to intgr (https://serverfault.com/a/912788)

# IMO the best solution is using a custom GIT_ASKPASS helper and deliver the password as another environment variable. So for example, create a file git-askpass-helper.sh as:
# #!/bin/sh
#exec echo "$GIT_PASSWORD"
#and then run git clone https://username@hostname/repo with environment variables GIT_ASKPASS=/path/to/git-askpass-helper.sh and GIT_PASSWORD=nuclearlaunchcodes.
#This has the advantage that the password won't be visible in the process list too.


exec echo "$GIT_PASSWORD"