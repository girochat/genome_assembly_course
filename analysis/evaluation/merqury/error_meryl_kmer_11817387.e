
Found 1 command tree.

Counting 10 (estimated) billion canonical 19-mers from 1 input file:
    sequence-file: data/reads/genome/Illumina/links//Illumina_R1.fastq.gz


SIMPLE MODE
-----------

  19-mers
    -> 274877906944 entries for counts up to 65535.
    -> 4096 Gbits memory used

  11785647954 input bases
    -> expected max count of 47142591, needing 11 extra bits.
    -> 2816 Gbits memory used

  864 GB memory needed


COMPLEX MODE
------------

prefix     # of   struct   kmers/    segs/      min     data    total
  bits   prefix   memory   prefix   prefix   memory   memory   memory
------  -------  -------  -------  -------  -------  -------  -------
     1     2  P  6504 kB  5619 MM   406 kS   128 kB    50 GB    50 GB
     2     4  P  6335 kB  2809 MM   197 kS   256 kB    49 GB    49 GB
     3     8  P  6172 kB  1404 MM    96 kS   512 kB    48 GB    48 GB
     4    16  P  6021 kB   702 MM    46 kS  1024 kB    46 GB    46 GB
     5    32  P  5896 kB   351 MM    22 kS  2048 kB    45 GB    45 GB
     6    64  P  5822 kB   175 MM    10 kS  4096 kB    43 GB    43 GB
     7   128  P  5849 kB    87 MM  5445  S  8192 kB    42 GB    42 GB
     8   256  P  6078 kB    43 MM  2635  S    16 MB    41 GB    41 GB
     9   512  P  6712 kB    21 MM  1274  S    32 MB    39 GB    39 GB
    10  1024  P  8152 kB    10 MM   615  S    64 MB    38 GB    38 GB
    11  2048  P    10 MB  5619 kM   297  S   128 MB    37 GB    37 GB
    12  4096  P    17 MB  2809 kM   143  S   256 MB    35 GB    35 GB
    13  8192  P    29 MB  1404 kM    69  S   512 MB    34 GB    34 GB
    14    16 kP    54 MB   702 kM    33  S  1024 MB    33 GB    33 GB
    15    32 kP   105 MB   351 kM    16  S  2048 MB    32 GB    32 GB  Best Value!
    16    64 kP   206 MB   175 kM     8  S  4096 MB    32 GB    32 GB
    17   128 kP   408 MB    87 kM     4  S  8192 MB    32 GB    32 GB
    18   256 kP   812 MB    43 kM     2  S    16 GB    32 GB    32 GB
    19   512 kP  1620 MB    21 kM     1  S    32 GB    32 GB    33 GB
    20  1024 kP  3240 MB    10 kM     1  S    64 GB    64 GB    67 GB
    21  2048 kP  6480 MB  5620  M     1  S   128 GB   128 GB   134 GB
    22  4096 kP    12 GB  2810  M     1  S   256 GB   256 GB   268 GB
    23  8192 kP    25 GB  1405  M     1  S   512 GB   512 GB   537 GB


FINAL CONFIGURATION
-------------------

WARNING:
WARNING: Cannot fit into 20 GB memory limit.
WARNING: Will split into up to 2 batches, and merge them at the end.
WARNING:

Configured complex mode for 20.000 GB memory per batch, and up to 2 batches.

