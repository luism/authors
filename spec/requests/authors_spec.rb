require 'rails_helper'

RSpec.describe "Authors", type: :request do
  describe "List authors" do
    let!(:authors) { FactoryBot.create_list(:author, 10) }

    before { get api_v1_authors_path }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all authors' do
      expect(JSON.parse(response.body).size).to eq(10)
    end
  end

  describe 'Get author' do

    context 'with exiting id' do
      let!(:author) { FactoryBot.create(:author) }

      before { get api_v1_author_path author }

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end

      it 'returns an author' do
        expect(JSON.parse(response.body)['name']).to eq(author.name)
      end
    end

    context 'with his publications' do
      let!(:number_of_publications) { 5 }
      let!(:author) { FactoryBot.create(:author_with_publications, publications_count: number_of_publications) }

      before { get api_v1_author_publications_path author }

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end

      it 'return a list of publications' do
        expect(JSON.parse(response.body).count).to eq(number_of_publications)
      end
    end

    context 'with unexisting id' do
      before { get api_v1_author_path 999 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
