$(document).ready(function(){

  function logClickEvent(eventLabel, event){
    var link = $(event.target);
    var recommendation = link.parents('article.recommendation').first();
    logInteraction(recommendation.data('recommendation-id'), 'click', eventLabel);
  }

  function logInteraction(eventCategory, eventAction, eventLabel){
    console.log('Logging: ' + eventCategory + ':' + eventAction + ':' + eventLabel);
    if(typeof gtag != 'undefined'){
      gtag('event', 'recommendation_interaction', {
        event_category: eventCategory,
        event_action: eventAction,
        event_label: eventLabel
      });
    }
  }

  $('.recommendations-page a[target=_blank]').click(function(event){
    logClickEvent(event.target.href, event);
  });

  $('.recommendations-page a.not_for_me').click(function(event){
    logClickEvent('This isn\'t for me', event);

    var link = $(event.target);
    var recommendation = link.parents('article.recommendation').first();

    recommendation.find(".front").hide();
    recommendation.find(".back").show();

    return(false);
  });

  $('.recommendations-page a.interest').click(function(event){
    logClickEvent('Interest', event);
    // TODO: UI feedback
    return false;
  });
});
