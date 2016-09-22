RSpec.shared_examples_for 'a basic view' do
  it 'should render successfully' do
    subject
    expect(rendered).to_not be_nil
  end
end
