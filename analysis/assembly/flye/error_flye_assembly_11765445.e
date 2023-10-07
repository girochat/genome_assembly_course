[2023-09-27 15:42:15] INFO: Starting Flye 2.8.3-b1695
[2023-09-27 15:42:15] INFO: >>>STAGE: configure
[2023-09-27 15:42:15] INFO: Configuring run
[2023-09-27 15:43:55] INFO: Total read length: 6364548471
[2023-09-27 15:43:55] INFO: Input genome size: 128000000
[2023-09-27 15:43:55] INFO: Estimated coverage: 49
[2023-09-27 15:43:55] INFO: Reads N50/N90: 14979 / 4566
[2023-09-27 15:43:55] INFO: Minimum overlap set to 5000
[2023-09-27 15:43:55] INFO: >>>STAGE: assembly
[2023-09-27 15:43:55] INFO: Assembling disjointigs
[2023-09-27 15:43:55] INFO: Reading sequences
[2023-09-27 15:45:46] INFO: Counting k-mers:
0% 10% 20% 30% 40% 50% 60% 70% 80% 90% 100% 
[2023-09-27 15:51:02] INFO: Filling index table (1/2)
0% 10% 20% 30% 40% 50% 60% 70% 80% 90% 100% 
[2023-09-27 15:54:15] INFO: Filling index table (2/2)
0% 10% 20% 30% 40% 50% 60% 70% 80% 90% 100% 
[2023-09-27 15:57:27] INFO: Extending reads
[2023-09-27 15:58:13] INFO: Overlap-based coverage: 17
[2023-09-27 15:58:13] INFO: Median overlap divergence: 0.227686
0% 10% 20% 30% 40% 50% 60% 70% 80% 90% 100% 
[2023-09-27 16:47:12] INFO: Assembled 1211 disjointigs
[2023-09-27 16:47:16] INFO: Generating sequence
0% 10% 20% 30% 40% 50% 60% 70% 80% 90% 100% 
[2023-09-27 16:48:20] INFO: >>>STAGE: consensus
[2023-09-27 16:49:26] INFO: Running Minimap2
[2023-09-28 03:07:11] INFO: Computing consensus
[2023-09-28 03:29:00] INFO: Alignment error rate: 0.205846
[2023-09-28 03:29:03] INFO: >>>STAGE: repeat
[2023-09-28 03:29:03] INFO: Building and resolving repeat graph
[2023-09-28 03:29:03] INFO: Parsing disjointigs
[2023-09-28 03:29:15] INFO: Building repeat graph
0% 10% 20% 30% 40% 50% 60% 70% 80% 90% 100% 
[2023-09-28 03:37:30] INFO: Median overlap divergence: 0.0623245
[2023-09-28 03:38:43] INFO: Parsing reads
[2023-09-28 03:40:23] INFO: Aligning reads to the graph
0% 10% 20% 30% 40% 50% 60% 70% 80% 90% 100% 
[2023-09-28 03:45:16] INFO: Aligned read sequence: 5049526307 / 5638164077 (0.895598)
[2023-09-28 03:45:16] INFO: Median overlap divergence: 0.114754
[2023-09-28 03:45:18] INFO: Mean edge coverage: 60
[2023-09-28 03:45:20] INFO: Simplifying the graph
[2023-09-28 03:47:16] INFO: >>>STAGE: contigger
[2023-09-28 03:47:16] INFO: Generating contigs
[2023-09-28 03:47:16] INFO: Reading sequences
[2023-09-28 03:50:31] INFO: Generated 198 contigs
[2023-09-28 03:51:00] INFO: Added 12 scaffold connections
[2023-09-28 03:51:46] INFO: >>>STAGE: polishing
[2023-09-28 03:51:46] INFO: Polishing genome (1/1)
[2023-09-28 03:52:07] INFO: Running minimap2
[2023-09-28 04:32:02] INFO: Separating alignment into bubbles
[2023-09-28 04:42:05] INFO: Alignment error rate: 0.149223
[2023-09-28 04:42:05] INFO: Correcting bubbles
0% 10% 20% 30% 40% 50% 60% 70% 80% 90% 100% 
[2023-09-28 05:09:51] INFO: >>>STAGE: finalize
[2023-09-28 05:10:04] INFO: Assembly statistics:

	Total length:	119963782
	Fragments:	164
	Fragments N50:	14082887
	Largest frg:	15013467
	Scaffolds:	12
	Mean coverage:	30

[2023-09-28 05:10:04] INFO: Final assembly: /data/users/grochat/genome_assembly_course/analysis/Assembly/Flye/assembly.fasta
