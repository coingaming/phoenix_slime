defmodule PhoenixSlime do
  @doc """
  Provides the `~L` sigil with HTML safe Slime syntax inside source files.

      iex> import PhoenixSlime
      iex> assigns = %{}
      iex> ~l"\""
      ...> p
      ...>   = "hello #{"world"}"
      ...> "\""
      %Phoenix.LiveView.Rendered{
        dynamic: ["hello world"],
        fingerprint: 286889347176720933956990911674974244626,
        static: ["<p>", "</p>"]
      }
  """
  defmacro sigil_l(expr, opts) do
    handle_sigil(expr, opts, __CALLER__.line)
  end

  @doc """
  Provides the `~L` sigil with HTML safe Slime syntax inside source files.

      iex> import PhoenixSlime
      iex> ~L"\""
      ...> p hello \#{"world"}
      ...> "\""
      {:safe, ["<p>hello ", "world", "</p>"]}
  """
  defmacro sigil_L(expr, opts) do
    handle_sigil(expr, opts, __CALLER__.line)
  end

  defp handle_sigil({:<<>>, _, [expr]}, [], line) do
    expr
    |> Slime.Renderer.precompile()
    |> EEx.compile_string(engine: Phoenix.LiveView.Engine, line: line + 1)
  end

  defp handle_sigil(_, _, _) do
    raise ArgumentError,
          ~S(Templating is not allowed with #{} in ~l sigil.) <>
            ~S( Remove the #{}, use = to insert values, or ) <>
            ~S(use ~L to template with #{}.)
  end
end
