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
end
