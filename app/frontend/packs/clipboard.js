import * as Clipboard from 'clipboard';

$(document).ready(function(){
    var clipboard = new Clipboard('.copy_button');

    clipboard.on('success', function(e) {
        var button = e.trigger

        const currentLabel = button.innerHTML;

        if(button.innerHTML === 'Copied!'){
            return;
        }

        button.innerHTML = 'Copied!';

        setTimeout(function(){
            button.innerHTML = currentLabel;
        }, 3000)
    });

    clipboard.on('error', function(e) {
        console.log(e);
    });
});
