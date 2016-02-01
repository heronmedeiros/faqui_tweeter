namespace :db do
  namespace :seed do
    desc "run a single seed with 'rake db:seed:single SEED=<seed_name_without_.seeds.rb>''"
    task :single => :environment do
      filename = Dir[File.join(Rails.root, 'db', 'seeds', "#{ENV['SEED']}.rb")][0]
      puts "Seeding #{filename}..."
      load(filename) if File.exist?(filename)
    end

    desc "run all seeds"
    task all: :environment do
      Dir[File.join(Rails.root, 'db', 'seeds', "*.rb")].each do |file|
        puts "Seeding #{file}..."
        load(file) if File.exist?(file)
      end
    end

  end
end
