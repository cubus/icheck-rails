require 'test_helper'

describe "icheck asset pipeline integration" do

  it "should include jquery.icheck.js via the asset pipeline" do
    visit '/assets/jquery.icheck.js'
    page.text.must_include '(c) 2013 Damir Foy, http://damirfoy.com'
  end

  it "should include jquery.icheck.js via the asset pipeline" do
    visit '/assets/square/_all.css'
    page.text.must_include 'iCheck plugin Square skin'
  end

end
