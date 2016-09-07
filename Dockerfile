FROM sglim2/centos7
MAINTAINER Ian Merrick <MerrickI@Cardiff.ac.uk>

##############################################################
# Software:             geomorph
# Software Version:     latest
# Software Website:     https://github.com/sglim2/geomorph
# Description:          geomorph
##############################################################

ENV APP_NAME=geomorph
ENV VERSION=latest
ENV GIT=https://github.com/sglim2/geomorph
ENV DEST=/software/applications/$APP_NAME/
ENV PATH=$DEST/$VERSION:$PATH

RUN git clone $GIT ; \
    cd $APP_NAME/src ; \
    make ARCH=GNU ; \
    mkdir -p /usr/share/licenses/$APP_NAME-$VERSION ; \
    cp ../LICENSE /usr/share/licenses/$APP_NAME-$VERSION/ ; \
    mkdir -p $DEST/$VERSION/ ; \
    mv geomorph $DEST/$VERSION ; \
    cd ../../ ;  \
    rm -rf $APP_NAME 
CMD ["/bin/bash"]

