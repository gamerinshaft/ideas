namespace :material do
  desc "materialを生成"

  task :sample => :environment do
    logger = Logger.new('log/material.log')
    logger.info "------------------------------------------------------"
    logger.info "#{Time.now} -- starting_task -- "
    10.times do |i|
      Material.create(name: "#{i} material")
    end
    logger = Logger.new('log/material.log')
    logger.info "------------------------------------------------------"
    logger.info "------------------------------------------------------"
  end
  desc "materialを生成するお"

  task :create, ['sitename'] => :environment do |task, args|
    nm = Natto::MeCab.new
    nm.parse("お腹減った") do |n|
      h = n.feature.split(",")[0];
      if(h == "名詞")
        Material.create(name: "#{n.surface}")
      end
    end
  end
end
