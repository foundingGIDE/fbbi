## Contributing to the ontology by opening tickets

The easiest way to contribute to the Biological Imaging Methods Ontology
is by opening tickets on our [issue tracker](https://github.com/foundingGIDE/fbbi/issues)
to requests new terms or amendments to existing terms.

This does not require you to be familiar with ontology editing
procedures, as your request will be handled by someone in the Biological
Imaging Methods Ontology editorial team, who will do the actual editing.

To help the editorial team to process your request(s), please consider
the following recommendations:

- **Does the term already exist?** Before submitting a new term request
(NTR), check whether the term you need already exists, either as a
primary term or a synonym term. You can search using an online ontology
browser such as [OLS](http://www.ebi.ac.uk/ols/ontologies/fbbi).

- **Write a detailed request.** A request that simply says “please add a
new term for ‘foo‘” or “please fix the definition of ‘bar’” is unlikely
to be acted upon. Do not assume that the editorial team will know what
“foo” is (or what meaning _you_ give to that term), or what is wrong
with the current definition of “bar”. Please be specific and include as
many details as necessary.

- **Include suggestions.** You may include suggestions for the precise
label, definition, and optional synonyms that you think the new term you
are requesting should use. If you are familiar with the structure of the
ontology, you may also suggest a position for the new term within the
existing hierarchy.

- **Provide references.** Whenever possible, please include
PMIDs, DOIs, or other references to source the definition of new or
updated terms.


## Contributing to the ontology by editing it directly

If you know how to edit a OWL ontology, then you may also contribute
more directly by editing it yourself, and submitting your proposed
changes to the editorial team in a pull request (PR).

If you want to do so, please consider the following recommendations:

- **Open a ticket prior to submitting a PR.** Even if you plan to make
the changes yourself, you should still start by opening a ticket
explaining what you think the problem is. You may then mention in the
ticket that you plan to fix the issue yourself in an upcoming PR.

- **Request an ID range.** If you plan to submit PRs in which you will
add new terms, please request (through a dedicated ticket) that an ID
range be assigned to you.

- **Do not edit fbbi-edit.owl manually.** Please use a specialized
ontology editor such as [Protégé](https://protegeproject.github.io/protege/)
for all your changes.

If you really want to implement your changes using a non-OWL-aware
program, please make sure to “re-serialize” the `fbbi-edit.owl` file
before committing your changes.

- **Finding help.** The Biological Imaging Methods Ontology is
maintained using the [Ontology Development Kit](https://github.com/INCATools/ontology-development-kit)
and overall follows (or _attempts_ to follow) the editing guidelines of
the [OBO Foundry](https://obofoundry.org). You can find more
informations about both the ODK and the OBO Foundry practices in the
[OBO Semantic Engineering Training](https://oboacademy.github.io/obook/)
website (commonly known as “the OBOOK”), and you can also find people to
help you in the [OBO Community](obo-communitygroup.slack.com) Slack
workspace.


On behalf of the Biological imaging methods ontology editorial team, Thanks!
