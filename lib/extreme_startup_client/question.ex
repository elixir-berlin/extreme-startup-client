defmodule ExtremeStartupClient.Question do
  @doc ~S"""
  ## Examples

      iex> ExtremeStartupClient.Question.answer("what is your name")
      "Name provided while registering server"

  """
  def answer("what is your name") do
    "Name provided while registering server"
  end

  def answer(_) do
    "Hmm!? let me think...."
  end
end
