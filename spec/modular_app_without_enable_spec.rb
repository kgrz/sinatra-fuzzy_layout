require_relative "spec_helper"
require_relative "apps/modular_without_enable"

describe 'Modular Style Application Without Enable Layouts directive' do

  def app
    SampleApp
  end

  it "should not have a layout for the template 'index.erb'" do
    get('/')
    last_response.should be_ok
    last_response.body.should == "<em>Spartaa!!</em>\n"
  end

  it "should not have a layout for the template 'one.erb'" do
    get('/one')
    last_response.should be_ok
    last_response.body.should == "<em>one</em>\n"
  end

  it "should have a layout for the template 'two.erb'" do
    get('/two')
    last_response.should be_ok
    last_response.body.should == "<h1>This is <em>two</em>\n</h1>\n"
  end

  it "should have a layout for the template 'three.erb'" do
    get('/three')
    last_response.should be_ok
    last_response.body.should == "<h1>This is <em>three</em>\n</h1>\n"
  end

  it "should not have a layout for the template 'four.erb'" do
    get('/four')
    last_response.should be_ok
    last_response.body.should == "<em>four</em>\n"
  end

  it "should not have a layout for the template 'five.erb'" do
    get('/five')
    last_response.should be_ok
    last_response.body.should == "<em>five</em>\n"
  end

end
