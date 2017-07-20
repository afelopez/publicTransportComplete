require 'rails_helper'

describe TracksController, type: :controller do
  login_user

  describe '#index' do
    it 'calls .all in Track' do
      get :index
      expect(response).to be_success
    end
  end
end
