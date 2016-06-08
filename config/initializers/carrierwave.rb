# NullStorage provider for CarrierWave for use in tests. Doesn't actually
# upload or store files but allows test to pass as if files were stored and
# the use of fixtures.
class NullStorage
  attr_reader :uploader

  def initialize(uploader)
    @uploader = uploader
  end

  def identifier
    uploader.filename
  end

  def store!(_file)
    true
  end

  def retrieve!(_identifier)
    file = Rails.root.join('test', 'fixtures', 'files', 'blank.jpg')
    tmp = Rails.root.join('tmp', 'blank_tmp.jpg')
    FileUtils.cp(file, tmp)
    CarrierWave::SanitizedFile.new(tmp)
  end
end

if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage NullStorage
    config.enable_processing = false
  end
end
