module Address
  class DocumentUploader < CarrierWave::Uploader::Base

    storage :file

    def store_dir
      "uploads/address"
    end

    def extension_white_list
      %w(jpg jpeg gif png pdf docx doc)
    end

    def filename
      if original_filename
        @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
        "#{@name}.#{file.extension}"
      end
    end
    
  end 
end
