require 'test_helper'

describe "icheck asset pipeline integration" do

  it "should include icheck.js via the asset pipeline" do
    visit '/assets/icheck.js'
    page.text.must_include 'http://fronteed.com'
  end

  it "should include all themes for the Square skin via the asset pipeline" do
    visit '/assets/icheck/square/_all.css'
    page.text.must_include 'iCheck plugin Square skin'
  end

  it "should include blue theme for the Square skin via the asset pipeline" do
    visit '/assets/icheck/square/blue.css'
    page.text.must_include 'iCheck plugin Square skin, blue'
  end

  it "should include blue theme for the Square skin image assets" do
    visit '/assets/icheck/square/blue.png'
    visit '/assets/icheck/square/blue@2x.png'
  end

  it "should include skin without color themes" do
    visit '/assets/icheck/futurico/futurico.css'
    page.text.must_include 'iCheck plugin Futurico skin'
  end

end
