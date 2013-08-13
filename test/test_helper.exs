Dynamo.under_test(Squigglies.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Squigglies.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
