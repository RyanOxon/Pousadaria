require 'rails_helper'

describe "./Api/V1/inn_rooms/id" do
  it "sucessfully" do
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida', 
                                document: '53783222001', email: 'joao@email.com', password: '123456')
    inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar', 
                                address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})
    inn.inn_rooms.create!(name: 'Quarto com Varanda', size: 35, guest_limit: 3, daily_rate_cents: 20000)
    room = inn.inn_rooms.create!(name: 'Quarto Térreo 1A', size: 30, guest_limit: 3, daily_rate_cents: 15000)
    inn.inn_rooms.create!(name: 'Quarto Térreo 2A', size: 30, guest_limit: 3, daily_rate_cents: 15000)

    get api_v1_inn_romms_path(room.id)

    expect(response).to have_http_status(200)
  end
end
