ORG = young-nick
PROJECT = mqtt-rpi-display
MODULE = github.com/$(ORG)/$(PROJECT)

export GO111MODULE=on

all: install

.PHONY: install
install: 
	go install -mod=readonly $(MODULE)/cmd/rpi-displayd

.PHONY: pibuild
pibuild: 
	GOOS=linux GOARCH=arm GOARM=7 go build -mod=readonly -o pibin $(MODULE)/cmd/rpi-displayd 

.PHONY: test
test:
	go test -cover -mod=readonly $(MODULE)/...
