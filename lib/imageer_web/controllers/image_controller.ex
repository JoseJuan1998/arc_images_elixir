defmodule ImageerWeb.ImageController do
  use ImageerWeb, :controller

  alias Imageer.Repo
  alias Imageer.Images
  alias Imageer.Images.Image

  def index(conn, _params) do
    images = Repo.all(Image)
  render(conn, "index.html", images: images)
  end

  def new(conn, _params) do
    changeset = Images.change_image(%Image{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"image" => image_params}) do
    changeset = Image.changeset(%Image{}, image_params)

    case Repo.insert(changeset) do
      {:ok, image} ->
        conn
        |> put_flash(:info, "Image was added.")
        |> redirect(to: Routes.image_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    image = Images.get_image!(id)
    render(conn, "show.html", image: image)
  end

  def edit(conn, %{"id" => id}) do
    image = Images.get_image!(id)
    changeset = Images.change_image(image)
    render(conn, "edit.html", image: image, changeset: changeset)
  end

  def update(conn, %{"id" => id, "image" => image_params}) do
    image = Images.get_image!(id)

    case Images.update_image(image, image_params) do
      {:ok, image} ->
        conn
        |> put_flash(:info, "Image updated successfully.")
        |> redirect(to: Routes.image_path(conn, :show, image))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", image: image, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    image = Images.get_image!(id)
    {:ok, _image} = Images.delete_image(image)

    conn
    |> put_flash(:info, "Image deleted successfully.")
    |> redirect(to: Routes.image_path(conn, :index))
  end
end
