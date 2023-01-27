class AddUserIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :user, foreign_key: true

    reversible do |direction|
      direction.up do
        uid = User.first.id
        Post.update_all(user_id: uid)

        change_column_null :posts, :user_id, false
      end
    end
  end
end
