function showAvatar(file) {
			var $avatarUp = $('#avatar-up'), 
			  $avatarBtn = $('#avatarBtn');

			if ($avatarBtn[0].files.length) {
				$avatarUp.show();
			}
			if (!file.files || !file.files[0]) {
				return;
			}
			var reader = new FileReader();
			reader.onload = function(evt) {
				document.getElementById('avatar').src = evt.target.result;
				
			}
			reader.readAsDataURL(file.files[0]);			
}
//tab 选项切换
var $tabList = $('.tab-list'),
    $tabContainer = $('.tab-container > div');

$tabList.on('click', function (e) {

    var $tag = $(e.target);

   /* $tag.siblings().removeClass('now').end().addClass('now');*/

    for (let index = 0; index < $tabContainer.length; index++) {
        var tar = $(($tabContainer)[index])

        if (tar.data('tabid') == $tag.data('tabid')) {
            tar.siblings().removeClass('now-tab').end().addClass('now-tab');
        }
    }
});