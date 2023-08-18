FROM ghcr.io/bleyerj/mealor@sha256:4b09382d474e87a3b8fa87f33aabf991a8255d7ec957b46cd0ea9b5258dbfd23

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
