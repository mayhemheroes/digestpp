FROM fuzzers/libfuzzer:12.0 as builder

RUN apt-get update
RUN apt install -y build-essential clang
ADD . /digestpp
WORKDIR /digestpp
ADD fuzzers/fuzz_blake2b.cpp .
RUN clang++ -fsanitize=fuzzer,address fuzz_blake2b.cpp -o /fuzzBlake2b

FROM fuzzers/libfuzzer:12.0
COPY --from=builder /fuzzBlake2b /

ENTRYPOINT []
CMD ["/fuzzBlake2b"]
