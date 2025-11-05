source "https://rubygems.org"

gem "rails", "~> 8.0.3"
gem "puma", ">= 5.0"
gem "sqlite3", ">= 2.1"
gem "bcrypt", "~> 3.1.17"
gem "jwt", "~> 2.6"
gem "rack-cors", "~> 3.0"

gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[windows jruby]
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "kamal", require: false
gem "thruster", require: false

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end
