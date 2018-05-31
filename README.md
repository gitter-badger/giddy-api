# Giddy API

Join the Giddy [comunnity][gitter].

## Tech Stack

* [Docker][docker], [Node.js][node], [Yarn][yarn], [JavaScript][js], [Babel][babel], [Flow][flow], [Prettier][prettier] — core platform and dev tools
* [Express][express], [Passport.js][passport], [session][session], [flash][flash], [cors][cors] etc. — common HTTP-server features
* [GraphQL.js][gqljs], [GraphQL.js Relay][gqlrelay], [DataLoader][loader], [validator][validator] — [GraphQL][gql] schema and API endpoint
* [PostgreSQL][pg], [Redis][redis], [Knex][knex], [pg][nodepg] — SQL, document, key/value data store; data acess and migrations
* [Nodemailer][mailer], [Handlebars][hbs], [Juice][juice] — transactional email and email templates /w layout support
* [I18next][i18next], [I18next Middleware][i18nextmid], [I18next Backend][i18nextback] — localization and translations
* [Jest][jest] - unit and snapshot testing

## Directory Layout

```bash
.
├── /build/                     # The compiled output (via Babel)
├── /locales/                   # Localization resources (i18n)
├── /migrations/                # Database schema migrations
├── /seeds/                     # Scripts with reference/sample data
├── /src/                       # Node.js application source files
│   ├── /emails/                # Handlebar templates for sending transactional email
│   ├── /routes/                # Express routes, e.g. /login/facebook
│   ├── /schema/                # GraphQL schema type definitions
│   ├── /utils/                 # Utility functions (mapTo, mapToMany etc.)
│   ├── /app.js                 # Express.js application
│   ├── /Context.js             # Data loaders and other context-specific stuff
│   ├── /db.js                  # Database access and connection pooling (via Knex)
│   ├── /email.js               # Client utility for sending transactional email
│   ├── /errors.js              # Custom errors and error reporting
│   ├── /passport.js            # Passport.js authentication strategies
│   ├── /redis.js               # Redis client
│   ├── /server.js              # Node.js server (entry point)
│   └── /types.js               # Flow type definitions
├── /tools/                     # Build automation scripts and utilities
├── docker-compose.yml          # Defines Docker services, networks and volumes
├── docker-compose.override.yml # Overrides per developer environment (not under source control)
├── Dockerfile                  # Commands for building a Docker image for production
├── package.json                # List of project dependencies
└── postgres-initdb.sh          # Configuration script for the PostgreSQL Docker container
```


## Prerequisites

* [Docker][docker] Community Edition v17 or higher
* [VS Code][code] editor (preferred) + [Project Snippets][vcsnippets],
  [EditorConfig][vceditconfig], [ESLint][vceslint], [Flow][vcflow], and [Prettier][vcprettier]
  plug-ins.


## Getting Started

Just clone the repo and run `docker-compose up`:

```bash
git clone https://github.com/giddy/giddy-api.git
cd giddy-api                    # Change current directory to the newly created one
docker-compose up               # Launch Docker containers with the Node.js API app running inside
```

