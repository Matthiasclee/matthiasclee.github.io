json.extract! about_page, :id, :content, :created_at, :updated_at
json.url about_page_url(about_page, format: :json)
json.content about_page.content.to_s
