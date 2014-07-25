#
# Copyright 2014 Chef Software, Inc.omnibus
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "perl_pg_driver"
default_version "3.3.0"

dependency "perl"
dependency "cpanminus"
dependency "postgresql"

source :url => "http://search.cpan.org/CPAN/authors/id/T/TU/TURNSTEP/DBD-Pg-#{version}.tar.gz",
       :md5 => "547de1382a47d66872912fe64282ff55"

relative_path "DBD-Pg-#{version}"

env = {
  "PATH" => "#{install_dir}/embedded/bin:#{ENV["PATH"]}"
}

build do
  command "cpanm -v --notest .", :env => env
end
