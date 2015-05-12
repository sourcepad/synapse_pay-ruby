module SynapsePay
  class Request
    attr_reader :raw_response
    attr_accessor :endpoint, :data

    def initialize(params)
      @data = params[:data]
      @endpoint = params[:endpoint]
    end

    def post
      @raw_response ||= connection.post do |req|
        req.url endpoint
        req.headers['Content-Type'] = 'application/json'
        req.body = request_body
      end
    end

    def status
      raw_response.env.status
    end

    def response_body
      @response_body ||= JSON.parse(raw_response.env.body, object_class: Response)
    end

    private

    def request_body
      data.to_json
    end

    def connection
      @connection ||= Faraday.new(url: SynapsePay.api_base)
    end

  end

  class Response < OpenStruct; end;
end