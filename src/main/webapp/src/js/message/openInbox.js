$("#openInbox").click(function () {
    const url = "/message/inbox.do";
    const title = "쪽지함";
    const status =
      "width=617px, height=700px, menubar=no, status=no, toolbar=no";

    const inboxPopup = window.open(url, title, status);
  });