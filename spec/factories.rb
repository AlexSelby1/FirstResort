FactoryBot.define do
  
    factory :user do
      id { 1}
      name { "john" }
      email { "john@gmail.com" }
      password { "password121" }
      isHost {"true"}
      isCandidate{"false"}
      isAdmin{"false"}
      confirmed_at { Time.now }
    end

    factory :job_application do
      id { 1}
      title { "Barman needed" }
      country { "Ireland" }
      cat { "Bar" }
      description {"Welcome to my bar - 5 months - blah blah"}
    end
end