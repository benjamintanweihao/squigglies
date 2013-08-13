defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    # Pick which parts of the request you want to fetch
    # You can comment the line below if you don't need
    # any of them or move them to a forwarded router
    conn.fetch([:cookies, :params])
  end

  # It is common to break your Dynamo in many
  # routers forwarding the requests between them
  # forward "/posts", to: PostsRouter

  get "/" do
    conn = conn.assign(:title, "Welcome to Squigglies!")
    render conn, "index.html"
  end

  get "/stream" do
    conn = conn.resp_content_type("text/event-stream")
    conn = conn.send_chunked(200)
    
    iterator = Stream.repeatedly(fn -> :random.uniform end)

    Enum.each iterator, fn(element) ->
      { :ok, conn } = conn.chunk "data: #{element}\n\n"
      await conn, 200, on_wake_up(&1, &2), on_time_out(&1)
    end
  end

  defp on_wake_up(arg1, arg2) do
    # Nothing
  end

  defp on_time_out(arg1) do
    # Nothing
  end
end
