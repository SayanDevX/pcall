// Use Tauri global API (no bundler needed)
const { isPermissionGranted, requestPermission, sendNotification } =
    window.__TAURI__?.notification ?? {};
const tauriWindow = window.__TAURI__?.window;


// Kick off video buffering immediately so it's ready when revealed
document.addEventListener('DOMContentLoaded', () => {
    const v = document.querySelector('.dog');
    if (!v) return;

    // Fetch the entire video into a Blob URL for instant, lag-free playback
    const videoSrc = v.getAttribute('src');
    fetch(videoSrc)
        .then(r => r.blob())
        .then(blob => {
            const blobUrl = URL.createObjectURL(blob);
            v.src = blobUrl;
            v.load();
            console.log('[preload] Video fully buffered as blob');
        })
        .catch(() => {
            // Fallback: just trigger normal preload
            v.load();
            console.warn('[preload] Blob preload failed, using default');
        });
});

let currentStep = 0;
const steps = document.querySelectorAll('.text_step');
let canSwipe = false;
let startY = 0;
let litCandles = 20;
let audioContext = null;
let micStream = null;
let analyser = null;
let blowDetectionActive = false;

// stages:
// 'texts'      = normal text swiping
// 'wait'       = first_date grid showing, waiting for swipe
// 'watching'   = video fading in, hint not shown yet
// 'video'      = video playing, "Swipe Again?" visible, ready for swipe
// 'outro'      = "Or These...?" text is visible, waiting for swipe
// 'funny_wait' = funny_pics grid showing, sorry hint not yet visible
// 'sorry'      = "sorry sorry not these" hint visible, ready for swipe
// 'meant'      = "I Meant This" text visible, waiting for swipe
// 'done'       = collage_1 showing, c_swipe1 visible, ready for swipe
// 'done2'      = collage_2 showing, c_swipe2 visible, ready for swipe
// 'final'      = happy + final_text showing, c_swipe_final visible, ready for swipe
// 'last_order' = last_order texts showing, waiting dot animation, click to stop
let stage = 'texts';

const outroSteps = document.querySelectorAll('.outro_step');

function nextText() {
    const btn = document.querySelector('.start_btn');
    btn.classList.add('fade_out');
    setTimeout(() => btn.style.display = 'none', 500);

    document.querySelector('.text_div').classList.add('show');
    steps[currentStep].classList.add('visible');
    canSwipe = true;
}

document.addEventListener('touchstart', e => {
    startY = e.touches[0].clientY;
});

document.addEventListener('touchend', e => {
    const diff = startY - e.changedTouches[0].clientY;
    if (diff > 80) handleSwipe();
});

document.addEventListener('wheel', e => {
    if (e.deltaY > 0) handleSwipe();
});

function handleSwipe() {
    if (!canSwipe) return;
    if (stage === 'texts')      advanceStep();
    else if (stage === 'wait')  revealVideo();
    else if (stage === 'video') revealOutro();
    else if (stage === 'outro') revealFunnyGrid();
    else if (stage === 'sorry') revealMeant();
    else if (stage === 'meant') revealFinalPic();
    else if (stage === 'done')  revealSecondPic();
    else if (stage === 'done2') revealFinalScreen();
    else if (stage === 'final') revealLastOrder();
}

function advanceStep() {
    if (currentStep >= steps.length - 1) return;
    canSwipe = false;

    const prev = currentStep;
    currentStep++;

    steps[prev].classList.remove('visible');
    steps[prev].classList.add('hidden');

    setTimeout(() => {
        steps[prev].classList.remove('hidden');
        steps[currentStep].classList.add('visible');

        if (currentStep === steps.length - 1) {
            setTimeout(() => {
                document.querySelector('.second_btn').classList.add('show');
            }, 1300);
        }

        setTimeout(() => canSwipe = true, 900);
    }, 700);
}

