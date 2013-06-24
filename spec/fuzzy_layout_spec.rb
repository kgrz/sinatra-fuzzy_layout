require_relative "spec_helper"


describe Sinatra::FuzzyLayout do

  def sample_app
    mock_app do
      register Sinatra::FuzzyLayout
      enable_layout_for :index, :views

      get('/') { erb :index }
      get('/one') { erb :one }
      get('/two') { erb :two }
      get('/three') { erb :three }
      get('/four') { erb :four }
      get('/five') { erb :five }

      template(:layout) { '<%= yield %> has a Layout' }
      template(:index) { 'Index' }
      template(:one) { 'One' }
      template(:two) { 'Two' }
      template(:three) { 'Three' }
      template(:four) { 'Four' }
      template(:five) { 'Five' }
    end
  end

  context "When using the 'enable_layout_for' syntax" do

    it "should accept multiple types of parameters" do

      get('/').should be_ok
      body.should be == "Index has a Layout"
      get('/one').should be_ok
      body.should be == "One has a Layout"
      get('/two').should be_ok
      body.should be == "Two has a Layout"
      get('/three').should be_ok
      body.should be == "Three has a Layout"
      get('/four').should be_ok
      body.should be == "Four has a Layout"
      get('/five').should be_ok
      body.should be == "Five has a Layout"
    end
  end

end
