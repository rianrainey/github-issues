# Issues

Retrieve a list of Github issues for a given organization/user and a project.

## Installation

  1. Add issues to your list of dependencies in `mix.exs`:

        def deps do
          [{:issues, github: "rianrainey/github-issues"}]
        end

  1. Run `mix deps get`


## Usage

```
$ iex -S mix
iex> Issues.CLI.process {"elixir-lang", "elixir", 1}
19:26:41.239 [info]  Fetching user elixir-lang's project elixir
19:26:45.864 [info]  Successful response
numb | created_at           | title
-----+----------------------+-----------------------------------------------
3328 | 2015-05-14T15:00:37Z | Support delayed evaluation of code in .iex.exs
:ok
```

