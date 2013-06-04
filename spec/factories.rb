FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    username 'david'
    password 'foobar'
  end

  factory :deck do
    title 'Control'
    format 'Standard'
    user
  end

  factory :mtg_block do
    title 'Return to Ravnica'
  end

  factory :mtg_set do
    title 'Return to Ravnica'
    code 'RTR'
    mtg_block
  end

  factory :card do
    title 'Abrupt Decay'
    main_type 'Instant'
    cmc 2
    mana_cost ['B', 'G']
    rarity 'Rare'
    mtg_set
  end

  factory :sideboard do
    deck
  end

  factory :suggestion do
    title 'add cards'
    deck
    user
  end

  factory :star do
    deck
    user
  end
end
