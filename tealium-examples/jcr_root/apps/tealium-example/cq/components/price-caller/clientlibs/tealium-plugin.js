;(function($) {

    var additionalAsyncMethod = 'async-method';
    var productDataCaller = 'product-data-caller';
    var elementToListen = jQuery('.tealium-price-caller');

    TealiumAsyncJsManager.enableDebug();

    TealiumAsyncJsManager.registerMethod(productDataCaller, elementToListen);
    TealiumAsyncJsManager.registerMethod(additionalAsyncMethod , elementToListen);

    function getProductData() {
        var url = elementToListen.data('page-path');
        jQuery.ajax({
            async: true,
            cache: false,
            type: "GET",
            url: url + '/jcr:content/par/product.json',
            dataType: 'json',
            success: function(data) {
                console.log('Received response:', data);
                if (data.price) {
                    data.price = data.price.replace('$', '');
                }
                elementToListen.trigger(productDataCaller, data);

                makeAdditionalAsyncCall();
            },
            error: function(data) {
                console.log('Error is occurred. Unregistering events.');
                TealiumAsyncJsManager.deregisterMethod(productDataCaller, elementToListen);
                TealiumAsyncJsManager.deregisterMethod(additionalAsyncMethod , elementToListen);
            }
        });
    }

    function makeAdditionalAsyncCall() {
        jQuery.ajax({
            async: true,
            cache: false,
            type: "GET",
            url: 'http://jsonplaceholder.typicode.com/posts?userId=1',
            dataType: 'json',
            success: function(data) {
                console.log('Received response:', data);
                elementToListen.trigger(additionalAsyncMethod , data);
            },
            error: function(data) {
                console.log('Error is occurred. Unregistering events.');
                TealiumAsyncJsManager.deregisterMethod(additionalAsyncMethod , elementToListen);
            }
        });
    }

    jQuery(document).ready(getProductData);

})(jQuery);