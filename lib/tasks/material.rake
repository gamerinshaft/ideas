require "natto"
require "nokogiri"
require "open-uri"

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
    charset = nil
    puts args
    html = open(args[:sitename].to_s) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end

    # htmlをパース(解析)してオブジェクトを生成
    doc = Nokogiri::HTML.parse(html, nil, charset)
    nm = Natto::MeCab.new
    nm.parse(doc.text).split("\n").each do |n|
      surface = n.split(" ")[0]
      feature = n.split(" ")[1]
      surface.match("[^\x01-\x7E]+") do|h|
        if feature.nil?
        else
          if feature.split(",")[0]=="名詞" && h[0].length > 1
            Material.create(name: h[0])
          end
        end
      end
    end
  end
end
