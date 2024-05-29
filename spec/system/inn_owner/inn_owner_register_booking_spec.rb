require 'rails_helper'

describe 'Inn owner registers a new booking' do
  it "from navbar" do
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida', 
                                document: '53783222001', email: 'joao@email.com', password: '123456')
    inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar', 
                                address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})

    inn.inn_rooms.create!(name: 'Quarto Térreo', size: 30, guest_limit: 3)
    inn.inn_rooms.create!(name: 'Quarto com Varanda', size: 35, guest_limit: 3)

    login_as inn_owner, scope: :inn_owner

    visit root_path
    click_on 'Gestão de Pousadas'

    expect(page).to have_link 'Registrar nova Reserva'

  end

  it "sucessfully" do
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida', 
                                document: '53783222001', email: 'joao@email.com', password: '123456')
    inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar', 
                                address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})

    inn.inn_rooms.create!(name: 'Quarto Térreo', size: 30, guest_limit: 3)
    inn.inn_rooms.create!(name: 'Quarto com Varanda', size: 35, guest_limit: 3)

    login_as inn_owner, scope: :inn_owner

    visit root_path
    click_on 'Gestão de Pousadas'
    click_on 'Registrar nova Reserva'
    
    fill_in "Nome",	with: "Treinadev ferias de verao" 
    fill_in "Data de Inicio",	with: "05/01/2025" 
    fill_in "Data de Termino",	with: "10/01/2025" 
    click_on 'Criar Reserva'

    expect(page).to have_content 'Reserva Criada com sucesso, por favor inclua os quartos e seus hospedes'
    expect(page).to have_button 'Incluir Quartos'
    
  end
  
  
end