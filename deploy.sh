#!/bin/bash
git commit -a -m 'Deployment' && git push
source bin/activate
pelican posts -s settings.py -t theme
rsync -arP output/ web@wodboard.com:/web/solberg.is
