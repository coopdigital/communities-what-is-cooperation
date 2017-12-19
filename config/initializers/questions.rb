Rails.application.config.spotlight = OpenStruct.new
Rails.application.config.spotlight.questions = {
  this_thats: [
    {
      name: :this_1,
      left: {
        name: 'plant some trees'
      },
      right: {
        name: 'learn to play a musical instrument'
      }
    }
  ]
}.with_indifferent_access
