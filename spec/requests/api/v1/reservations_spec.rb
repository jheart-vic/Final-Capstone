require 'rails_helper'
# Rspec.describe "Reservation", type: :request
# RSpec.describe "Reservations", type: :request do
#   describe "Reservations API " do
#     before do
#       post 'api/v1/reservations', params: {:reservation_date => '03-feb-2010', :city => 'DRC', :teacher_id => 1}
#     end

#     it "returns the reservation date" do

#       # gets '/api/v1/reservations'
#       # expect(response.body).to have_http_status(:success)
#       # get user_path
#       # add reservation
#       # reservations = create(:reservations)
#       # Reservation.create(reservation_date: '02-04-2012', city: 'USA', teacher_id: 1);
#       # get api_v1_reservations_path

#       expect(JSON.parse(response.body)['reservation_date']).to eq('03-feb-2010')
#     end

#     it "returns the quotes content" do
#       expect(JSON.parse(response.body)['city']).to eq('DRC')
#     end

#     it "returns a create status" do
#       expect(response).to have_http_status(:created)
#     end
#   end
# end

# RSpec.describe 'Reservations', type: :request do
#   describe 'post / users' do
#     subject { get '/api/v1/reservations' }

#     it 'returns success' do
#       subject
      
#       expect(response).to have_http_status(200)
#     end
#   end
# end

# RSpec.describe 'Reservations', type: :request  do
#   describe "GET/ index" do
#     before do
#       FactoryBot.create_list(:reservation, 5)
#       # post Reservation.create(reservation_date: '03-apr-2021', city: 'Kigali', teacher_id: 1)

#       get 'http://localhost:3001/api/v1/reservations'
#     end

#     # let(:user) { create(:user, password: "password", password_confirmation: "password") }
#     # let (:token_new) { Users::CreateTokenService.call(user)}
#     # let(:token) do
#     #   {  "Authorization": "Bearer #{token_new}"  }
#     # end
  
#     # describe "GET api/v1/user#show" do
#     #   context "correct params are passed" do
#     #     subject { get api_v1_user_path(format: :json), params: {}, headers: token }
  
#     #     it "returns correct status" do
#     #       subject
#     #       expect(response).to have_http_status(200)
#     #     end
#     #   end
#     # end

#     it "returns all reservations" do


#     it "returns http success" do
#       expect(response).to have_http_status(200)
#     end
#     # it "JSON body response contains expected recipe attributes" do
#     #   json_response = JSON.parse(response.body)
#     #   expect(hash_body.keys).to match_array([:id, :ingredients, :instructions])
#     # end
#   end
# end

RSpec.describe Api::V1::ReservationsController, type: :controller do
  before :all do
    @user = User.create(name: 'samiha', email: 'teta@gmail.com', password: '123456')
    @teacher = Teacher.create(name: 'ev5', title: '2022-12-12', photo: 'test')
    @reservation = Reservation.create(reservation_date: '2022-12-12', city: 'Kigali')
  end

  describe 'Index action' do
    it 'returns the users reservations' do
      get :index, params: { user_id: @user.id }
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).not_to be_empty
    end
  end

  describe 'Create reservation action' do
    it 'returns status 200' do
      post :create, params: { reservation_date: '2020-12-12', user_id: @user.id, event_id: @event.id }
      expect(response.status).to eq(200)
    end
  end
end
