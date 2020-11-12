defmodule ExtremeStartupClient.Router do
  use Plug.Router
  alias ExtremeStartupClient.Question
  require Logger

  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/" do
    params = fetch_query_params(conn).query_params |> IO.inspect()

    question =
      case Map.get(params, "q") do
        # Strip ID from question
        <<_code::binary-size(8)>> <> ": " <> q -> q
        q -> q
      end

    answer = Question.answer(question)
    Logger.info("Answer: " <> answer)

    conn
    |> send_resp(200, answer)
  end

  match _ do
    conn
    |> send_resp(404, "Not Found!")
  end
end
