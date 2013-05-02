FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    username 'david'
    password 'foobar'
  end

  factory :deck do
    title 'Control'
    format 'Standard'
    association :user, factory: :user
  end

  factory :mtg_block do
    title 'Return to Ravnica'
  end

  factory :mtg_set do
    title 'Return to Ravnica'
    code 'RTR'
    association :mtg_block, factory: :mtg_block
  end

  factory :card do
    title 'Abrupt Decay'
    main_type 'Instant'
    cmc 2
    mana_cost ['B', 'G']
    rarity 'Rare'
    association :mtg_set, factory: :mtg_set
  end

  factory :sideboard do
    association :deck, factory: :deck
  end
end
