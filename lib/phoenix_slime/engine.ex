defmodule PhoenixSlime.Engine do
  @behaviour Phoenix.Template.Engine

  @doc """
  Precompiles the String file_path into a function definition
  """
  def compile(path, _name) do
    engine =
      case Path.expand(path) do
        ".lime" ->
          Phoenix.LiveView.Engine

        _ ->
          Phoenix.HTML.Engine
      end

    path
    |> read!
    |> EEx.compile_string(engine: engine, file: path, line: 1)
  end

  defp read!(file_path) do
    file_path
    |> File.read!()
    |> Slime.Renderer.precompile()
  end
end
