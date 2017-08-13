class TrainInformationsCreator
  def self.create
    trainInfomationHTML = Nokogiri::HTML(open('https://transit.yahoo.co.jp/traininfo/area/4/'))

    trainInformations = []
    trainInfomationHTML.css('div#mdStatusTroubleLine tr').each do |tableRow|
      if tableRow.css('td').present?
        train = tableRow.css('a').text
        status = tableRow.css('span.colTrouble').text
        detail = tableRow.css('td').last.text

        trainInformation = TrainInformation.new(train, status, detail)

        trainInformations.push(trainInformation)
      end
    end

    return trainInformations
  end
end
