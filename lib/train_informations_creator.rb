class TrainInformationsCreator
  def self.create
    trainInfomationHTML = Nokogiri::HTML(open('https://transit.yahoo.co.jp/traininfo/area/4/'))
    
    trainInformations = []
    trainInfomationHTML.css('div#mdStatusTroubleLine tr').each do |rowElement|
      tableDatas = rowElement.css('td')
      train = tableDatas[0]
      status = tableDatas[1]
      detail = tableDatas[2]

      trainInformation = TrainInformation.new(train, status, detail)

      trainInformations.push(trainInformation)
    end

    return trainInformations
  end
end