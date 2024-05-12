ActiveAdmin.register Profile do
  permit_params :username, :address, :dob, :about, :bio, :user_id, :profile_pic

  action_item 'Back', only: :show do
    link_to('Back', :back)
  end

  index do
    selectable_column
    id_column
    column :username
    column :email do |profile|
      profile.user.email
    end
    actions
  end

  show do
    attributes_table do
      row :username
      row :address
      row :dob
      row :about
      row :bio
      row :email do |profile|
        profile.user.email
      end
      row 'Profile Image' do |profile|
        if profile.profile_pic.attached?
          image_tag url_for(profile.profile_pic), style: 'width: 150px'
        else
          'No image available'
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :username
      f.input :address
      f.input :dob
      f.input :about
      f.input :bio
      f.input :user, as: :select, collection: User.pluck(:email, :id)
      f.input :profile_pic, as: :file, hint: f.object.profile_pic.attached? ? image_tag(f.object.profile_pic.variant(resize_to_limit: [100, 100])) : content_tag(:span, "No Image Attached")
    end
    f.actions
  end
end
