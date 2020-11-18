if ENV.fetch['AWS_ACCESS_KEY_ID'] && ENV.fetch['AWS_SECRET_ACCESS_KEY']
  Paperclip::Attachment.default_options.merge!(
      storage: :fog,
      fog_credentials: {
          provider: 'AWS',
          aws_access_key_id: ENV.fetch['AWS_ACCESS_KEY_ID'],
          aws_secret_access_key: ENV.fetch['AWS_SECRET_ACCESS_KEY'],
          region: "eu-west-1",
      },
      fog_directory: 'com.xptesting.solidus'
  )

  Spree::Image.attachment_definitions[:attachment].delete(:url)
  Spree::Image.attachment_definitions[:attachment].delete(:path)
end


if ENV['CLOUDINARY_URL']
  require 'paperclip/cloudinary'

  Paperclip::Attachment.default_options[:storage] = :cloudinary

  Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
  Paperclip::Attachment.default_options[:s3_host_name] = 'eu-west-1.amazonaws.com'



  Spree::Image.attachment_definitions[:attachment].delete(:url)
  Spree::Image.attachment_definitions[:attachment].delete(:path)
  Spree::Image.attachment_definitions[:attachment].delete(:default_url)
  Spree::Image.attachment_definitions[:attachment][:path] = 'spree/products/:id/:style/:filename'
  Spree::Image.attachment_definitions[:attachment][:cloudinary_url_options] = {
    default: { secure: true }
  }
end
