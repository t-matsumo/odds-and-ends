class TrainInformationsCreator
  def self.create
    train_infomation_html = Nokogiri::HTML(open('https://transit.yahoo.co.jp/traininfo/area/4/'))

    train_informations = []
    train_infomation_html.css('div#mdStatusTroubleLine tr').each do |table_row|
      if table_row.css('td').present?
        train = table_row.css('a').text
        status = table_row.css('span.colTrouble').text
        detail = table_row.css('td').last.text

        train_information = TrainInformation.new(train, status, detail)

        train_informations.push(train_information)
      end
    end

    return train_informations
  end
end
