defmodule CDB.SirTrevorImageUploader do
  use Arc.Definition
  use Arc.Ecto.Definition

  @versions ~w{ original web }a
  @acl :public_read
  @async false

  def __storage do
    Application.get_env(:arc, :storage) || Arc.Storage.S3
  end

  def validate({file, _}) do
    ~w(.jpg .jpeg .png) |> Enum.member?(Path.extname(file.file_name) |> String.downcase)
  end

  def transform(:web, {_file, _scope}) do
    if (Application.get_env(:cdb, :environment) == :dev) do
      :noaction
    else
      {:convert, fn(input, output) ->
        "#{input} -filter Triangle -define filter:support=2 -unsharp 0.25x0.25+8+0.065 -quality 82 -define jpeg:fancy-upsampling=off -interlace none -colorspace sRGB -strip -sampling-factor 4:2:0 -gravity center -thumbnail 1280x1280^ -geometry 1280 #{output}"
      end}
    end
  end

  def filename(version,  {file, _scope}) do
    no_ext = Path.rootname file.file_name
    "#{no_ext}-#{version}"
  end

  def storage_dir(_, _), do: "uploads/sir_trevor"
end
