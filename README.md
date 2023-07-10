# Possum help pages

There is not much documentation about possum.

- [User guide (mainly GUI)](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/POSSUM/UserGuide)

## `pulse`

```bash
Part of FSL (build 509)
pulse
Copyright(c) 2003, University of Oxford (Ivana Drobnjak and Mark Jenkinson)

Usage: 
pulse -i <input digital brain> -o <output base name> [optional arguments]

Compulsory arguments (You MUST set one or more of):
	-i,--inp	4D digital brain, resolution can be any.
	-o,--out	pulse sequence matrix

Optional arguments (You may optionally specify one or more of):
	--seq	default=epi (epi OR ge)
	--angle	default=90 (flip angle in degrees)
	--te	default=0.03s (the time from the first RF to the first echo (in epi center of the k-space, in GE it is the center of the first line of the k-space)
	--tr	default=3s (the time between the two RF pulses applied on the same part of the object (in epi the acquisition time for the whole k-space in GE time for the first line)
	--trslc	default=0.12s (the time that takes for the acquisition of one slice)
	--nx	default=64 (resolution in x of the output image)
	--ny	default=64 (resolution in y of the output image)
	--dx	default=0.004m (image voxel x-dimension)
	--dy	default=0.004m (image voxel y-dimension) 
	--maxG	default=0.055 T/m (maximum gradient strength) 
	--riset	default=0.00022s (time it takes for the gradient to reach its max value) 
	--bw	default=100000Hz ( receiving bandwidth) 
	--numvol	default=1 (number of volumes)
	--numslc	default=1 (number of slices)
	--slcthk	default=0.006m (slice thickness)
	--gap	default=0m (gap between the slices in m)
	--zstart	default=0m (the lowest position in the slice direction in m)
	--slcdir	default=z- (x+,x-, y+,y- or z+,or z- slice acquisition direction/orientation)
	--phasedir	default=y+ (x+,x-, y+,y- or z+,or z- phase encode direction/orientation)
	--readdir	default=x+ (x+,x-, y+,y- or z+,or z- read-out direction/orientation) 
	-v,--verbose	switch on diagnostic messages
	-h,--help	display this message
	-k,--kcoord	default=no (saving k-space coordinates)
	--cover	default=100 (phase partial Fourier coverage in  %. min=50 max=100)

```

## `possumX`

```bash
Usage: possumX <subject directory> [options]

Subject directory needs to contain:
1.  brain
2.  MRpar
3.  motion 
4.  slcprof
5.  pulse, pulse.info, pulse.readme, pulse.posx, pulse.posy, pulse.posz
optional
6.  T2
7.  T2timecourse
8.  b0z_dz and (in case of motion) b0x_dx, b0x_dy, ... b0z_dy
9.  b0extra
10. b0timecourse

In case there is a cluster enviroment (e.g. SGE):
-n (number of processors, default 1)
-t (estimated running time per processor (minutes), default 2000)
-s (marix segment size [default 10000], purely for memory efficiency)
-a (architecture [e.g., darwin or lx24-amd64])
-v verbose
-j (place hold for till this job finishes)
```

## `possum_matrix`

```bash
Part of FSL (build 509)
possum (Version 2.0)
Copyright(c) 2008, University of Oxford (Ivana Drobnjak)

Usage: 
possum_matrix  -p <pulse>  -m <motion file> -o <output main even matrix> [optional arguments]

Compulsory arguments (You MUST set one or more of):
	-m,--motion	<inputmatrix-filename> (Motion matrix [time(s) Tx(m) Ty(m) Tz(m) Rx(rad) Ry(rad) Rz(rad)]) 
	-p,--pulse	<inputmatrix-basename> (Pulse sequence - all additional files .posx,.posy, etc,  expected to be in the same directory)
	-o,--mainmatx	<outputmatrix-filename> (Main event matrix [t(s),rf_ang(rad),rf_freq_band(Hz),(4)=rf_cent_freq(Hz),read(1/0),Gx,Gy,Gz(T/m),Tx,Ty,Tz(m),angle_of_rot B(rad),rot_axis Bx,By,Bz(m),angle_of_rot A(rad),rot_axis Ax,Ay,Az(m)]) 

Optional arguments (You may optionally specify one or more of):
	-v,--verbose	switch on diagnostic messages
	-h,--help	display this message
	--old	Allows for the old version of the sorter to run
	--seg	Seting the size of the segment of the matrix that is read in one at a time
```

## `fsl_sub`

```bash
fsl_sub V1.1 - wrapper for job control system such as SGE

Usage: fsl_sub [options] <command>

fsl_sub gzip *.img *.hdr
fsl_sub -q short.q gzip *.img *.hdr
fsl_sub -a darwin regscript rawdata outputdir ...

  -T <minutes>          Estimated job length in minutes, used to let SGE select
                        an appropriate queue
  -q <queuename>        Possible values for <queuename> can be queried with
                        'qconf -sql'
  -a <arch-name>        Architecture [e.g., darwin or lx24-amd64]
  -p <job-priority>     Lower priority [0:-1024] default = 0                 
  -M <email-address>    Who to email, default = root@localhost
  -j <jid>              Place a hold on this task until job jid has completed
  -t <filename>         Specify a task file of commands to execute in parallel
  -N <jobname>          Specify jobname as it will appear on queue
  -l <logdirname>       Where to output logfiles
  -m <mailoptions>      Change the SGE mail options, see qsub for details
  -z <output>           If <output> image or file already exists, do nothing and exit
  -F                    Use flags embedded in scripts to set SGE queuing options
  -s <pename>,<threads> Submit a multi-threaded task - requires a PE (<pename>) to be
                        configured for the requested queues.
                        <threads> specifies the number of threads to run
  -v                    Verbose mode.
```

## `possum_sum`

```bash
Part of FSL (build 509)
possum_sum
Copyright(c) 2006, University of Oxford (Ivana Drobnjak)

Usage: 
possum_sum -i <inname> -o <outname> -n <nproc> 

Compulsory arguments (You MUST set one or more of):
	-i,--in	input signal for one processor (possum output matrix)
	-o,--out	output signal: sum of all the processors (possum matrix form)

Optional arguments (You may optionally specify one or more of):
	-n,--nproc	Number of processors
	-h,--help	display this message
	-v,--verbose	switch on diagnostic messages
```

## `signal2image`

```bash
Part of FSL (build 509)
signal2image
Copyright(c) 2003, University of Oxford (Mark Jenkinson & Ivana Drobnjak)

Usage: 
signal2image [options] -i <signal> -p <pulse> -o <image> 
 signal2image -p <pulse> -c <kcoord>

Compulsory arguments (You MUST set one or more of):
	-p,--pulse	8-column pulse_sequence matrix. Expects to find all other pulse sequence files in the same directory.

Optional arguments (You may optionally specify one or more of):
	-i,--in	input signal
	-o,--out	output image
	-c, --kcoord	kspace coordinates
	-k,--kout	output k-space
	-a,--abs	save absolute magnitude and phase
	--homo	do the homodyne reconstruction
	-v,--verbose	switch on diagnostic messages
	-h,--help	display this message
	-z,--apodize	Do apodization
	-l,--limit	Apodization with this cutoff; default 100
	-r,--roll	Apodization with this rolloff; default 10
	-s,--save	(DEBUG!) Save window as ascii matrix
```