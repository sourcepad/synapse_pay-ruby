require 'json'

require 'faraday'

require 'request'
require 'user'

module SynapsePay
  @production_mode = false

  class << self
    attr_accessor :production_mode

    def api_base
      @api_base ||= if production_mode
        "https://synapsepay.com/api/v2"
       else
        "https://sandbox.synapsepay.com/api/v2"
       end

    end

  end
end