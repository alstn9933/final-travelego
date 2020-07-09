$("#openInbox").on("click", openInbox);

function openInbox() {
  const url = "/message/inbox.do";
  const title = "쪽지함";
  const status = "width=617px, height=700px, menubar=no, status=no, toolbar=no";

  const inboxPopup = window.open(url, title, status);
}

function sendMessageById(receiver) {
  const url = "/message/writeById.do?memberId=" + receiver;
  const title = "쪽지함";
  const status = "width=617px, height=700px, menubar=no, status=no, toolbar=no";

  const inboxPopup = window.open(url, title, status);
}

function sendMessageByNick(receiver) {
  const url = "/message/write.do?receiver=" + receiver;
  const title = "쪽지함";
  const status = "width=617px, height=700px, menubar=no, status=no, toolbar=no";

  const inboxPopup = window.open(url, title, status);
}
