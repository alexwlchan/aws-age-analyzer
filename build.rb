#!/usr/bin/env ruby

require 'json'
require 'date'

def years_since(date_string)
  years = if date_string =~ /^\d{4}$/
            Date.today.year - date_string.to_i
          else
            date = Date.parse(date_string)
            ((Date.today - date) / 365).to_i
          end

  if years.zero?
    'hardly any time at all ago!'
  elsif years == 1
    '1 year ago'
  else
    "#{years} years ago"
  end
end

def icon(key)
  @icons[key]
end

template = File.read('index.template')
services = JSON.parse(File.read('services.json'))

# sort the list of services
services = services.sort_by { |t| t["name"] }
File.open('services.json', 'w') { |f|
  f.write JSON.pretty_generate(services)
}

@icons = JSON.parse(File.read('icons.json'))

service_html = services.map do |tech|
  if tech['name'] == 'Infinidash'
    <<-HTML
    <p data-name="#{tech['name']}">
      <a target="_blank" rel='noopener noreferrer' href="#{tech['link']}">
        #{icon(tech['icon'])}
        <strong>#{tech['name']}</strong>
      </a> has not been introduced&hellip; yet</strong>
    </p>
    HTML
  else
    <<-HTML
    <p data-name="#{tech['name']}">
      <a target="_blank" rel='noopener noreferrer' href="#{tech['link']}">
        #{icon(tech['icon'])}
        <strong>#{tech['name']}</strong>
      </a> was introduced <strong>#{years_since(tech['released'])}</strong>
    </p>
    HTML
  end
end.join

dropdown_html = services.map do |tech|
  <<-HTML
  <option value="#{tech['name']}"></option>
  HTML
end.join

generated_html = template.sub("TECH_GOES_HERE", service_html)
generated_html = generated_html.sub("DROPDOWN_OPTIONS", dropdown_html)

File.write("index.html", generated_html)
