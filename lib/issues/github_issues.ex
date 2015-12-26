defmodule Issues.GithubIssues do
  @user_agent [ {"User-agent", "Elixir hello@rian.me"} ]
  @github_url Application.get_env(:issues, :github_url)

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({:error, %HTTPoison.Error{reason: error}}) do
    {:error, error}
  end
  def handle_response({:ok, %HTTPoison.Response{status_code: status,
                                                body: body}}) when status >= 400 do
    {:error, body}
  end
  def handle_response({:ok, %HTTPoison.Response{body: body}}) do
    {:ok, :jsx.decode(body)}
  end
end