Start counting with THREADED method.
Used 1.232 GB out of 20.000 GB to store       852887 kmers.
Used 1.358 GB out of 20.000 GB to store     23881112 kmers.
Used 1.484 GB out of 20.000 GB to store     75904063 kmers.
Used 1.609 GB out of 20.000 GB to store    123663457 kmers.
Used 1.735 GB out of 20.000 GB to store    171422745 kmers.
Used 1.860 GB out of 20.000 GB to store    218330625 kmers.
Used 1.985 GB out of 20.000 GB to store    265237547 kmers.
Used 2.113 GB out of 20.000 GB to store    312997695 kmers.
Used 2.238 GB out of 20.000 GB to store    359905433 kmers.
Used 2.363 GB out of 20.000 GB to store    406810288 kmers.
Used 2.488 GB out of 20.000 GB to store    453711092 kmers.
Used 2.614 GB out of 20.000 GB to store    500608590 kmers.
Used 2.739 GB out of 20.000 GB to store    547503618 kmers.
Used 2.865 GB out of 20.000 GB to store    594396733 kmers.
Used 2.990 GB out of 20.000 GB to store    641290274 kmers.
Used 3.116 GB out of 20.000 GB to store    688189977 kmers.
Used 3.241 GB out of 20.000 GB to store    735074682 kmers.
Used 3.366 GB out of 20.000 GB to store    781963784 kmers.
Used 3.492 GB out of 20.000 GB to store    828856319 kmers.
Used 3.617 GB out of 20.000 GB to store    875755561 kmers.
Used 3.743 GB out of 20.000 GB to store    922651747 kmers.
Used 3.868 GB out of 20.000 GB to store    969549383 kmers.
Used 3.994 GB out of 20.000 GB to store   1016458764 kmers.
Used 4.119 GB out of 20.000 GB to store   1063367584 kmers.
Used 4.245 GB out of 20.000 GB to store   1110276451 kmers.
Used 4.371 GB out of 20.000 GB to store   1157185480 kmers.
Used 4.496 GB out of 20.000 GB to store   1204094158 kmers.
Used 4.622 GB out of 20.000 GB to store   1251002719 kmers.
Used 4.747 GB out of 20.000 GB to store   1297900774 kmers.
Used 4.873 GB out of 20.000 GB to store   1344795326 kmers.
Used 4.998 GB out of 20.000 GB to store   1391691391 kmers.
Used 5.124 GB out of 20.000 GB to store   1438592011 kmers.
Used 5.249 GB out of 20.000 GB to store   1485487718 kmers.
Used 5.375 GB out of 20.000 GB to store   1532387328 kmers.
Used 5.501 GB out of 20.000 GB to store   1579284657 kmers.
Used 5.626 GB out of 20.000 GB to store   1626177949 kmers.
Used 5.752 GB out of 20.000 GB to store   1673074053 kmers.
Used 5.878 GB out of 20.000 GB to store   1719970725 kmers.
Used 6.003 GB out of 20.000 GB to store   1766870741 kmers.
Used 6.129 GB out of 20.000 GB to store   1813769516 kmers.
Used 6.255 GB out of 20.000 GB to store   1860628791 kmers.
Used 6.380 GB out of 20.000 GB to store   1907463724 kmers.
Used 6.506 GB out of 20.000 GB to store   1954324610 kmers.
Used 6.631 GB out of 20.000 GB to store   2001165767 kmers.
Used 6.756 GB out of 20.000 GB to store   2048030164 kmers.
Used 6.882 GB out of 20.000 GB to store   2094888575 kmers.
Used 7.008 GB out of 20.000 GB to store   2141736184 kmers.
Used 7.135 GB out of 20.000 GB to store   2189310564 kmers.
Used 7.260 GB out of 20.000 GB to store   2236023838 kmers.
Used 7.387 GB out of 20.000 GB to store   2283650966 kmers.
Used 7.513 GB out of 20.000 GB to store   2330359320 kmers.
Used 7.640 GB out of 20.000 GB to store   2377971349 kmers.
Used 7.766 GB out of 20.000 GB to store   2424732820 kmers.
Used 7.891 GB out of 20.000 GB to store   2471498823 kmers.
Used 8.018 GB out of 20.000 GB to store   2519052835 kmers.
Used 8.144 GB out of 20.000 GB to store   2565819927 kmers.
Used 8.271 GB out of 20.000 GB to store   2613381996 kmers.
Used 8.396 GB out of 20.000 GB to store   2660161736 kmers.
Used 8.522 GB out of 20.000 GB to store   2706948085 kmers.
Used 8.647 GB out of 20.000 GB to store   2753728046 kmers.
Used 8.772 GB out of 20.000 GB to store   2800538573 kmers.
Used 8.898 GB out of 20.000 GB to store   2847415639 kmers.
Used 9.023 GB out of 20.000 GB to store   2894279125 kmers.
Used 9.149 GB out of 20.000 GB to store   2941155227 kmers.
Used 9.275 GB out of 20.000 GB to store   2988035299 kmers.
Used 9.400 GB out of 20.000 GB to store   3034919316 kmers.
Used 9.526 GB out of 20.000 GB to store   3081803095 kmers.
Used 9.651 GB out of 20.000 GB to store   3128579663 kmers.
Used 9.776 GB out of 20.000 GB to store   3175295538 kmers.
Used 9.902 GB out of 20.000 GB to store   3222077757 kmers.
Used 10.027 GB out of 20.000 GB to store   3268806968 kmers.
Used 10.153 GB out of 20.000 GB to store   3315586142 kmers.
Used 10.278 GB out of 20.000 GB to store   3362370690 kmers.
Used 10.405 GB out of 20.000 GB to store   3410014039 kmers.
Used 10.531 GB out of 20.000 GB to store   3456724547 kmers.
Used 10.658 GB out of 20.000 GB to store   3504348910 kmers.
Used 10.784 GB out of 20.000 GB to store   3551120814 kmers.
Used 10.909 GB out of 20.000 GB to store   3597845182 kmers.
Used 11.034 GB out of 20.000 GB to store   3644632811 kmers.
Used 11.160 GB out of 20.000 GB to store   3691417752 kmers.
Used 11.286 GB out of 20.000 GB to store   3738352634 kmers.