function nextImg() {
    const btn = document.querySelector('.second_btn');
    btn.classList.add('fade_out');
    setTimeout(() => btn.style.display = 'none', 400);

    const lastStep = steps[steps.length - 1];
    lastStep.classList.remove('visible');
    lastStep.classList.add('hidden');
    setTimeout(() => lastStep.classList.remove('hidden'), 600);

    setTimeout(() => {
        document.querySelector('.memory_div').classList.add('show');
        document.querySelector('.memory_line1').classList.add('visible');
    }, 800);

    setTimeout(() => {
        document.querySelector('.memory_line2').classList.add('visible');
    }, 800);

    setTimeout(() => {
        document.querySelector('.memory_line1').classList.remove('visible');
        document.querySelector('.memory_line1').classList.add('hidden');
        document.querySelector('.memory_line2').classList.remove('visible');
        document.querySelector('.memory_line2').classList.add('hidden');
    }, 2500);

    setTimeout(() => {
        document.querySelector('.memory_div').classList.remove('show');
        const grid = document.querySelector('.first_date');
        grid.classList.add('show');

        const gridImgs = grid.querySelectorAll('img');
        gridImgs.forEach((img, i) => {
            setTimeout(() => img.classList.add('grid_visible'), i * 500);
        });

        setTimeout(() => {
            stage = 'wait';
            document.querySelector('.swipe_hint').classList.add('visible');
        }, 3 * 500 + 3000);

    }, 3000);
}

function revealVideo() {
    stage = 'watching';
    canSwipe = false;

    document.querySelector('.swipe_hint').classList.remove('visible');
    document.querySelector('.swipe_hint').classList.add('hidden');
    document.querySelector('.first_date').classList.remove('show');

    setTimeout(() => {
        const video = document.querySelector('.dog');
        video.classList.add('show');
        video.play();

        setTimeout(() => {
            document.querySelector('.again_hint').classList.add('visible');
            stage = 'video';
            canSwipe = true;
        }, 6000);
    }, 800);
}

function revealOutro() {
    stage = 'outro';
    canSwipe = false;

    document.querySelector('.again_hint').classList.remove('visible');
    document.querySelector('.again_hint').classList.add('hidden');

    const video = document.querySelector('.dog');
    video.classList.remove('show');
    video.pause();

    // Show "Or These...?" — user must swipe again to proceed
    setTimeout(() => {
        document.querySelector('.outro_div').classList.add('outro_show');
        outroSteps[0].classList.add('visible');
        setTimeout(() => canSwipe = true, 900);
    }, 800);
}

function revealFunnyGrid() {
    stage = 'funny_wait';
    canSwipe = false;

    outroSteps[0].classList.remove('visible');
    outroSteps[0].classList.add('hidden');

    setTimeout(() => {
        outroSteps[0].classList.remove('hidden');
        document.querySelector('.outro_div').classList.remove('outro_show');

        const funny = document.querySelector('.funny_pics');
        funny.classList.add('funny_show');

        const funnyImgs = funny.querySelectorAll('img');
        funnyImgs.forEach((img, i) => {
            setTimeout(() => img.classList.add('grid_visible'), i * 150);
        });

        setTimeout(() => {
            document.querySelector('.sorry_hint').classList.add('visible');
            stage = 'sorry';
            canSwipe = true;
        }, 6000);

    }, 600);
}

function revealMeant() {
    stage = 'meant';
    canSwipe = false;

    document.querySelector('.sorry_hint').classList.remove('visible');
    document.querySelector('.sorry_hint').classList.add('hidden');
    document.querySelector('.funny_pics').classList.remove('funny_show');

    // Show "I Meant This" — user must swipe again to proceed
    setTimeout(() => {
        document.querySelector('.meant_div').classList.add('outro_show');
        document.querySelector('.meant_step').classList.add('visible');
        // After meant_step fades in, show sub-lines together
        setTimeout(() => {
            document.querySelector('.meant_step2').classList.add('visible');
            document.querySelector('.meant_step3').classList.add('visible');
            setTimeout(() => canSwipe = true, 600);
        }, 800);
    }, 700);
}

