# netty-gh-11701
See https://github.com/netty/netty/issues/11701

The tests `Epoll.isAvailable()` and `Epoll.ensureAvailability()` on different distros to see if they return false/fail in case glibc is missing. It seems `isAvailable` does not return false and `ensureAvailability` does not fail even if glibc is missing.

Image | `isAvailable` | `ensureAvailability` | Comment
------ | ------------------- |  --------------------------- | -------------
bellsoft_liberica-openjre-debian:17 | `true` | `OK` | works
bellsoft_liberica-openjre-alpine:17  | `true` | `OK` | works since it contains glibc
**bellsoft_liberica-openjre-alpine-musl:17**  | `true` | `OK` | **does not work as expected**
azul_zulu-openjdk:17 | `true` | `OK` | works as expected
**azul_zulu-openjdk-alpine:17-jre**  | `true` | `OK` | **does not work as expected**

# How to run

Execute `./test.sh` and check the `test.out` file.

It produces the following output:
```
bellsoft_liberica-openjre-debian:17
	Epoll.isAvailable: true
	Epoll.ensureAvailability: OK
bellsoft_liberica-openjre-alpine:17
	Epoll.isAvailable: true
	Epoll.ensureAvailability: OK
bellsoft_liberica-openjre-alpine-musl:17
	Epoll.isAvailable: true
	Epoll.ensureAvailability: OK
azul_zulu-openjdk:17
	Epoll.isAvailable: true
	Epoll.ensureAvailability: OK
azul_zulu-openjdk-alpine:17-jre
	Epoll.isAvailable: true
	Epoll.ensureAvailability: OK

```


