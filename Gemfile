source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'

gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'haml'
gem 'simple_form'
gem 'pagy'
gem 'font-awesome-rails'

gem 'has_scope'
gem 'file_validators'
gem 'validates_cpf_cnpj'
gem 'validates_timeliness'
gem 'email_validator'
gem 'barby', '~> 0.6.5'
gem 'chunky_png', '~> 1.3.10'
gem 'rqrcode_png', '~> 0.1.5'
gem 'bd_money', '~> 0.0.14'

gem 'carrierwave', git: 'https://github.com/carrierwaveuploader/carrierwave.git'
gem 'carrierwave-base64', '~> 2.7.0'

gem 'bcrypt'

gem 'support', github: 'codhab/support', branch: 'master'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

path 'engines' do
  gem 'attendance'
  gem 'brb'
  gem 'candidate'
  gem 'cpl'
  gem 'entity'
  gem 'helpdesk'
  gem 'juridical'
  gem 'pivotal'
end
