require_relative '../../app/middleware/search_cards'

describe SearchCards do
  let(:app) { double :app }
  let(:env) { double :env }
  let(:search_cards) { SearchCards.new app }

  describe '#call' do
    it 'searches for cards by term' do
      expect(env).to receive('[]').with('PATH_INFO').and_return '/search_cards'
      expect(search_cards).to receive(:cards).and_return(double to_json: true)
      expect(search_cards.call env).to include 200
    end

    it 'delegates to app when not /search_cards' do
      expect(env).to receive('[]').with('PATH_INFO').and_return '/'
      expect(app).to receive(:call).with env
      search_cards.call env
    end
  end
end
