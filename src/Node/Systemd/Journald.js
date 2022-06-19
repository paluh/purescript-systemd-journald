"use strict";

// Node.Systemd.Journald

import journald from 'systemd-journald';

export function journaldImpl(defaultFields) {
  return new journald(defaultFields);
};
export function emergImpl(journald, message, fields) { return journald.emerg(message, fields); };
export function alertImpl(journald, message, fields) { return journald.alert(message, fields); };
export function critImpl(journald, message, fields) { return journald.crit(message, fields); };
export function errImpl(journald, message, fields) { return journald.err(message, fields); };
export function warningImpl(journald, message, fields) { return journald.warning(message, fields); };
export function noticeImpl(journald, message, fields) { return journald.notice(message, fields); };
export function infoImpl(journald, message, fields) { return journald.info(message, fields); };
export function debugImpl(journald, message, fields) { return journald.debug(message, fields); };
