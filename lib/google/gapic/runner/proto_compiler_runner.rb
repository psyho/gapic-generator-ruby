#!/usr/bin/env ruby
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

require "google/gapic/schema"
require "google/gapic/generator"
require "protobuf/descriptors"
require "action_controller"

module Google
  module Gapic
    module Runner
      class ProtoCompilerRunner
        # Initializes the runner.
        def initialize templates_path
          # Ensure that no encoding conversions are done on STDIN and STDOUT
          # since we are passing binary data back and forth. Otherwise these
          # streams will be mangled on Windows.
          STDIN.binmode
          STDOUT.binmode
          @templates_path = templates_path
        end

        # Run protoc generation.
        def run
          # Create an API Schema from the FileDescriptorProtos
          api = Google::Gapic::Schema::Api.new request.proto_file,
                                               request.file_to_generate

          # Create a generator from the API.
          generator = Google::Gapic::Generator::Generator.new api,
                                                              controller,
                                                              templates

          # Generate and format the files.
          files = generator.generate.map { |f| format_file f }

          # Create and write the response
          response = Google::Protobuf::Compiler::CodeGeneratorResponse.new \
            file: files
          write_response response
        end

        private

        # Private.
        # Read in the CodeGeneratorRequest and return it.
        # @return [Google::Protobuf::Compiler::CodeGeneratorRequest]
        #   The CodeGeneratorRequest.
        def request
          # Memoize so that the request is only read in once.
          return @request if @request

          request_bytes = STDIN.read
          @request = Google::Protobuf::Compiler::CodeGeneratorRequest.decode \
            request_bytes
        end

        # Private.
        # The controller for this run.
        # @return [ActionController::Base]
        def controller
          # Specify where to load the templates from.
          ActionController::Base.helper Google::Gapic::Generator::Helpers
          provider = ActionController::Base.new
          provider.prepend_view_path @templates_path
          provider
        end

        # Returns the content of the templates found at the given path.
        # This will ignore any template that starts with '_' in their file name
        # because those are understood to be partial templates.
        #
        # @return [Array<String>] The templates.
        def templates
          Dir.new(@templates_path).each
             .select { |file| file.end_with? ".erb" }
             .reject { |file| File.directory? file }
             .reject { |file| File.split(file).last.start_with? "_" }
             .map { |file| file.chomp ".erb" }
        end

        # Private.
        # Formats a file if it is a file that has a name with a '.rb' file
        # extension.
        # @param file [Google::Protobuf::Compiler::CodeGeneratorResponse::File]
        #   The file to be formatted.
        # @return [Google::Protobuf::Compiler::CodeGeneratorResponse::File]
        #   The formatted file.
        def format_file file
          # Only autocorrect ruby files.
          return file unless file.name.end_with? ".rb"

          # Return the new file.
          Google::Protobuf::Compiler::CodeGeneratorResponse::File.new(
            name: file.name,
            content: rubocop(file)
          )
        end

        # Private.
        # Formats a file if it is a file that has a name with a '.rb' file
        # extension.
        # @param file [Google::Protobuf::Compiler::CodeGeneratorResponse::File]
        #   The file to be formatted.
        # @return [Google::Protobuf::Compiler::CodeGeneratorResponse::File]
        #   The formatted file.
        def rubocop file
          # Write generated file to a tmp file.
          tmp_file = File.expand_path "../tmp.rb", __dir__
          log_file = File.expand_path "../tmp.log", __dir__
          f = File.new tmp_file, "w"
          f.write file.content
          f.close

          # Autocorrect file with rubocop.
          # TODO(landrito) make this call system agnostic.
          system "rubocop -a #{tmp_file} -o #{log_file}"

          # Read the corrected file.
          content = File.read tmp_file

          # Delete temp file.
          File.delete tmp_file
          File.delete log_file

          # Return the new file contents.
          content
        end

        # Private.
        # Writes the response.
        # @param response [Google::Protobuf::Compiler::CodeGeneratorResponse]
        def write_response response
          STDOUT.print response.serialize
        end
      end
    end
  end
end