Writing results to 'data/reads/genome/Illumina/links//kmer_db2_1.meryl', using 4 threads.
finishIteration()--

Finished counting.

Cleaning up.

Bye.

Found 1 command tree.

Counting 10 (estimated) billion canonical 19-mers from 1 input file:
    sequence-file: data/reads/genome/Illumina/links//Illumina_R2.fastq.gz


SIMPLE MODE
-----------

  19-mers
    -> 274877906944 entries for counts up to 65535.
    -> 4096 Gbits memory used

  11145990660 input bases
    -> expected max count of 44583962, needing 11 extra bits.
    -> 2816 Gbits memory used

  864 GB memory needed


COMPLEX MODE
------------

prefix     # of   struct   kmers/    segs/      min     data    total
  bits   prefix   memory   prefix   prefix   memory   memory   memory
------  -------  -------  -------  -------  -------  -------  -------
     1     2  P  6152 kB  5314 MM   384 kS   128 kB    48 GB    48 GB
     2     4  P  5992 kB  2657 MM   186 kS   256 kB    46 GB    46 GB
     3     8  P  5838 kB  1328 MM    90 kS   512 kB    45 GB    45 GB
     4    16  P  5697 kB   664 MM    44 kS  1024 kB    44 GB    44 GB
     5    32  P  5582 kB   332 MM    21 kS  2048 kB    42 GB    42 GB
     6    64  P  5517 kB   166 MM    10 kS  4096 kB    41 GB    41 GB
     7   128  P  5553 kB    83 MM  5149  S  8192 kB    40 GB    40 GB
     8   256  P  5792 kB    41 MM  2492  S    16 MB    38 GB    38 GB
     9   512  P  6436 kB    20 MM  1205  S    32 MB    37 GB    37 GB
    10  1024  P  7888 kB    10 MM   582  S    64 MB    36 GB    36 GB
    11  2048  P    10 MB  5314 kM   281  S   128 MB    35 GB    35 GB
    12  4096  P    16 MB  2657 kM   135  S   256 MB    33 GB    33 GB
    13  8192  P    29 MB  1328 kM    65  S   512 MB    32 GB    32 GB
    14    16 kP    54 MB   664 kM    32  S  1024 MB    32 GB    32 GB
    15    32 kP   104 MB   332 kM    15  S  2048 MB    30 GB    30 GB  Best Value!
    16    64 kP   206 MB   166 kM     8  S  4096 MB    32 GB    32 GB
    17   128 kP   408 MB    83 kM     4  S  8192 MB    32 GB    32 GB
    18   256 kP   812 MB    41 kM     2  S    16 GB    32 GB    32 GB
    19   512 kP  1620 MB    20 kM     1  S    32 GB    32 GB    33 GB
    20  1024 kP  3240 MB    10 kM     1  S    64 GB    64 GB    67 GB
    21  2048 kP  6480 MB  5315  M     1  S   128 GB   128 GB   134 GB
    22  4096 kP    12 GB  2658  M     1  S   256 GB   256 GB   268 GB
    23  8192 kP    25 GB  1329  M     1  S   512 GB   512 GB   537 GB


