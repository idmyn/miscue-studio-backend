# Miscue Studio

## Feature summary

[Miscue analysis](https://en.wikipedia.org/wiki/Miscue_analysis) is a diagnostic
tool to help teachers better understand the reading ability of their
students. This webapp enables teachers to digitally annotate reading material
with a representation of the way it was actually read by a student. The webapp
can then use these annotations to generate statistics about the student’s
reading ability, and track their progress over time. Work in progress.

React frontend can be found
[here](https://github.com/idmyn/miscue-studio-frontend).

## Techincal summary

### Endpoints

This rails API currently has the following endpoints (namespaced under `/v1/`)
- students (create, index, show)
- teachers (create, show)
- stories (index, show)
- readings (create, index, show)
- login (POST)
- validate (GET)
