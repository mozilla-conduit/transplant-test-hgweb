Mercurial `hgweb` server for the [autoland-transplant](https://github.com/mozilla-conduit/autoland-transplant) test suite.

Creates three repos:
* land-repo: the repo transplant lands to (akin to integration-autoland)
* test-repo: clone of land-repo for repo-to-repo transplants (akin to reviewboard-hg)
* try: clone of land-repo for repo-to-try transplants
