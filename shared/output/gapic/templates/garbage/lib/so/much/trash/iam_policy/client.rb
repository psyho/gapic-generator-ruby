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

require "google/iam/v1/iam_policy_pb"

module So
  module Much
    module Trash
      module IAMPolicy
        ##
        # Client for the IAMPolicy service.
        #
        # ## API Overview
        #
        # Manages Identity and Access Management (IAM) policies.
        #
        # Any implementation of an API that offers access control features
        # implements the google.iam.v1.IAMPolicy interface.
        #
        # ## Data model
        #
        # Access control is applied when a principal (user or service account), takes
        # some action on a resource exposed by a service. Resources, identified by
        # URI-like names, are the unit of access control specification. Service
        # implementations can choose the granularity of access control and the
        # supported permissions for their resources.
        # For example one database service may allow access control to be
        # specified only at the Table level, whereas another might allow access control
        # to also be specified at the Column level.
        #
        # ## Policy Structure
        #
        # See google.iam.v1.Policy
        #
        # This is intentionally not a CRUD style API because access control policies
        # are created and deleted implicitly with the resources to which they are
        # attached.
        #
        class Client
          # @private
          attr_reader :iam_policy_stub

          ##
          # Configure the IAMPolicy Client class.
          #
          # See {So::Much::Trash::IAMPolicy::Client::Configuration}
          # for a description of the configuration fields.
          #
          # ## Example
          #
          # To modify the configuration for all IAMPolicy clients:
          #
          #     So::Much::Trash::IAMPolicy::Client.configure do |config|
          #       config.timeout = 10_000
          #     end
          #
          # @yield [config] Configure the Client client.
          # @yieldparam config [Client::Configuration]
          #
          # @return [Client::Configuration]
          #
          def self.configure
            @configure ||= begin
              default_config = Client::Configuration.new

              default_config
            end
            yield @configure if block_given?
            @configure
          end

          ##
          # Configure the IAMPolicy Client instance.
          #
          # The configuration is set to the derived mode, meaning that values can be changed,
          # but structural changes (adding new fields, etc.) are not allowed. Structural changes
          # should be made on {Client.configure}.
          #
          # See {So::Much::Trash::IAMPolicy::Client::Configuration}
          # for a description of the configuration fields.
          #
          # @yield [config] Configure the Client client.
          # @yieldparam config [Client::Configuration]
          #
          # @return [Client::Configuration]
          #
          def configure
            yield @config if block_given?
            @config
          end

          ##
          # Create a new IAMPolicy client object.
          #
          # ## Examples
          #
          # To create a new IAMPolicy client with the default
          # configuration:
          #
          #     client = So::Much::Trash::IAMPolicy::Client.new
          #
          # To create a new IAMPolicy client with a custom
          # configuration:
          #
          #     client = So::Much::Trash::IAMPolicy::Client.new do |config|
          #       config.timeout = 10_000
          #     end
          #
          # @yield [config] Configure the IAMPolicy client.
          # @yieldparam config [Client::Configuration]
          #
          def initialize
            # These require statements are intentionally placed here to initialize
            # the gRPC module only when it's required.
            # See https://github.com/googleapis/toolkit/issues/446
            require "gapic/grpc"
            require "google/iam/v1/iam_policy_services_pb"

            # Create the configuration object
            @config = Configuration.new Client.configure

            # Yield the configuration if needed
            yield @config if block_given?

            # Create credentials
            credentials = @config.credentials
            credentials ||= Credentials.default scope: @config.scope
            if credentials.is_a?(String) || credentials.is_a?(Hash)
              credentials = Credentials.new credentials, scope: @config.scope
            end
            @quota_project_id = credentials.respond_to?(:quota_project_id) ? credentials.quota_project_id : nil

            @iam_policy_stub = Gapic::ServiceStub.new(
              Google::Iam::V1::IAMPolicy::Stub,
              credentials:  credentials,
              endpoint:     @config.endpoint,
              channel_args: @config.channel_args,
              interceptors: @config.interceptors
            )
          end

          # Service calls

          ##
          # Sets the access control policy on the specified resource. Replaces any
          # existing policy.
          #
          # @overload set_iam_policy(request, options = nil)
          #   Pass arguments to `set_iam_policy` via a request object, either of type
          #   {Google::Iam::V1::SetIamPolicyRequest} or an equivalent Hash.
          #
          #   @param request [Google::Iam::V1::SetIamPolicyRequest, Hash]
          #     A request object representing the call parameters. Required. To specify no
          #     parameters, or to keep all the default parameter values, pass an empty Hash.
          #   @param options [Gapic::CallOptions, Hash]
          #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
          #
          # @overload set_iam_policy(resource: nil, policy: nil)
          #   Pass arguments to `set_iam_policy` via keyword arguments. Note that at
          #   least one keyword argument is required. To specify no parameters, or to keep all
          #   the default parameter values, pass an empty Hash as a request object (see above).
          #
          #   @param resource [String]
          #     REQUIRED: The resource for which the policy is being specified.
          #     `resource` is usually specified as a path. For example, a Project
          #     resource is specified as `projects/{project}`.
          #   @param policy [Google::Iam::V1::Policy, Hash]
          #     REQUIRED: The complete policy to be applied to the `resource`. The size of
          #     the policy is limited to a few 10s of KB. An empty policy is a
          #     valid policy but certain Cloud Platform services (such as Projects)
          #     might reject them.
          #
          # @yield [response, operation] Access the result along with the RPC operation
          # @yieldparam response [Google::Iam::V1::Policy]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          #
          # @return [Google::Iam::V1::Policy]
          #
          # @raise [GRPC::BadStatus] if the RPC is aborted.
          #
          def set_iam_policy request, options = nil
            raise ArgumentError, "request must be provided" if request.nil?

            request = Gapic::Protobuf.coerce request, to: Google::Iam::V1::SetIamPolicyRequest

            # Converts hash and nil to an options object
            options = Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

            # Customize the options with defaults
            metadata = @config.rpcs.set_iam_policy.metadata.to_h

            # Set x-goog-api-client and x-goog-user-project headers
            metadata[:"x-goog-api-client"] ||= Gapic::Headers.x_goog_api_client \
              lib_name: @config.lib_name, lib_version: @config.lib_version,
              gapic_version: ::Google::Garbage::VERSION
            metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

            header_params = {
              "resource" => request.resource
            }
            request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
            metadata[:"x-goog-request-params"] ||= request_params_header

            options.apply_defaults timeout:      @config.rpcs.set_iam_policy.timeout,
                                   metadata:     metadata,
                                   retry_policy: @config.rpcs.set_iam_policy.retry_policy
            options.apply_defaults metadata:     @config.metadata,
                                   retry_policy: @config.retry_policy

            @iam_policy_stub.call_rpc :set_iam_policy, request, options: options do |response, operation|
              yield response, operation if block_given?
              return response
            end
          end

          ##
          # Gets the access control policy for a resource.
          # Returns an empty policy if the resource exists and does not have a policy
          # set.
          #
          # @overload get_iam_policy(request, options = nil)
          #   Pass arguments to `get_iam_policy` via a request object, either of type
          #   {Google::Iam::V1::GetIamPolicyRequest} or an equivalent Hash.
          #
          #   @param request [Google::Iam::V1::GetIamPolicyRequest, Hash]
          #     A request object representing the call parameters. Required. To specify no
          #     parameters, or to keep all the default parameter values, pass an empty Hash.
          #   @param options [Gapic::CallOptions, Hash]
          #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
          #
          # @overload get_iam_policy(resource: nil)
          #   Pass arguments to `get_iam_policy` via keyword arguments. Note that at
          #   least one keyword argument is required. To specify no parameters, or to keep all
          #   the default parameter values, pass an empty Hash as a request object (see above).
          #
          #   @param resource [String]
          #     REQUIRED: The resource for which the policy is being requested.
          #     `resource` is usually specified as a path. For example, a Project
          #     resource is specified as `projects/{project}`.
          #
          # @yield [response, operation] Access the result along with the RPC operation
          # @yieldparam response [Google::Iam::V1::Policy]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          #
          # @return [Google::Iam::V1::Policy]
          #
          # @raise [GRPC::BadStatus] if the RPC is aborted.
          #
          def get_iam_policy request, options = nil
            raise ArgumentError, "request must be provided" if request.nil?

            request = Gapic::Protobuf.coerce request, to: Google::Iam::V1::GetIamPolicyRequest

            # Converts hash and nil to an options object
            options = Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

            # Customize the options with defaults
            metadata = @config.rpcs.get_iam_policy.metadata.to_h

            # Set x-goog-api-client and x-goog-user-project headers
            metadata[:"x-goog-api-client"] ||= Gapic::Headers.x_goog_api_client \
              lib_name: @config.lib_name, lib_version: @config.lib_version,
              gapic_version: ::Google::Garbage::VERSION
            metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

            header_params = {
              "resource" => request.resource
            }
            request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
            metadata[:"x-goog-request-params"] ||= request_params_header

            options.apply_defaults timeout:      @config.rpcs.get_iam_policy.timeout,
                                   metadata:     metadata,
                                   retry_policy: @config.rpcs.get_iam_policy.retry_policy
            options.apply_defaults metadata:     @config.metadata,
                                   retry_policy: @config.retry_policy

            @iam_policy_stub.call_rpc :get_iam_policy, request, options: options do |response, operation|
              yield response, operation if block_given?
              return response
            end
          end

          ##
          # Returns permissions that a caller has on the specified resource.
          # If the resource does not exist, this will return an empty set of
          # permissions, not a NOT_FOUND error.
          #
          # @overload test_iam_permissions(request, options = nil)
          #   Pass arguments to `test_iam_permissions` via a request object, either of type
          #   {Google::Iam::V1::TestIamPermissionsRequest} or an equivalent Hash.
          #
          #   @param request [Google::Iam::V1::TestIamPermissionsRequest, Hash]
          #     A request object representing the call parameters. Required. To specify no
          #     parameters, or to keep all the default parameter values, pass an empty Hash.
          #   @param options [Gapic::CallOptions, Hash]
          #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
          #
          # @overload test_iam_permissions(resource: nil, permissions: nil)
          #   Pass arguments to `test_iam_permissions` via keyword arguments. Note that at
          #   least one keyword argument is required. To specify no parameters, or to keep all
          #   the default parameter values, pass an empty Hash as a request object (see above).
          #
          #   @param resource [String]
          #     REQUIRED: The resource for which the policy detail is being requested.
          #     `resource` is usually specified as a path. For example, a Project
          #     resource is specified as `projects/{project}`.
          #   @param permissions [Array<String>]
          #     The set of permissions to check for the `resource`. Permissions with
          #     wildcards (such as '*' or 'storage.*') are not allowed. For more
          #     information see
          #     [IAM Overview](https://cloud.google.com/iam/docs/overview#permissions).
          #
          # @yield [response, operation] Access the result along with the RPC operation
          # @yieldparam response [Google::Iam::V1::TestIamPermissionsResponse]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          #
          # @return [Google::Iam::V1::TestIamPermissionsResponse]
          #
          # @raise [GRPC::BadStatus] if the RPC is aborted.
          #
          def test_iam_permissions request, options = nil
            raise ArgumentError, "request must be provided" if request.nil?

            request = Gapic::Protobuf.coerce request, to: Google::Iam::V1::TestIamPermissionsRequest

            # Converts hash and nil to an options object
            options = Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

            # Customize the options with defaults
            metadata = @config.rpcs.test_iam_permissions.metadata.to_h

            # Set x-goog-api-client and x-goog-user-project headers
            metadata[:"x-goog-api-client"] ||= Gapic::Headers.x_goog_api_client \
              lib_name: @config.lib_name, lib_version: @config.lib_version,
              gapic_version: ::Google::Garbage::VERSION
            metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

            header_params = {
              "resource" => request.resource
            }
            request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
            metadata[:"x-goog-request-params"] ||= request_params_header

            options.apply_defaults timeout:      @config.rpcs.test_iam_permissions.timeout,
                                   metadata:     metadata,
                                   retry_policy: @config.rpcs.test_iam_permissions.retry_policy
            options.apply_defaults metadata:     @config.metadata,
                                   retry_policy: @config.retry_policy

            @iam_policy_stub.call_rpc :test_iam_permissions, request, options: options do |response, operation|
              yield response, operation if block_given?
              return response
            end
          end

          ##
          # Configuration class for the IAMPolicy API.
          #
          # This class represents the configuration for IAMPolicy,
          # providing control over timeouts, retry behavior, logging, transport
          # parameters, and other low-level controls. Certain parameters can also be
          # applied individually to specific RPCs. See
          # {So::Much::Trash::IAMPolicy::Client::Configuration::Rpcs}
          # for a list of RPCs that can be configured independently.
          #
          # Configuration can be applied globally to all clients, or to a single client
          # on construction.
          #
          # # Examples
          #
          # To modify the global config, setting the timeout for set_iam_policy
          # to 20 seconds, and all remaining timeouts to 10 seconds:
          #
          #     So::Much::Trash::IAMPolicy::Client.configure do |config|
          #       config.timeout = 10_000
          #       config.rpcs.set_iam_policy.timeout = 20_000
          #     end
          #
          # To apply the above configuration only to a new client:
          #
          #     client = So::Much::Trash::IAMPolicy::Client.new do |config|
          #       config.timeout = 10_000
          #       config.rpcs.set_iam_policy.timeout = 20_000
          #     end
          #
          # @!attribute [rw] endpoint
          #   The hostname or hostname:port of the service endpoint.
          #   Defaults to `"endlesstrash.example.net"`.
          #   @return [String]
          # @!attribute [rw] credentials
          #   Credentials to send with calls. You may provide any of the following types:
          #    *  (`String`) The path to a service account key file in JSON format
          #    *  (`Hash`) A service account key as a Hash
          #    *  (`Google::Auth::Credentials`) A googleauth credentials object
          #       (see the [googleauth docs](https://googleapis.dev/ruby/googleauth/latest/index.html))
          #    *  (`Signet::OAuth2::Client`) A signet oauth2 client object
          #       (see the [signet docs](https://googleapis.dev/ruby/signet/latest/Signet/OAuth2/Client.html))
          #    *  (`GRPC::Core::Channel`) a gRPC channel with included credentials
          #    *  (`GRPC::Core::ChannelCredentials`) a gRPC credentails object
          #    *  (`nil`) indicating no credentials
          #   @return [Object]
          # @!attribute [rw] scope
          #   The OAuth scopes
          #   @return [Array<String>]
          # @!attribute [rw] lib_name
          #   The library name as recorded in instrumentation and logging
          #   @return [String]
          # @!attribute [rw] lib_version
          #   The library version as recorded in instrumentation and logging
          #   @return [String]
          # @!attribute [rw] channel_args
          #   Extra parameters passed to the gRPC channel. Note: this is ignored if a
          #   `GRPC::Core::Channel` object is provided as the credential.
          #   @return [Hash]
          # @!attribute [rw] interceptors
          #   An array of interceptors that are run before calls are executed.
          #   @return [Array<GRPC::ClientInterceptor>]
          # @!attribute [rw] timeout
          #   The call timeout in milliseconds.
          #   @return [Numeric]
          # @!attribute [rw] metadata
          #   Additional gRPC headers to be sent with the call.
          #   @return [Hash{Symbol=>String}]
          # @!attribute [rw] retry_policy
          #   The retry policy. The value is a hash with the following keys:
          #    *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
          #    *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
          #    *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
          #    *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
          #       trigger a retry.
          #   @return [Hash]
          #
          class Configuration
            extend Gapic::Config

            config_attr :endpoint,     "endlesstrash.example.net", String
            config_attr :credentials,  nil do |value|
              allowed = [::String, ::Hash, ::Proc, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
              allowed += [::GRPC::Core::Channel, ::GRPC::Core::ChannelCredentials] if defined? ::GRPC
              allowed.any? { |klass| klass === value }
            end
            config_attr :scope,        nil, String, Array, nil
            config_attr :lib_name,     nil, String, nil
            config_attr :lib_version,  nil, String, nil
            config_attr(:channel_args, { "grpc.service_config_disable_resolution"=>1 }, Hash, nil)
            config_attr :interceptors, nil, Array, nil
            config_attr :timeout,      nil, Numeric, nil
            config_attr :metadata,     nil, Hash, nil
            config_attr :retry_policy, nil, Hash, Proc, nil

            # @private
            def initialize parent_config = nil
              @parent_config = parent_config unless parent_config.nil?

              yield self if block_given?
            end

            ##
            # Configurations for individual RPCs
            # @return [Rpcs]
            #
            def rpcs
              @rpcs ||= begin
                parent_rpcs = nil
                parent_rpcs = @parent_config.rpcs if @parent_config&.respond_to? :rpcs
                Rpcs.new parent_rpcs
              end
            end

            ##
            # Configuration RPC class for the IAMPolicy API.
            #
            # Includes fields providing the configuration for each RPC in this service.
            # Each configuration object is of type `Gapic::Config::Method` and includes
            # the following configuration fields:
            #
            #  *  `timeout` (*type:* `Numeric`) - The call timeout in milliseconds
            #  *  `metadata` (*type:* `Hash{Symbol=>String}`) - Additional gRPC headers
            #  *  `retry_policy (*type:* `Hash`) - The retry policy. The policy fields
            #     include the following keys:
            #      *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
            #      *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
            #      *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
            #      *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
            #         trigger a retry.
            #
            class Rpcs
              ##
              # RPC-specific configuration for `set_iam_policy`
              # @return [Gapic::Config::Method]
              #
              attr_reader :set_iam_policy
              ##
              # RPC-specific configuration for `get_iam_policy`
              # @return [Gapic::Config::Method]
              #
              attr_reader :get_iam_policy
              ##
              # RPC-specific configuration for `test_iam_permissions`
              # @return [Gapic::Config::Method]
              #
              attr_reader :test_iam_permissions

              # @private
              def initialize parent_rpcs = nil
                set_iam_policy_config = parent_rpcs&.set_iam_policy if parent_rpcs&.respond_to? :set_iam_policy
                @set_iam_policy = Gapic::Config::Method.new set_iam_policy_config
                get_iam_policy_config = parent_rpcs&.get_iam_policy if parent_rpcs&.respond_to? :get_iam_policy
                @get_iam_policy = Gapic::Config::Method.new get_iam_policy_config
                test_iam_permissions_config = parent_rpcs&.test_iam_permissions if parent_rpcs&.respond_to? :test_iam_permissions
                @test_iam_permissions = Gapic::Config::Method.new test_iam_permissions_config

                yield self if block_given?
              end
            end
          end
        end
      end
    end
  end
end
