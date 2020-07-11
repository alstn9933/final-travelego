function twsConnect() {
  var url = window.location.host;
  tws = new WebSocket("ws://" + url + "/together/tws.do");
  const memberId = "${sessionScope.member.memberId}";
  tws.onopen = function () {
    const msg = {
      type: "register",
      memberId: memberId,
    };
    tws.send(JSON.stringify(msg));
  };
  tws.onmessage = function (e) {
    console.log(e);
    const notify = $(".notify_area");
    notify.show();
    let currentNum = notify.find("#newCount").html().substr(1);
    notify.find("#newCount").html("+" + eval(Number(currentNum) + 1));
    let currentLoad = notify.attr("loadNum");
    if (currentLoad == undefined) {
      notify.attr("loadNum", e.data);
    } else {
      notify.attr("loadNum", currentLoad + "," + e.data);
    }
  };
  tws.onclose = function () {
    const msg = {
      type: "exit",
      memberId: memberId,
    };
    tws.send(JSON.stringify(msg));
  };
}

twsConnect();
