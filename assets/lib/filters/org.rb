require_relative '../input'

module Filters
  class Org
    def initialize(pull_requests:, input: Input.instance)
      @pull_requests = pull_requests
      @input = input
    end

    def pull_requests
      if @input.source.org
        @memoized ||= @pull_requests.delete_if { |pr| pr.org_member?(org: @input.source.org) }
      else
        @pull_requests
      end
    end
  end
end
