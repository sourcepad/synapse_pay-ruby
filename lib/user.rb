module SynapsePay
  class User
    class Error < StandardError; end

    attr_reader :request

    METHODS = [:create, :login, :refresh, :edit, :show, :customers]

    def initialize data, request = SynapsePay::Request.new({})
      @request = request
      @request.data = data
    end

    METHODS.each do |method|
      define_method(method) do
        request.endpoint = "user/#{method}"

        request.post
        
        raise SynapsePay::User::Error, request.response_body.reason if status != 200
      end
    end

    def status
      request.status
    end

    def response_body
      request.response_body
    end

  end
end