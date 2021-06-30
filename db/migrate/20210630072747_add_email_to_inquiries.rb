class AddEmailToInquiries < ActiveRecord::Migration[6.1]
  def change
    add_column :inquiries, :email, :string
  end
end
