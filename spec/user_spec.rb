require 'spec_helper'

describe SynapsePay::User do

  describe "#create" do

    let(:body) {
      {
        email: Faker::Internet.email,
        fullname: Faker::Name.name,
        phonenumber: Faker::PhoneNumber.phone_number,
        password: '5ourcep4d',
        ip_address: '8.8.8.8',
        client_secret: '41877da204b32dbee3095033069ed81bcf512154',
        client_id: "ce65d5ce9116ae4c77bb"
      }
    }

    let(:request) { SynapsePay::User.new(body) }

    it "returns status code 200" do
      request.create

      expect(request.status).to eq(200)
    end

    context "existing user" do
      it "raises an error" do
        existing_body = {
          email: Faker::Internet.email,
          fullname: Faker::Name.name,
          phonenumber: Faker::PhoneNumber.phone_number,
          password: '5ourcep4d',
          ip_address: '8.8.8.8',
          client_secret: '41877da204b32dbee3095033069ed81bcf512154',
          client_id: "ce65d5ce9116ae4c77bb"
        }

        request = SynapsePay::User.new(existing_body)
        request.create

        another_request = SynapsePay::User.new(existing_body)

        expect {another_request.create}.to raise_error(SynapsePay::User::Error, 'Email already registered.')
      end

    end

  end

  describe "#login" do
    context "invalid username" do
      let(:body) {
        {
          username: 'invalid',
          password: '5ourcep4d',
          client_secret: '41877da204b32dbee3095033069ed81bcf512154',
          client_id: "ce65d5ce9116ae4c77bb"
        }
      }

      let(:request) { SynapsePay::User.new(body) }
      it "returns status code 200" do

        expect {request.login}.to raise_error(SynapsePay::User::Error, 'invalid_grant')
      end
    end
  end

end