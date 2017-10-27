require_relative 'spec/spec_helper'
require_relative 'app/models/user'

describe User do
	describe "#domain_valid?" do

    let!(:user) { FactoryGirl.build(:user) }
    
    before do
      user.domain_valid?(email)
    end

    context "with valid email" do
      let(:email) { "milde@moip.com.br" }
			it { expect(response).to be_truthy }
		end

		context "with invalid email" do
			let(:email) { "milde@moip.com.br" }  
			it { expect(response).to be_falsey }
		end
	end
end