FROM ghcr.io/bleyerj/mealor@sha256:4b09382d474e87a3b8fa87f33aabf991a8255d7ec957b46cd0ea9b5258dbfd23

RUN nb=$(which jupyter-notebook) \
    && rm $nb \
    && ln -s $(which jupyter-lab) $nb

# Copy home directory for usage in binder
WORKDIR ${HOME}
COPY --chown=${NB_UID} . ${HOME}

USER ${NB_USER}


ENV PATH $PATH:~/.local/bin
ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:~/.local/lib
ENV PYTHONPATH ${PYTHONPATH}:~/.local/lib/python3.9/site-packages

RUN git clone https://github.com/MEALORII/TP_MEALOR.git
RUN cd TP_MEALOR
RUN pip install mealor/ --user
ENTRYPOINT []
