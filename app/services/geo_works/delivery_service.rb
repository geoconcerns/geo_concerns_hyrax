module GeoWorks
  class DeliveryService
    attr_reader :geoserver

    def initialize(file_set, file_path)
      @geoserver = GeoWorks::Delivery::Geoserver.new(file_set, file_path)
    end

    delegate :publish, to: :geoserver
  end
end
