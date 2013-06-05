class StarAddition
  attr_accessor :user, :deck

  def initialize user, deck
    @user, @deck = user, deck
  end

  def process
    star_exists? ? destroy_star : create_star
  end

  def destroy_star
    deck.stars.find_by_user_id(user.id).destroy
  end

  def create_star
    deck.stars.create user_id: user.id
  end

  def star_exists?
    deck.stars.find_by_user_id user
  end
end
