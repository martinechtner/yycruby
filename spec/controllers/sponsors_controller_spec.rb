RSpec.describe SponsorsController, type: :controller do

  let(:valid_attributes) { { company: Faker::Company::name,
                             url: Faker::Internet::url,
                             description: Faker::Lorem::paragraph,
                             sponsoring: Faker::Lorem::paragraph,
                             logo: fixture_file_upload('photos/test.png', 'image/png'),
                             position: 3} }

  let(:invalid_attributes) { { company: '',
                               url: '',
                               description: '',
                               sponsoring: '' ,
                               logo: fixture_file_upload('photos/invalid_file.txt', 'text/plain') } }

  describe 'GET #index' do
    it 'assigns all sponsors as @sponsors' do
      sponsor = create(:sponsor, valid_attributes)
      get :index, params: {}
      expect(assigns(:sponsors)).to eq([sponsor])
    end
  end

  describe 'GET #new' do
    before(:each) { sign_in create(:user) }

    it 'assigns a new sponsor as @sponsor' do
      get :new, params: {}
      expect(assigns(:sponsor)).to be_a_new(Sponsor)
    end
  end

  describe 'GET #edit' do
    before(:each) { sign_in create(:user) }

    it 'assigns the requested sponsor as @sponsor' do
      sponsor = create(:sponsor, valid_attributes)
      get :edit, params: { id: sponsor.to_param }
      expect(assigns(:sponsor)).to eq(sponsor)
    end
  end

  describe 'POST #create' do
    before(:each) { sign_in create(:user) }

    context 'with valid params' do
      it 'creates a new Sponsor' do
        expect {
          post :create, params: { sponsor: valid_attributes }
        }.to change(Sponsor, :count).by(1)
      end

      it 'assigns a newly created sponsor as @sponsor' do
        post :create, params: { sponsor: valid_attributes }
        expect(assigns(:sponsor)).to be_a(Sponsor)
        expect(assigns(:sponsor)).to be_persisted
      end

      it 'redirects to the created sponsor' do
        post :create, params: { sponsor: valid_attributes }
        expect(response).to redirect_to sponsors_url
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved sponsor as @sponsor' do
        post :create, params: { sponsor: invalid_attributes }
        expect(assigns(:sponsor)).to be_a_new(Sponsor)
      end

      it "re-renders the 'new' template" do
        post :create, params: { sponsor: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    before(:each) { sign_in create(:user) }

    context 'with valid params' do
      let(:new_attributes) { { company: Faker::Company::name,
                               url: Faker::Internet::url,
                               description: Faker::Lorem::paragraph,
                               sponsoring: Faker::Lorem::paragraph } }

      it 'updates the requested sponsor' do
        sponsor = create(:sponsor, valid_attributes)
        put :update, params: { id: sponsor.to_param, sponsor: new_attributes }
        sponsor.reload
        expect(sponsor.company).to eq new_attributes[:company]
        expect(sponsor.url).to eq new_attributes[:url]
        expect(sponsor.description).to eq new_attributes[:description]
        expect(sponsor.sponsoring).to eq new_attributes[:sponsoring]
      end

      it 'assigns the requested sponsor as @sponsor' do
        sponsor = create(:sponsor, valid_attributes)
        put :update, params: { id: sponsor.to_param, sponsor: valid_attributes }
        expect(assigns(:sponsor)).to eq(sponsor)
      end

      it 'redirects to the sponsor' do
        sponsor = create(:sponsor, valid_attributes)
        put :update, params: { id: sponsor.to_param, sponsor: valid_attributes }
        expect(response).to redirect_to sponsors_url
      end
    end

    context 'with invalid params' do
      it 'assigns the sponsor as @sponsor' do
        sponsor = create(:sponsor, valid_attributes)
        put :update, params: { id: sponsor.to_param, sponsor: invalid_attributes }
        expect(assigns(:sponsor)).to eq(sponsor)
      end

      it "re-renders the 'edit' template" do
        sponsor = create(:sponsor, valid_attributes)
        put :update, params: { id: sponsor.to_param, sponsor: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) { sign_in create(:user) }
    
    it 'destroys the requested sponsor' do
      sponsor = create(:sponsor, valid_attributes)
      expect {
        delete :destroy, params: { id: sponsor.to_param }
      }.to change(Sponsor, :count).by(-1)
    end

    it 'redirects to the sponsors list' do
      sponsor = create(:sponsor, valid_attributes)
      delete :destroy, params: { id: sponsor.to_param }
      expect(response).to redirect_to(sponsors_url)
    end
  end
end
