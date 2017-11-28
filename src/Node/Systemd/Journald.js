"use strict";

// Node.Systemd.Journald

var journald = require('systemd-journald');

exports.journaldImpl = function(defaultFields) {
  return new journald(defaultFields);
};
exports.emergImpl = function(journald, message, fields) { return journald.emerg(message, fields); };
exports.alertImpl = function(journald, message, fields) { return journald.alert(message, fields); };
exports.critImpl = function(journald, message, fields) { return journald.crit(message, fields); };
exports.errImpl = function(journald, message, fields) { return journald.err(message, fields); };
exports.warningImpl = function(journald, message, fields) { return journald.warning(message, fields); };
exports.noticeImpl = function(journald, message, fields) { return journald.notice(message, fields); };
exports.infoImpl = function(journald, message, fields) { return journald.info(message, fields); };
exports.debugImpl = function(journald, message, fields) { return journald.debug(message, fields); };
