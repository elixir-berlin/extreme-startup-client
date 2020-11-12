defmodule ExtremeStartupClient.QuestionTest do
  use ExUnit.Case
  alias ExtremeStartupClient.Question

  doctest Question

  test "some random question" do
    assert Question.answer("fghjkjhghjjk") == "Hmm!? let me think...."
  end
end
