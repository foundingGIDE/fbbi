## Customize Makefile settings for fbbi
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

# Automatically generate the orcidio component from ORCID references
# within the ontology.
# Of note, ODK 1.7 will have built-in support for this, so once ODK 1.7
# is out we should replace this with the built-in feature.
$(COMPONENTSDIR)/orcidio.owl: $(TMPDIR)/stamp-component-%.owl $(SRCMERGED) | $(COMPONENTSDIR) all_robot_plugins
	$(ROBOT) odk:extract-orcids -i $(SRCMERGED) \
		 $(ANNOTATE_CONVERT_FILE)
