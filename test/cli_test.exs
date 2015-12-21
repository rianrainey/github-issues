defmodule CliTest do
  use ExUnit.Case
  import Issues.CLI, only: [parse_args: 1]
  doctest Issues

  test ":help return by option parsign with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three values returned if three given" do
    assert parse_args(["user", "project", "98"]) == {"user", "project", 98}
  end

  test "count is defaulted if two values given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end
end
