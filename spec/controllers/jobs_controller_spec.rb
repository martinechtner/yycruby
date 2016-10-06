RSpec.describe JobsController, type: :controller do

  let(:valid_attributes) { { company: Faker::Company::name,
                             company_career_url: Faker::Internet::url,
                             posting_url: Faker::Internet::url,
                             description: Faker::Lorem::paragraph,
                             title: Faker::Lorem::paragraph,
                             logo: fixture_file_upload('photos/test.png', 'image/png') } }

  let(:invalid_attributes) { { company: '',
                               company_career_url: '',
                               posting_url: '',
                               description: '',
                               title: '',
                               logo: fixture_file_upload('photos/invalid_file.txt', 'text/plain') } }

  describe 'GET #index' do
    it 'assigns all jobs as @jobs' do
      job = create(:job, valid_attributes)
      get :index, params: {}
      expect(assigns(:jobs)).to eq([job])
    end
  end

  describe 'GET #new' do
    it 'assigns a new job as @job' do
      get :new, params: {}
      expect(assigns(:job)).to be_a_new(Job)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested job as @job' do
      job = create(:job, valid_attributes)
      get :edit, params: { id: job.to_param }
      expect(assigns(:job)).to eq(job)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Job' do
        expect {
          post :create, params: { job: valid_attributes }
        }.to change(Job, :count).by(1)
      end

      it 'assigns a newly created job as @job' do
        post :create, params: { job: valid_attributes }
        expect(assigns(:job)).to be_a(Job)
        expect(assigns(:job)).to be_persisted
      end

      it 'redirects to the created job' do
        post :create, params: { job: valid_attributes }
        expect(response).to redirect_to jobs_url
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved job as @job' do
        post :create, params: { job: invalid_attributes }
        expect(assigns(:job)).to be_a_new(Job)
      end

      it "re-renders the 'new' template" do
        post :create, params: { job: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { company: Faker::Company::name,
                               company_career_url: Faker::Internet::url,
                               posting_url: Faker::Internet::url,
                               description: Faker::Lorem::paragraph,
                               title: Faker::Lorem::paragraph } }

      it 'updates the requested job' do
        job = create(:job, valid_attributes)
        put :update, params: { id: job.to_param, job: new_attributes }
        job.reload
        expect(job.company).to eq new_attributes[:company]
        expect(job.company_career_url).to eq new_attributes[:company_career_url]
        expect(job.posting_url).to eq new_attributes[:posting_url]
        expect(job.description).to eq new_attributes[:description]
        expect(job.title).to eq new_attributes[:title]
      end

      it 'assigns the requested job as @job' do
        job = create(:job, valid_attributes)
        put :update, params: { id: job.to_param, job: valid_attributes }
        expect(assigns(:job)).to eq(job)
      end

      it 'redirects to the job' do
        job = create(:job, valid_attributes)
        put :update, params: { id: job.to_param, job: valid_attributes }
        expect(response).to redirect_to jobs_url
      end
    end

    context 'with invalid params' do
      it 'assigns the job as @job' do
        job = create(:job, valid_attributes)
        put :update, params: { id: job.to_param, job: invalid_attributes }
        expect(assigns(:job)).to eq(job)
      end

      it "re-renders the 'edit' template" do
        job = create(:job, valid_attributes)
        put :update, params: { id: job.to_param, job: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested job' do
      job = create(:job, valid_attributes)
      expect {
        delete :destroy, params: { id: job.to_param }
      }.to change(Job, :count).by(-1)
    end

    it 'redirects to the jobs list' do
      job = create(:job, valid_attributes)
      delete :destroy, params: { id: job.to_param }
      expect(response).to redirect_to(jobs_url)
    end
  end
end
