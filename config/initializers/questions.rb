Rails.application.config.spotlight = OpenStruct.new
Rails.application.config.spotlight.questions = {
  this_thats: [
    {
      name: :this_1,
      left: {
        name: 'Graffiti',
        image: 'graffiti.png'
      },
      right: {
        name: 'Nature',
        image: 'nature.png'
      }
    }
  ]
}.with_indifferent_access