The API server must become available at [http://localhost:8080/graphql](http://localhost:8080/graphql)
([live demo][demo]).

Once the Docker container named `api` is started, the Docker engine executes `node tools/run.js`
command that installs Node.js dependencies, migrates database schema to the latest version,
compiles Node.js app from source files (see [`src`](./src)) and launches it with "live reload"
on port `8080`.

If you need to manually rollback and re-apply the latest database migration file, run the following:

```bash
yarn docker-db-rollback         # Rollbacks the latest migration
yarn docker-db-migrate          # Migrates database to the latest version (see /migrates folder)
yarn docker-db-seed             # Seeds database with test data (see /seeds folder)
```

In order to open a shell from inside the running "api" container, run:

```bash
docker-compose exec api /bin/sh
```

Similarly, if you need to open a PostgreSQL shell ([psql][psql]), execute this command:

```bash
docker-compose exec db psql <db> -U postgres
```

For the full list of automation scripts available in this project, please reffer to "scripts"
section in the [`package.json`](./package.json) file and the [`tools`](./tools) folder.


## Testing

```bash
yarn lint                       # Find problematic patterns in code
yarn check                      # Check source code for type errors
yarn docker-test                # Run unit tests once inside a Docker container
yarn docker-test-watch          # Run unit tests in watch mode inside a Docker container
```

For more information visit http://facebook.github.io/jest/


## Debugging

In order to run the app with [V8 inspector][v8debug] enabled, simply replace `node tools/run.js`
with `node --inspect=0.0.0.0:9229 tools/run.js` in either [`docker-compose.yml`](docker-compose.yml)
file or, even better, in `docker-compose.override.yml`. Then restart the app (`docker-compose up`) and
[attach your debugger][vsdebug] to `127.0.0.1:9230` (see [`.vscode/launch.json`](./.vscode/launch.json))


## Keeping Up-to-Date

If you keep the original Git history after cloning this repo, you can always fetch and merge
the recent updates back into your project by running:

```bash
git remote add nodejs-api-starter https://github.com/kriasoft/nodejs-api-starter.git
git checkout master
git fetch nodejs-api-starter
git merge nodejs-api-starter/master
docker-compose build --no-cache
docker-compose run --rm --no-deps api yarn
docker-compose up
```

*NOTE: Try to merge as soon as the new changes land on the master branch in Node.js API Starter
repository, otherwise your project may differ too much from the base/upstream repo.*


## Deployment

Customize the deployment script found in `tools/publish.js` if needed. Then whenever you need to
deploy your app to a remote server simply run:

```bash
node tools/publish <host>       # where <host> is the name of your web server (see ~/.ssh/config)
```

## Contributing

Anyone and everyone is welcome to [contribute](CONTRIBUTING.md). Start by checking out the list of
[open issues](https://github.com/giddy/giddy-api/issues) marked
[help wanted](https://github.com/giddy/giddy-api/issues?q=label:"help+wanted").
However, if you decide to get involved, please take a moment to review the [guidelines](CONTRIBUTING.md).


## Reference Articles and Tutorials

* [Stop using JWT for sessions](http://cryto.net/~joepie91/blog/2016/06/13/stop-using-jwt-for-sessions/)
  ([Part 2](http://cryto.net/~joepie91/blog/2016/06/19/stop-using-jwt-for-sessions-part-2-why-your-solution-doesnt-work/))
  by [Sven Slootweg](https://github.com/joepie91)
* [How to Safely Store Your Users' Passwords](https://paragonie.com/blog/2016/02/how-safely-store-password-in-2016)
  by [P.I.E.](https://paragonie.com/)
  ([video](https://youtu.be/IV4IsYyfdKI)) by [Davey Edwards](https://twitter.com/daveyedwards)
* [How to call C/C++ code from Node.js](https://medium.com/@tarkus/how-to-call-c-c-code-from-node-js-86a773033892)
  by [Konstantin Tarkus](https://twitter.com/koistya)


## Related Projects

* [GraphQL.js](https://github.com/graphql/graphql-js) — The JavaScript reference implementation for [GraphQL](http://graphql.org/)
* [DataLoader](https://github.com/facebook/dataloader) — Batching and caching for GraphQL data access layer
* [Membership Database](https://github.com/membership/membership.db) — SQL schema boilerplate for user accounts, profiles, roles, and auth claims


## License

Copyright © 2016-present Giddy. This source code is licensed under the MIT license found in the
[LICENSE.txt](https://github.com/giddy/giddy-api/blob/master/LICENSE.txt) file.

---
Made with ♥ by Robert Kovacs ([@robi_kovacs](https://twitter.com/robi_kovacs), Sasha Mihalache ([@sasha_mihalache](https://soundcloud.com/sasha_mihalache)) and [contributors](https://github.com/giddy/giddy-api/graphs/contributors)

[node]: https://nodejs.org
[js]: https://developer.mozilla.org/docs/Web/JavaScript
[babel]: http://babeljs.io/
[flow]: https://flow.org/
[prettier]: https://prettier.io/
[gql]: http://graphql.org/
[gqljs]: https://github.com/graphql/graphql-js
[gqlrelay]: https://github.com/graphql/graphql-relay-js
[yarn]: https://yarnpkg.com
[demo]: https://giddy-demo.herokuapp.com/
[express]: http://expressjs.com/
[session]: https://github.com/expressjs/session
[flash]: https://github.com/expressjs/flash
[cors]: https://github.com/expressjs/cors
[pg]: https://www.postgresql.org/
[nodepg]: https://github.com/brianc/node-postgres
[psql]: https://www.postgresql.org/docs/current/static/app-psql.html
[code]: https://code.visualstudio.com/
[vcsnippets]: https://marketplace.visualstudio.com/items?itemName=rebornix.project-snippets
[vceditconfig]: https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig
[vceslint]: https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint
[vcflow]: https://marketplace.visualstudio.com/items?itemName=flowtype.flow-for-vscode
[vcprettier]: https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode
[docker]: https://www.docker.com/community-edition
[compose]: https://docs.docker.com/compose/
[v8debug]: https://chromedevtools.github.io/debugger-protocol-viewer/v8/
[vsdebug]: https://code.visualstudio.com/Docs/editor/debugging
[passport]: http://passportjs.org/
[redis]: https://redis.io/
[knex]: http://knexjs.org/
[loader]: https://github.com/facebook/dataloader
[validator]: https://github.com/chriso/validator.js
[mailer]: https://nodemailer.com/
[hbs]: http://handlebarsjs.com/
[juice]: https://github.com/Automattic/juice
[i18next]: https://www.i18next.com/
[i18nextmid]: https://github.com/i18next/i18next-express-middleware
[i18nextback]: https://github.com/i18next/i18next-node-fs-backend
[jest]: http://facebook.github.io/jest/
[gitter]: https://gitter.im/giddy/giddy-api
