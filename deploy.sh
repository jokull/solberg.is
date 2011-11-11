#!/bin/bash
git commit -a -m 'Deployment' && git push
source bin/activate
pelican posts -s settings.py -t theme
rsync -arP output/ web@solberg.is:/web/solberg.is
