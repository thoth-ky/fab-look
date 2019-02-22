module Types
  class FileType < Types::BaseScalar
    graphql_name 'File'

    def self.coerce_input(file, context)
      return nil if file.nil?
      
      ActionDispatch::Http::UploadedFile.new(
        filename: file.original_filename,
        type: file.content_type,
        head: file.headers,
        tempfile: file.tempfile
      )

    end

    def self.coerce_result(ruby_value, context)
      # Override this to serialize a Ruby value for the GraphQL response
      ruby_value.to_s
    end
  end
end
