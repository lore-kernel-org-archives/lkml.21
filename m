Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794961261;
	b=UPq5kW4Bj2jCKXT0bVh3U4lSwhWjAYbhLdhgUitcxu34GgVc3UoysCRcQn8BVd4gnJr7
	 CkW1kJ5j6rnubw6nIM3A8fApKB/E2ZRpOz7XVZGTLgusJa0W05RyJWF2/1NZ8tP4LClEw
	 3XcyCaBmSnXYGafkpBXYFOFSpHsIvRXERZjjeIYGd6BktHkC+RdXKFzljt7txpaG9VQOA
	 DWpSILbdg2rJ8Nt/7UjNHQZGWNvBIz3FsS0E1PHR4xzi/72g1iveFTDp2mfJHxvh0jIZj
	 Tq1pwQv8IZUQZ4bKjb5m3/lc9kFdUg0B5QtCil5G8GzZEPyWisI3XwUeN70KWRUo/Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p48I65HeS0LE6+JEAKuMNs7lMy0Bmt0jolYFmJ5Afoc=;
	b=AOYDO1KKrPQFoIEkEZC+6PzJXxhLjMsfiOXcZsFkFCgqOQR7wevYqJcPLvLr/zHn62zg
	 xFl63q7XqOAs+ne0CZQ2AFbtuMzPckC8dmMwqu7COrAU7RMCd93SzAXsSLUSxIFwHATxa
	 bUAjY5Cq7Ez2F60nSdSSTv546IZ1vAfNaAJ1+7hoRwyk4gxQtqmSvPl+Qe7RQkMXy1Y29
	 +k/ICKe+dQtGKLYCm/BAWGNZ7X19OkitrZZM8xZzqEpZiCiV68LksLq2ueAn+tpdnVYoK
	 d1ihAgvQPE56FvRVzgLIQkHRN2SK4zho6R25cDs4JZ4z13Oi2RNbPB+nV0vTOU0mS6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Vn4f8nE+;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748D606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3748D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Vn4f8nE+
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df4f7ccf4so35290f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794961258; x=1795566058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p48I65HeS0LE6+JEAKuMNs7lMy0Bmt0jolYFmJ5Afoc=;
        b=Vn4f8nE+QlhvqnHu8Rocbf5bMhOqES56vORB1T/uF8y+eDUL0gX5mLo3QsV8HSFoDM
         plTlS6sETaSMlvJLknulhtHBxgbDnUO2bPoWW7epxNiw8CMKwHVh/apfjXgQKnfvlPm8
         c4pOiDPzahhGFEwugJOfIfdT9x3Z53/JUAWYgt5vRv8LmREHaSa+kzRg7f5dDT4jQ5zC
         tAYb1edSg4PB1/PPcqkB4t+hz4Ah4MxJeurTB5QVNk418XQasmLQTQXAGspYp6LyK3Gp
         Zwp8GCxYIbbixq1Gkq+ezBN+SHlkEWx4t68lTF+nOPeavKXm8p75mM/K0aEP5pE4knlw
         ti2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961258; x=1795566058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p48I65HeS0LE6+JEAKuMNs7lMy0Bmt0jolYFmJ5Afoc=;
        b=B5xJsEiYLHaBwlsKkEUTNmLyAV945DW73WiToZNLVgFiAfa/c51d2iYoO+Ho8jT873
         5P4ypVEbm8iZw8TxWC92hCNU1vPH2EPaohDxm0disGqSIxN/eYtKv7Lq0kLc7GS0qvOr
         dsnu2FiWLQWAz09xzfiaOEUUbeLQV7c4IjvuwCJp3oI/gCCekQ0deXzvw5pN00CKbsdC
         SGk2tq7inVRloqZTPmoKLttnzOWdRNnZf8mGumavkXH4AnHIvhBS5k44m9DMl+YI0vl+
         ZinXZ1HoufDOOuW19fsLm2eEUeuqA8LUUsk85/Eg/BAMHfvEYXTzlNyIkrzloslqiiZt
         iJwg==
X-Forwarded-Encrypted: i=1; AL+hErGUfh8Zo+KpGmFNr1j5qb3ml74p3JcbHk5VxFcThaIZhkq3ivIh1AhdKxFr3exRziorad0hBqsocEboNyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZgFPUqeu2O4dGuVE2VYbKWgTAp3/L+Lijne0qs3BSE5qn2J8e
	/5Gx84gq9cJcjW9nlWebgMnNLHLycWijHTfMpDCabMsmtniUDB41I66XioO5KHkT0Wk=
