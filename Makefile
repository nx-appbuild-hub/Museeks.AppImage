# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)

DESTINATION="Museeks.AppImage"

all: clean
	echo "Building: $(DESTINATION)"
	wget --output-document=$(DESTINATION) --continue https://github.com/martpie/museeks/releases/download/0.11.4/museeks-x86_64.AppImage
	7z x $(DESTINATION) -o$(PWD)/AppDir
	chmod +x $(PWD)/AppDir/AppRun
	chmod +x $(PWD)/AppDir/chrome-sandbox
	chmod +x $(PWD)/AppDir/museeks

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(PWD)/$(DESTINATION)

	chmod +x $(PWD)/$(DESTINATION)
	make clean

clean:
	rm -rf $(PWD)/AppDir
