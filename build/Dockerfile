FROM r-base:4.3.0

WORKDIR /usr/src/app

COPY build/packages.R /usr/src/app/build/

RUN Rscript build/packages.R

COPY scripts/process.R /usr/src/app/scripts/

CMD ["Rscript", "scripts/process.R"]
