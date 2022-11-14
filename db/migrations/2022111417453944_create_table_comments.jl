module CreateTableComments

import SearchLight.Migrations: create_table, column, columns, pk, drop_table

function up()
  create_table(:comments) do
    [
      pk()
      column(:name, :string, limit = 32, not_null = true)
      column(:text, :string, limit = 256, not_null = true)
      column(:created_at, :timestamp, default = "current_timestamp", not_null = true)
      column(:page, :string, limit = 64, not_null = true)
    ]
  end
end

function down()
  drop_table(:comments)
end

end
