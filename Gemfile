source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "4.0.2"

gem "rails", "~> 8.1.2"
gem "puma", ">= 5.0"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "cgi"

# Move sqlite3 into the development/test group so Render ignores it
group :development, :test do
  gem "sqlite3", "~> 2.1"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

# Add the PostgreSQL gem specifically for Render (Production)
group :production do
  gem "pg"
end

group :development do
  gem "tabulo"
  gem "web-console"
end

