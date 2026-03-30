# A summary of changes made to fbbi for the PhIS project

### new/changed relationships

* Some rearragement of the class heirarchy for consistency:
e.g. movement of some methods involved in imaging (e.g. illumnination method) out out from classification under microscopy.  These are now linked to micropscopy types by 'makes use of').

* Addition of some new classes (e.g. fixation method) and movement of other classes underneath.

 Some formalization to give better inferred classification.
 
**Old classification:**
 
 ![image](https://user-images.githubusercontent.com/112839/45681894-93607380-bb36-11e8-896a-6a8351ec251c.png)
 
**New classification:**
 
![image](https://user-images.githubusercontent.com/112839/45681915-a410e980-bb36-11e8-87cd-7373b0fd1255.png)

![image](https://user-images.githubusercontent.com/112839/45681983-e33f3a80-bb36-11e8-8669-e56e9123c766.png)

 
 #### details

```diff
+	EquivalentClasses(<light microscopy> ObjectIntersectionOf(<microscopy with lenses> ObjectSomeValuesFrom(<makes_use_of> <UV/visible/IR illumination>)) )
-	EquivalentClasses(<light microscopy> ObjectIntersectionOf(<microscopy> ObjectSomeValuesFrom(<makes_use_of> <UV/visible/IR illumination>)) )
+	EquivalentClasses(<radiography> ObjectIntersectionOf(<recorded image> ObjectSomeValuesFrom(<makes_use_of> <x-ray/gamma ray illumination>)) )
+	EquivalentClasses(<X-ray computed tomography> ObjectIntersectionOf(<computed tomography> ObjectSomeValuesFrom(<makes_use_of> <X-ray illumination>)) )
+	EquivalentClasses(<X-ray microscopy> ObjectIntersectionOf(<microscopy> ObjectSomeValuesFrom(<makes_use_of> <X-ray illumination>)) )
+	EquivalentClasses(<X-ray radiography> ObjectIntersectionOf(<recorded image> ObjectSomeValuesFrom(<makes_use_of> <X-ray illumination>)) )
+	EquivalentClasses(<X-ray tomography> ObjectIntersectionOf(<tomography> ObjectSomeValuesFrom(<makes_use_of> <X-ray illumination>)) )
+	SubClassOf(<chemically fixed tissue> <fixation method>)
-	SubClassOf(<chemically fixed tissue> <sample preparation method>)
+	SubClassOf(<computed tomography> <tomography>)
+	SubClassOf(<contrast-enhancing method> <method involved in biological imaging>)
-	SubClassOf(<contrast-enhancing method> <microscopy with lenses>)
+	SubClassOf(<cryofixed tissue> <fixation method>)
-	SubClassOf(<cryofixed tissue> <sample preparation method>)
+	SubClassOf(<detection method> <method involved in biological imaging>)
-	SubClassOf(<detection method> <microscopy with lenses>)
+	SubClassOf(<fixation method> <sample preparation method>)
+	SubClassOf(<heat fixed tissue> <fixation method>)
-	SubClassOf(<heat fixed tissue> <sample preparation method>)
+	SubClassOf(<http://purl.obolibrary.org/obo/FBbi_00001007> <x-ray/gamma ray illumination>)
+	SubClassOf(<illumination method> <method involved in biological imaging>)
-	SubClassOf(<illumination method> <microscopy with lenses>)
+	SubClassOf(<imaged parameter> <method involved in biological imaging>)
-	SubClassOf(<imaged parameter> <microscopy with lenses>)
-	SubClassOf(<light microscopy> <microscopy with lenses>)
+	SubClassOf(<nearfield illumination> <illumination method>)
+	SubClassOf(<nearfield illumination> <illumination method>)
+	SubClassOf(<radiography> <recorded image>)
+	SubClassOf(<resolution-enhancing method> <method involved in biological imaging>)
-	SubClassOf(<resolution-enhancing method> <microscopy with lenses>)
+	SubClassOf(<source of contrast> <method involved in biological imaging>)
-	SubClassOf(<source of contrast> <microscopy with lenses>)
+	SubClassOf(<tomography> <recorded image>)
+	SubClassOf(<unfixed tissue> <fixation method>)
-	SubClassOf(<unfixed tissue> <sample preparation method>)
-	SubClassOf(<X-ray illumination> <illumination by photons>)
+	SubClassOf(<X-ray illumination> <x-ray/gamma ray illumination>)
+	SubClassOf(<X-ray microscopy> <microscopy>)
+	SubClassOf(<X-ray microscopy> <radiography>)
-	SubClassOf(<X-ray microscopy> <X-ray illumination>)
+	SubClassOf(<X-ray microscopy> ObjectSomeValuesFrom(<makes_use_of> <X-ray illumination>))
+	SubClassOf(<X-ray tomography> <radiography>)
+	SubClassOf(<x-ray/gamma ray illumination> <illumination by photons>)

```

### New terms

```yaml
[Term]
id: FBbi:00001000
name: radiography
def: "An imaging technique that uses high energy electromagnetic radiation, typically X-rays, as a source of illumination." [http://en.wikipedia.org/w/index.php?title=Radiography&oldid=606628211]
is_a: FBbi:00000265 ! recorded image
intersection_of: FBbi:00000265 ! recorded image
intersection_of: FBbi:00000346 FBbi:00001006 ! makes_use_of x-ray/gamma ray illumination

[Term]
id: FBbi:00001001
name: X-ray radiography
def: "Radiography using X-rays" []
subset: PhenoImageShare_ImagingMethod
synonym: "X-radiography" EXACT []
synonym: "X-ray" RELATED []
intersection_of: FBbi:00000265 ! recorded image
intersection_of: FBbi:00000346 FBbi:00000342 ! makes_use_of X-ray illumination

[Term]
id: FBbi:00001002
name: X-ray computed tomography
subset: PhenoImageShare_ImagingMethod
synonym: "CAT scan" EXACT []
synonym: "computed axial tomography" RELATED []
synonym: "CT scan" EXACT []
synonym: "X-ray CT" EXACT []
xref: http://en.wikipedia.org/wiki/X-ray_computed_tomography
xref: MeSH:D014057
intersection_of: FBbi:00001005 ! computed tomography
intersection_of: FBbi:00000346 FBbi:00000342 ! makes_use_of X-ray illumination

[Term]
id: FBbi:00001003
name: X-ray tomography
def: "Tomography using X-ray illumination." []
is_a: FBbi:00001000 ! radiography
intersection_of: FBbi:00001004 ! tomography
intersection_of: FBbi:00000346 FBbi:00000342 ! makes_use_of X-ray illumination

[Term]
id: FBbi:00001004
name: tomography
def: "An imaging technique that creates virtual sections through the use of any kind of penetrating wave." []
is_a: FBbi:00000265 ! recorded image

[Term]
id: FBbi:00001005
name: computed tomography
def: "Tomography in which virtual sections are taken from multiple angles and the results are processed via tomographic reconstruction software to produce 2 or 3D images." []
is_a: FBbi:00001004 ! tomography

[Term]
id: FBbi:00001006
name: x-ray/gamma ray illumination
is_a: FBbi:00000272 ! illumination by photons

[Term]
id: FBbi:00001007
name: gamma ray illumination
is_a: FBbi:00001006 ! x-ray/gamma ray illumination

[Term]
id: FBbi:00001012
name: fixation method
is_a: FBbi:00000001 ! sample preparation method

```

### Relabelling notes

Most edits to labels were made in order to give better type-consistency down the classification heirarchy.  For example, 'mode of electron microscopy' was changed simply to 'electron microscopy' to fit its parent term (microscopy) and sub classes (e.g. scanning electron microscopy). This work took the form of either [direct renames](#Renames) or use of the alternative annotation property for recording names [OBO Foundry Unique name](#obo_foundry_uniquenames).  The latter was used in order to be conservative with renames in case it caused problems for the widespread usage of these terms by the [Cell Image Libarary](http://www.cellimagelibrary.org/home). Whether it is viable to make these new names the primary 


#### Renames

```diff
< name: label conjugated to probe
---
> name: vizualization of label conjugated to probe

< name: mode of electron microscopy
---
> name: electron microscopy

< name: X-ray micrograph
---
> name: X-ray microscopy

< name: mode of light microscopy
---
> name: light microscopy

< name: UV/visible/IR photons
---
> name: detection of UV/visible/IR photons

< name: X-ray photons
---
> name: detection of X-ray photons

< name: slit-scan confocal
---
> name: slit-scan confocal microscopy

< name: array-scan confocal
---
> name: array-scan confocal microscopy

< name: Biological Imaging Method
---
> name: method involved in biological imaging
```

#### OBO_Foundry_uniquenames:

ID (IRI) | rdfs:label | obo_foundry_uniquename
 --- |--- | ---
http://purl.obolibrary.org/obo/FBbi_00000472 | SuperfolderFP | visualization of SuperfolderFP
http://purl.obolibrary.org/obo/FBbi_00000471 | EmeraldFP | visualization of EmeraldFP
http://purl.obolibrary.org/obo/FBbi_00000470 | SCFP | visualization of SCFP
http://purl.obolibrary.org/obo/FBbi_00000476 | TopazFP | visualization of TopazFP
http://purl.obolibrary.org/obo/FBbi_00000355 | non-linear method | non-linear computational contrast enhancing method method
http://purl.obolibrary.org/obo/FBbi_00000113 | DiA | visualization of DiA
http://purl.obolibrary.org/obo/FBbi_00000354 | linear method | linear computational contrast enhancing method method
http://purl.obolibrary.org/obo/FBbi_00000475 | SYFP | visualization of SYFP
http://purl.obolibrary.org/obo/FBbi_00000112 | probe for lipid | visualization of probe for lipid
http://purl.obolibrary.org/obo/FBbi_00000474 | CitrineFP | visualization of CitrineFP
http://purl.obolibrary.org/obo/FBbi_00000473 | T-SapphireFP | visualization of T-SapphireFP
http://purl.obolibrary.org/obo/FBbi_00000117 | DiR | visualization of DiR
http://purl.obolibrary.org/obo/FBbi_00000116 | DiO | visualization of DiO
http://purl.obolibrary.org/obo/FBbi_00000479 | Blue fluorescent proteins from Anthozoa | visualization of Blue fluorescent proteins from Anthozoa
http://purl.obolibrary.org/obo/FBbi_00000478 | yPet | visualization of yPet
http://purl.obolibrary.org/obo/FBbi_00000115 | DiI | visualization of DiI
http://purl.obolibrary.org/obo/FBbi_00000114 | DiD | visualization of DiD
http://purl.obolibrary.org/obo/FBbi_00000477 | VenusFP | visualization of VenusFP
http://purl.obolibrary.org/obo/FBbi_00000461 | AzuriteFP | visualization of AzuriteFP
http://purl.obolibrary.org/obo/FBbi_00000460 | non-specific protein affinity | visualization of non-specific protein affinity
http://purl.obolibrary.org/obo/FBbi_00000465 | botulinum toxin | visualization of botulinum toxin
http://purl.obolibrary.org/obo/FBbi_00000464 | alpha-bungarotoxin | visualization of alpha-bungarotoxin
http://purl.obolibrary.org/obo/FBbi_00000463 | non-immunological protein probe | visualization of non-immunological protein probe
http://purl.obolibrary.org/obo/FBbi_00000584 | X-Rhodamine | visualization of X-Rhodamine conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000100 | phalloidin | visualization of phalloidin
http://purl.obolibrary.org/obo/FBbi_00000462 | SiriusFP | visualization of SiriusFP
http://purl.obolibrary.org/obo/FBbi_00000469 | CyPet | visualization of CyPet
http://purl.obolibrary.org/obo/FBbi_00000468 | CeruleanFP | visualization of CeruleanFP
http://purl.obolibrary.org/obo/FBbi_00000467 | batrachatoxin | visualization of batrachatoxin
http://purl.obolibrary.org/obo/FBbi_00000466 | tetrodotoxin | visualization of tetrodotoxin
http://purl.obolibrary.org/obo/FBbi_00000494 | mKateFP | visualization of mKateFP
http://purl.obolibrary.org/obo/FBbi_00000493 | KatushkaFP | visualization of KatushkaFP
http://purl.obolibrary.org/obo/FBbi_00000130 | labeled primary antibody | visualization of labeled primary antibody
http://purl.obolibrary.org/obo/FBbi_00000492 | HcRed-tandemFP | visualization of HcRed-tandemFP
http://purl.obolibrary.org/obo/FBbi_00000491 | AQ143 | visualization of AQ143
http://purl.obolibrary.org/obo/FBbi_00000498 | tdRFP639 | visualization of tdRFP639
http://purl.obolibrary.org/obo/FBbi_00000497 | tdKatuskaFP | visualization of tdKatuskaFP
http://purl.obolibrary.org/obo/FBbi_00000496 | mPlumFP | visualization of mPlumFP
http://purl.obolibrary.org/obo/FBbi_00000132 | alkaline phosphatase | visualization of alkaline phosphatase conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000495 | mKate2FP | visualization of mKate2FP
http://purl.obolibrary.org/obo/FBbi_00000490 | TagCFP | visualization of TagCFP
http://purl.obolibrary.org/obo/FBbi_00000138 | horseradish peroxidase | visualization of horseradish peroxidase conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000499 | AceFP | visualization of AceFP
http://purl.obolibrary.org/obo/FBbi_00000483 | Red fluorescent proteins from Anthozoa | visualization of Red fluorescent proteins from Anthozoa
http://purl.obolibrary.org/obo/FBbi_00000482 | Orange fluorescent proteins from Anthozoa | visualization of Orange fluorescent proteins from Anthozoa
http://purl.obolibrary.org/obo/FBbi_00000481 | Green fluorescent proteins from Anthozoa | visualization of Green fluorescent proteins from Anthozoa
http://purl.obolibrary.org/obo/FBbi_00000480 | Cyan fluorescent proteins from Anthozoa | visualization of Cyan fluorescent proteins from Anthozoa
http://purl.obolibrary.org/obo/FBbi_00000487 | AmCyanFP | visualization of AmCyanFP
http://purl.obolibrary.org/obo/FBbi_00000124 | [32]P | visualization of metabolically incorporated [32]P
http://purl.obolibrary.org/obo/FBbi_00000486 | mTagBFP | visualization of mTagBFP
http://purl.obolibrary.org/obo/FBbi_00000123 | [14]C | visualization of metabolically incorporated [14]C
http://purl.obolibrary.org/obo/FBbi_00000485 | Yellow fluorescent proteins from Anthozoa | visualization of Yellow fluorescent proteins from Anthozoa
http://purl.obolibrary.org/obo/FBbi_00000122 | metabolically incorporated radioisotope | visualization of metabolically incorporated radioisotope
http://purl.obolibrary.org/obo/FBbi_00000484 | Far-red fluorescent proteins from Anthozoa | visualization of Far-red fluorescent proteins from Anthozoa
http://purl.obolibrary.org/obo/FBbi_00000127 | [3]H | visualization of metabolically incorporated [3]H
http://purl.obolibrary.org/obo/FBbi_00000489 | mTFP1 | visualization of mTFP1
http://purl.obolibrary.org/obo/FBbi_00000126 | [35]S | visualization of metabolically incorporated [35]S
http://purl.obolibrary.org/obo/FBbi_00000488 | mCyFP | visualization of mCyFP
http://purl.obolibrary.org/obo/FBbi_00000125 | [33]P | visualization of metabolically incorporated [33]P
http://purl.obolibrary.org/obo/FBbi_00000156 | primary antibody plus labeled secondary antibody | visualization of primary antibody plus labeled secondary antibody
http://purl.obolibrary.org/obo/FBbi_00000035 | cresyl fast violet | visualization of cresyl fast violet
http://purl.obolibrary.org/obo/FBbi_00000034 | HA peptide tag | visualization of HA peptide tag
http://purl.obolibrary.org/obo/FBbi_00000039 | fuchsin | visualization of fuchsin
http://purl.obolibrary.org/obo/FBbi_00000038 | ethidium bromide | visualization of ethidium bromide
http://purl.obolibrary.org/obo/FBbi_00000158 | acid phosphatase | visualization of acid phosphatase conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000037 | eosin | visualization of eosin
http://purl.obolibrary.org/obo/FBbi_00000266 | portrayed image | image portrayal method
http://purl.obolibrary.org/obo/FBbi_00000265 | recorded image | image recording method
http://purl.obolibrary.org/obo/FBbi_00000054 | CMX rosamine (Mitotracker Red) | visualization of CMX rosamine (Mitotracker Red)
http://purl.obolibrary.org/obo/FBbi_00000053 | cationic colloidal gold | visualization of cationic colloidal gold
http://purl.obolibrary.org/obo/FBbi_00000052 | Hoechst 33342 | visualization of Hoechst 33342
http://purl.obolibrary.org/obo/FBbi_00000051 | acridine orange | visualization of acridine orange
http://purl.obolibrary.org/obo/FBbi_00000058 | methylene blue | visualization of methylene blue
http://purl.obolibrary.org/obo/FBbi_00000178 | glucose oxidase | visualization of glucose oxidase conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000056 | 4',6-diamidino-2-phenylindole (DAPI) | visualization of 4',6-diamidino-2-phenylindole (DAPI)
http://purl.obolibrary.org/obo/FBbi_00000176 | esterase | visualization of esterase conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000055 | DiOC6 (3,3'-dihexyloxacarbocyanine iodide) | visualization of DiOC6 (3,3'-dihexyloxacarbocyanine iodide)
http://purl.obolibrary.org/obo/FBbi_00000059 | Nile blue A | visualization of Nile blue A
http://purl.obolibrary.org/obo/FBbi_00000043 | methyl violet | visualization of methyl violet
http://purl.obolibrary.org/obo/FBbi_00000042 | methyl green | visualization of methyl green
http://purl.obolibrary.org/obo/FBbi_00000041 | hematoxylin | visualization of hematoxylin
http://purl.obolibrary.org/obo/FBbi_00000040 | giemsa | visualization of giemsa
http://purl.obolibrary.org/obo/FBbi_00000047 | propidium iodide | visualization of propidium iodide
http://purl.obolibrary.org/obo/FBbi_00000046 | orcein | visualization of orcein
http://purl.obolibrary.org/obo/FBbi_00000045 | nuclear fast red | visualization of nuclear fast red
http://purl.obolibrary.org/obo/FBbi_00000044 | nitro blue tetrazolium chloride | visualization of nitro blue tetrazolium chloride
http://purl.obolibrary.org/obo/FBbi_00000049 | toluidine blue | visualization of toluidine blue
http://purl.obolibrary.org/obo/FBbi_00000048 | SYTOX Green | visualization of SYTOX Green
http://purl.obolibrary.org/obo/FBbi_00000076 | genetically encoded enzyme | visualization of genetically encoded enzyme
http://purl.obolibrary.org/obo/FBbi_00000073 | taxol | visualization of taxol
http://purl.obolibrary.org/obo/FBbi_00000079 | genetically encoded tag | visualization of genetically encoded tag
http://purl.obolibrary.org/obo/FBbi_00000078 | beta-glucuronidase | visualization of beta-glucuronidase
http://purl.obolibrary.org/obo/FBbi_00000077 | beta-galactosidase | visualization of beta-galactosidase
http://purl.obolibrary.org/obo/FBbi_00000192 | Cascade blue | visualization of Cascade blue conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000191 | aminomethylcoumarin | visualization of aminomethylcoumarin conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000065 | SYTO Green | visualization of SYTO Green
http://purl.obolibrary.org/obo/FBbi_00000064 | SYTO Blue | visualization of SYTO Blue
http://purl.obolibrary.org/obo/FBbi_00000063 | rhodamine B | visualization of rhodamine B
http://purl.obolibrary.org/obo/FBbi_00000062 | rhodamine 123 | visualization of rhodamine 123
http://purl.obolibrary.org/obo/FBbi_00000068 | YO-PRO-1 | visualization of YO-PRO-1
http://purl.obolibrary.org/obo/FBbi_00000067 | SYTO Red | visualization of SYTO Red
http://purl.obolibrary.org/obo/FBbi_00000066 | SYTO Orange | visualization of SYTO Orange
http://purl.obolibrary.org/obo/FBbi_00000061 | pyronine | visualization of pyronine
http://purl.obolibrary.org/obo/FBbi_00000060 | Nile red | visualization of Nile red
http://purl.obolibrary.org/obo/FBbi_00000087 | FLAG peptide tag | visualization of FLAG peptide tag
http://purl.obolibrary.org/obo/FBbi_00000086 | c-MYC peptide tag | visualization of c-MYC peptide tag
http://purl.obolibrary.org/obo/FBbi_00000085 | DsRed | visualization of DsRed
http://purl.obolibrary.org/obo/FBbi_00000084 | EYFP | visualization of EYFP
http://purl.obolibrary.org/obo/FBbi_00000082 | EGFP | visualization of EGFP
http://purl.obolibrary.org/obo/FBbi_00000081 | ECFP | visualization of ECFP
http://purl.obolibrary.org/obo/FBbi_00000080 | EBFP | visualization of EBFP
http://purl.obolibrary.org/obo/FBbi_00000612 | fluorescent protein derived from Arabidopsis | visualization of fluorescent protein derived from Arabidopsis
http://purl.obolibrary.org/obo/FBbi_00000610 | copper salt | visualization of copper salt
http://purl.obolibrary.org/obo/FBbi_00000615 | miniSOG | visualization of miniSOG
http://purl.obolibrary.org/obo/FBbi_00000614 | phototropin 2 | visualization of phototropin 2
http://purl.obolibrary.org/obo/FBbi_00000519 | turboRFP | visualization of turboRFP
http://purl.obolibrary.org/obo/FBbi_00000518 | tdTomatoFP | visualization of tdTomatoFP
http://purl.obolibrary.org/obo/FBbi_00000513 | Kusabira OrangeFP2 | visualization of Kusabira OrangeFP2
http://purl.obolibrary.org/obo/FBbi_00000512 | Kusabira OrangeFP | visualization of Kusabira OrangeFP
http://purl.obolibrary.org/obo/FBbi_00000511 | dTomatoFP | visualization of dTomatoFP
http://purl.obolibrary.org/obo/FBbi_00000510 | DsRed2FP | visualization of DsRed2FP
http://purl.obolibrary.org/obo/FBbi_00000517 | TagRFP-T | visualization of TagRFP-T
http://purl.obolibrary.org/obo/FBbi_00000516 | TagRFP | visualization of TagRFP
http://purl.obolibrary.org/obo/FBbi_00000515 | mOrange2FP | visualization of mOrange2FP
http://purl.obolibrary.org/obo/FBbi_00000514 | mOrangeFP | visualization of mOrangeFP
http://purl.obolibrary.org/obo/FBbi_00000509 | DsRed-monomerFP | visualization of DsRed-monomerFP
http://purl.obolibrary.org/obo/FBbi_00000508 | DsRed-MaxFP | visualization of DsRed-MaxFP
http://purl.obolibrary.org/obo/FBbi_00000507 | DsRed-Express2FP | visualization of DsRed-Express2FP
http://purl.obolibrary.org/obo/FBbi_00000502 | mWasabiFP | visualization of mWasabiFP
http://purl.obolibrary.org/obo/FBbi_00000501 | CopGFP | visualization of CopGFP
http://purl.obolibrary.org/obo/FBbi_00000500 | Azami GreenFP | visualization of Azami GreenFP
http://purl.obolibrary.org/obo/FBbi_00000506 | DsRed-ExpressFP | visualization of DsRed-ExpressFP
http://purl.obolibrary.org/obo/FBbi_00000505 | ZsGreenFP | visualization of ZsGreenFP
http://purl.obolibrary.org/obo/FBbi_00000504 | TagGFP2 | visualization of TagGFP2
http://purl.obolibrary.org/obo/FBbi_00000503 | TagGFP | visualization of TagGFP
http://purl.obolibrary.org/obo/FBbi_00000531 | PhiYFP | visualization of PhiYFP
http://purl.obolibrary.org/obo/FBbi_00000410 | macromolecular probe | visualization of macromolecular probe
http://purl.obolibrary.org/obo/FBbi_00000530 | tdRFP611 | visualization of tdRFP611
http://purl.obolibrary.org/obo/FBbi_00000414 | probe for lysosomes | visualization of probe for lysosomes
http://purl.obolibrary.org/obo/FBbi_00000535 | fluorescent protein timer | visualization of fluorescent protein timer
http://purl.obolibrary.org/obo/FBbi_00000534 | ZsYellowFP | visualization of ZsYellowFP
http://purl.obolibrary.org/obo/FBbi_00000413 | probe for Golgi | visualization of probe for Golgi
http://purl.obolibrary.org/obo/FBbi_00000533 | TurboYFP | visualization of TurboYFP
http://purl.obolibrary.org/obo/FBbi_00000412 | probe for endoplasmic reticulum | visualization of probe for endoplasmic reticulum
http://purl.obolibrary.org/obo/FBbi_00000411 | probe for mitochondria | visualization of probe for mitochondria
http://purl.obolibrary.org/obo/FBbi_00000532 | TagYFP | visualization of TagYFP
http://purl.obolibrary.org/obo/FBbi_00000418 | genetically encoded biotin tag | visualization of genetically encoded biotin tag
http://purl.obolibrary.org/obo/FBbi_00000539 | photoswitchable fluorescent protein | visualization of photoswitchable fluorescent protein
http://purl.obolibrary.org/obo/FBbi_00000417 | Hoechst 33258 | visualization of Hoechst 33258
http://purl.obolibrary.org/obo/FBbi_00000538 | photoconvertible/photoswitchable fluorescent protein | visualization of photoconvertible/photoswitchable fluorescent protein
http://purl.obolibrary.org/obo/FBbi_00000416 | tetracysteine tag | visualization of tetracysteine tag
http://purl.obolibrary.org/obo/FBbi_00000537 | photoconvertible fluorescent protein | visualization of photoconvertible fluorescent protein
http://purl.obolibrary.org/obo/FBbi_00000415 | stain with broad specificity | visualization of stain with broad specificity
http://purl.obolibrary.org/obo/FBbi_00000536 | photoactivatable fluorescent protein | visualization of photoactivatable fluorescent protein
http://purl.obolibrary.org/obo/FBbi_00000520 | AsRed2FP | visualization of AsRed2FP
http://purl.obolibrary.org/obo/FBbi_00000409 | organelle-specific probe | visualization of organelle-specific probe
http://purl.obolibrary.org/obo/FBbi_00000408 | probe for protein | visualization of probe for protein
http://purl.obolibrary.org/obo/FBbi_00000529 | mStrawberryFP | visualization of mStrawberryFP
http://purl.obolibrary.org/obo/FBbi_00000524 | mAppleFP | visualization of mAppleFP
http://purl.obolibrary.org/obo/FBbi_00000403 | small-molecule probe | visualization of small-molecule probe
http://purl.obolibrary.org/obo/FBbi_00000402 | lectin | visualization of lectin
http://purl.obolibrary.org/obo/FBbi_00000523 | JRedFP | visualization of JRedFP
http://purl.obolibrary.org/obo/FBbi_00000522 | HcRed1FP | visualization of HcRed1FP
http://purl.obolibrary.org/obo/FBbi_00000401 | antibody | visualization of antibody
http://purl.obolibrary.org/obo/FBbi_00000521 | eqFP611 | visualization of eqFP611
http://purl.obolibrary.org/obo/FBbi_00000400 | sequence-specific nucleic acid probe | visualization of sequence-specific nucleic acid probe
http://purl.obolibrary.org/obo/FBbi_00000528 | mRubyFP | visualization of mRubyFP
http://purl.obolibrary.org/obo/FBbi_00000407 | small genetically encoded tag | visualization of small genetically encoded tag
http://purl.obolibrary.org/obo/FBbi_00000527 | mRFP1 | visualization of mRFP1
http://purl.obolibrary.org/obo/FBbi_00000406 | probes for nucleic acid | visualization of probes for nucleic acid
http://purl.obolibrary.org/obo/FBbi_00000405 | fluorescent protein tag | visualization of fluorescent protein tag
http://purl.obolibrary.org/obo/FBbi_00000526 | mRasberryFP | visualization of mRasberryFP
http://purl.obolibrary.org/obo/FBbi_00000525 | mCherryFP | visualization of mCherryFP
http://purl.obolibrary.org/obo/FBbi_00000432 | peptide-nucleic acid probe | visualization of peptide-nucleic acid probe
http://purl.obolibrary.org/obo/FBbi_00000553 | mKikGR | visualization of mKikGR
http://purl.obolibrary.org/obo/FBbi_00000552 | mEOS2FP | visualization of mEOS2FP
http://purl.obolibrary.org/obo/FBbi_00000431 | cholera toxin B | visualization of cholera toxin B
http://purl.obolibrary.org/obo/FBbi_00000430 | soybean agglutinin | visualization of soybean agglutinin
http://purl.obolibrary.org/obo/FBbi_00000551 | KaedeFP | visualization of KaedeFP
http://purl.obolibrary.org/obo/FBbi_00000550 | dEOSFP | visualization of dEOSFP
http://purl.obolibrary.org/obo/FBbi_00000436 | Cyan fluorescent protein from Aequorea | visualization of Cyan fluorescent protein from Aequorea
http://purl.obolibrary.org/obo/FBbi_00000557 | bsDronpa | visualization of bsDronpa
http://purl.obolibrary.org/obo/FBbi_00000556 | IrisFP | visualization of IrisFP
http://purl.obolibrary.org/obo/FBbi_00000435 | Blue fluorescent protein from Aequorea victoria | visualization of Blue fluorescent protein from Aequorea victoria
http://purl.obolibrary.org/obo/FBbi_00000555 | wtKIikGR | visualization of wtKIikGR
http://purl.obolibrary.org/obo/FBbi_00000434 | optical highlighter | visualization of optical highlighter
http://purl.obolibrary.org/obo/FBbi_00000433 | fluorescent protein derived from Anthozoa | visualization of fluorescent protein derived from Anthozoa
http://purl.obolibrary.org/obo/FBbi_00000554 | wtEOSFP | visualization of wtEOSFP
http://purl.obolibrary.org/obo/FBbi_00000439 | Yellow fluorescent protein from Aequorea | visualization of Yellow fluorescent protein from Aequorea
http://purl.obolibrary.org/obo/FBbi_00000438 | DiIC16 | visualization of DiIC16
http://purl.obolibrary.org/obo/FBbi_00000559 | Dronpa-3 | visualization of Dronpa-3
http://purl.obolibrary.org/obo/FBbi_00000558 | Dronpa | visualization of Dronpa
http://purl.obolibrary.org/obo/FBbi_00000437 | Green fluorescent protein from Aequorea | visualization of Green fluorescent protein from Aequorea
http://purl.obolibrary.org/obo/FBbi_00000542 | Medium-FT | visualization of Medium-FT
http://purl.obolibrary.org/obo/FBbi_00000421 | membrane-permeant probe | visualization of membrane-permeant probe
http://purl.obolibrary.org/obo/FBbi_00000541 | Fast-FT | visualization of Fast-FT
http://purl.obolibrary.org/obo/FBbi_00000420 | fluorescent protein derived from Aequorea victoria | visualization of fluorescent protein derived from Aequorea victoria
http://purl.obolibrary.org/obo/FBbi_00000540 | DsRed-ES FP | visualization of DsRed-ES FP
http://purl.obolibrary.org/obo/FBbi_00000546 | PA-mCherry1FP | visualization of PA-mCherry1FP
http://purl.obolibrary.org/obo/FBbi_00000425 | conconavalin A | visualization of conconavalin A
http://purl.obolibrary.org/obo/FBbi_00000545 | PA-CFP | visualization of PA-CFP
http://purl.obolibrary.org/obo/FBbi_00000424 | 7-amino-actinomycin D | visualization of 7-amino-actinomycin D
http://purl.obolibrary.org/obo/FBbi_00000423 | acridine homodimer | visualization of acridine homodimer
http://purl.obolibrary.org/obo/FBbi_00000544 | PA-GFP | visualization of PA-GFP
http://purl.obolibrary.org/obo/FBbi_00000422 | membrane impermeant probe | visualization of membrane impermeant probe
http://purl.obolibrary.org/obo/FBbi_00000543 | Slow-FT | visualization of Slow-FT
http://purl.obolibrary.org/obo/FBbi_00000429 | Helix pomatia agglutinin | visualization of Helix pomatia agglutinin
http://purl.obolibrary.org/obo/FBbi_00000549 | Dendra2FP | visualization of Dendra2FP
http://purl.obolibrary.org/obo/FBbi_00000428 | Arachis hypogaea (PNA) | visualization of Arachis hypogaea (PNA)
http://purl.obolibrary.org/obo/FBbi_00000548 | Phamret | visualization of Phamret
http://purl.obolibrary.org/obo/FBbi_00000427 | Phaseolus vulgaris lectin PHA-L) | visualization of Phaseolus vulgaris lectin PHA-L)
http://purl.obolibrary.org/obo/FBbi_00000426 | wheat germ agglutinin | visualization of wheat germ agglutinin
http://purl.obolibrary.org/obo/FBbi_00000547 | PA-mRFP | visualization of PA-mRFP
http://purl.obolibrary.org/obo/FBbi_00000571 | osmium tetroxide | visualization of osmium tetroxide
http://purl.obolibrary.org/obo/FBbi_00000450 | Cy5 | visualization of Cy5 conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000570 | lead salt | visualization of lead salt
http://purl.obolibrary.org/obo/FBbi_00000454 | Tetramethyl rhodamine (TRITC) | visualization of Tetramethyl rhodamine (TRITC) conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000453 | TexasRed | visualization of TexasRed conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000452 | Rhodamine | visualization of Rhodamine conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000451 | Fluorescein (FITC) | visualization of Fluorescein (FITC) conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000572 | potassium permanganate | visualization of potassium permanganate
http://purl.obolibrary.org/obo/FBbi_00000458 | biotin | visualization of biotin conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000457 | electron dense label | visualization of electron dense label conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000215 | RNA probe | visualization of RNA probe
http://purl.obolibrary.org/obo/FBbi_00000578 | other radioisotope | visualization of metabolically incorporated other radioisotope
http://purl.obolibrary.org/obo/FBbi_00000456 | enzyme label | visualization of enzyme label conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000455 | fluorescent label | visualization of fluorescent label conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000459 | affinity for specific proteins | visualization of affinity for specific proteins
http://purl.obolibrary.org/obo/FBbi_00000560 | E2GFP | visualization of E2GFP
http://purl.obolibrary.org/obo/FBbi_00000443 | Alexa Fluor 555 | visualization of Alexa Fluor 555 conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000564 | rsCherryFP | visualization of rsCherryFP
http://purl.obolibrary.org/obo/FBbi_00000322 | optical method | optical contrast enhancing method
http://purl.obolibrary.org/obo/FBbi_00000442 | Alexa Fluor 568 | visualization of Alexa Fluor 568 conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000563 | PadronFP | visualization of PadronFP
http://purl.obolibrary.org/obo/FBbi_00000562 | mTFP0.7 | visualization of mTFP0.7
http://purl.obolibrary.org/obo/FBbi_00000441 | Alexa Fluor 546 | visualization of Alexa Fluor 546 conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000561 | KFP1 | visualization of KFP1
http://purl.obolibrary.org/obo/FBbi_00000440 | Alexa Fluor 488 | visualization of Alexa Fluor 488 conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000447 | Alexa Fluor 647 | visualization of Alexa Fluor 647 conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000568 | electron-dense stain | visualization of electron-dense stain
http://purl.obolibrary.org/obo/FBbi_00000567 | optically-dense stain | visualization of optically-dense stain
http://purl.obolibrary.org/obo/FBbi_00000446 | Alexa Fluor 633 | visualization of Alexa Fluor 633 conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000204 | DNA probe | visualization of DNA probe
http://purl.obolibrary.org/obo/FBbi_00000445 | Alexa Fluor 610 | visualization of Alexa Fluor 610 conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000566 | rsFastLimeFP | visualization of rsFastLimeFP
http://purl.obolibrary.org/obo/FBbi_00000323 | computational method | computational contrast enhancing method
http://purl.obolibrary.org/obo/FBbi_00000444 | Alexa Fluor 594 | visualization of Alexa Fluor 594 conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000565 | rsCherryRevFP | visualization of rsCherryRevFP
http://purl.obolibrary.org/obo/FBbi_00000202 | gold | visualization of gold conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000449 | Cy3 | visualization of Cy3 conjugated to probe
http://purl.obolibrary.org/obo/FBbi_00000569 | uranyl salt | visualization of uranyl salt
http://purl.obolibrary.org/obo/FBbi_00000448 | Cy2 | visualization of Cy2 conjugated to probe
