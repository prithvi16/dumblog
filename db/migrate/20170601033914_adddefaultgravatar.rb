class Adddefaultgravatar < ActiveRecord::Migration[5.0]

def up
  change_column_default :users, :gravatar, true
end

def down
  change_column_default :users, :gravatar, nil
end

end
