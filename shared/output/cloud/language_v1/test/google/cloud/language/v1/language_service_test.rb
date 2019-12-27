# frozen_string_literal: true

# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/cloud/language/v1/language_service_pb"
require "google/cloud/language/v1/language_service_services_pb"
require "google/cloud/language/v1/language_service"

class Google::Cloud::Language::V1::LanguageService::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_analyze_sentiment
    # Create GRPC objects.
    grpc_response = Google::Cloud::Language::V1::AnalyzeSentimentResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    document = {}
    encoding_type = :NONE

    analyze_sentiment_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :analyze_sentiment, name
      assert_kind_of Google::Cloud::Language::V1::AnalyzeSentimentRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Language::V1::Document), request.document
      assert_equal :NONE, request.encoding_type
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, analyze_sentiment_client_stub do
      # Create client
      client = Google::Cloud::Language::V1::LanguageService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.analyze_sentiment({ document: document, encoding_type: encoding_type }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.analyze_sentiment document: document, encoding_type: encoding_type do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.analyze_sentiment Google::Cloud::Language::V1::AnalyzeSentimentRequest.new(document: document, encoding_type: encoding_type) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.analyze_sentiment({ document: document, encoding_type: encoding_type }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.analyze_sentiment Google::Cloud::Language::V1::AnalyzeSentimentRequest.new(document: document, encoding_type: encoding_type), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, analyze_sentiment_client_stub.call_rpc_count
    end
  end

  def test_analyze_entities
    # Create GRPC objects.
    grpc_response = Google::Cloud::Language::V1::AnalyzeEntitiesResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    document = {}
    encoding_type = :NONE

    analyze_entities_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :analyze_entities, name
      assert_kind_of Google::Cloud::Language::V1::AnalyzeEntitiesRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Language::V1::Document), request.document
      assert_equal :NONE, request.encoding_type
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, analyze_entities_client_stub do
      # Create client
      client = Google::Cloud::Language::V1::LanguageService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.analyze_entities({ document: document, encoding_type: encoding_type }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.analyze_entities document: document, encoding_type: encoding_type do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.analyze_entities Google::Cloud::Language::V1::AnalyzeEntitiesRequest.new(document: document, encoding_type: encoding_type) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.analyze_entities({ document: document, encoding_type: encoding_type }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.analyze_entities Google::Cloud::Language::V1::AnalyzeEntitiesRequest.new(document: document, encoding_type: encoding_type), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, analyze_entities_client_stub.call_rpc_count
    end
  end

  def test_analyze_entity_sentiment
    # Create GRPC objects.
    grpc_response = Google::Cloud::Language::V1::AnalyzeEntitySentimentResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    document = {}
    encoding_type = :NONE

    analyze_entity_sentiment_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :analyze_entity_sentiment, name
      assert_kind_of Google::Cloud::Language::V1::AnalyzeEntitySentimentRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Language::V1::Document), request.document
      assert_equal :NONE, request.encoding_type
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, analyze_entity_sentiment_client_stub do
      # Create client
      client = Google::Cloud::Language::V1::LanguageService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.analyze_entity_sentiment({ document: document, encoding_type: encoding_type }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.analyze_entity_sentiment document: document, encoding_type: encoding_type do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.analyze_entity_sentiment Google::Cloud::Language::V1::AnalyzeEntitySentimentRequest.new(document: document, encoding_type: encoding_type) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.analyze_entity_sentiment({ document: document, encoding_type: encoding_type }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.analyze_entity_sentiment Google::Cloud::Language::V1::AnalyzeEntitySentimentRequest.new(document: document, encoding_type: encoding_type), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, analyze_entity_sentiment_client_stub.call_rpc_count
    end
  end

  def test_analyze_syntax
    # Create GRPC objects.
    grpc_response = Google::Cloud::Language::V1::AnalyzeSyntaxResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    document = {}
    encoding_type = :NONE

    analyze_syntax_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :analyze_syntax, name
      assert_kind_of Google::Cloud::Language::V1::AnalyzeSyntaxRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Language::V1::Document), request.document
      assert_equal :NONE, request.encoding_type
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, analyze_syntax_client_stub do
      # Create client
      client = Google::Cloud::Language::V1::LanguageService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.analyze_syntax({ document: document, encoding_type: encoding_type }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.analyze_syntax document: document, encoding_type: encoding_type do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.analyze_syntax Google::Cloud::Language::V1::AnalyzeSyntaxRequest.new(document: document, encoding_type: encoding_type) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.analyze_syntax({ document: document, encoding_type: encoding_type }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.analyze_syntax Google::Cloud::Language::V1::AnalyzeSyntaxRequest.new(document: document, encoding_type: encoding_type), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, analyze_syntax_client_stub.call_rpc_count
    end
  end

  def test_classify_text
    # Create GRPC objects.
    grpc_response = Google::Cloud::Language::V1::ClassifyTextResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    document = {}

    classify_text_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :classify_text, name
      assert_kind_of Google::Cloud::Language::V1::ClassifyTextRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Language::V1::Document), request.document
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, classify_text_client_stub do
      # Create client
      client = Google::Cloud::Language::V1::LanguageService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.classify_text({ document: document }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.classify_text document: document do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.classify_text Google::Cloud::Language::V1::ClassifyTextRequest.new(document: document) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.classify_text({ document: document }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.classify_text Google::Cloud::Language::V1::ClassifyTextRequest.new(document: document), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, classify_text_client_stub.call_rpc_count
    end
  end

  def test_annotate_text
    # Create GRPC objects.
    grpc_response = Google::Cloud::Language::V1::AnnotateTextResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    document = {}
    features = {}
    encoding_type = :NONE

    annotate_text_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :annotate_text, name
      assert_kind_of Google::Cloud::Language::V1::AnnotateTextRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Language::V1::Document), request.document
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Language::V1::AnnotateTextRequest::Features), request.features
      assert_equal :NONE, request.encoding_type
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, annotate_text_client_stub do
      # Create client
      client = Google::Cloud::Language::V1::LanguageService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.annotate_text({ document: document, features: features, encoding_type: encoding_type }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.annotate_text document: document, features: features, encoding_type: encoding_type do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.annotate_text Google::Cloud::Language::V1::AnnotateTextRequest.new(document: document, features: features, encoding_type: encoding_type) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.annotate_text({ document: document, features: features, encoding_type: encoding_type }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.annotate_text Google::Cloud::Language::V1::AnnotateTextRequest.new(document: document, features: features, encoding_type: encoding_type), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, annotate_text_client_stub.call_rpc_count
    end
  end
end
