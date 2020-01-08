FROM tiangolo/uwsgi-nginx-flask:python3.7-alpine3.8
LABEL maintainer="Rémi Alvergnat <toilal.dev@gmail.com>"

ENV WRKDIR /guessit-rest/guessitrest
ENV UWSGI_INI /guessit-rest/guessitrest/uwsgi.ini

COPY / /guessit-rest
RUN cd /guessit-rest && pip3 install -e .

WORKDIR ${WRKDIR}

RUN python3 setup.py install

CMD python3 __main__.py

