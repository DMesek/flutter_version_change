import sys
import json

RELEASES = "releases"
CHANNEL = "channel"
VERSION = "version"
NUMBER_OF_VERSIONS = 20

channel = sys.argv[1]
data = sys.stdin.read()

all_versions = json.loads(data)[RELEASES]
filtered_versions = [v for v in all_versions if v[CHANNEL] == channel]
filtered_version_names = map(lambda v: v[VERSION], filtered_versions)

f = open('availableVersions', "a")
f2 = open('availableVersionLabels', "a")
for i in range(20):
    current_index = NUMBER_OF_VERSIONS - i
    f.write('[{index}] {version}\n'.format(index=current_index, version=filtered_version_names[current_index]))
    f2.write('{version}\n'.format(version=filtered_versions[current_index]['archive']))
