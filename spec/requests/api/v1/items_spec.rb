require 'rails_helper'

RSpec.describe 'Items Endpoint', :type => :request do
  it 'should return a collection of all items' do
    items = create_list(:item, 5)
    expected_item = items.first

    get '/api/v1/items'

    expect(response.status).to eq(200)

    parsed_response = JSON.parse(response.body)
    first_item = parsed_response.first

    expect(parsed_response.count).to eq(5)
    expect(first_item[:name]).to eq(expected_item.name)
    expect(first_item[:description]).to eq(expected_item.description)
    expect(first_item[:image_url]).to eq(expected_item.image_url)
    expect(first_item[:created_at]).to eq(expected_item.created_at)
    expect(first_item[:updated_at]).to eq(expected_item.updated_at)
  end

  it 'should return a single item' do
    items = create_list(:item, 5)
    expected_item = items.first

    get "/api/v1/items/#{expected_item.id}"

    expect(response.status).to eq(200)

    parsed_response = JSON.parse(response.body)

    expect(parsed_response[:name]).to eq(expected_item.name)
    expect(parsed_response[:description]).to eq(expected_item.description)
    expect(parsed_response[:image_url]).to eq(expected_item.image_url)
    expect(parsed_response[:created_at]).to eq(expected_item.created_at)
    expect(parsed_response[:updated_at]).to eq(expected_item.updated_at)
  end

  it 'should delete an item' do
    items = create_list(:item, 5)
    deleted_item = items.first

    delete "/api/v1/items/#{deleted_item.id}"

    expect(response.status).to eq(204)

    get '/api/v1/items'

    leftover_items = JSON.parse(response.body)

    expect(leftover_items.count).to eq(4)
  end

  it 'should create an item' do
    params = {
      name: 'Gameboy',
      description: 'It is a Gameboy',
      image_url: 'http://www.url.com'
    }

    post "/api/v1/items", params

    expect(response.status).to eq(201)

    new_item = JSON.parse(response.body)

    expect(new_item[:name]).to eq('Gameboy')
    expect(new_item[:description]).to eq('It is a Gameboy')
    expect(new_item[:image_url]).to eq('http://www.url.com')
  end
end
