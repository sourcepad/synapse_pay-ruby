require 'spec_helper'

describe SynapsePay::Request do

  describe "successful post" do
    
    xit "returns status code 200" do
      body = {
        email: Faker::Internet.email,
        fullname: Faker::Name.name,
        phonenumber: Faker::PhoneNumber.phone_number,
        password: '5ourcep4d',
        ip_address: '8.8.8.8',
        client_secret: '41877da204b32dbee3095033069ed81bcf512154',
        client_id: "ce65d5ce9116ae4c77bb"
      }

      req = SynapsePay::Request.new({endpoint: "user/create", data: body})
      req.post

      expect(req.status).to eq(200)
    end

  end
end