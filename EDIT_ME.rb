require_relative 'quaint'

MAIN_THING = Quaint.new do
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
      searchable_column key: "external_ref", name: "external reference"
    end

    record_type "Shop card grant" do
      table "tblitljiz4cxhF5tr"
      searchable_column key: "identifier", name: "identifier", match_case: true
    end

    record_type "Shop address" do
      table "tblYxntrYxcTewLJW"
      searchable_column key: "identifier", name: "identifier"
    end
  end

  base "Marketing – Shipment Request" do
    api_key ENV["AIRTABLE_PAT"]
    base_id "appK53aN0fz3sgJ4w"

    record_type "Shipment Request" do
      table "tbltnDSvmiUH0grQo"
    end

    record_type "SKU" do
      table "tblvSJMqoXnQyN7co"
      searchable_column key: "SKU", name: "SKU"
    end

  end

  base "You Ship We Ship" do
    api_key ENV["AIRTABLE_PAT"]
    base_id "appre1xwKlj49p0d4"

    record_type "YSWS Verification User" do
      table "tbl2Q2aCWqyBGi9mj"
      searchable_column key: "Hack Club Slack ID", name: "Slack ID"
      searchable_column key: "Email", name: "Email"
    end
  end

end
