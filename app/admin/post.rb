ActiveAdmin.register Post do
		permit_params :title, :body, :image, :author_id, :author

  index do
    selectable_column
    column :title
    column :body
    column :author
    actions
  end

		show do |t|
			attributes_table do
				row :title
				row :body
				row :author
				row :image do
					post.image? ? image_tag(post.image.url, height: '100') : content_tag(:span, "No photo yet")
				end
			end
		end

		form :html => { :enctype => "multipart/form-data" } do |f|
			f.inputs 'Post Editing' do
				f.input :title
				f.input :body
				f.input :author 
				f.input :image, hint: f.post.image? ? image_tag(post.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
			end
			f.actions
		end
end

