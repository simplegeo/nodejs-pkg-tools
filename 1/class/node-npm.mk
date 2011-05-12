_cdbs_scripts_path ?= /usr/lib/cdbs
_cdbs_rules_path ?= /usr/share/cdbs/1/rules
_cdbs_class_path ?= /usr/share/cdbs/1/class

ifndef _cdbs_class_node_npm
_cdbs_class_node_npm = 1

include $(_cdbs_rules_path)/buildcore.mk$(_cdbs_makefile_suffix)
include $(_cdbs_class_path)/ant-vars.mk$(_cdbs_makefile_suffix)

DEB_PHONY_RULES += node-npm-sanity-check

DEB_NPM_NAME := $(shell node /usr/lib/node_modules/npm/bin/read-package-json.js $(DEB_SRCDIR)/package.json name)

node-npm-sanity-check:
	# TODO

common-install-arch common-install-indep:: common-install-impl
common-install-impl::
	npm_config_prefix=$(DEB_DESTDIR)usr/lib/nodejs_debian npm install -g
	dh_link usr/lib/nodejs_debian/lib/node_modules/$(DEB_NPM_NAME) usr/lib/nodejs/$(DEB_NPM_NAME)

endif
