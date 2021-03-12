FactoryBot.define do
  factory :message do
    
  end

  factory :conversation do
    
  end

  
    factory :user do
     
      name { "john" }
      email { "john@gmail.com" }
      password { "password121" }
      confirmed_at { Time.now }
      isHost { "true" }
      isCandidate { "false" }
     
    end

    factory :job_application do
      title { "Barman needed" }
      country { "Ireland" }
      cat { "Bar" }
      description {"Welcome to my bar - 5 months - blah blah"}
      images { nil}
    end
end