FINAL CONFIGURATION
-------------------

WARNING:
WARNING: Cannot fit into 20 GB memory limit.
WARNING: Will split into up to 2 batches, and merge them at the end.
WARNING:

Configured complex mode for 20.000 GB memory per batch, and up to 2 batches.

Start counting with THREADED method.
Used 1.232 GB out of 20.000 GB to store       825397 kmers.
Used 1.358 GB out of 20.000 GB to store     23388959 kmers.
Used 1.484 GB out of 20.000 GB to store     76018509 kmers.
Used 1.610 GB out of 20.000 GB to store    123968432 kmers.
Used 1.735 GB out of 20.000 GB to store    171183312 kmers.
Used 1.861 GB out of 20.000 GB to store    218452583 kmers.
Used 1.987 GB out of 20.000 GB to store    265749812 kmers.
Used 2.113 GB out of 20.000 GB to store    313172784 kmers.
Used 2.239 GB out of 20.000 GB to store    360460249 kmers.
Used 2.366 GB out of 20.000 GB to store    407877869 kmers.
Used 2.493 GB out of 20.000 GB to store    455113822 kmers.
Used 2.618 GB out of 20.000 GB to store    502295639 kmers.
Used 2.745 GB out of 20.000 GB to store    549521728 kmers.
Used 2.871 GB out of 20.000 GB to store    596746882 kmers.
Used 2.998 GB out of 20.000 GB to store    644174810 kmers.
Used 3.124 GB out of 20.000 GB to store    691436301 kmers.
Used 3.251 GB out of 20.000 GB to store    738645645 kmers.
Used 3.376 GB out of 20.000 GB to store    785820459 kmers.
Used 3.503 GB out of 20.000 GB to store    833070085 kmers.
Used 3.630 GB out of 20.000 GB to store    880490931 kmers.
Used 3.757 GB out of 20.000 GB to store    927751076 kmers.
Used 3.884 GB out of 20.000 GB to store    975177593 kmers.
Used 4.009 GB out of 20.000 GB to store   1021909737 kmers.
Used 4.136 GB out of 20.000 GB to store   1069398965 kmers.
Used 4.263 GB out of 20.000 GB to store   1116945796 kmers.
Used 4.388 GB out of 20.000 GB to store   1163715544 kmers.
Used 4.515 GB out of 20.000 GB to store   1211274385 kmers.
Used 4.640 GB out of 20.000 GB to store   1258033646 kmers.
Used 4.766 GB out of 20.000 GB to store   1304683608 kmers.
Used 4.892 GB out of 20.000 GB to store   1352153347 kmers.
Used 5.019 GB out of 20.000 GB to store   1399681092 kmers.
Used 5.147 GB out of 20.000 GB to store   1447219815 kmers.
Used 5.272 GB out of 20.000 GB to store   1493991725 kmers.
Used 5.397 GB out of 20.000 GB to store   1540636711 kmers.
Used 5.524 GB out of 20.000 GB to store   1588074647 kmers.
Used 5.651 GB out of 20.000 GB to store   1635532178 kmers.
Used 5.779 GB out of 20.000 GB to store   1683042814 kmers.
Used 5.904 GB out of 20.000 GB to store   1729765774 kmers.
Used 6.029 GB out of 20.000 GB to store   1776494139 kmers.
Used 6.154 GB out of 20.000 GB to store   1823307532 kmers.
Used 6.280 GB out of 20.000 GB to store   1870214458 kmers.
Used 6.406 GB out of 20.000 GB to store   1917120285 kmers.
Used 6.531 GB out of 20.000 GB to store   1964027648 kmers.
Used 6.657 GB out of 20.000 GB to store   2010933464 kmers.
Used 6.783 GB out of 20.000 GB to store   2057840936 kmers.
Used 6.908 GB out of 20.000 GB to store   2104747173 kmers.
Used 7.034 GB out of 20.000 GB to store   2151652576 kmers.
Used 7.159 GB out of 20.000 GB to store   2198559084 kmers.
Used 7.285 GB out of 20.000 GB to store   2245463842 kmers.
Used 7.411 GB out of 20.000 GB to store   2292370232 kmers.
Used 7.537 GB out of 20.000 GB to store   2339276951 kmers.
Used 7.663 GB out of 20.000 GB to store   2386182083 kmers.
Used 7.788 GB out of 20.000 GB to store   2433089344 kmers.
Used 7.914 GB out of 20.000 GB to store   2479995446 kmers.
Used 8.039 GB out of 20.000 GB to store   2526900718 kmers.
Used 8.165 GB out of 20.000 GB to store   2573807885 kmers.
Used 8.290 GB out of 20.000 GB to store   2620714622 kmers.
Used 8.416 GB out of 20.000 GB to store   2667620277 kmers.
Used 8.542 GB out of 20.000 GB to store   2714526977 kmers.
Used 8.667 GB out of 20.000 GB to store   2761434610 kmers.
Used 8.793 GB out of 20.000 GB to store   2808341980 kmers.
Used 8.919 GB out of 20.000 GB to store   2855250321 kmers.
Used 9.045 GB out of 20.000 GB to store   2902157406 kmers.
Used 9.170 GB out of 20.000 GB to store   2949065290 kmers.
Used 9.296 GB out of 20.000 GB to store   2995971675 kmers.
Used 9.422 GB out of 20.000 GB to store   3042876671 kmers.
Used 9.547 GB out of 20.000 GB to store   3089780059 kmers.
Used 9.673 GB out of 20.000 GB to store   3136687179 kmers.
Used 9.799 GB out of 20.000 GB to store   3183593837 kmers.
Used 9.924 GB out of 20.000 GB to store   3230501667 kmers.
Used 10.050 GB out of 20.000 GB to store   3277409153 kmers.
Used 10.176 GB out of 20.000 GB to store   3324316186 kmers.
Used 10.301 GB out of 20.000 GB to store   3371222705 kmers.
Used 10.427 GB out of 20.000 GB to store   3418130062 kmers.
Used 10.553 GB out of 20.000 GB to store   3465037527 kmers.
Used 10.678 GB out of 20.000 GB to store   3511944057 kmers.
Used 10.804 GB out of 20.000 GB to store   3558851986 kmers.
Used 10.930 GB out of 20.000 GB to store   3605759636 kmers.
Used 11.056 GB out of 20.000 GB to store   3652665365 kmers.
Used 11.181 GB out of 20.000 GB to store   3699571376 kmers.

Writing results to 'data/reads/genome/Illumina/links//kmer_db2_2.meryl', using 4 threads.
finishIteration()--

Finished counting.

Cleaning up.

Bye.

Found 1 command tree.

PROCESSING TREE #1 using 1 thread.
  opUnionSum
    data/reads/genome/Illumina/links//kmer_db2_1.meryl
    data/reads/genome/Illumina/links//kmer_db2_2.meryl
    output to data/reads/genome/Illumina/links//kmer_db2.meryl

Cleaning up.

Bye.
