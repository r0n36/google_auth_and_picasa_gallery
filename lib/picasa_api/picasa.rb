module Picasa
  require "net/http"
  class Base
    # Constants
    PICASA_API_PROTOCOL = "HTTP/1.1"
    PICASA_API_URL_ALL_ALBUM = "https://picasaweb.google.com/data/feed/api/user/"
    API_URL_FOR_RECENT_IMAGES = "https://picasaweb.google.com/data/feed/api/user/"#"/userID?kind=photo&max-results=10"
    GET_METHOD = "GET"
    POST_METHOD = "POST"
    PUT_METHOD = "PUT"
    DELETE_METHOD = "DELETE"
    DATE_HEADER = Time.now.gmtime.strftime("%a, %d %b %Y %I:%M:%S GMT")
    # methods for PICASAAP
    def get_albums
      retry_times = 1
      begin
        s = Patron::Session.new
        s.connect_timeout = 30
        s.timeout = 30
        s.base_url = PICASA_API_URL_ALL_ALBUM
        s.headers['Date'] = DATE_HEADER
        s.headers['Accept'] = 'application/xml'
        s.headers['Content-Type'] = 'application/json'
        response = s.get(uri)
        #  puts response.body
        return response.status, response.body
      rescue Patron::TimeoutError => e
        retry if (retry_times -= 1) == 0
        Rails.logger.error(e.backtrace.join("\n"))
        return nil
      rescue Patron::ConnectionFailed
        retry if (retry_times -= 1) == 0
        Rails.logger.error(e.backtrace.join("\n"))
        return nil
      rescue Patron::Error => e
        Rails.logger.error(e.backtrace.join("\n"))
        return nil
      rescue
        return nil
      end
    end

    def parse_xml_data_for_album(xml_data)
      remote_control_data = {}
      begin
        doc = Nokogiri::XML(xml_data)
        if doc.children.xpath("//albums").length > 0

          return parsed_data
        else
          return parsed_data
        end
      rescue
        return parsed_data
      end
    end
    def parse_xml_data_for_recent_images(xml_data)
      device = {}
      begin
        doc = Nokogiri::XML(xml_data)
        if doc.children.xpath("//d").length > 0

          return photos
        else
          return photos
        end
      rescue
        return photos
      end
    end
  end
end
