var locales = {};
var audioPlayer;
const radarWrapper = $('.radar-wrapper');

const ToggleRadar = ((state) => {
    if (state) {
        radarWrapper.css('display', 'flex');
        radarWrapper.animate({
            opacity: '0.93'
        }, 300);
    } else {
        radarWrapper.animate({
            opacity: '0.0'
        }, 300);
        setTimeout(() => {
            radarWrapper.css('display', 'none');
        }, 300);
    }
})

const UpdateRadar = ((data) => {
    for (const [radarSide, radarInfo] of Object.entries(data)) {
        const radarSideWrapper = $(`.${radarSide}-side`);
        radarSideWrapper.find('.radar-speed-value').text(radarInfo.speed);
        radarSideWrapper.find('.radar-plate-value').text(radarInfo.plate);
    }
})

const LockRadar = ((side, value) => {
    const radarStatus = $(`.${side}-side .radar-status`);
    if (value) {
        radarStatus.removeClass('unlocked');
        radarStatus.addClass('locked');
        radarStatus.text(locales['radar_locked']);
        PlayAudio('radar_lock', 0.2);
    } else {
        radarStatus.removeClass('locked');
        radarStatus.addClass('unlocked');
        radarStatus.text(locales['radar_unlocked']);
        PlayAudio('radar_unlock', 0.2);
    }
})

const PlayAudio = ((file, volume) => {
    if (audioPlayer) {
        audioPlayer.pause();
    }

    audioPlayer = new Howl({src: ["./sounds/" + file + ".ogg"]});
    audioPlayer.volume(volume || 0.3);
    audioPlayer.play();
})

document.addEventListener('DOMContentLoaded', function () {
    setTimeout(() => {
        $.post('https://p_policejob/NUILoaded').then(data => {
            locales = data;
            radarWrapper.html(`
        <div class="radar-side front-side">
            <span>${locales['radar_front_antena']}</span>
            <hr>
            <div class="radar-status unlocked">${locales['radar_unlocked']}</div>
            <div class="radar-speed">
                <div class="radar-speed-header">${locales['radar_speed']}</div>
                <span class="radar-speed-value">0</span>
            </div>
            <div class="radar-plate">
                <img src="images/plateholder.png" alt="">
                <span class="radar-plate-value"></span>
            </div>
        </div>
        <div class="radar-side rear-side">
            <span>${locales['radar_rear_antena']}</span>
            <hr>
            <div class="radar-status unlocked">${locales['radar_unlocked']}</div>
            <div class="radar-speed">
                <div class="radar-speed-header">${locales['radar_speed']}</div>
                <span class="radar-speed-value">0</span>
            </div>
            <div class="radar-plate">
                <img src="images/plateholder.png" alt="">
                <span class="radar-plate-value"></span>
            </div>
        </div>`)
        const radarWrapper2 = document.querySelector('.radar-wrapper');
        if (!radarWrapper2) return;
    
        let isDragging = false;
        let isResizing = false;
        let startX, startY, startLeft, startTop, startWidth;
    
        const resizeHandle = document.createElement('div');
        resizeHandle.style.width = '10px';
        resizeHandle.style.height = '10px';
        resizeHandle.style.backgroundColor = '#252b34';
        resizeHandle.style.position = 'absolute';
        resizeHandle.style.bottom = '0';
        resizeHandle.style.right = '0';
        resizeHandle.style.cursor = 'nwse-resize';
        radarWrapper2.appendChild(resizeHandle);
    
        radarWrapper2.addEventListener('mousedown', (e) => {
            if (e.target === resizeHandle) return;
            isDragging = true;
            startX = e.clientX;
            startY = e.clientY;
            const rect = radarWrapper2.getBoundingClientRect();
            startLeft = rect.left;
            startTop = rect.top;
            document.addEventListener('mousemove', handleDrag);
            document.addEventListener('mouseup', stopDragging);
        });
    
        function handleDrag(e) {
            if (!isDragging) return;
            const dx = e.clientX - startX;
            const dy = e.clientY - startY;
            radarWrapper2.style.position = 'absolute';
            radarWrapper2.style.right = `unset`;
            radarWrapper2.style.bottom = `unset`;
            radarWrapper2.style.left = `${startLeft + dx}px`;
            radarWrapper2.style.top = `${startTop + dy}px`;
        }
    
        function stopDragging() {
            isDragging = false;
            document.removeEventListener('mousemove', handleDrag);
            document.removeEventListener('mouseup', stopDragging);
        }
    
        resizeHandle.addEventListener('mousedown', (e) => {
            e.stopPropagation();
            isResizing = true;
            startX = e.clientX;
            startY = e.clientY;
            const rect = radarWrapper2.getBoundingClientRect();
            startWidth = rect.width;
            startHeight = rect.height;
            document.addEventListener('mousemove', handleResize);
            document.addEventListener('mouseup', stopResizing);
        });
    
        function handleResize(e) {
            if (!isResizing) return;
            const dx = e.clientX - startX;
            const dy = e.clientY - startY;
            const newWidth = startWidth + dx;
            const scale = newWidth / startWidth;
            radarWrapper2.style.transformOrigin = 'top left';
            radarWrapper2.style.transform = `scale(${scale})`;
    
        }
    
        function stopResizing() {
            isResizing = false;
            document.removeEventListener('mousemove', handleResize);
            document.removeEventListener('mouseup', stopResizing);
        }
        })
    }, 100);
});

