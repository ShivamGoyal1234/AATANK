

function fadeIn(element) {
    var hud = document.getElementById(element);
    hud.style.display = 'flex';

    var opacity = 0;
    if (hud.style.opacity < 1) {
        var fadeInInterval = setInterval(function() {
            if (opacity < 1) {
                opacity += 0.05;
                hud.style.opacity = opacity;
            } else {
                clearInterval(fadeInInterval);
            }
        }, 0);
    }
}
function fadeOut(element) {
    var hud = document.getElementById(element);
    var opacity = 1;
    if (hud.style.opacity > 0) {
        var fadeOutInterval = setInterval(function() {
            if (opacity > 0) {
                opacity -= 0.05;
                hud.style.opacity = opacity;
            } else {
                hud.style.display = 'none';
                clearInterval(fadeOutInterval);
            }
        }, 0);
    }
}

function slowFadeOut(element) {
    var hud = document.getElementById(element);
    var opacity = 1;
    if (hud.style.opacity > 0) {
        var fadeOutInterval = setInterval(function() {
            if (opacity > 0) {
                opacity -= 0.01;
                hud.style.opacity = opacity;
            } else {
                hud.style.display = 'none';
                clearInterval(fadeOutInterval);
            }
        }, 0);
    }
}

