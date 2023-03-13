FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 4) + '1' + 'a' }
    password_confirmation { password }
    child_name            { person.last.kanji }
    child_name_kana       { person.last.katakana }
    parent_name           { person.first.kanji }
    parent_name_kana      { person.first.katakana }
    sex_id                { Faker::Number.between(from: 2, to: 3) }
    birthday              { '1991/1/1' }
  end
end
