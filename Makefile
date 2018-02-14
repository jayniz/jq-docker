VERSION := $(or ${VERSION},${VERSION},1.5)

default: build

build:
	docker build --build-arg VERSION=${VERSION} -t jannis/jq:${VERSION} .
	docker tag jannis/jq:${VERSION} jannis/jq

release: build
	docker push jannis/jq:${VERSION}