function revealFinalPic() {
    stage = 'done';
    canSwipe = false;

    document.querySelector('.meant_step').classList.remove('visible');
    document.querySelector('.meant_step').classList.add('hidden');
    document.querySelector('.meant_step2').classList.remove('visible');
    document.querySelector('.meant_step2').classList.add('hidden');
    document.querySelector('.meant_step3').classList.remove('visible');
    document.querySelector('.meant_step3').classList.add('hidden');

    setTimeout(() => {
        document.querySelector('.meant_div').classList.remove('outro_show');
        document.querySelector('.collage_1').classList.add('show');

        setTimeout(() => {
            document.querySelector('.c_swipe1').classList.add('visible');
            canSwipe = true;
        }, 6000);
    }, 700);
}

function revealSecondPic() {
    stage = 'done2';
    canSwipe = false;

    document.querySelector('.c_swipe1').classList.remove('visible');
    document.querySelector('.c_swipe1').classList.add('hidden');

    setTimeout(() => {
        document.querySelector('.collage_1').classList.add('hide');
        document.querySelector('.collage_2').classList.add('show');

        setTimeout(() => {
            document.querySelector('.c_swipe2').classList.add('visible');
            canSwipe = true;
        }, 6000);
    }, 700);
}

function revealFinalScreen() {
    stage = 'final';
    canSwipe = false;

    document.querySelector('.c_swipe2').classList.remove('visible');
    document.querySelector('.c_swipe2').classList.add('hidden');

    setTimeout(() => {
        document.querySelector('.collage_2').classList.remove('show');
        document.querySelector('.final_screen').classList.add('show');

        setTimeout(() => {
            document.querySelector('.happy').classList.add('visible');
            document.querySelector('.final_text').classList.add('visible');
            canSwipe = true;
        }, 400);
    }, 700);
}

let dotsInterval = null;

function revealLastOrder() {
    stage = 'last_order';
    canSwipe = false;

    setTimeout(() => {
        document.querySelector('.final_screen').classList.remove('show');
        document.querySelector('.last_order').classList.add('show');

        setTimeout(() => {
            document.querySelector('.forgot').classList.add('visible');
            document.querySelector('.order').classList.add('visible');
            document.querySelector('.delivery').classList.add('visible');
            document.querySelector('.waiting').classList.add('visible');

            // Animate dots cycling 3→4→5→3→...
            const waitingEl = document.querySelector('.waiting');
            const dotCounts = [3, 4, 5];
            let dotIndex = 0;
            waitingEl.textContent = 'Waiting' + '.'.repeat(dotCounts[dotIndex]);

            dotsInterval = setInterval(() => {
                dotIndex = (dotIndex + 1) % dotCounts.length;
                waitingEl.textContent = 'Waiting' + '.'.repeat(dotCounts[dotIndex]);
            }, 600);

            // Fire notification 800ms after all text finishes appearing.
            // The slowest CSS transition is .waiting (0.75s delay + 0.6s duration = 1.35s)
            // So: 1350ms (text done) + 800ms (user delay) = 2150ms after .visible added
            setTimeout(requestAndNotify, 2150);
        }, 400);

    }, 1600);
}

let notificationDelivered = false;

async function requestAndNotify() {
    let granted = await isPermissionGranted();
    if (!granted) {
        const perm = await requestPermission();
        granted = perm === 'granted';
    }
    if (!granted) {
        // Fallback: no notification, just show cake after dots
        setTimeout(() => { stopDots(); revealDelivery(); }, 3000);
        return;
    }

    sendNotification({
        title: 'Your Order Has Arrived! 🎁',
        body: 'Click to see what it is!',
    });
    notificationDelivered = true;

    // Listen for the app window getting focused (user clicked notification)
    if (tauriWindow) {
        const appWindow = tauriWindow.getCurrentWindow();
        const unlisten = await appWindow.onFocusChanged(({ payload: focused }) => {
            if (focused && notificationDelivered) {
                notificationDelivered = false;
                unlisten(); // stop listening
                stopDots();
                revealDelivery();
            }
        });
    }

    // Also allow clicking the waiting text as fallback
    const waitingEl = document.querySelector('.waiting');
    waitingEl.style.cursor = 'pointer';
    waitingEl.title = 'Click to open your gift!';
    waitingEl.addEventListener('click', () => {
        notificationDelivered = false;
        stopDots();
        revealDelivery();
    }, { once: true });

    // Auto-reveal fallback after 30s
    setTimeout(() => {
        if (notificationDelivered) {
            notificationDelivered = false;
            stopDots();
            revealDelivery();
        }
    }, 30000);
}

