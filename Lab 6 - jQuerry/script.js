function hideMe(){
  if($("#element").attr("visible") == "yes"){
      $("#element").fadeOut(500);
      $("#element").attr("visible", "no");
      $(".click").text("show me");
  } else {
      $("#element").fadeIn(500);
      $("#element").attr("visible", "yes");
      $(".click").text("hide me");
  }
}

function makeResizableDiv() {
  const element = $('#element');
  const resizers = $('#element .resizer')

  const minimSize = 200;
  let original_width = 0;
  let original_height = 0;
  let original_x = 0;
  let original_y = 0;
  let original_mouse_x = 0;
  let original_mouse_y = 0;

  for (let i = 0; i < resizers.length; i++) {
    const currentResizer = resizers[i];
    $(currentResizer).on('mousedown', function(e) {
      e.preventDefault() 
      original_width = parseFloat($(element).css('width'));
      original_height = parseFloat($(element).css('height'));
      original_x = $(element).offset().left;
      original_y = $(element).offset().top;
      original_mouse_x = e.pageX;
      original_mouse_y = e.pageY;
     
      $(window).on('mousemove', resize)
      $(window).on('mouseup', stopResize)
    })
    
    function resize(e) {
      if ($(currentResizer).hasClass("bottom-right")) {
        let width = e.pageX - original_x;
        let height = e.pageY - original_y;
        if(width > minimSize){
          element.css("width", width)
        }
        if(height > minimSize){
          element.css("height", height)
        }
      }
      else
      if($(currentResizer).hasClass("bottom-left")){
        let width = original_width - (e.pageX - original_mouse_x);
        let height = original_height + (e.pageY - original_mouse_y);
        let left = original_x + (e.pageX - original_mouse_x);

        if(width > minimSize){
          element.css("width", width)
          element.css("left", left)
        }
        if(height > minimSize){
          element.css("height", height);
        }
      }
      else
      if($(currentResizer).hasClass("top-right")){
        let width = original_width + (e.pageX - original_mouse_x);
        let height = original_height - (e.pageY - original_mouse_y);
        let top = original_y + (e.pageY - original_mouse_y);

        if(width > minimSize){
          element.css("width", width)
        }
        if(height > minimSize){
          element.css("height", height);
          element.css("top", top)
        }
      }
      else{
        let width = original_width - (e.pageX - original_mouse_x);
        let height = original_height - (e.pageY - original_mouse_y);
        let top = original_y + (e.pageY - original_mouse_y);
        let left = original_x + (e.pageX - original_mouse_x);

        if(width > minimSize){
          element.css("width", width);
          element.css("left", left);
        }
        if(height > minimSize){
          element.css("height", height);
          element.css("top", top);
        }
      }
    }
    
    function stopResize() {
      $(window).off('mousemove', resize)
    }
  }
}

makeResizableDiv()