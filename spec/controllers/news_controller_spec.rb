RSpec.describe NewsController, type: :controller do

  let(:valid_attributes) { { content: Faker::Lorem::paragraph } }

  let(:invalid_attributes) { { content: '' } }

  describe 'GET #index' do
    before(:each) { sign_in create(:user) }

    it 'assigns all news as @news' do
      news = News.create! valid_attributes
      get :index, params: {}
      expect(assigns(:news)).to eq([news])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested news as @news' do
      news = News.create! valid_attributes
      get :show, params: { id: news.to_param }
      expect(assigns(:news)).to eq(news)
    end
  end

  describe 'GET #new' do
    before(:each) { sign_in create(:user) }

    it 'assigns a new news as @news' do
      get :new, params: {}
      expect(assigns(:news)).to be_a_new(News)
    end
  end

  describe 'GET #edit' do
    before(:each) { sign_in create(:user) }

    it 'assigns the requested news as @news' do
      news = News.create! valid_attributes
      get :edit, params: { id: news.to_param }
      expect(assigns(:news)).to eq(news)
    end
  end

  describe 'POST #create' do
    before(:each) { sign_in create(:user) }

    context 'with valid params' do
      it 'creates a new News' do
        expect {
          post :create, params: { news: valid_attributes }
        }.to change(News, :count).by(1)
      end

      it 'assigns a newly created news as @news' do
        post :create, params: { news: valid_attributes }
        expect(assigns(:news)).to be_a(News)
        expect(assigns(:news)).to be_persisted
      end

      it 'redirects to the created news' do
        post :create, params: { news: valid_attributes }
        expect(response).to redirect_to root_url
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved news as @news' do
        post :create, params: { news: invalid_attributes }
        expect(assigns(:news)).to be_a_new(News)
      end

      it "re-renders the 'new' template" do
        post :create, params: { news: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    before(:each) { sign_in create(:user) }

    context 'with valid params' do
      let(:new_attributes) { { content: Faker::Lorem::paragraph } }

      it 'updates the requested news' do
        news = News.create! valid_attributes
        put :update, params: { id: news.to_param, news: new_attributes }
        news.reload
        expect(news.content).to eq new_attributes[:content]
      end

      it 'assigns the requested news as @news' do
        news = News.create! valid_attributes
        put :update, params: { id: news.to_param, news: valid_attributes }
        expect(assigns(:news)).to eq(news)
      end

      it 'redirects to the news' do
        news = News.create! valid_attributes
        put :update, params: { id: news.to_param, news: valid_attributes }
        expect(response).to redirect_to root_url
      end
    end

    context 'with invalid params' do
      it 'assigns the news as @news' do
        news = News.create! valid_attributes
        put :update, params: { id: news.to_param, news: invalid_attributes }
        expect(assigns(:news)).to eq(news)
      end

      it "re-renders the 'edit' template" do
        news = News.create! valid_attributes
        put :update, params: { id: news.to_param, news: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) { sign_in create(:user) }

    it 'destroys the requested news' do
      news = News.create! valid_attributes
      expect {
        delete :destroy, params: { id: news.to_param }
      }.to change(News, :count).by(-1)
    end

    it 'redirects to the news list' do
      news = News.create! valid_attributes
      delete :destroy, params: { id: news.to_param }
      expect(response).to redirect_to(news_index_url)
    end
  end
end
