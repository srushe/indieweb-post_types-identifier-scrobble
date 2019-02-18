require "indieweb/post_types/identifier/scrobble/version"

module Indieweb
  module PostTypes
    module Identifier
      module Scrobble
        def self.type_from(data)
          data = entry_data_from(data)
          return unless data.key?('scrobble-of')

          'scrobble'
        end

        private

        def self.entry_data_from(data)
          return data['properties'] if data['properties']
          return data unless data.key?('items')
          data['items'].first['properties']
        end
      end
    end
  end
end