require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  # let(:Authorization) { 'fcNnUfD+DF0J+3U++4Q8pRKyXWkQYO9q9ubRUIEDU8NyjbqB54ibwFF83narC4AGYKKs9f4O1ohCk8bQIZUAOw==' } # Replace with your actual authentication token
  # before do
  #   header 'Authorization', 'Bearer fcNnUfD+DF0J+3U++4Q8pRKyXWkQYO9q9ubRUIEDU8NyjbqB54ibwFF83narC4AGYKKs9f4O1ohCk8bQIZUAOw=='
  # end
  path '/api/v1/reservations/index' do
    get('list reservations') do

      produces 'application/json'

      parameter name: 'Authorization', in: :header, type: :string, description: 'Bearer token'
      response(200, 'successful') do

        before do
          request.headers['Authorization'] = "Bearer fcNnUfD+DF0J+3U++4Q8pRKyXWkQYO9q9ubRUIEDU8NyjbqB54ibwFF83narC4AGYKKs9f4O1ohCk8bQIZUAOw=="
        end

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

  path '/api/v1/reservations' do

    get('list reservations') do
      
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
  end
end
