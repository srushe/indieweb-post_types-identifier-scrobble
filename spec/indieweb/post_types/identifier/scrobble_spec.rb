RSpec.describe Indieweb::PostTypes::Identifier::Scrobble do
  context '.type_from' do
    context 'when the identifier should identify the type' do
      let(:post_data) do
        {
          "type" => ["h-entry"],
          "properties" => {
            "content" => [
              "Wildlife Analysis - Boards of Canada (Music Has the Right to Children)"
            ],
            "scrobble-of" => [
              {
                "title" => "Wildlife Analysis",
                "artist" => "Boards of Canada",
                "album" => "Music Has the Right to Children",
                "time" => "1:15",
                "genre" => "Electronic",
                "when" => "2018-04-19 10:24:55 UTC",
                "type" => "music",
                "musicbrainz_id" => "17d74d52-c92b-3b8d-9f87-218ab2d1c4a0"
              }
            ],
            "published"=>[
              "2018-04-19T10:24:55+00:00"
            ]
          }
        }
      end

      context "when the entry is standalone" do
        let(:data) { post_data }

        it { expect(described_class.type_from(data)).to eq('scrobble') }
      end

      context "when the entry is within items" do
        let(:data) do
          {
            "items" => [post_data]
          }
        end

        it { expect(described_class.type_from(data)).to eq('scrobble') }
      end
    end

    context 'when the identifier should not identify the type' do
      let(:post_data) do
        {
          "type" => ["h-entry"],
          "properties" => {
            "content" => [
              "This is an example of a note"
            ],
            "published" => [
              "2018-04-19T10:24:55+00:00"
            ]
          }
        }
      end

      context "when the entry is standalone" do
        let(:data) { post_data }

        it { expect(described_class.type_from(data)).not_to eq('scrobble') }
      end

      context "when the entry is within items" do
        let(:data) do
          {
            "items" => [post_data]
          }
        end

        it { expect(described_class.type_from(data)).not_to eq('scrobble') }
      end
    end
  end
end
