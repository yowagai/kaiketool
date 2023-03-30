module ApplicationHelper
  def birth_date_select(form, method)
    form.date_select method,
      {
        start_year: 2005,
        end_year: Time.now.year,
        use_month_numbers: true,
        prompt: { year: '年', month: '月', day: '日' }
      },
      { class: 'birth-date-select' }
  end
end
