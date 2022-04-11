defmodule Imageer.ImagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Imageer.Images` context.
  """

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        image: "some image"
      })
      |> Imageer.Images.create_image()

    image
  end
end