const getNowDate = (() => {
    let date = new Date();
    let month = (date.getMonth() + 1).toString().padStart(2, '0');
    let day = date.getDate().toString().padStart(2, '0')
    let hour = date.getHours().toString().padStart(2, '0');
    let minutes = date.getMinutes().toString().padStart(2, '0');
    let seconds = date.getSeconds().toString().padStart(2, '0');
    return `${date.getFullYear()}-${month}-${day} ${hour}:${minutes}:${seconds}`
})

const bodyCamWrapper = $('.bodycam-wrapper');
let bodyCamInterval;
const ToggleBodyCam = ((data, state) => {
    if (bodyCamInterval) {
        clearInterval(bodyCamInterval);
        bodyCamInterval = null;
    }
    if (state) {
        $('.bodycam-info').html(`<span>${getNowDate()}</span><span>${data.name} - ${data.badge}</span>`);
        bodyCamWrapper.animate({opacity: '1.0'});
        bodyCamInterval = setInterval(() => {
            $('.bodycam-info').html(`<span>${getNowDate()}</span><span>${data.name} - ${data.badge}</span>`);
        }, 1000);
    } else {
        bodyCamWrapper.animate({opacity: '0.0'});
    }
})

const radioWrapper = $('.radiolist-wrapper');
const ToggleRadio = ((state) => {
    radioWrapper.css({
        left: state ? '1rem' : '-20rem',
        opacity: state ? '1.0' : '0.0'
    })
})

let radioData = [];
let radioPage = 0;
const UpdateRadio = ((channel, data) => {
    let newUsers = ``;
    let totalUsers = 0;
    if (data) {
        radioData = [];
        for (const user of data) {
            if (user && user.name) {
                let currentPage = radioData.length - 1;
                if (currentPage === -1 || radioData[currentPage].length >= 9) {
                    radioData.push([]);
                    currentPage++;
                }
                radioData[currentPage].push(user);
                totalUsers++;
            }
        }
    }
    
    if (radioData[radioPage]) {
        for (const user of radioData[radioPage]) {
            newUsers = newUsers + `
            <div class="radio-user" id="user-${user.player}">
                <span>${user.name} ${user.badge ? `[${user.badge}]` : ``}</span>
                ${user.isDead ? `<i class="fa-solid fa-skull-crossbones"></i>` : user.talking ? `<i class="fa-solid fa-microphone"></i>` : ``}
            </div>`
        }
    }

    $('.radiolist-header').html(`
    <div>CH${channel}</div>
    <div>
        <i class="fa-light fa-user"></i>
        <span>${totalUsers}</span>
    </div>`)
    $('.radio-users').html(newUsers);
})

const playerRadioTalk = ((player, state) => {
    const userWrapper = $(`#user-${player}`);
    if (!userWrapper || userWrapper.length < 1) return;
    userWrapper.find('i').remove();
    if (state) {
        userWrapper.append(`<i class="fa-thin fa-microphone"></i>`);
    }
})

const playerRadioDead = ((player, state) => {
    const userWrapper = $(`#user-${player}`);
    if (!userWrapper || userWrapper.length < 1) return;
    userWrapper.find('i').remove();
    if (state) {
        userWrapper.append(`<i class="fa-solid fa-skull-crossbones"></i>`);
    }
})

let inPhoto = false;
window.addEventListener("message", (event) => {
    let data = event.data;
    switch(data.action) {
        case 'PlayAudio':
            PlayAudio(data.audio.file, data.audio.vol);
            break;
        case 'ToggleHeadBag':
            $('.headbag-wrapper').css('display', data.state ? 'flex' : 'none');
            break;
        case 'ToggleRadar':
            ToggleRadar(data.state);
            break;
        case 'UpdateRadar':
            UpdateRadar(data.radar);
            break;
        case 'LockRadar':
            LockRadar(data.side, data.value);
            break;
        case 'ToggleBodyCam':
            ToggleBodyCam(data.data, data.state);
            break;
        case 'ShowPhoto':
            inPhoto = true;
            $('.photo-wrapper > img').attr('src', data.photoURL);
            $('.photo-wrapper').css('display', 'flex');
            break;
        case 'ToggleRadio':
            ToggleRadio(data.state);
            break;
        case 'UpdateRadio':
            UpdateRadio(data.channel, data.data);
            break;
        case 'playerTalking':
            playerRadioTalk(data.player, data.talking);
            break;
        case 'playerDead':
            playerRadioDead(data.player, data.state);
            break;
        case 'ChangeRadioPage':
            let newPage = radioPage + data.page;
            if (!radioData[newPage]) return;

            radioPage = newPage;
            UpdateRadio(data.channel);
            break;
    }
})

document.onkeydown = ((e) => {
    if (e.which == 27) {
        if (inPhoto) {
            $('.photo-wrapper').css('display', 'none');
            inPhoto = false;
        }
        $.post('https://p_policejob/CloseUI');
    }
})