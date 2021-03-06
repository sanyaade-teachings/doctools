
ifdef HTML5_DIR_NAME
	html5_dir_name =$(HTML5_DIR_NAME)
endif

ifdef HTML5_DOCINFO
	html5_docinfo =$(HTML5_DOCINFO)
endif

simple-asciidoc-html5:
	#
	#
	# Building HTML5 straight from the AsciiDoc sources.
	#
	#
	mkdir -p "$(html5_dir)/images"
	mkdir -p "$(html5_dir)/css"
	mkdir -p "$(html5_dir)/js"
	if [ -d "$(build_image_dir)/" ]; then \
		cp -fR "$(build_image_dir)" "$(html5_dir)";\
	fi
	cp -fR "$(build_source_dir)/css" "$(html5_dir)"
	cp -fR "$(build_source_dir)/js" "$(html5_dir)"
	"$(asciidoc)" $(asciidoc_flags) --conf-file="$(build_config_dir)/asciidoc.conf"  --conf-file="$(build_config_dir)/asciidoc.local.conf" --backend html5 --doctype book --attribute $(html5_docinfo) --attribute toc --out-file "$(html5_file)" "$(source_document)" 2>&1 | "$(script_dir)/outputcheck-includefiles.sh" || $(html5_unchecked)
	if [ -d "$(build_image_dir)/" ]; then \
		cp -fR "$(build_image_dir)" "$(html5_dir)";\
	fi
	cp -fR "$(build_source_dir)/css" "$(html5_dir)"
	cp -fR "$(build_source_dir)/js" "$(html5_dir)"


