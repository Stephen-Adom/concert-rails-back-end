require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do

  path '/api/v1/register' do

    post('create user') do
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          username: { type: :string },
          email: { type: :string, format: :email },
          password: { type: :string },
          password_confirmation: { type: :string }
        },
        required: ['name', 'username', 'email', 'password', 'password_confirmation']
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
end
