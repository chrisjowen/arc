defmodule Arc.File do
  defstruct [:path, :file_name, :identifier]

  # Accepts a path
  def new(path) when is_binary(path) do
    case File.exists?(path) do
      true -> %Arc.File{ path: path, file_name: Path.basename(path), identifier:  UUID.uuid1() }
      false -> {:error, :no_file}
    end
  end

  # Accepts a map conforming to %Plug.Upload{} syntax
  def new(%{filename: filename, path: path}) do
    case File.exists?(path) do
      true -> %Arc.File{ path: path, file_name: filename, identifier:  UUID.uuid1() }
      false -> {:error, :no_file}
    end
  end
end
