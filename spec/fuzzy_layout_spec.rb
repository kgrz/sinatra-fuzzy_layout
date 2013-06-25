require_relative "spec_helper"
require_relative "sample_app"
require_relative "sample_app_multiple"

describe 'Test App with single declaration of enable or disable directives' do

  def app
    SampleApp
  end

  it "disables layout if route level :layout => false is set" do
    get('/')
    last_response.should be_ok
    last_response.body.should == "<em>Spartaa!!</em>\n"
  end

  it "enables layout when layout is both enabled and disabled" do
    get('/one')
    last_response.should be_ok
    last_response.body.should == "<h1>This is <em>one</em></h1>\n"
  end

  it "works when template is specified as a string" do
    get('/two')
    last_response.should be_ok
    last_response.body.should == "<em>two</em>\n"
  end

  context "works when template is specified as a regex" do
    it "should not have a layout for the route four" do
      get('/four')
      last_response.should be_ok
      last_response.body.should == "<em>four</em>\n"
    end

    it "should not have a layout for the route five" do
      get('/five')
      last_response.should be_ok
      last_response.body.should == "<em>five</em>\n"
    end
  end

end



describe 'Test App with multiple declarations of enable directives' do

  def app
    SampleAppMultiple
  end

  it "disables layout if route level :layout => false is set" do
    get('/')
    last_response.should be_ok
    last_response.body.should == "<em>Spartaa!!</em>\n"
  end

  it "enables layout when layout is both enabled and disabled" do
    get('/one')
    last_response.should be_ok
    last_response.body.should == "<h1>This is <em>one</em></h1>\n"
  end

  it "works when template is specified as a string" do
    get('/two')
    last_response.should be_ok
    last_response.body.should == "<em>two</em>\n"
  end

  context "works when template is specified as a regex" do
    it "should not have a layout for the route four" do
      get('/four')
      last_response.should be_ok
      last_response.body.should == "<em>four</em>\n"
    end

    it "should not have a layout for the route five" do
      get('/five')
      last_response.should be_ok
      last_response.body.should == "<em>five</em>\n"
    end
  end

end
