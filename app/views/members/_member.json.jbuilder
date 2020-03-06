json.extract! member, :id, :first_name, :last_name, :address, :region, :phone_number, :email, :created_at, :updated_at
json.url member_url(member, format: :json)
