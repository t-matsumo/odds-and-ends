class TrainInformation
  attr_reader :train, :status, :detail

  def initialize(train, status, detail)
    @train = train
    @status = status
    @detail = detail
  end
end