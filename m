Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070441;
	b=lmqkttejn9YHNIAjMyETctpOMlyq8SlHySPLyl7QqZcfTfK1N+DkA9t6X1Zc0I7uDt6P
	 PD81abyR8jCnhhNZV1kC7gXKBJkQW6NoXO3xA7pEsdL7Yy1i2KQ16qhWG7d6ucB6sRxT7
	 VvpyLGj5Ro7pT4qQo05zmedueQ8xVous//RnYeAviHNQjCQUtSZRzAZ0/30f/fUQS3/O+
	 I3PE1+zF82rqODKM5Itku8fGZGmax5eCTokgY7KJ4Uuqlt5h8IpIoOgti43ywg5griQ7f
	 oRmmJtXqOtYt6arK1FzMQFUL4uctRiJtjZTijJ9iatUCIjgQyUc6eubGQEZGnUyHPAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0+i4kPjCyDFw5Pumf94Wx8o9MH3eUOLWR8/QQh7Fq4I=;
	b=2cZNT9aTbTaMmmRmIvcZLDA3xGTQXXqgj2RIXjP5Dt1H4ZLUt2uuh7NSOdLLMDGTVpUF
	 k4HLPnLbSvNxd50juKaFA+YVt75nKrFbMprk9meaPqXaJnyOy2OU3Og6lk6dSE/t8I74B
	 0D87kHn19uJt4bZJ1FLfTk7jBIvAWZzMgWwXMnjdvOUZxbNEct4l1QCUQAYQCISI43S9i
	 qljowny++C/B2XvgrUp+gOoYNsgV4YR5BGgxf05qt9IY0vj1JQWRQ3D4GHLUsvrZj/f1y
	 OlT2LXui82AHNi3NXDAZQYMQeFABUTbiyEH0rH0+dOGjuwNiKhVnWMCDL88EHLEONJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OQJDt8Qs;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C1A606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70C1A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OQJDt8Qs
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb67b3a18aso1305975e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795070439; x=1795675239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+i4kPjCyDFw5Pumf94Wx8o9MH3eUOLWR8/QQh7Fq4I=;
        b=OQJDt8QsV3tBMEosqCXDLtp0K0YvVdy77xsfQEwoNS5k5bQWR7ov7TfdctfiXdzDp+
         Mzn5TzF5yHCzVVu5/HSSmwVQmeNOgScS1aYvtxNALPX7q56++2DQXgbsOGB1t39v9v3A
         lEx9JhfcJU3MaQh98+Wte1YDZG4tF8yv0lF9CKeqTshaUaqpZPsQ/e0xxVYD9gnh3TtE
         YNniaA6SOOvoBNe4pelYkBjPrB1zfCaNAUf8hXUZ8wGUkdikn62DjMwcfC3sXJw0uCTN
         xEvNaJrZ2xUCvyKDfDLBv/7w93RQ5LyqcBqXqaDeiYbkL/zjszL4xYOsZfyhVP8YerHr
         nEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795070439; x=1795675239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+i4kPjCyDFw5Pumf94Wx8o9MH3eUOLWR8/QQh7Fq4I=;
        b=XNGCs/sAO+bbcMBzKMhavB7S12fQJQbfoNVrYBfORG6xjFCsC8NCdqUQBzQ/GfoF7e
         NA7UaVAI3w4pE5tYZd9buqy84ice+8vE+YS9zoyQ4lWfqTiyDPCYb3zi+ejdT8KiRcVt
         LpHNq8p0bjCBK3mvzhO9ldUiVtjXDGs1hNh6xSyuArAsI81AN0PejackDZWdNL1OfGJc
         LxHTa13QIqhKwTbyIMDE2AE2oo2KMNwwZZD8jDXfZyXXV3vwIUEE3upKHaqpdFMr1Glq
         TWvjrwGUoWdgrL4CM3lr+2l5hoQKAVCHz2FnqMDLGK1trUGccxkwyzYgd82mnAuRc6p6
         BjZg==
X-Forwarded-Encrypted: i=1; AL+hErGRqxnDW3nv3YN7Zd79F/mGI+c7DwBU/UtRSKGZY9VPt5ePO2b9NKSrnEvQwJyN52Z4MJ1btNNgDlXFTZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pL9zMtoyA9bjOBAy5hPbsJ0m+6s5/MEELx2AlGk/Ega/f0moU
	iuX84NKNyly6l+uAUUb64N+Xn6Nb0WN6zrpyUcWeTCHxjjVEIHlrA15ucT5lOAPM9OFhzB5eG8B
	DHu2E/N4=
