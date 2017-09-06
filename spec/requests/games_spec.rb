require 'rails_helper'

# GET existence
# GET expected object count
# GET non-existence 404

RSpec.describe 'Games API' do
  # Initialize test data using FactoryGirl
  let!(:champion) { create(:champion) }
  let!(:games) { create_list(:game, 5, champion_id: champion.id) }
  let(:champion_id) { champion.id }
  let(:game_id) { games.first.id }

  describe 'GET /champions/:champion_id/games' do
    before { get "/champions/#{champion_id}/games"}

    context 'when Champions games exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all games' do
        expect(json.size).to eq(5)
      end
    end

    context 'when game does not exist' do
      let(:champion_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'GET /champions/:champion_id/games/:game_id' do
    before { get "/champions/#{champion_id}/games/#{game_id}" }

    context 'when game exists' do
      it 'returns status code of 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the game' do
        expect(json['id']).to eq(game_id)
      end
    end

    context 'when game does not exist' do
      let(:champion_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /champions/:champion_id/games' do
    let(:valid_attributes) { {datePlayed: Faker::Date.backward(20)} }

    context 'when request attributes are valid' do
      before { post "/champions/#{champion_id}/games", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request attributes are invalid' do
      before { post "/champions/#{champion_id}/games", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end


  describe 'DELETE /champions/:champion_id' do
    before { delete "/champions/#{champion_id}/games/#{game_id}" }

    it 'returns status code of 204' do
      expect(response).to have_http_status(204)
    end
  end
end
