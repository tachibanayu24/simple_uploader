class UploadFile < ActiveRecord::Base
  mount_uploader :file, UploadFileUploader
#  validate  :file_valid?, :if => Proc.new{ |upload_file| upload_file.file_changed? && upload_file.errors[:file].blank? }

#  def file_valid?
#    if file.file.content_type != ["application/vnd.openxmlformats-officedocument.wordprocessingml.document","application/vnd.openxmlformats-officedocument.spreadsheetml.sheet","text/plain"]
#      errors.add(:file, "不正なファイルの送信を検出")
#    end
#  end

end
