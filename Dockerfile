FROM tiangolo/uwsgi-nginx-flask:python3.7-alpine3.8
LABEL maintainer="Rémi Alvergnat <toilal.dev@gmail.com>"

ENV WRKDIR /guessit-rest/guessitrest
ENV UWSGI_INI /guessit-rest/guessitrest/uwsgi.ini

COPY / /guessit-rest
RUN cd /guessit-rest && python3 setup.py install

WORKDIR ${WRKDIR}

CMD python3 __main__.py

