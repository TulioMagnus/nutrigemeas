window.onLoad = function onLoad(f) {
  document.addEventListener('turbolinks:load', () => f($));
};

window.turbolinksSetInterval = function turbolinksSetInterval(intervalFunction, milliseconds) {
  const interval = setInterval(intervalFunction, milliseconds);

  function removeInterval() {
    clearInterval(interval);
    $(document).off('turbolinks:load', removeInterval);
  }

  $(document).on('turbolinks:load', removeInterval);
};

String.prototype.replaceAll = function(from, to){
  var str = this;
  var pos = str.indexOf(from);
  while (pos > -1){
    str = str.replace(from, to);
    pos = str.indexOf(from);
  }
  return (str);
}
