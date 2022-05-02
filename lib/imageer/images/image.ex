defmodule Imageer.Images.Image do
  use Ecto.Schema
  use  Waffle.Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :image, ImageUploader.Type

    timestamps()
  end

  @doc false
  def changeset(image, attrs \\ %{}) do
    image
    |> cast(attrs, [:image])
    |> cast_attachments(attrs, [:image])
  end
end
