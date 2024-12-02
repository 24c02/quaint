require_relative 'quant'

MAIN_THING = Quant.new do
  base "High Seas" do
    api_key ENV["AIRTABLE_PAT"]
    base_id "appTeNFYcUiYfGcR6"

    record_type "Person" do
      table "tblfTzYVqvDJlIYUB"
      searchable_column key: "slack_id", name: "Slack ID"
      searchable_column key: "email", name: "email"
    end

    record_type "Shop order" do
      table "tbl7Dj23N5tjLanM4"
    end

    record_type "Shop card grant" do
      table "tblitljiz4cxhF5tr"
      searchable_column key: "identifier", name: "identifier"
    end

    record_type "Shop address" do
      table "shop_addresses"
      searchable_column key: "identifier", name: "identifier"
    end
  end

  base "Marketing – Shipment Request" do
    api_key ENV["AIRTABLE_PAT"]
    base_id "appK53aN0fz3sgJ4w"

    record_type "Shipment Request" do
      table "tbltnDSvmiUH0grQo"
    end

  end

end
