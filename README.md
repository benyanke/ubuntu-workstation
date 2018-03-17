# Docker Ubuntu Workstation 

Designed to be an Ubuntu workstation image running on docker.

Primarily designed to be a base image for another container which installs xrdp, 
x2go, or another remote access tool.

More docs to come.

Additionally, plan to make different desktop environments as well, starting with ubuntu mate 
and perhaps XFCE. These could perhaps be published as different tags, or perhaps as child images.
Currently, just using KDE in the base image.


Lastly, need to make a runtime script which will set up users by env vars, among other things.
