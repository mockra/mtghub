class SearchCards
  def initialize app
    @app = app
  end

  def call(env)
    if env["PATH_INFO"] == "/search_cards"
      [200, {"Content-Type" => "application/json"}, [matching_cards.to_json]]
    else
      @app.call(env)
    end
  end

  def request
    @request ||= Rack::Request.new(env)
  end

  def matching_cards
    @matching_cards ||= Card.terms_for(request.params["term"])
  end
end
