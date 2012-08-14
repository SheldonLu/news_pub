#encoding: utf-8
ActiveAdmin.register AdminUser do

  menu :label => "用户管理"

  filter :email

  index :download_links => false do
    id_column
    column "邮箱", :email
    column "最后登录时间", :last_sign_in_at
    column "用户创建时间", :created_at
    default_actions
  end

  show :title => :email do
    panel '管理员信息' do
      attributes_table_for admin_user, :email,
                           :last_sign_in_at,
                           :last_sign_in_ip,
                           :created_at,
                           :sign_in_count
    end
  end

  form do |f|
    f.inputs '用户信息' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end

end
