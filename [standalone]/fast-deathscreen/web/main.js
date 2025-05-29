const { createApp } = Vue;

$(document).ready((function() {
  $('#input').on('input', function() {
    var value = $(this).val();
    $(this).val(value.replace(/[^0-9]/g, ''));
  });
}));

window.postNUI = async (name, data) => {
  try {
    const response = await fetch(`https://fast-deathscreen/${name}`, {
      method: "POST",
      mode: "cors",
      cache: "no-cache",
      credentials: "same-origin",
      headers: {
        "Content-Type": "application/json"
      },
      redirect: "follow",
      referrerPolicy: "no-referrer",
      body: JSON.stringify(data)
    });
    return await response.json()
  } catch (error) {
    return null;
  }
};

const app = createApp({
  data() {
    return {
      isFlex: false,
      widthPercentage: 50,
      isRunning: false,
      minutes:0,
      secondes:0,
      time3162: 0,
      pressedg: false,
      againgbutton: 0,
      againhbutton: 0,
      pressedh: false,
      time:2,
      timer:null,
    };
  },
  methods: {
    start() {
      this.isRunning = true
      if (!this.timer) {
         this.timer = setInterval( () => {
           if (this.time > 0) {
              this.time--
           } else {
              this.widthPercentage = 0
              postNUI("timeFinished")
              clearInterval(this.timer)
              this.reset()
           }
         }, 1000 )
      }
    },
    stop() {
      this.isRunning = false
      clearInterval(this.timer)
      this.timer = null
    },
    reset() {
       this.stop()
       this.time = 0
       this.secondes = 0
       this.minutes = 0
    },
    messageHandler(event) {
      switch (event.data.action) {
        case "update":
          this.time3162 = event.data.timer;
          this.againgbutton = event.data.againgbutton * 1000;
          this.againhbutton = event.data.againhbutton * 1000;
          break;
        case "open":
          this.pressedh = false
          this.pressedg = false
          this.reset()
          this.time = this.time3162
          this.start()
          this.isFlex = true
          break;
        case "nopresse":
          this.widthPercentage = 0
          break;
        case "pressinge":
          if (this.widthPercentage < 101) {
            this.widthPercentage = this.widthPercentage + 1
          } else {
            postNUI("PressedE")
          }
          break;
        case "close":
          this.isFlex = false
          break;
        case "pressedg":
          if (!this.pressedg) {
            this.pressedg = true
            setTimeout(() => {
              this.pressedg = false
            }, this.againgbutton);
            postNUI("pressedg")
          }
          break;
        case "pressedh": 
          if (!this.pressedh) {
            this.pressedh = true
            setTimeout(() => {
              this.pressedh = false
            }, this.againhbutton);
            postNUI("pressedh")
          }
          break;
        default: break;
      };
    },
    keyHandler(e) {},
  },
  computed: {
    prettyTime() {
      let time = this.time / 60;
      let minutes = parseInt(time);
      let seconds = Math.round((time - minutes) * 60);
      return {
        minutes: minutes.toString().padStart(2, "0"),
        seconds: seconds.toString().padStart(2, "0"),
      };
    },
    minutesFirstDigit() {
      return this.prettyTime.minutes[0];
    },
    minutesSecondDigit() {
      return this.prettyTime.minutes[1];
    },
    secondsFirstDigit() {
      return this.prettyTime.seconds[0];
    },
    secondsSecondDigit() {
      return this.prettyTime.seconds[1];
    },
    menuColor() {
      return this.widthPercentage > 50 ? "rgba(0, 0, 0, 0.8)" : "#fff";
    },
    titleColor() {
      return this.widthPercentage > 50 ? "#000000" : "#fff";
    },
    titleColor2() {
      return this.widthPercentage > 50 ? "#fff" : "#000000";
    },
  },
  mounted() {
    window.addEventListener("message", this.messageHandler);
    window.addEventListener("keyup", this.keyHandler);
    postNUI("uiLoaded");
  },
  beforeDestroy() {
    window.removeEventListener("message", this.messageHandler);
    window.removeEventListener("keyup", this.keyHandler);
  },
});


app.mount("#app");