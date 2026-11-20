Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795154438;
	b=AhplIoqXQrzrZBDa6rdfd+A2X+tfg2gKgEtaZqu/y6XBbnx8dbk/szuX6oiDAM7cQxrv
	 HJVpxTzs7iWn6uN+R0qh1Phk92S1usmz+rUGJANPKvoD5kzw+vDIX8CidhwYqjpKgIe6O
	 0yloj7Aa/05ODFVMWevvuUADnCKWGFk/UBjKO+xZQVl70Vygq7gl3YpjQGmvflx/cyTN4
	 8r0b07atgNg871FgJkUohRRdpEajp0g3+grqHFQkEqF76QuZvvcb3VydMROzqNfN/lQ4n
	 oNII3r119tspLMXPAk4UsqjN1gvdDVbWciLMTsfJv0wzp1RDqTHI2PrFDpv+LAoYsxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795154438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DtK7xc22PFS/DS1SnT4QjONMp7nL9Ef3ondTieqkIMA=;
	b=c/kYb777lVXxdSGW9DWTzhEEQz/ZENqmoxyrI/GEEBpCdNgkevLFDBQjErRqX9x5yXCw
	 Up7+wzMQKPE41dwcD4wi+bM9GDZNIuUBINbh5KMs+iDysSb9FsITEafG9EU0xppnyBBOE
	 SQBGtSaL9Ct3Eb1vsWFpCTmW6gz2uoxWEMl9VCYJLXweyZZSclAFPDJLKqJjNxyY9BSaY
	 LSl6rzJ9BizNFnYmjL05QfoalI1NAl0k1AxeqKFu2/gQVNP+kQmKNklN15ZcO3FJbzcNz
	 OcHNGvc61Rmvs9KTEP8v9B+/IAKAYF036RbD3Ig252NBiAnj3vGOQYDvLRG7KQgXOKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bhZqx0yn;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ACD606A51B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20ACD606A51B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bhZqx0yn
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50686daf9cso8923966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795154426; x=1795759226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DtK7xc22PFS/DS1SnT4QjONMp7nL9Ef3ondTieqkIMA=;
        b=bhZqx0ynGLQZaxru6vppQaIy0IHL+cWNPLiD8SFGIgRxZsmPTYkB4mgLCDkQyFh4l2
         LnWb2d0aHmWlvCMOtNJAcafyy8hCOixuczrYA7PC3IwaKfEZnNMszSDuA8s3zzDVSxGi
         GNx27j/QB8hAz742f7EUj6xr3QgJLhKi+AJct0MAjqKzO+gM4cu4+i3FmWrH4MjWk+QU
         C6/7VeBby29MSt+qxX8aLOVpKqUR0hsA2pgbZS03eGCOiDSPScW87JvfYF1sFSYfB+Sl
         AowIR3RSpAt36tSU14gEdrZsDGDZKurBu5o7h4M3VEu+hOpfXFKSDa6n0RpRwrIWysBV
         TFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795154426; x=1795759226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DtK7xc22PFS/DS1SnT4QjONMp7nL9Ef3ondTieqkIMA=;
        b=eaq5Qee8rfPGJy7vUetWkxSTyXr8qvA6JNk47X/yVaSpyExiZyb7RKijrNViSTnkY9
         MQDVmlNjl3ZZsbla/njqZ91W9bi7VRPQZunxpaJ54RX8Qybwgh9R0YSz7oqUkOmuQYo6
         RslIpNxzx5OEa0t74d8TomQ+hdlBI+LuixkehYujP/KXauw6jgbNw2i3VpYaG1TDoOoJ
         NHU6/sUjtGCXS3FWaRLZyVxrXBojypgmxeyeqF+hgjWj2FdTR62KCJaaSweWsbPeiw+L
         I1P+Q/rAvJvqqci5LeBo2xzfrfqZT9no1L/PNosZR9gMHdKZdw/Im/HjlcZPt2lWW4at
         KreA==
X-Forwarded-Encrypted: i=1; AL+hErGoge5FTL2RXy+/uWsFomMu8t38W2oUg8m43RdnYgWM1BAyrIRtgSwAwLdTEQsv6zmRGX2a87LWJmxTcPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GUd64sFDMhLvyL8Y9hIX1wSUzLOUAJ5MH6MaETv9Ht+ognxku
	/L2PwsQTSzIZmMfh4fPt8E/+DB70jV+442/5RrR7Psd/S2bvWKOv0MRagYgv+gnjIxc=
