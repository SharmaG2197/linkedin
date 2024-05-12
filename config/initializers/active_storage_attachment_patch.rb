module ActiveStorageAttachmentPatch
  def self.included(base)
    base.class_eval do
      def self.ransackable_attributes(auth_object = nil)
        super + %w[blob_id created_at id name record_id record_type]
      end
    end
  end
end

ActiveSupport.on_load(:active_storage_attachment) do
  include ActiveStorageAttachmentPatch
end


# Path      :- linkendin\config\initializers\active_storage_attachment_patch.rb
# File Name :- active_storage_attachment_patch.rb
