require_relative 'EDIT_ME'

require 'norairrecord'
require 'grape'

class API < Grape::API
  format :json
  rescue_from :all do |error|
    error!({ message: "error! #{error.message}" }, 418)
  end
  params { requires :query }
  namespace 'api' do
    MAIN_THING.bases.each do |base|
      base.record_types.each do |type|
        type.searchable_columns.each do |column|
          post "#{type.tag column[:key]}" do
            error!({message: "i said enter something >:-/"}) unless params[:query].length > 0
            tbl = Norairrecord.table(base._api_key, base.id, type.table_id)
            filter = if column[:match_case]
                       "{#{column[:key]}}=\"#{params[:query]}\""
                     else
                       "LOWER({#{column[:key]}})=\"#{params[:query].downcase}\""
                     end
            recs = tbl.records filter: filter
            unless recs.one?
              error!({message: "#{recs.length} records match."}, 400)
            end
            {found: recs.first.airtable_url}
          end
        end
      end
    end
  end
  route :any, '*path' do
    error!({ message: "not found"}, 404)
  end
end
