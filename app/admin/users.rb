ActiveAdmin.register User do

  index do
    selectable_column
    id_column
    column :email
    actions
  end
  
end
