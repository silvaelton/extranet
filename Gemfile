source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bcrypt', '~> 3.1.12'

gem 'bootsnap', '~> 1.1.0', require: false
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '~> 1.3.0'
gem 'jquery-rails', '~> 4.3.3' 
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'


gem 'haml', '~> 5.0.4'
gem 'has_scope', '~> 0.7.2'
gem 'simple_form', '~> 4.1.0'
gem 'pagy', '~> 1.3.3'


gem 'bd_money', '~> 0.0.14'
gem 'email_validator', '~> 1.6.0'
gem 'file_validators', '~> 2.3.0'
gem 'font-awesome-rails', '~> 4.7.0.4'
gem 'validates_cpf_cnpj', '~> 0.2.0'
gem 'validates_timeliness', '~> 4.0.2'

gem 'barby', '~> 0.6.5'
gem 'chunky_png', '~> 1.3.10'
gem 'rqrcode_png', '~> 0.1.5'

gem 'support', github: 'codhab/support', branch: 'master'

group :development, :test do
  gem 'byebug', '~> 11.0.0', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '~> 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'capybara', '~> 2.15'
  gem 'selenium-webdriver', '~> 3.141.0'
  gem 'chromedriver-helper', '~> 2.1.0'
end

path 'engines' do
  gem 'address'
  gem 'api'
  gem 'attendance'
  gem 'brb'
  gem 'candidate'
  gem 'cpl'
  gem 'entity'
  gem 'helpdesk'
  gem 'juridical'
  gem 'pivotal'
end
