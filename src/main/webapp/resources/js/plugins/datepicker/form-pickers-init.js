(function($) {
    "use strict"


    // MAterial Date picker
   /* $('#mdate').bootstrapMaterialDatePicker({
        weekStart: 0,
        time: false
    });
    $('#timepicker').bootstrapMaterialDatePicker({
        format: 'HH:mm',
        time: true,
        date: false
    });
    $('#date-format').bootstrapMaterialDatePicker({
        format: 'dddd DD MMMM YYYY - HH:mm'
    });

    $('#min-date').bootstrapMaterialDatePicker({
        format: 'DD/MM/YYYY HH:mm',
        minDate: new Date()
    });
    
    // Clock pickers
    $('#single-input').clockpicker({
        placement: 'bottom',
        align: 'left',
        autoclose: true,
        'default': 'now'
    });
    $('.clockpicker').clockpicker({
        donetext: 'Done',
    }).find('input').change(function() {
        console.log(this.value);
    });
    
    $('#check-minutes').click(function(e) {
        // Have to stop propagation here
        e.stopPropagation();
        input.clockpicker('show').clockpicker('toggleView', 'minutes');
    });
    if (/mobile/i.test(navigator.userAgent)) {
        $('input').prop('readOnly', true);
    }
    // Colorpicker
    $(".colorpicker").asColorPicker();
    $(".complex-colorpicker").asColorPicker({
        mode: 'complex'
    });
    $(".gradient-colorpicker").asColorPicker({
        mode: 'gradient'
    });*/
	
    // Date Picker
    jQuery('.mydatepicker, #datepicker').datepicker();
    
    jQuery('#datepicker-autoclose').datepicker({
        autoclose: true,
        todayHighlight: true,
        language: "ko"
    });
    
    jQuery('#date-range').datepicker({
        toggleActive: true
    });
    jQuery('#datepicker-inline').datepicker({
        todayHighlight: true
    });
    
    // Daterange picker
    // locale 을 통해 한글로 변경, class지정, 원하는 형식으로 출력.
    $('.input-daterange-datepicker').daterangepicker({
    	 startDate: moment(),
         endDate: moment().subtract(-1, 'days'),
    	"locale": {
    		format: 'YYYY-MM-DD',
    		buttonClasses: ['btn'],
    		applyClass: 'okBtn',
    		cancelClass: 'cancelBtn',
    		"daysOfWeek": [
                "일",
                "월",
                "화",
                "수",
                "목",
                "금",
                "토"
            ],
            "monthNames": [
                "1월",
                "2월",
                "3월",
                "4월",
                "5월",
                "6월",
                "7월",
                "8월",
                "9월",
                "10월",
                "11월",
                "12월"
            ],
            "firstDay": 1
    	}
    });
    $('.input-daterange-timepicker').daterangepicker({
        timePicker: true,
        timePickerIncrement: 60,
        timePicker24Hour: true,
        timePickerSeconds: false,
       	"locale": {
       		format: 'YYYY-MM-DD H:mm',
       		buttonClasses: ['btn'],
       		applyClass: 'okBtn',
       		cancelClass: 'cancelBtn',
       		"daysOfWeek": [
                   "일",
                   "월",
                   "화",
                   "수",
                   "목",
                   "금",
                   "토"
               ],
               "monthNames": [
                   "1월",
                   "2월",
                   "3월",
                   "4월",
                   "5월",
                   "6월",
                   "7월",
                   "8월",
                   "9월",
                   "10월",
                   "11월",
                   "12월"
               ],
               "firstDay": 1
       	}
    });
    $('.input-limit-datepicker').daterangepicker({
        format: 'YYYY-MM-DD',
        minDate: '06/01/2015',
        maxDate: '06/30/2015',
        buttonClasses: ['btn', 'btn-sm'],
        applyClass: 'btn-danger',
        cancelClass: 'btn-inverse',
        dateLimit: {
            days: 6
        }
    });

})(jQuery);