class CatalogController < ApplicationController
  require 'csv'

  def index
    csv_string = CSV.generate(:row_sep => "\r\n", :col_sep => ";") do |csv|
      csv << ["product_id", "product_name", "group_id"]
      rows = get_catalog
      rows.each do |row|
        csv << [row['id'], row['name'], row['group_id']]
      end
    end
    send_data(csv_string, :filename => "Catalog.csv")
  end

  private
    def get_catalog
=begin 
      sql = <<-SQL
        SELECT g.name as group_name, p.name as product_name
        FROM groups g, products p
        WHERE g.id = p.group_id
      SQL
      ActiveRecord::Base.connection.select_all sql 
=end
      Product.select("*")
    end
end
