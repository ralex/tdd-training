#!/bin/bash

source url-splitting.sh >/dev/null

test_binary_exist() {
  assert "test -e ../url-splitting.sh"
}

test_protocol_function() {
  assert_equals "http" "$(get_protocol http://www.test.com)"
}

test_domain_function() {
  assert_equals "www.test.com" "$(get_domain http://www.test.com)"
}

test_http_protocol() {
  assert_equals "http" "$(../url-splitting.sh http://www.test.com |grep protocol |cut -d ' ' -f 3)"
}

test_https_protocol() {
  assert_equals "https" "$(../url-splitting.sh https://www.test.com |grep protocol |cut -d ' ' -f 3)"
}

test_ftp_protocol() {
  assert_equals "ftp" "$(../url-splitting.sh ftp://www.test.com |grep protocol |cut -d ' ' -f 3)"
}

itest_domain_is_present() {
  assert "$(../url-splitting.sh http://www.test.com)"
}
