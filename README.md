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

### Authentication

The endpoints related to authentication are `/teachers`, `/login`, and
`/validate`. 

#### Account creation
Credentials (email, password, password confirmation) are received via POST
request to `/teachers` since our users and teachers are one and the same. As
such, **all authentication methods are handled in
[`teachers_controller.rb`](https://github.com/idmyn/miscue-studio-backend/blob/master/app/controllers/v1/teachers_controller.rb).**

#### Login
Credentials (email, password) are received via POST request to `/login`, where
they are verified. If successful, a [JSON Web
Token](https://en.wikipedia.org/wiki/JSON_Web_Token) (JWT) is created and sent
in the response to the client (alongside a hash of the teacher data). If
unsuccessful, the following error hash is sent: `{ errors: ["Email or password incorrect."] }`. It didn't _need_ to be an array, but in other cases
there might be more than one error, so all errors are sent in arrays for
consistency's sake.

#### Validation
The `/validate` endpoint serves to validate JWTs received under the
`Authorization` key in the headers of GET requests. JWTs are validated with the
[`logged_in`](https://github.com/idmyn/miscue-studio-backend/blob/b34dc232e5832642d1fed686d6fdaa09f174c39d/app/controllers/application_controller.rb#L26)
helper method, which decodes a token and looks for a matching `teacher_id` in
the database. If successful, a response is sent with the token and corresponding
teacher hash. If unsuccessful, a response is sent with a status of
`:not_accepted`
([406?](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/406)) and the
following error hash: `{ errors: ["Invalid token"] }`.

#### Issues

The account creation and login endpoints don't currently send appropriate error
codes with their responses when auth was unsuccessful. This is because it was
causing trouble in the frontend (probably because I was doing it wrong in the
backend). Low severity, but worth fixing at some point.
