# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load "test_helper/load"

@test 'stdlib::run_or_die(echo foo) is successful' {
  run stdlib::run_or_die echo foo
  assert_success
  assert_output 'foo'
}

@test 'stdlib::run_or_die(false) exits with E_RUN_OR_DIE' {
  run stdlib::run_or_die false
  assert_equal "$status" "$E_RUN_OR_DIE"
  assert_output --regexp 'Error.* exiting with exit code \d+'
}
