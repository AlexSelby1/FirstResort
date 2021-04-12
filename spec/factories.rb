FactoryBot.define do

  factory :message do
    
  end

  factory :conversation do
    recipient_id {"1"}
    sender_id {"2"}
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
      category { "Bar" }
      description {"Welcome to my bar - 5 months - blah blah"}
      images { nil}
    end

    factory :job_application do
      applicant_id { "1" }
      job_id { "1" }
    end

end