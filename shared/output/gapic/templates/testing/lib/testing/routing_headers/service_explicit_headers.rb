# frozen_string_literal: true

# The MIT License (MIT)
#
# Copyright <YEAR> <COPYRIGHT HOLDER>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "gapic/common"
require "gapic/config"
require "gapic/config/method"

require "testing/version"

require "testing/routing_headers/service_explicit_headers/credentials"
require "testing/routing_headers/service_explicit_headers/client"
require "testing/routing_headers/service_explicit_headers/rest"

module Testing
  module RoutingHeaders
    ##
    # @example Load this service and instantiate a gRPC client
    #
    #     require "testing/routing_headers/service_explicit_headers"
    #     client = ::Testing::RoutingHeaders::ServiceExplicitHeaders::Client.new
    #
    # @example Load this service and instantiate a REST client
    #
    #     require "testing/routing_headers/service_explicit_headers/rest"
    #     client = ::Testing::RoutingHeaders::ServiceExplicitHeaders::Rest::Client.new
    #
    module ServiceExplicitHeaders
    end
  end
end

helper_path = ::File.join __dir__, "service_explicit_headers", "helpers.rb"
require "testing/routing_headers/service_explicit_headers/helpers" if ::File.file? helper_path
