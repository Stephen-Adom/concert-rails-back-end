require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  reservation_schema = {
    type: :object,
    properties: {
      user_id: { type: :integer },
      concert_hall_id: { type: :integer }
    },
    required: %w[user_id concert_hall_id]
  }
  path '/api/v1/reservations' do
    get('list reservations') do
      consumes 'application/json'
      produces 'application/json'
      parameter name: 'Authorization', in: :header, type: :string, description: 'Bearer token'

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create reservation') do
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, type: :string, description: 'Bearer token'

      parameter name: :reservation, in: :body, schema: reservation_schema
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
