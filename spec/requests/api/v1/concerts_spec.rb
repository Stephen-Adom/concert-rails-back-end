require 'swagger_helper'

RSpec.describe 'api/v1/concerts', type: :request do

  path '/api/v1/concerts' do

    get('list concerts') do
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

    post('create concert') do
      consumes 'application/json' # Specify that the endpoint consumes JSON
      produces 'application/json'

      parameter name: 'Authorization', in: :header, type: :string, description: 'Bearer token'
     
      parameter name: :concert_params, in: :body, schema: {
        type: :object,
        properties: {
          concert: {
            type: :object,
            properties: {
              name: { type: :string },
              band: { type: :string },
              image: { type: :string },
              description: { type: :string },
              total_seats: { type: :integer },
              artist: { type: :string }
            },
            required: ['name', 'band', 'image', 'description', 'total_seats', 'artist']
          },
          concert_hall: {
            type: :object,
            properties: {
              city_id: { type: :integer },
              date: { type: :string, format: :date }
            },
            required: ['city_id', 'date']
          }
        },
        required: ['concert', 'concert_hall']
      }

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

  path '/api/v1/concerts/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show concert') do
      response(200, 'successful') do
        let(:id) { '1' }

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

    delete('delete concert') do
      response(200, 'successful') do
        let(:id) { '1' }

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
