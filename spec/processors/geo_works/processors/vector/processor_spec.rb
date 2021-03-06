require 'spec_helper'

describe GeoWorks::Processors::Vector::Processor do
  subject { described_class.new(file_name, directives) }
  let(:processor) { double }

  context 'when a shapefile format type is passed' do
    let(:file_name) { 'files/shapefile.zip' }
    let(:directives) { { input_format: 'application/zip; ogr-format="ESRI Shapefile"' } }

    it 'calls the shapefile processor' do
      expect(GeoWorks::Processors::Vector::Shapefile).to receive(:new).and_return(processor)
      expect(processor).to receive(:process)
      subject.process
    end
  end

  context 'when a geojson format type is passed' do
    let(:file_name) { 'files/geo.json' }
    let(:directives) { { input_format: 'application/vnd.geo+json' } }

    it 'calls the base vector processor' do
      expect(GeoWorks::Processors::Vector::Base).to receive(:new).and_return(processor)
      expect(processor).to receive(:process)
      subject.process
    end
  end
end
