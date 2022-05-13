FactoryBot.define do
    factory :user do
        name { 'Tanaka' }
        sex { 'male' }
        email { 'tanaka@tanaka.com' }
        prefecture { 'Tokyo' }
        birthday { '2000-02-01' }
    end
end