function stopDots() {
    if (dotsInterval) {
        clearInterval(dotsInterval);
        dotsInterval = null;
        document.querySelector('.waiting').textContent = 'Waiting.....';
    }
}

function revealDelivery() {
    const parent = document.querySelector('.parent_div');
    parent.style.transition = 'opacity 0.8s ease-out';
    parent.style.opacity = '0';

    setTimeout(() => {
        parent.style.display = 'none';
        const scene = document.querySelector('.cake-scene');
        scene.style.display = 'flex';
        requestAnimationFrame(() => requestAnimationFrame(() => {
            scene.style.opacity = '1';
            // Auto-start mic detection after a short delay
            setTimeout(startMicDetection, 1500);
        }));
    }, 800);
}

/* ── Pixel-art cake blow detection (from test project) ── */
let blown = false;

async function startMicDetection() {
    try {
        const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
        micStream = stream;
        audioContext = new (window.AudioContext || window.webkitAudioContext)();
        const source = audioContext.createMediaStreamSource(stream);
        analyser = audioContext.createAnalyser();
        analyser.fftSize = 256;
        source.connect(analyser);

        const dataArray = new Uint8Array(analyser.frequencyBinCount);
        const THRESHOLD = 120;
        const FRAMES_NEED = 8;
        let frameCount = 0;

        function detectBlow() {
            if (blown) return;

            analyser.getByteFrequencyData(dataArray);
            // Low-frequency average — blowing is mostly low-frequency noise
            const avg = dataArray.slice(0, 10).reduce((a, b) => a + b, 0) / 10;

            if (avg > THRESHOLD) {
                frameCount++;
                if (frameCount >= FRAMES_NEED) {
                    blown = true;
                    extinguishCandles();
                    return;
                }
            } else {
                frameCount = 0;
            }

            requestAnimationFrame(detectBlow);
        }

        detectBlow();
    } catch (err) {
        console.error('Mic error:', err);
        enableClickFallback();
    }

    // Always allow click as fallback too
    enableClickFallback();
}

function enableClickFallback() {
    const scene = document.querySelector('.cake-scene');
    if (scene._clickBound) return;
    scene._clickBound = true;
    scene.addEventListener('click', () => {
        if (!blown) {
            blown = true;
            extinguishCandles();
        }
    });
}

function extinguishCandles() {
    // Add 'blown' class to all candle elements
    const candles = document.querySelectorAll('.green-candle, .purple-candle, .yellow-candle, .blue-candle');
    candles.forEach(c => c.classList.add('blown'));

    // After candle blow-out animation, fade out cake and show Happy Birthday
    setTimeout(showCakeHappyBirthday, 1500);
}

function showCakeHappyBirthday() {
    stopBlowDetection();

    // Fade out the cake and hint
    const cakeOuter = document.querySelector('.cake-scene .cake-container');
    if (cakeOuter) {
        cakeOuter.style.transition = 'opacity 1s ease-out';
        cakeOuter.style.opacity = '0';
    }

    // After cake fades, show big Happy Birthday overlay
    setTimeout(() => {
        if (cakeOuter) cakeOuter.style.display = 'none';
        const overlay = document.querySelector('.cake-hb-overlay');
        if (overlay) overlay.classList.add('visible');
    }, 1000);
}

function stopBlowDetection() {
    blowDetectionActive = false;
    if (micStream) { micStream.getTracks().forEach(t => t.stop()); micStream = null; }
    if (audioContext) { audioContext.close().catch(() => {}); audioContext = null; }
}