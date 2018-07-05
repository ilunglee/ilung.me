namespace :db do
  namespace :seed do
    Dir[Rails.root.join('db', 'seeds', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb')
      desc "Seed #{task_name}, based on the file with the same name in `db/seeds/*.rb`"
      task task_name.to_sym => :environment do
        load(filename) if File.exist?(filename)
      end
    end

    desc 'Setup'
    task setup: :environment do
      Rake::Task['db:cb_stem:seed:admin_user'].invoke
      %w[projects].each do |x|
        Rake::Task["db:seed:#{x}"].invoke
      end
    end

    desc 'Seed everything'
    task all: :environment do
      Rake::Task['db:seed:setup'].invoke
      %w[].each do |x|
        Rake::Task["db:seed:#{x}"].invoke
      end
    end
  end
end
