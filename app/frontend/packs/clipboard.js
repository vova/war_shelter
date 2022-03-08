import * as Clipboard from 'clipboard';

$(document).ready(function(){
    var clipboard = new Clipboard('.copy_button');

    clipboard.on('success', function(e) {
        var button = e.trigger

        const currentLabel = button.innerHTML;

        // Exit label update when already in progress
        if(button.innerHTML === 'Copied!'){
            return;
        }

        button.innerHTML = 'Copied!';

        // Revert button label after 3 seconds
        setTimeout(function(){
            button.innerHTML = currentLabel;
        }, 3000)
    });

    clipboard.on('error', function(e) {
        console.log(e);
    });
});
