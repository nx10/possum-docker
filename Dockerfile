FROM neurodebian:bionic

RUN apt-get update \
    && apt-get install -y wget \
    && wget -O- http://neuro.debian.net/lists/bionic.us-nh.full | tee /etc/apt/sources.list.d/neurodebian.sources.list \
    && apt-key adv --recv-keys --keyserver hkps://keyserver.ubuntu.com 0xA5D32F012649A5A9 \
    && apt-get update \
    && apt-get install -y fsl-5.0-complete


# Configure FSL
ENV FSLDIR=/usr/share/fsl/5.0 \
    FSLOUTPUTTYPE=NIFTI_GZ \
    FSLMULTIFILEQUIT=TRUE \
    POSSUMDIR=/usr/share/fsl/5.0 \
    LD_LIBRARY_PATH=/usr/lib/fsl/5.0:$LD_LIBRARY_PATH \
    FSLTCLSH=/usr/bin/tclsh \
    FSLWISH=/usr/bin/wish \
    PATH=/usr/lib/fsl/5.0:$PATH \
    TZ=America/New_York

RUN echo ". /etc/fsl/5.0/fsl.sh" >> /root/.bashrc \
    && cp /usr/lib/fsl/5.0/*.so /usr/lib/
    # ^ Just don't question it [RVdW]
