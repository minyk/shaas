PWD := `pwd`

default: build

build: clean
	docker run --rm -v $(PWD):/go/src/shaas -w /go/src/shaas golang:1.10.1 /go/src/shaas/hack/make.sh
	docker build -t harbor.ajway.kr/test/shaas:dev .

push: build
	docker push harbor.ajway.kr/test/shaas:dev

clean:
	rm  -f ./shaas | true
	docker rmi harbor.ajway.kr/test/shaas:dev | true