X-Gm-Gg: AYBFou1ZukMEahzP3u5ZbTJDB+oBuIRJILvCpZsUiATMoA73cItt9ArKD68lc8KDIMY
	7kR7UYec/iHn+LMw+VNuSD9OMYbUetjl1mLBdBBZUXVs06RYNX4MPMonFbsbHBzQMGnEmLj+y9J
	LmGi4AcHS7tHFXiE6Zl5XoeZZGchUdt7b1mnV/nFsk+ej9819Tvi4fkobIKQOQzcM7bxLEo9qK8
	U6viO5axWZcG+2UZACfmUYlz2ldIeL7IcYacYFFNsxcnlQeokLQJQpR8TPCyBWPYf5ivEqmwOFU
	JP6eWFSlrpAdcKFjxm8kucWN6SCvSHsqJp7AJE466JTeiGaA9QpKQsTB66pIKxDu0kMAXIBBNxF
	2WkX1YrTMjCQMNtWJejr+xo6Fwow/gKzzpYM5mt/CqHKmqqf0Yvr+esYd7y57M2YUPTUdHNoAWU
	YXqq5TTKUU+Cr+0WnUbYQkUlOFb5FBAcZJ5w8vSDx0XZcX0XbgeULonkfNaK7/Mbz5ZV03HPaqN
	yJM1gCeps1GL+J0+FXYK6kB2uoyVMcVLhYuRhIqdF9/2Faiy6LcLUgNKwir2xVcnmjV1FjTJ5GK
	OZpwAOdj34faAGKb+NmZTbTyJksXpJ82AJol9duS9CU=
X-Received: by 2002:a17:906:cedc:b0:c51:269e:5c7b with SMTP id a640c23a62f3a-c513a85b344mr187941866b.4.1795154426377;
        Thu, 19 Nov 2026 22:00:26 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f571sm918597b3a.34.2026.11.19.22.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:00:25 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v9 0/3] migrate ocfs2 DIO from buffer_head to iomap
Date: Fri, 20 Nov 2026 14:00:10 +0800
Message-ID: <20261120060014.12087-1-heming.zhao@suse.com>
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

V9 changelog:

Address sashiko's review comments [3] (all changes are in patch [3/3]):

ocfs2_file_write_to_iter():
- switch pr lock to ex when DIO falls back to buffered IO
- Fall back to buffered I/O for a direct write when block size is smaller
  than the page size and the write does not cover whole pages
- clear orphan when rw_lock is still held

ocfs2_dio_wr_map_blocks may use a value beyand u32 to call
ocfs2_clusters_to_blocks()

initialize oi->ip_dio_orphan_pid and oi->ip_dio_orphan_end in
ocfs2_inode_init_once()

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

(4k blocksize 4k clustersize, local mount)

fio --direct=1 --iodepth=32 --rw=write --ioengine=libaio --bs=128k --size=1g \
--numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
before patch: write: IOPS=32.2k, BW=4028MiB/s
after  patch: write: IOPS=38.6k, BW=4824MiB/s

fio --direct=1 --iodepth=32 --rw=read --ioengine=libaio --bs=128k --size=1g \
--numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
before patch: read: IOPS=49.1k, BW=6132MiB/s
after  patch: read: IOPS=50.9k, BW=6360MiB/s

fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k \
--size=1g --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
before patch: write: IOPS=14.4k, BW=56.4MiB/s
after  patch: write: IOPS=14.4k, BW=56.1MiB/s

fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k \
--size=1g --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
before patch: read: IOPS=382k, BW=1492MiB/s
after  patch: read: IOPS=419k, BW=1637MiB/s

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

-----------------------

Heming Zhao (3):
  ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
  ocfs2: switch DIO read path from buffer_head to iomap
  ocfs2: switch dio write path from buffer_head to iomap

 fs/ocfs2/Kconfig      |    2 +-
 fs/ocfs2/aops.c       | 1685 ++++++++++++++++++++++++++++++++---------
 fs/ocfs2/aops.h       |   43 +-
 fs/ocfs2/extent_map.c |   34 +-
 fs/ocfs2/extent_map.h |    3 +
 fs/ocfs2/file.c       |  314 +++++++-
 fs/ocfs2/inode.h      |    9 +
 fs/ocfs2/mmap.c       |    2 +-
 fs/ocfs2/ocfs2.h      |   25 +-
 fs/ocfs2/super.c      |    3 +
 10 files changed, 1690 insertions(+), 430 deletions(-)

-- 
2.55.0

