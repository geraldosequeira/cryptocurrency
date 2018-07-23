jQuery(document).ready(function($) {
    
    $("#convert").click(function(e){
        convert(e);
    });

    $("#coin-change").click(function(e){
        coinChange(e);
    });

    $("#convert-btc").click(function(e){
        convertBtc(e);
    });

    $("#amount").setMask("decimal");
  });

  function convert(e) {
    e.preventDefault();
      $.ajax({
        url: "/convert",
        data: {
            source_currency: $("#source_currency").val(),
            target_currency: $("#target_currency").val(),
            amount: $("#amount").val()
        },
         type: "GET",
         dataType: "json",
         async : false,
         beforeSend: function(xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
         },
         success: function(response){
            $('#result').val(float2(response.value));
        },error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(thrownError);
          }
    });
  }

  function convertBtc(e) {
    e.preventDefault();
      $.ajax({
        url: "/convert-btc",
        data: {
            source_currency: $("#source_currency").val(),
            target_currency: $("#target_currency").val(),
            amount: $("#amount").val()
        },
         type: "GET",
         dataType: "json",
         async : false,
         beforeSend: function(xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
         },
         success: function(response){
            alert("Você pode comprar: "+response.value);
        },error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(thrownError);
          }
    });
  }

  function coinChange(e){
    var source_currency = $('#source_currency').val();
    var target_currency = $('#target_currency').val();
    
    $('#source_currency').val(target_currency);
    $('#target_currency').val(source_currency);

    convert(e);
  }

  function float2(num) {
    x = 0;

    if (num < 0) {
        num = Math.abs(num);
        x = 1;
    }

    if (isNaN(num))
        num = "0";

    cents = Math.floor((num * 100 + 0.5) % 100);

    num = Math.floor((num * 100 + 0.5) / 100).toString();

    if (cents < 10)
        cents = "0" + cents;

    for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
        num = num.substring(0, num.length - (4 * i + 3)) + '.' + num.substring(num.length - (4 * i + 3));

    ret = num + ',' + cents;

    if (x == 1)
        ret = ' - ' + ret;

    return ret;
  }
  
  