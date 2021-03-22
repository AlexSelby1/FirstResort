FactoryBot.define do
  factory :job_acceptance do
    user { nil }
    applicant_id { 1 }
    confirmed { false }
    default { "MyString" }
     { "" }
  end

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

    factory :job do
      title { "Barman needed" }
      country { "Ireland" }
      cat { "Bar" }
      description {"Welcome to my bar - 5 months - blah blah"}
      images { nil}
    end
end