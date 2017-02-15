json.extract! survey, :id, :html, :name, :created_at, :updated_at
json.url survey_url(survey, format: :json)