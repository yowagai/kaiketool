module ApplicationHelper
  def birth_date_select(form, method, options = {})
    date = form.object.send(method)
    options[:start_year] ||= 10.years.ago.year
    options[:end_year] ||= Time.now.year
    options[:use_month_numbers] ||= true
    options[:prompt] ||= { year: '年', month: '月', day: '日' }
    options[:class] ||= 'birth-date-select'
    html = "<div class=\"#{options[:class]}\">"
    html += form.select("#{method}(1i)", options_for_select((options[:start_year]..options[:end_year]).to_a.reverse, date ? date.year : nil), { prompt: options[:prompt][:year] }, class: 'year-select')
    html += form.select("#{method}(2i)", options_for_select((1..12).to_a, date ? date.month : nil), { prompt: options[:prompt][:month] }, class: 'month-select')
    html += form.select("#{method}(3i)", options_for_select((1..31).to_a, date ? date.day : nil), { prompt: options[:prompt][:day] }, class: 'day-select')
    html += "</div>"
    html.html_safe
  end
end