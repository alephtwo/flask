defmodule FlaskTest.Macros do
  defmacro assert_ok(test) do
    quote do
      assert {:ok, _} = unquote(test)
    end
  end
end
