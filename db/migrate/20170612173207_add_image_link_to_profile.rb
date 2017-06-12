class AddImageLinkToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :image_link, :string
  end
end
