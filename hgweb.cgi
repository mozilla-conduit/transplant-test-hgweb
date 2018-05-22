#!/usr/bin/env python

config = "/repos/hgweb.config"

from mercurial import demandimport
demandimport.enable()
from mercurial.hgweb import hgweb, wsgicgi

application = hgweb(config)
wsgicgi.launch(application)