X-Gm-Gg: AYBFou29xMrUCneQ7LUA7dzqUDVPEJM/zuww3rnWezQFibvStfyhi//tVH5Yh7cXyD0
	7wFVK8ZhgHXOmuDRtsJu6wtMeN1qW3gdP4HrNlmnbQOUzTVUHrWgcIcVTlcjvOBxosEm7gHGRrS
	4cPOFYJIXv2yx9m1v5c9IQSZblNc0CkRKEUZj0cCtr4R39NEbVWcIh/GYwbKctM8Fx5ZDDNWxLB
	ESKilzIUGdHJudssiCvOVpg0I+LCfSh29EHymfBbE6bRFaXEwBTiDZ2dKzWTk2eKtf0kr2KMoJ3
	CAmkerX4BfS6ZlXYhQp8woboVtjvw5x0msgicDowIu4Rxw3WBfZgUa8oeYzYu5fvINGdIhABL/H
	fR4M1dvjkRLh23y+kfUb+HcS20u5oNj4yl00MZyvDADHITuw4TyuafQw6nyy8QFN9miUGtoNtpp
	MnW5s1MOvQ+ju+HjJaRKqWgclqWHYu2LLU2Pu3TkiwFHgz5oLAMvdZQ05LAhG6G43IoF3anyag9
	0UKDX26QIKqOkDnNFq4F/n3YEynXGB2klarNFNmCxvsAT1juZU1doRbFgXXkX7fYE5zO1fWC69S
	sLoFsP7rOa5Sgt1kHtzRymQDoFunlxmnUN+Ijplf6Ok=
X-Received: by 2002:a05:600c:2e0b:b0:4bb:6a02:d42e with SMTP id 5b1f17b1804b1-4bb7da033b8mr9285215e9.1.1794961258575;
        Tue, 17 Nov 2026 16:20:58 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm2373481c88.9.2026.11.17.16.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:20:57 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH v7 0/3] migrate ocfs2 DIO from buffer_head to iomap
Date: Wed, 18 Nov 2026 08:20:46 +0800
Message-ID: <20261118002050.9019-1-heming.zhao@suse.com>
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
to iomap mode. And the code base is commit aebb72744764 (v7.4-rc3),
and also merge Joseph's code and ideas from [1]:

V7 changelog:

Address sashiko's review comments. Main changes:

1. Adopt the latest iomap API and remove the iomap_ops structure.
2. Add a retry mechanism in ocfs2_dio_wr_map_blocks() to fix a data loss
   bug. Multiple concurrent writes are serialized by i_rwsem at submission
   time but completed asynchronously by ocfs2_dio_end_io(). When the
   unwritten extent conversion fails and finishes first, other threads'
   submissions would lose data but still return success.
3. Fix DIO alignment issues.
4. Fix several edge-case handling problems in the DIO write path.

Resend this patch set based on sashiko latest review comments:
- ref: https://sashiko.dev/#/patchset/20261117150053.18417-1-heming.zhao%40suse.com
- build issues with the latest iomap API
- comments contain some stale symbol names 
- patch [2/3]: change the check of "map->pblk < past_eof" to
  "map->lblk < past_eof" in ocfs2_map_blocks()
- patch [3/3]: remove the dead w_unwritten_count field in
  "struct ocfs2_write_ctxt"
- revise some commit log mistakes and a typo.

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

--------------
# test report

This patch set has been tested on 7.4-rc3 kernel with the following test cases.

The current code still needs some polishing. I hope sashiko can continue to
find issues in v7, so I've only done a few basic tests so far.


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


-----------------------
Heming Zhao (3):
  ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
  ocfs2: switch DIO read path from buffer_head to iomap
  ocfs2: switch dio write path from buffer_head to iomap

 fs/ocfs2/Kconfig |    2 +-
 fs/ocfs2/aops.c  | 1626 ++++++++++++++++++++++++++++++++++++----------
 fs/ocfs2/aops.h  |   42 +-
 fs/ocfs2/file.c  |  248 ++++++-
 fs/ocfs2/inode.h |    6 +
 fs/ocfs2/mmap.c  |    2 +-
 fs/ocfs2/ocfs2.h |   25 +-
 fs/ocfs2/super.c |    1 +
 8 files changed, 1533 insertions(+), 419 deletions(-)

-- 
2.55.0

