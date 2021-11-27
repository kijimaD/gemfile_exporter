# frozen_string_literal: true

RSpec.describe Gemat do
  it 'has a version number' do
    expect(Gemat::VERSION).not_to be nil
  end

  describe 'csv' do
    it 'can run' do
      VCR.use_cassette 'Rubygems' do
        Gemat::Cli.new.csv
      end
    end
  end

  describe 'md' do
    it 'can run' do
      VCR.use_cassette 'Rubygems' do
        Gemat::Cli.new.md
      end
    end
  end

  describe 'command line' do
    it 'can run' do
      VCR.use_cassette 'Rubygems_fixture' do
        # response = call_api(api_url)
        # response.first.should == "hello world"
        capture(:stdout) do
          Gemat::Cli.start(['csv',
                            '--input', './spec/fixtures/Gemfile_test',
                            '--output', 'test.csv'])
        end
        File.delete('test.csv')
      end
    end
  end
end
