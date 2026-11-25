Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621596;
	b=ZcYPM7LcFY3IeJaKeY0ghaEeEyH8/Yr88TPF1YGwHo0wZdDbO65yeuyFTQ2RsqIB4/+t
	 EuHQdXhOLuhHyOn0jSa0KXvOPIiIqp1tW1S6xsMwK3HLWx5s8mV+VZw9ADKaygCY1JFtQ
	 jhfw0YB05Y5xqmvreTgsZuh1EO3vcPgNrRRKZH4ahnWZ6QbvLh73U4YRPEqqz0BQrV+f6
	 gL6gqBm+ANvKd3+fzMASmYYBH9bE9GanKdFq/mlfxwsSC0dsNDvNvCQHBviS8o36rAKYf
	 qV/uC6QWUFCDSN0TmQ4cGzy7hI+TkR31hKTh0kbFlBbuDEsRc7ktrgN0z2IX2O8966w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=adV91UNf/xXHzN6L3ZMDB+0yf+V1HEUnItm0oTlcCfk=;
	b=ckNyet8csrMobsvNaPsDlfNWHYpG0DLDS5YNnmH2OIyZ2RXXXCFlpaDeTkQmPyCzg7kr
	 s9AVdGLjK296aX9EaH0QjLucUApvRkmXahw5qLdIjd+ERoRtH0D60ln4MQBxOfKuIaq92
	 FHQbejB4IgQEUS9gBiob4325HJxoAZTxyQCQHlApnlpMQpwXTXfBzIzLsN5jXTLbCYJjz
	 EL8xsTwwICwqAUMk91DR6ljiM6OGKu2r7rWqfp8XwIAG7UOuV+ZMmS02i38q6d9ZnuLLW
	 +7BWYFhFi8VlESJK5p4+7llE4H0/mGF4aTk2+BkVXudSHhrJuKaIczcO6Ypq+SmCyIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ew2NlrEJ;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DE6606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5DE6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ew2NlrEJ
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b896db8f9bso578379a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795621594; x=1796226394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=adV91UNf/xXHzN6L3ZMDB+0yf+V1HEUnItm0oTlcCfk=;
        b=Ew2NlrEJkzPFzM2tw5LfeRZqyY+ubzsdLbWTSvCA9Ee+2SA4eVokogy6whAPDTrlMT
         3E/2Eeg6JPdinRZk/6OxvSNo1aW/r+gJD5vEtGZ5LyCYrx9o0p4vSGMPhnubrLzXR8o8
         nY7s6OjyiNIj0zjphHwYZkwQj0sWKWi5huc6A6obzHI6SF14rs5tk/Bm6ikgdetBzn1b
         O2SVpC367NVb7l14SXDV9qFbqOii7spEgWp7qOeIw0FsCjoP0audR3MuNoe0ZDNYQnX8
         WXmd8lF3qoklX6ca4offAq52rYMd8bscoO6LLDYRsi2YAeMZk4uZ9A2sktfi95mO+lse
         1ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621594; x=1796226394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adV91UNf/xXHzN6L3ZMDB+0yf+V1HEUnItm0oTlcCfk=;
        b=XPuejDl/BrXAlFWD6D1jO9XStLzz+KpvMbmZ+8RtUALeMTa8ZM1Ya/pvjWl1Nq+Qa0
         lZkLEAhwWn31wkRheAvL9Igk18QcR4D8Ahr5fej8mUU5jODmjhBPVmE7pQPymchomL6M
         EvekyEqgFXbkP60eZvyCdbsys+UW1PkZPSseQ/90W9UW0jYVwHB+TnAH7qzf/4vGOLFV
         SfB0L6O2uanGeyJGDLZngf1htY4+YVD7xhXk29W8hNIgxiuRglgA2uN4nAGndtSK+yOX
         +kt2kn/+xp5Qz7erj6ra5NHqWfhP4bsnWrvY6DrFuRX3VcBF4qQK+/rL1drXUi4bsaQH
         2cvw==
X-Forwarded-Encrypted: i=1; AL+hErFt16rkCaq7OOc6OawR39ViFPi9nxwMkv9yDjzWjaLZcBFYP6wjrW4cL88f2+j0foYS2+UH4ng7wcGUuJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ol2I0oiFRybHppeTfh9EbFFq1VUm3bMiFDl2rENxC3JrUCMQn
	JKV+Li9MwRxPuNotUAafp7MVXEizlRP0X5kTurTLh8zE7AMirHrJ68Uvrd7FvciMUu8JQQS4hk8
	mpm8EBR0=
