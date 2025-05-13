class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order(created_at: :desc)
    render(template: "photos/index")
  end

  def show
    my_photo_id = params.fetch("path_id")
    @the_photo = Photo.where(id: my_photo_id).first

    if @the_photo.nil?
      redirect_to("/404")
    else
      render(template: "photos/show")
    end
  end

  def destroy
    my_photo_id = params.fetch("path_id")
    the_photo = Photo.where(id: my_photo_id).first
    the_photo.destroy
    redirect_to("/photos")
  end

  def create
    new_photo = Photo.new
    new_photo.image = params.fetch("input_image")
    new_photo.caption = params.fetch("input_caption")
    new_photo.owner_id = params.fetch("input_owner_id")
    new_photo.save
    redirect_to("/photos/#{new_photo.id}")
  end

  def update
    my_photo_id = params.fetch("path_id")
    the_photo = Photo.where(id: my_photo_id).first
    the_photo.caption = params.fetch("input_caption")
    the_photo.image = params.fetch("input_image")
    the_photo.save
    redirect_to("/photos/#{my_photo_id}")
  end
end
