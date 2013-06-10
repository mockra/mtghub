require "open-uri"

class CardImageAddition
  attr_accessor :card

  def initialize card
    @card = card
  end

  def process
    download_card
    upload_card
    delete_temp_card
  end

  def service
    S3::Service.new access_key_id: ENV['AWS_ACCESS_KEY'],
      secret_access_key: ENV['AWS_SECRET_KEY']
  end

  def bucket
    service.buckets.find('mtg_cards')
  end

  def download_card
    open(card.image_url) {|f|
      File.open("tmp/#{card.filename}",'wb') do |file|
        file.puts f.read
      end
    }
  end

  def upload_card
    img = bucket.objects.build card.filename
    img.content = open "tmp/#{card.filename}"
    img.save
  end

  def delete_temp_card
    File.delete "tmp/#{card.filename}"
  end
end
