class SearchCards
  def initialize app
    @app = app
  end

  def call(env)
    @env = env
    if env["PATH_INFO"] == "/search_cards"
      [200, {"Content-Type" => "application/json"}, [cards.to_json]]
    else
      @app.call(env)
    end
  end

  def request
    Rack::Request.new(@env)
  end

  def cards
    Card.terms_for request.params['term']
  end
end
