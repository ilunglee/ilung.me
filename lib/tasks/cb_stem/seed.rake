namespace :db do
  namespace :cb_stem do
    namespace :seed do
      Dir[Rails.root.join('db', 'seeds', 'cb_stem', '*.rb')].each do |filename|
        task_name = File.basename(filename, '.rb')
        desc "Seed #{task_name}, based on the file with the same name in `db/seeds/*.rb`"
        task task_name.to_sym => :environment do
          load(filename) if File.exist?(filename)
        end
      end

      desc 'Seed everything'
      task all: :environment do
        Dir[Rails.root.join('db', 'seeds', 'cb_stem', '*.rb')].each do |filename|
          task_name = File.basename(filename, '.rb')
          Rake::Task["db:seed:#{task_name}"].invoke
        end
      end
    end
  end
end
