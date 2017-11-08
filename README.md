# vint_amber

Frontent alterantive for vint.com.ua

## Installation

Create a pg database called `vint_amber_development` and configure the
`config/database.yml` to provide the credentials to access the table.

Then:

```shellsession
shards update
amber migrate up
```

## Usage

To run the demo:

```shellsession
$ shards build src/vint_amber.cr
./vint_amber
```

## Docker Compose

This will start an instance of postgres, migrate the database,
and launch the site at http://localhost:3020

```shellsession
docker-compose up -d
```

To view the logs:

```shellsession
docker-compose logs -f
```

Note: The Docker images are compatible with Heroku.

## Contributing

1. Fork it ( https://github.com/chaky222/vint_amber/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [your_github_name](https://github.com/your_github_name) your_name - creator, maintainer
