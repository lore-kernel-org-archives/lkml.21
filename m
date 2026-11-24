Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538192;
	b=AbHfpkB3anpe8bQJLnWc0irH36dWfl5XPpu4p6Qua/slF79+v5lWds1ByMPrLIZCwurl
	 bi5mfdTBYgkecc+KkSFRif68HKayCcx20CY8VrH9QbvsnF+QB/42CrJkcQEd0Vsb9JTJx
	 QM2c9VxxMOvvYhA7iIyWirkj90wHvOBJDwbVhOGBKzS1SmTuyyesdZA2TTGTZkH6n9kEq
	 StTVo5glUX9Xpr/Z+in237mGrKUsQd4HEa2ZxMkmOiPmwl1nVahTw6mUGrbs1NOmPRqCO
	 xQdgiBQLTXwANfyzJ2rdK7Wz24E5muzHHtWhf+PlQwsnMnz1Bf4bG27c3+pVLQ07OJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=KlyAUr28QoFApeyGH9rQOKo8k916UOOHLfP4qwo+4VE=;
	b=gg/JWRL5SOJHZkT8HsoHZr1Tnohz5TlzBEcuCx6TXG5PBjbmAy1GeHZLVzLi85yzPSa7
	 WYVPfTfn+EjWfkIZfmglVKeyOIhSbdKNxj/LxNUeBPMP5SnjuzSXeWT0AJYWt4DSS7xQl
	 A+HrEnOvligAUxMrsln0yBTUQx+KKomZz83NpFu3Un3026Z+OePNShPLghK6601EmB2Ac
	 xy2RNYEq/+UK9uja2VT64jZzPVuZIazOSsJh5+AZKtcjJK1/WdswJ0fbI1jMeHK9YO+oD
	 A7gyUUwjWVV7oE14cJThmKO+OaAk5NxeLQBMQgqNP86uHmzIaJaNwwW7hJfBLqeifOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=Ps3n+xHx;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F80606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F80606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=Ps3n+xHx
Received: from trampoline.thunk.org (pool-173-48-102-184.bstnma.fios.verizon.net [173.48.102.184])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AOGaPYs025972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 11:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795538187; bh=KlyAUr28QoFApeyGH9rQOKo8k916UOOHLfP4qwo+4VE=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=Ps3n+xHxPXmD7FDggnrJg3jbtQIteuRzE0+L6PaNcdhXJ/TPmmVm/jLEOBRY222bR
	 sVsDXyqaX3UpKDnlvzHeztPTzHw1A81e1/jc0nHiZ0NFtO6JTkF5lkdKlKEUOQt+0J
	 1CfUC2J9PsIXPdAN/SPT9/tEPs+eUTx7/KKNMselA0BS0mdjj2LVVsxZwJ0ab95pue
	 +wdIJxYxOELBPfA4MFWBqRswq4TeqaIQfS5J3NU9lHEXdiffamZ5pyN0r5ASbBFpIu
	 wxoOnsEnVlUoE2OYzUkL/TDGikjONXzmSanR9fvNC3vUn59AMhewOFCLCOhnCQatjN
	 eRfgzTQtQ7KrA==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 485722E00BB; Tue, 24 Nov 2026 11:36:25 -0500 (EST)
Date: Tue, 24 Nov 2026 11:36:25 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Developers List <linux-kernel@vger.kernel.org>,
        Ext4 Developers List <linux-ext4@vger.kernel.org>
Subject: [GIT PULL] updates for 7.4-rc5
Message-ID: <awW86EI5fYafQx-o@mit.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git tags/ext4_for_linus-7.4-rc5

for you to fetch changes up to bae28a1b11f422d0214654800d9425e042295c71:

  ext4: add KUnit regression tests for inode migration fixes (2026-11-23 15:29:17 -0500)

----------------------------------------------------------------
Various updates for 7.4-rc5:

The bulk of the new lines was caused by adding KUnit tests, which
makes it safer to validate AI generated patches.

Three minor performance provements:

* Spread the inodes of files in sibling directories over the block
  groups of a flex group.  This avoids contention on the inode table
  buffer locks and significantly speeds up parallel file creation.
* Move the orphan list tracking fields in ext4_sb_info off the cache
  line shared with the journal state, which improves unlink
  performance on file systems without the orphan_file feature.
* Speed up fast commit replay for sparse files by skipping holes when
  shrinking the extent tree.

A huge number of bug fixes, most of which were AI generated:

* Fast commit fixes to avoid losing fsync'ed data after a journal
  flush or when part of an unwritten extent is zeroed out, to not
  fail journal recovery on a torn fast commit, and to propagate
  errors and validate inodes during replay
* Check the return value of blkdev_issue_flush() in ext4 and jbd2,
  and record failed delalloc writeback and unwritten extent
  conversions as writeback errors so fsync() can report them
