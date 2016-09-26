require 'tempfile'
require "open-uri"

module CandidatesHelper
  def download_picture(lat, lng)
    url = "https://maps.googleapis.com/maps/api/streetview?size=640x480&location=#{lat},#{lng}&heading=0&pitch=0&fov=120&key=#{Rails.configuration.google_api_key}"
    file = Tempfile.new((0...8).map { (65 + rand(26)).chr }.join, Dir.tmpdir)
    file.binmode
    file.write(URI.parse(url).read)
    file.flush
    file
  end
end
