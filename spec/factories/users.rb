# frozen_string_literal: true

FactoryBot.define do
    factory :user do
      email { 'test@gmail.com' }
      first_name { 'Anna' }
      password { '123456' }
    end
  end
  