* Fixes for EXT4_IOC_MIGRATE, including data loss for contiguous
  ranges longer than EXT_INIT_MAX_LEN, a logical block overflow
  with block sizes of 8k and larger, and error paths which freed
  extent tree blocks that were still in use
* Fix stale data being returned after a failed zeroout, and after
  a FALLOC_FL_ZERO_RANGE or FALLOC_FL_WRITE_ZEROES which covers the
  EOF block
* Fix out-of-bounds accesses in the inline data and in-inode xattr
  code when handling corrupted file systems
* Fix i_size being advanced by a buffered write which failed with
  EFAULT
* Fix use-after-frees in the discard work on a failed mount and in
  ext4_split_convert_extents()
* Fix a buffer/folio lock inversion deadlock in
  __ext4_get_inode_loc() when the folio size is larger than the
  block size
* Fix readdir position truncation on 32-bit kernels for directories
  larger than 4 GiB
* Accept the orphan file created by e2fsprogs 1.47.4 on file
  systems with a 1k block size
* Treat a directory entry rec_len of 0 as corruption for block
  sizes smaller than 64k
* Return an error instead of using a bogus block number when the
  journal inode has a hole
* Don't report ENOSPC or EDQUOT when converting inline data in
  truncate as a file system error
* Fix the scan accounting in the extent status and jbd2 checkpoint
  shrinkers so that they stop once there is nothing left to scan.
* Complete the writeback of RWF_DONTCACHE writes in task context so
  that their folios are reliably dropped from the page cache.
* Only advertise atomic writes on inodes which can support them
  (excluding DAX and data=journal inodes), never fall back to buffered
  I/O for an atomic write, and set awu_max_opt in statx.
* Miscellaneous fixes for reference and memory leaks, error return
  values, documentation, and static checker warnings.

----------------------------------------------------------------
Amit Patole (1):
      jbd2: document the h_invalid handle flag

Baokun Li (1):
      ext4: skip eof zeroing when the zero range covers the eof block

Christian Göttsche (1):
      jbd2: set JBD2_LOADED under j_state_lock

Daejun Park (5):
      jbd2: don't start a fast commit while the journal is marked empty
      ext4: skip holes when shrinking the extent tree in fast commit replay
      ext4: don't cache unzeroed blocks as written after a failed zeroout
      ext4: track zeroed out blocks of unwritten extents for fast commit
      ext4: spread files of sibling directories over a flex group

Deepanshu Kartikey (1):
      ext4: add bounds check for e_value_offs in ext4_read_inline_data

Fan Wu (1):
      ext4: fix discard work use-after-free on failed mount

Hamza Mahfooz (1):
      ext4: validate inode block references during fast commit replay

Hemanth Selam (1):
      ext4: fix typos in comments

Hengyu Liang (3):
      ext4: do not accept rec_len 0 for block sizes below 64k
      ext4: do not report inline conversion allocation failures as fs errors
      ext4: do not advance i_size on a buffered write that copied nothing

Hsiu-Hsien Lee (1):
      ext4: don't fail journal recovery on an incomplete fast commit

Hungyu Lin (1):
      ext4: preserve force-fsck requests across unmount

Jan Kara (1):
      ext4: Fix maximum orphan file size check

Jiaming Zhang (1):
      ext4: clear in-inode xattr space before adding the first xattr

Jonas Zhou (1):
      ext4: move orphan tracking away from journal state

Jérémy Jean (1):
      ext4: save converted extent before merging

Kaixuan Li (2):
      ext4: stop verify_reserved_gdb() one entry short of the block
      ext4: don't read past the UAPI struct in GROUP_ADD

Karl Mehltretter (1):
      ext4: return an error when a journal block is not mapped

Lukas Czerner (2):
      ext4: free fast commit replay state on failed mounts
      ext4: fix failed migrate freeing extent tree blocks

Manuel Ebner (1):
      ext4, doc: remove unnecessary bracket

Matthias Goergens (1):
      ext4: drop extra ea_inode ref in cached-block reuse path

Ojaswin Mujoo (2):
      ext4: Fix sparse warning in extents kunit test when EXT4_KUNIT_TESTS=m
      ext4: return -EINVAL on hole in ext4_convert_unwritten_extents_atomic()

Pankaj Raghav (1):
      ext4: set awu_max_opt to awu_max

Qiliang Yuan (3):
      jbd2: fix shrinker scan budget accounting in jbd2_journal_shrink_scan()
      ext4: fix shrinker scan budget accounting in ext4_es_scan()
      ext4: remove unused locked_ei parameter from __es_shrink()

Stephen Kitt (1):
      docs: ext4 filesystems can be converted to 64-bit

Tal Zussman (4):
      ext4: reject atomic writes on inodes that can't do direct I/O
      ext4: never fall back to buffered I/O for atomic direct writes
      ext4: don't advertise atomic writes for DAX inodes
      ext4: complete dropbehind writeback in task context

