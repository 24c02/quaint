require 'erb'
require 'active_support/inflector'

require_relative 'EDIT_ME'

MAIN_THING.bases.each do |b|
  puts "Base: #{b.name}"
  b.record_types.each do |type|
    puts "\t#{type.name.pluralize}"
  end
end

@bases = MAIN_THING.bases

def go_button(slug)
  "(<a class='ext-link'  href='https://airtable.com/#{slug}' target='_blank'>go!</a>)"
end

def generate_form(id:, label:, slug:, recid: false)
  # ugly but lets us only hit a dynamic call & AT when it's something more complicated than a record ID
  form_action = recid ? "open_record_in_new_tab(me, value of first <input/> in me)" : "hit_searchable_column(me, '#{id}')"
  <<~EOH
<form _="on submit halt the event's default #{form_action}  end" data-slug="#{slug}">
          <label for="#{id}">#{label}: </label>
          <input type="text" id=#{id} name=#{id}>
          <input type="submit" value="go!">
          <span class="error"></span>
        </form>
EOH
end

template = File.read('page.erb')
renderer = ERB.new(template)
result = renderer.result(binding)

output_dir = "build"
output_file = File.join(output_dir, "index.html")

Dir.mkdir(output_dir) unless Dir.exist?(output_dir)

File.write(output_file, result)