X-Gm-Gg: AZFdTZf8VKqWx/4F3wzro7RG5CtRKGKczMEB4Y6gm3dBI2hKrMEmnIiaqleZER4+eRq
	ksxfY1aYZh7T2piOWHFE7rOz9fce0HWEP/glXholoXvNJe9GnCncqvP7lxoEPe9BzByZTS1+QaS
	j4FLGiGeSt6iNPystaDqYjySvZ+33oALvUyqITtrPakY5k1zp1Km2AQNisE4qtW0VDj8ButFS0r
	hN/UJ3M6jAWYwbpLXfS9rMZ1ZE0hq/XYB8+xM+ZVqzHWsKS40bZswr7h50ydUzoBfh40/qPHXgG
	63KQ7xG/PHEw8qiQT238ulhRoz3GdqesqqM6l0UMaeHA6iPt2E9IpJoooQ51+ijvtLoQA44r9Ps
	ydqo6rEx2to5mXffJDruZ4wyGcOQC1JATC/kdk98OMw/5jFtGYsU1W+ZuRUZ+7FWgwvg7lzAuro
	bjfrxmOcZFWfM9hmkHhVibXIVkNK67lnRt1/GYS1HKvAhi5CiNmIqZ1qlYuVHbil+56lyl9HbsU
	VjS4otSoevDxhXcsT/Ycf7knRgP/67A4+TT5ZMhS5dKfTS3ZVS4dufa5XnMyR1f7VmbxBW1Pbo7
	whjxNv3CR+jajDw8ullANeJnP1vF8KJhwksbFKeDA+A=
X-Received: by 2002:a05:6402:a545:10b0:6b4:2960:d381 with SMTP id 4fb4d7f45d1cf-6ba37c76e50mr12198200a12.1.1795621594123;
        Wed, 25 Nov 2026 07:46:34 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm9419677b3a.7.2026.11.25.07.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:46:33 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v12 0/3] migrate ocfs2 DIO from buffer_head to iomap
Date: Wed, 25 Nov 2026 23:46:22 +0800
Message-ID: <20261125154626.22335-1-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set migrates ocfs2 Direct I/O (DIO) from buffer_head mode
to iomap mode. It is based on commit aebb72744764 (v7.4-rc3), and
also incorporates Joseph's code and ideas from [1]:

V12 changelog:

