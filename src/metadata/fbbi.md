---
layout: ontology_detail
id: fbbi
title: Biological Imaging Methods Ontology
description: >-
  An ontology for the description of sample preparation, visualization, and
  imaging methods used in biomedical research.
domain: investigations
homepage: https://github.com/foundingGIDE/fbbi
tracker: https://github.com/foundingGIDE/fbbi/issues
license:
  url: http://creativecommons.org/licenses/by/4.0/
  label: CC-BY
contact:
  orcid: 0000-0002-6095-8718
  email: damien@gerbi-gmb.de
  label: Damien Goutte-Gattat
  github: gouttegd
build:
  checkout: git clone https://github.com/foundingGIDE/fbbi.git
  system: git
  path: "."
products:
  - id: fbbi.owl
  - id: fbbi.obo
  - id: fbbi.json
  - id: fbbi/fbbi-base.owl
  - id: fbbi/fbbi-base.obo
  - id: fbbi/fbbi-base.json
dependencies:
- id: ro
usages:
  - user: https://flybase.org
    description: FlyBase uses FBbi to annotate its image collection.
    examples:
      - description: images annotated to "scanning electron micrograph"
        url: https://flybase.org/cgi-bin/fbcvquery.pl?mode=subtreehits&cvterm=FBbi:00000257%3EFBim
  - user: https://virtualflybrain.org
    description: Virtual Fly Brain uses FBbi to annotate images.
  - user: https://www.cellimagelibrary.org
    description: The Cell Image Library uses FBbi to annotate images.
    examples:
      - description: An image annotate with several terms from FBbi.
        url: https://www.cellimagelibrary.org/images/13654
activity_status: active
---