X-Gm-Gg: AYBFou0HhZF4+DTyomG7qlRlB4YoPMRKC75opZPpWxHk3XneHwIHV7nER1wUHoFGIRS
	/DeuMqgtl2AihoBTbUywK5A4Oud8LbqrWzpxNSIb/Uc++W8+QLqwPO5RZGUF/eRu1vi7JfPOYEc
	Inq3huP3vJylfLDYA2+HZlfj0dQn6EsnluhtX5dsKXrjWUcDN7uQuEOKjtdXliC0leuf6mtoxCz
	Pt1cKsKLPK4ip1gydK7pYSfG4cR3VhJoXCtsMH1vUGeeZRDh/xhFe+v64JnkVbjxxiOVN9u5+4B
	6lNRpThZ18SkXHzsBWI6YNAlIOO1nFymKVk3j9bF49bvMOOIh8zYa+DFS/etwOHup4ebmWL3skQ
	9r1NCDmrYPNgrU2cgFUE6FVO/NUJnZGUKfD1X/4nq630K6lMrMoMFIt0WkMwZtd6+ZWtFHlO9z7
	Amgnyfbux4DtDdAD5CYqObvLMS+lzTX2U0lgF4fOs1rxd55croUCeeyUR2ZGmkpXI0aQo03b54T
	ugREFVacMSOCSOkpOfPypHqV5M4MTz+faF/VxGZj26zeUetoOE07hAxrRy7sl0nsZsZGl8aCR9f
	eHRs/6gUXUdt0z6GDbLkpW9Zk3dThXLL0ax2xsEQ4U0=
X-Received: by 2002:a05:600c:4e92:b0:4bb:7ae0:30bf with SMTP id 5b1f17b1804b1-4bb7da147cfmr84885725e9.2.1795070438763;
        Wed, 18 Nov 2026 22:40:38 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa769sm2286469b3a.18.2026.11.18.22.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:40:37 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v8 0/3] migrate ocfs2 DIO from buffer_head to iomap
Date: Thu, 19 Nov 2026 14:40:24 +0800
Message-ID: <20261119064029.11910-1-heming.zhao@suse.com>
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

V8 changelog:

Address sashiko's review comments (all changes are in patch [3/3]):

1. move del_orphan from ocfs2_file_write_iter() to
   ocfs2_dio_end_io_write().
2. Fix several edge-case handling problems in the DIO write path.
3. adjust dio fallback logic in ocfs2_file_write_iter() to ensure
   dirty pages are properly written back or invalidated.
4. Note that some issues reported by sashiko are pre-existing
   problems and won't be fixed in this patch set.

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

OCFS2_MKFS_LOCAL_OPT="-b 2K -C 8K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/056 generic/075 generic/091 generic/094 generic/112
generic/177 generic/211 generic/225 generic/263 generic/319 generic/321 generic/322
generic/329 generic/331 generic/370 generic/376 generic/424 generic/448 generic/467
generic/477 generic/481 generic/498 generic/510 generic/512 generic/513 generic/534
generic/537 generic/552 generic/557 generic/563 generic/564 generic/578 generic/588
generic/607 generic/620 generic/630 generic/755 generic/759 generic/760 generic/771
generic/777 generic/779 generic/784 ocfs2/001
Failed 45 of 632 tests

## fio

fio --direct=1 --iodepth=32 --rw=write --ioengine=libaio --bs=128k --size=1g \
--numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
before patch: write: IOPS=38.5k, BW=4808MiB/s
after  patch: write: IOPS=39.3k, BW=4911MiB/s

fio --direct=1 --iodepth=32 --rw=read --ioengine=libaio --bs=128k --size=1g \
--numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
before patch: read: IOPS=51.7k, BW=6461MiB/s
after  patch: read: IOPS=50.0k, BW=6253MiB/s

fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k \
--size=1g --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
before patch: write: IOPS=27.3k, BW=107MiB/s
after  patch: write: IOPS=26.9k, BW=105MiB/s

fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k \
--size=1g --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
before patch: read: IOPS=372k, BW=1455MiB/s
after  patch: read: IOPS=350k, BW=1368MiB/s

------
[1]:
https://gitee.com/anolis/storage-cloud-kernel/commit/ea3fe75e2060118ba093e90b1cd34fa382914b29

[2]:
https://sashiko.dev/#/patchset/20261103135605.22943-1-heming.zhao%40suse.com

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

-----------------------

Heming Zhao (3):
  ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
  ocfs2: switch DIO read path from buffer_head to iomap
  ocfs2: switch dio write path from buffer_head to iomap

 fs/ocfs2/Kconfig      |    2 +-
 fs/ocfs2/aops.c       | 1661 ++++++++++++++++++++++++++++++++---------
 fs/ocfs2/aops.h       |   42 +-
 fs/ocfs2/extent_map.c |   34 +-
 fs/ocfs2/extent_map.h |    3 +
 fs/ocfs2/file.c       |  226 +++++-
 fs/ocfs2/inode.h      |    9 +
 fs/ocfs2/mmap.c       |    2 +-
 fs/ocfs2/ocfs2.h      |   25 +-
 fs/ocfs2/super.c      |    1 +
 10 files changed, 1577 insertions(+), 428 deletions(-)

-- 
2.55.0