ThangNN99 (1):
      ext4: avoid buffer/folio lock inversion in __ext4_get_inode_loc()

Theodore Ts'o (26):
      ext4: add KUinit tests for fs/ext4/extents_status.c
      ext4: add KUnit tests for fs/ext4/extents.c
      ext4: add KUnit tests for fs/ext4/xattr.c
      ext4: add KUnit tests for fs/ext4/namei.c
      ext4: expand KUnit tests for fs/ext4/mballoc.c
      ext4: add KUnit tests for fs/ext4/inline.c
      ext4: add KUnit tests for fs/ext4/fast_commit.c
      ext4: expand KUnit tests for fs/ext4/inode.c
      ext4: add KUnit tests for fs/ext4/ialloc.c
      ext4: add KUnit tests for fs/ext4/balloc.c
      ext4: add KUnit tests for fs/ext4/orphan.c
      ext4: add KUnit tests for fs/ext4/block_validity.c
      ext4: check multi-block overlap on left traversal in add_system_zone()
      ext4: enable full feature coverage in fs/ext4/.kunitconfig
      ext4: add KUnit tests for fs/ext4/super.c
      ext4: add KUnit tests for fs/ext4/sysfs.c
      ext4: add KUnit tests for fs/ext4/ioctl.c
      ext4: add KUnit tests for fs/ext4/resize.c
      ext4: add KUnit tests for fs/ext4/migrate.c
      ext4: add KUnit tests for fs/ext4/indirect.c
      ext4: expand KUnit tests in fs/ext4/extents-test.c for file range operations
      ext4: add KUnit tests for fs/ext4/fsmap.c
      ext4: add KUnit tests for fs/ext4/move_extent.c
      ext4: add KUnit tests for fs/ext4/mmp.c
      ext4: add KUnit tests for fs/ext4/dir.c
      ext4: add KUnit regression tests for inode migration fixes

Yichong Chen (6):
      ext4: clear journal restart indication after inserting extent
      ext4: cap migration extent length at EXT_INIT_MAX_LEN
      ext4: don't clobber the migration error in ext4_ext_migrate()
      ext4: fix the logical block counter overflow in indirect migration
      ext4: don't free the tmp_inode tree after a partial migration swap
      ext4: drop tmp inode ownership before migration cleanup

Zhan Xusheng (1):
      ext4: fix readdir position truncation on 32-bit kernels

Zhang Yi (4):
      ext4: return 0 instead of stale ret in ext4_iomap_writepages()
      ext4: fix extent status cache clearing when truncating inline data
      ext4: add inode to orphan list before extent conversion
      ext4: initialize map->m_pblk in ext4_da_map_blocks()

Zhao Gongyi (1):
      ext4: fix OOB memmove in ext4_xattr_set_entry

dardaoe (1):
      Documentation: ext4: fix group descriptor and superblock placement in meta_bg description

guolingxing (9):
      ext4: fix buffer_head leak in ext4_ind_map_blocks() error path
      jbd2: check return value of blkdev_issue_flush() when checkpointing
      jbd2: check return value of blkdev_issue_flush() when committing
      jbd2: check return value of blkdev_issue_flush() for async commits
      ext4: check return value of blkdev_issue_flush() when initializing inode tables
      ext4: check return value of blkdev_issue_flush() when starting a fast commit
      ext4: record writeback error when discarding pages on failed delalloc
      ext4: fix folio reference leak in mpage_submit_partial_folio()
      ext4: report unwritten extent conversion failures as writeback errors

lty (4):
      ext4: propagate errors from fast commit i_blocks replay
      ext4: propagate errors from fast commit block cleanup
      ext4: propagate errors from fast commit bitmap rebuild
      ext4: propagate errors from fast commit create replay

