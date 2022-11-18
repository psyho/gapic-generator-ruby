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

require "helper"
require "gapic/rest"
require "google/showcase/v1beta1/testing_pb"
require "google/showcase/v1beta1/testing/rest"


class ::Google::Showcase::V1beta1::Testing::Rest::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_count, :requests

    def initialize response, &block
      @response = response
      @block = block
      @call_count = 0
      @requests = []
    end

    def make_get_request uri:, params: {}, options: {}
      make_http_request :get, uri: uri, body: nil, params: params, options: options
    end

    def make_delete_request uri:, params: {}, options: {}
      make_http_request :delete, uri: uri, body: nil, params: params, options: options
    end

    def make_post_request uri:, body: nil, params: {}, options: {}
      make_http_request :post, uri: uri, body: body, params: params, options: options
    end

    def make_patch_request uri:, body:, params: {}, options: {}
      make_http_request :patch, uri: uri, body: body, params: params, options: options
    end

    def make_put_request uri:, body:, params: {}, options: {}
      make_http_request :put, uri: uri, body: body, params: params, options: options
    end

    def make_http_request *args, **kwargs
      @call_count += 1

      @requests << @block&.call(*args, **kwargs)

      @response
    end
  end

  def test_create_session
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::Session.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    session = {}

    create_session_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Testing::Rest::ServiceStub.stub :transcode_create_session_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, create_session_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Testing::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.create_session({ session: session }) do |_result, response|
          assert_equal http_response, response
        end

        # Use named arguments
        client.create_session session: session do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object
        client.create_session ::Google::Showcase::V1beta1::CreateSessionRequest.new(session: session) do |_result, response|
          assert_equal http_response, response
        end

        # Use hash object with options
        client.create_session({ session: session }, call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object with options
        client.create_session(::Google::Showcase::V1beta1::CreateSessionRequest.new(session: session),
                              call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Verify method calls
        assert_equal 5, create_session_client_stub.call_count
      end
    end
  end

  def test_get_session
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::Session.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_session_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Testing::Rest::ServiceStub.stub :transcode_get_session_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, get_session_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Testing::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.get_session({ name: name }) do |_result, response|
          assert_equal http_response, response
        end

        # Use named arguments
        client.get_session name: name do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object
        client.get_session ::Google::Showcase::V1beta1::GetSessionRequest.new(name: name) do |_result, response|
          assert_equal http_response, response
        end

        # Use hash object with options
        client.get_session({ name: name }, call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object with options
        client.get_session(::Google::Showcase::V1beta1::GetSessionRequest.new(name: name),
                           call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Verify method calls
        assert_equal 5, get_session_client_stub.call_count
      end
    end
  end

  def test_list_sessions
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::ListSessionsResponse.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    page_size = 42
    page_token = "hello world"

    list_sessions_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Testing::Rest::ServiceStub.stub :transcode_list_sessions_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, list_sessions_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Testing::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.list_sessions({ page_size: page_size, page_token: page_token }) do |_result, response|
          assert_equal http_response, response
        end

        # Use named arguments
        client.list_sessions page_size: page_size, page_token: page_token do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object
        client.list_sessions ::Google::Showcase::V1beta1::ListSessionsRequest.new(page_size: page_size,
                                                                                  page_token: page_token) do |_result, response|
          assert_equal http_response, response
        end

        # Use hash object with options
        client.list_sessions({ page_size: page_size, page_token: page_token }, call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object with options
        client.list_sessions(
          ::Google::Showcase::V1beta1::ListSessionsRequest.new(page_size: page_size,
                                                               page_token: page_token), call_options
        ) do |_result, response|
          assert_equal http_response, response
        end

        # Verify method calls
        assert_equal 5, list_sessions_client_stub.call_count
      end
    end
  end

  def test_delete_session
    # Create test objects.
    client_result = ::Google::Protobuf::Empty.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_session_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Testing::Rest::ServiceStub.stub :transcode_delete_session_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, delete_session_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Testing::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.delete_session({ name: name }) do |_result, response|
          assert_equal http_response, response
        end

        # Use named arguments
        client.delete_session name: name do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object
        client.delete_session ::Google::Showcase::V1beta1::DeleteSessionRequest.new(name: name) do |_result, response|
          assert_equal http_response, response
        end

        # Use hash object with options
        client.delete_session({ name: name }, call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object with options
        client.delete_session(::Google::Showcase::V1beta1::DeleteSessionRequest.new(name: name),
                              call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Verify method calls
        assert_equal 5, delete_session_client_stub.call_count
      end
    end
  end

  def test_report_session
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::ReportSessionResponse.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    report_session_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Testing::Rest::ServiceStub.stub :transcode_report_session_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, report_session_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Testing::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.report_session({ name: name }) do |_result, response|
          assert_equal http_response, response
        end

        # Use named arguments
        client.report_session name: name do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object
        client.report_session ::Google::Showcase::V1beta1::ReportSessionRequest.new(name: name) do |_result, response|
          assert_equal http_response, response
        end

        # Use hash object with options
        client.report_session({ name: name }, call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object with options
        client.report_session(::Google::Showcase::V1beta1::ReportSessionRequest.new(name: name),
                              call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Verify method calls
        assert_equal 5, report_session_client_stub.call_count
      end
    end
  end

  def test_list_tests
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::ListTestsResponse.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"

    list_tests_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Testing::Rest::ServiceStub.stub :transcode_list_tests_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, list_tests_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Testing::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.list_tests({ parent: parent, page_size: page_size, page_token: page_token }) do |_result, response|
          assert_equal http_response, response
        end

        # Use named arguments
        client.list_tests parent: parent, page_size: page_size, page_token: page_token do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object
        client.list_tests ::Google::Showcase::V1beta1::ListTestsRequest.new(parent: parent, page_size: page_size,
                                                                            page_token: page_token) do |_result, response|
          assert_equal http_response, response
        end

        # Use hash object with options
        client.list_tests({ parent: parent, page_size: page_size, page_token: page_token },
                          call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object with options
        client.list_tests(
          ::Google::Showcase::V1beta1::ListTestsRequest.new(parent: parent, page_size: page_size,
                                                            page_token: page_token), call_options
        ) do |_result, response|
          assert_equal http_response, response
        end

        # Verify method calls
        assert_equal 5, list_tests_client_stub.call_count
      end
    end
  end

  def test_delete_test
    # Create test objects.
    client_result = ::Google::Protobuf::Empty.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_test_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Testing::Rest::ServiceStub.stub :transcode_delete_test_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, delete_test_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Testing::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.delete_test({ name: name }) do |_result, response|
          assert_equal http_response, response
        end

        # Use named arguments
        client.delete_test name: name do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object
        client.delete_test ::Google::Showcase::V1beta1::DeleteTestRequest.new(name: name) do |_result, response|
          assert_equal http_response, response
        end

        # Use hash object with options
        client.delete_test({ name: name }, call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object with options
        client.delete_test(::Google::Showcase::V1beta1::DeleteTestRequest.new(name: name),
                           call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Verify method calls
        assert_equal 5, delete_test_client_stub.call_count
      end
    end
  end

  def test_verify_test
    # Create test objects.
    client_result = ::Google::Showcase::V1beta1::VerifyTestResponse.new
    http_response = OpenStruct.new body: client_result.to_json

    call_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    answer = "hello world"
    answers = ["hello world"]

    verify_test_client_stub = ClientStub.new http_response do |_verb, uri:, body:, params:, options:|
      assert options.metadata.key? :"x-goog-api-client"
      assert options.metadata[:"x-goog-api-client"].include? "rest"
      refute options.metadata[:"x-goog-api-client"].include? "grpc"
    end

    ::Google::Showcase::V1beta1::Testing::Rest::ServiceStub.stub :transcode_verify_test_request, ["", "", {}] do
      Gapic::Rest::ClientStub.stub :new, verify_test_client_stub do
        # Create client
        client = ::Google::Showcase::V1beta1::Testing::Rest::Client.new do |config|
          config.credentials = :dummy_value
        end

        # Use hash object
        client.verify_test({ name: name, answer: answer, answers: answers }) do |_result, response|
          assert_equal http_response, response
        end

        # Use named arguments
        client.verify_test name: name, answer: answer, answers: answers do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object
        client.verify_test ::Google::Showcase::V1beta1::VerifyTestRequest.new(name: name, answer: answer,
                                                                              answers: answers) do |_result, response|
          assert_equal http_response, response
        end

        # Use hash object with options
        client.verify_test({ name: name, answer: answer, answers: answers }, call_options) do |_result, response|
          assert_equal http_response, response
        end

        # Use protobuf object with options
        client.verify_test(
          ::Google::Showcase::V1beta1::VerifyTestRequest.new(name: name, answer: answer,
                                                             answers: answers), call_options
        ) do |_result, response|
          assert_equal http_response, response
        end

        # Verify method calls
        assert_equal 5, verify_test_client_stub.call_count
      end
    end
  end

  def test_configure
    credentials_token = :dummy_value

    client = block_config = config = nil
    Gapic::Rest::ClientStub.stub :new, nil do
      client = ::Google::Showcase::V1beta1::Testing::Rest::Client.new do |config|
        config.credentials = credentials_token
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of ::Google::Showcase::V1beta1::Testing::Rest::Client::Configuration, config
  end
end