patch 1/3: no change
patch 2/3: no change
patch 3/3: (based on sashiko's review comments)
- add IOMAP_F_DIRTY in ocfs2_iomap_begin() when the write extends i_size

- introduce new api ocfs2_dio_cleanup_range/ocfs2_dio_cleanup_pages to
  fix Sashiko review problem for function ocfs2_dio_end_io().

  ```sashiko review comments
  [Severity: High]
  What happens if a multi-mapping direct write to unwritten or newly
  allocated clusters completes some I/O (size > 0) and then fails on a later
  mapping or bio (error != 0), for example with -ENOSPC in
  ocfs2_dio_wr_map_blocks() or -EFAULT in bio_iov_iter_get_pages()?
  
  During ocfs2_dio_wr_map_blocks(), any unaligned head or tail folios in the
  page cache for the first and last clusters of the earlier mapping were
  already zeroed, mapped to the cluster's physical blocks, and marked dirty
  and uptodate via block_commit_write().  Because error != 0,
  ocfs2_dio_end_io() skips ocfs2_dio_end_io_write() and discards the
  unwritten list, and iomap_dio_complete() skips
  kiocb_invalidate_post_direct_write().  That leaves dirty, mapped page
  cache buffers pointing at an extent that is still marked
  OCFS2_EXT_UNWRITTEN on disk.
  ``` 

--------------
# test report

This patch set has been tested on 7.4-rc3 kernel

## ltp

runltp -f dio -d /mnt/ocfs2/

results: passed

## xfstests

./check -g quick -T -b -s ocfs2 -e generic/081 \
-e generic/266 -e generic/272 -e generic/281 \
-e generic/338 -e generic/347 -e generic/361 \
-e generic/628 -e generic/629 -e generic/648 -e generic/650 

OCFS2_MKFS_LOCAL_OPT="-b 2K -C 4K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/056 generic/091 generic/094 generic/177
generic/211 generic/225 generic/263 generic/321 generic/322 generic/329
generic/331 generic/370 generic/376 generic/424 generic/448 generic/467
generic/477 generic/481 generic/498 generic/510 generic/512 generic/513
generic/534 generic/537 generic/552 generic/557 generic/563 generic/578
generic/588 generic/607 generic/620 generic/630 generic/755 generic/760
generic/771 generic/777 generic/779 generic/784
Failed 39 of 632 tests

OCFS2_MKFS_LOCAL_OPT="-b 4K -C 4K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/056 generic/070 generic/091 generic/094
generic/177 generic/211 generic/225 generic/263 generic/321 generic/322
generic/329 generic/331 generic/370 generic/376 generic/424 generic/448
generic/467 generic/477 generic/481 generic/498 generic/510 generic/512
generic/513 generic/534 generic/537 generic/552 generic/557 generic/563
generic/578 generic/588 generic/607 generic/620 generic/630 generic/755
generic/760 generic/771 generic/777 generic/779 generic/784
Failed 40 of 632 tests

OCFS2_MKFS_LOCAL_OPT="-b 2K -C 8K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/056 generic/075 generic/091 generic/094
generic/112 generic/177 generic/211 generic/225 generic/263 generic/321
generic/322 generic/329 generic/331 generic/370 generic/376 generic/424
generic/448 generic/467 generic/477 generic/481 generic/498 generic/510
generic/512 generic/513 generic/534 generic/537 generic/552 generic/557
generic/563 generic/564 generic/578 generic/588 generic/607 generic/620
generic/630 generic/755 generic/759 generic/760 generic/771 generic/777
generic/779 generic/784 ocfs2/001
Failed 44 of 632 tests

## fio

no test

------
[1]:
https://gitee.com/anolis/storage-cloud-kernel/commit/ea3fe75e2060118ba093e90b1cd34fa382914b29

[2]:
https://sashiko.dev/#/patchset/20261103135605.22943-1-heming.zhao%40suse.com

[3]:
v1 patch set:
https://lore.kernel.org/ocfs2-devel/20260724052559.15409-1-heming.zhao@suse.com/
v2 patch set:
https://lore.kernel.org/ocfs2-devel/20260727061802.18485-1-heming.zhao@suse.com/
v3 patch set:
https://lore.kernel.org/ocfs2-devel/20261018143319.22329-1-heming.zhao@suse.com/
v3 sashiko review:
https://sashiko.dev/#/patchset/20261018143319.22329-1-heming.zhao%40suse.com
v4 patch set:
https://lore.kernel.org/ocfs2-devel/20261103135605.22943-1-heming.zhao@suse.com/
v4 sashiko review:
https://sashiko.dev/#/patchset/20261103135605.22943-1-heming.zhao%40suse.com
v5 patch set:
https://lore.kernel.org/ocfs2-devel/20261105071930.16399-1-heming.zhao@suse.com/
v5 sashiko review:
https://sashiko.dev/#/patchset/20261105071930.16399-1-heming.zhao%40suse.com
v6 patch set:
https://lore.kernel.org/ocfs2-devel/20261115154013.9379-1-heming.zhao@suse.com/
v6 sashiko review:
https://sashiko.dev/#/patchset/20261115154013.9379-1-heming.zhao%40suse.com
v7 patch set:
https://lore.kernel.org/ocfs2-devel/20261118002050.9019-1-heming.zhao@suse.com/
v7 sashiko review:
- https://sashiko.dev/#/patchset/20261117150053.18417-1-heming.zhao%40suse.com
- https://sashiko.dev/#/patchset/20261118002050.9019-1-heming.zhao%40suse.com
v8 patch set:
https://lore.kernel.org/ocfs2-devel/20261119064029.11910-1-heming.zhao@suse.com/
v8 sashiko review:
https://sashiko.dev/#/patchset/20261119064029.11910-1-heming.zhao%40suse.com
v9 patch set:
https://lore.kernel.org/ocfs2-devel/20261120060014.12087-1-heming.zhao@suse.com/
v9 sashiko review:
https://sashiko.dev/#/patchset/20261120060014.12087-1-heming.zhao%40suse.com
v10 patch set:
https://lore.kernel.org/ocfs2-devel/20261124045501.10281-1-heming.zhao@suse.com/
v10 sashiko review:
https://sashiko.dev/#/patchset/20261124045501.10281-1-heming.zhao%40suse.com
v11 patch set:
https://lore.kernel.org/ocfs2-devel/20261124152623.7838-1-heming.zhao@suse.com/
v11 sashiko review:
https://sashiko.dev/#/patchset/20261124152623.7838-1-heming.zhao%40suse.com

-----------------------

Heming Zhao (3):
  ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
  ocfs2: switch DIO read path from buffer_head to iomap
  ocfs2: switch dio write path from buffer_head to iomap

 fs/ocfs2/Kconfig      |    2 +-
 fs/ocfs2/aops.c       | 1820 +++++++++++++++++++++++++++++++++--------
 fs/ocfs2/aops.h       |   43 +-
 fs/ocfs2/extent_map.c |   34 +-
 fs/ocfs2/extent_map.h |    3 +
 fs/ocfs2/file.c       |  345 +++++++-
 fs/ocfs2/inode.h      |    9 +
 fs/ocfs2/mmap.c       |    2 +-
 fs/ocfs2/ocfs2.h      |   25 +-
 fs/ocfs2/super.c      |    3 +
 10 files changed, 1857 insertions(+), 429 deletions(-)

-- 
2.55.0

