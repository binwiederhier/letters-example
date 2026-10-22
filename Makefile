CHROME := google-chrome

all: build output
	@for doc in documents/*.html; do \
	  name=$$(basename "$$doc" .html); \
	  if [ -f "output/$$name.pdf" ]; then \
	    echo "Skipping $$name (already exists)"; \
	  else \
	    echo "Building $$name ..."; \
	    sed -e '/<!-- CONTENT -->/{' -e "r $$doc" -e 'd' -e '}' templates/base.html > "build/$$name.html"; \
	    $(CHROME) --headless --disable-gpu --no-pdf-header-footer \
	      --print-to-pdf="output/$$name.pdf" "file://$(CURDIR)/build/$$name.html"; \
	  fi; \
	done

build output:
	mkdir -p $@

clean:
	rm -rf build/ output/

.PHONY: all clean