shuo chen (2):
      ext4: update the pre-check in ext4_find_inline_data_nolock
      ext4: fix WARNING in ext4_journalled_invalidate_folio

 Documentation/filesystems/ext4/allocators.rst |    6 +-
 Documentation/filesystems/ext4/blockgroup.rst |   43 +-
 Documentation/filesystems/ext4/checksums.rst  |    6 +-
 Documentation/filesystems/ext4/directory.rst  |    2 +-
 fs/ext4/.kunitconfig                          |    7 +
 fs/ext4/Makefile                              |   12 +-
 fs/ext4/balloc-test.c                         | 2403 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ext4/balloc.c                              |   11 +-
 fs/ext4/bitmap.c                              |    5 +
 fs/ext4/block_validity-test.c                 | 1598 +++++++++++++++++++++++++++++++++++++++++++
 fs/ext4/block_validity.c                      |   11 +-
 fs/ext4/crypto.c                              |    4 +
 fs/ext4/dir-test.c                            |  993 +++++++++++++++++++++++++++
 fs/ext4/dir.c                                 |   39 +-
 fs/ext4/ext4.h                                |  287 +++++++-
 fs/ext4/ext4_extents.h                        |   24 +-
 fs/ext4/ext4_jbd2.c                           |   21 +
 fs/ext4/extents-test.c                        | 2635 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 fs/ext4/extents.c                             |  283 ++++++--
 fs/ext4/extents_status-test.c                 | 1646 ++++++++++++++++++++++++++++++++++++++++++++
 fs/ext4/extents_status.c                      |   60 +-
 fs/ext4/fast_commit-test.c                    | 2714 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ext4/fast_commit.c                         |  251 ++++++-
 fs/ext4/file.c                                |   17 +-
 fs/ext4/fsmap-test.c                          |  796 ++++++++++++++++++++++
 fs/ext4/fsmap.c                               |    3 +
 fs/ext4/ialloc-test.c                         | 2731 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ext4/ialloc.c                              |  192 +++++-
 fs/ext4/indirect-test.c                       | 1293 +++++++++++++++++++++++++++++++++++
 fs/ext4/indirect.c                            |   20 +-
 fs/ext4/inline-test.c                         | 1866 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ext4/inline.c                              |   64 +-
 fs/ext4/inode-test.c                          | 3511 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 fs/ext4/inode.c                               |  298 +++++++-
 fs/ext4/ioctl-test.c                          | 1198 ++++++++++++++++++++++++++++++++
 fs/ext4/ioctl.c                               |  259 +++++--
 fs/ext4/mballoc-test.c                        | 1940 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 fs/ext4/mballoc.c                             |  191 +++++-
 fs/ext4/mballoc.h                             |   44 +-
 fs/ext4/migrate-test.c                        | 1384 +++++++++++++++++++++++++++++++++++++
 fs/ext4/migrate.c                             |   51 +-
 fs/ext4/mmp-test.c                            |  661 ++++++++++++++++++
 fs/ext4/mmp.c                                 |  117 +++-
 fs/ext4/move_extent-test.c                    | 1023 ++++++++++++++++++++++++++++
 fs/ext4/move_extent.c                         |   22 +
 fs/ext4/namei-test.c                          | 2347 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ext4/namei.c                               |  342 +++++-----
 fs/ext4/namei.h                               |  213 ++++++
 fs/ext4/orphan-test.c                         | 2372 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ext4/orphan.c                              |   20 +-
 fs/ext4/page-io.c                             |   13 +
 fs/ext4/resize-test.c                         | 1336 ++++++++++++++++++++++++++++++++++++
 fs/ext4/resize.c                              |  104 ++-
 fs/ext4/super-test.c                          | 1345 ++++++++++++++++++++++++++++++++++++
 fs/ext4/super.c                               |  290 +++++++-
 fs/ext4/sysfs-test.c                          |  679 ++++++++++++++++++
 fs/ext4/sysfs.c                               |   55 ++
 fs/ext4/xattr-test.c                          | 1822 +++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ext4/xattr.c                               |   68 +-
 fs/ext4/xattr.h                               |    2 +
 fs/ext4/xattr_hurd.c                          |    4 +
 fs/ext4/xattr_security.c                      |    4 +
 fs/ext4/xattr_trusted.c                       |    4 +
 fs/ext4/xattr_user.c                          |    4 +
 fs/jbd2/checkpoint.c                          |   10 +-
 fs/jbd2/commit.c                              |   13 +-
 fs/jbd2/journal.c                             |   28 +-
 include/linux/jbd2.h                          |    1 +
 68 files changed, 41197 insertions(+), 621 deletions(-)
 create mode 100644 fs/ext4/balloc-test.c
 create mode 100644 fs/ext4/block_validity-test.c
 create mode 100644 fs/ext4/dir-test.c
 create mode 100644 fs/ext4/extents_status-test.c
 create mode 100644 fs/ext4/fast_commit-test.c
 create mode 100644 fs/ext4/fsmap-test.c
 create mode 100644 fs/ext4/ialloc-test.c
 create mode 100644 fs/ext4/indirect-test.c
 create mode 100644 fs/ext4/inline-test.c
 create mode 100644 fs/ext4/ioctl-test.c
 create mode 100644 fs/ext4/migrate-test.c
 create mode 100644 fs/ext4/mmp-test.c
 create mode 100644 fs/ext4/move_extent-test.c
 create mode 100644 fs/ext4/namei-test.c
 create mode 100644 fs/ext4/namei.h
 create mode 100644 fs/ext4/orphan-test.c
 create mode 100644 fs/ext4/resize-test.c
 create mode 100644 fs/ext4/super-test.c
 create mode 100644 fs/ext4/sysfs-test.c
 create mode 100644 fs/ext4/xattr-test.c
