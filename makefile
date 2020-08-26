.POSIX:

SLIM_INTERPRETER = ~/local/var/slime.sh

# ------ phony targets ------

_default: _warning _run_slim

_force:

_warning:
	@echo "WARNING: this uses a hand-rolled slim interpreter at"
	@echo " ~/local/var/slime.sh"
	@echo
	@echo "WARNING: this Makefile is hand-rolled and not complete yet"
	@echo
	@echo " currently it handles:"
	@echo
	@echo "   - docs/index.html"


# ------ generate with slim up html ------

_run_slim: _run_slim_description \
	    docs/index.html

_run_slim_description: _force
	@echo
	@echo "Generating html from slim files..."

docs/index.html: index.slim
	$(SLIM_INTERPRETER) <index.slim >docs/index.html
	tidy5 -config tidy_config.txt -m docs/index.html

