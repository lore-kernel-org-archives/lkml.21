Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496112;
	b=Pl/k9BZS6Y02OG59lQFj68jesheGksT7FKUaZelwl+7vo3h3AnL5TtOPNi/R2JC/O1Rk
	 zuWx2h0ZafdV4JRYRoyKqgZueC54f/91MaS83utaBT2MwsmvgOetQAH6munvrRGMdSljb
	 p06oHHfwNOE5wVw6RavAaAJZAqHuapdA38no4VJdwpvVAE36YyVq5vIMoi7YWRhqHVFUQ
	 vthLWlJLxN3w3eEMQAobfru4HdaAFlfvQ3JPIXj92R+6bnmQN8UNvsibRJta2fHoh7uWT
	 IYzCmT6cDh8oW1hEAx1EthpKdJEGFahpyOWs8KidQ9Y07tnD8/BGilcvPDRSC2G+OqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7aUybPiPpUnNn7ks+/w9bKIAWuxaQfEdz1JAzzHLFhQ=;
	b=SIqq4r3dApAV04pYk6khZp+g6bfBiOFWz3QajNUM5XSzrx71+2FTceD4LZgvYcp77Qnh
	 of4BoWWNlGYW9gJuqxO53eFZNcM4AVWAHN8VcIKRD3rObk4fFrpht5XmCvTUR1XdBgMeT
	 NZMyYZL4gnJMfS5RsafnKQR5si2Wvz16riJ8vECulQBuFFIv1eLuUsBGl4w639wtCTDxx
	 xdI78XGcpQINGHdVWZl1Av4K9N3NseXQ0LL2C1edw6C/ROaMV2WESJMctQLozeDHat1mG
	 /Zq01fCbZd9KJC5Wh/1F+yjFaDJ+JpFusNzZ7Qypnn53TZyYGczh6huL8EWeaFCeUPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=a5u2UxLC;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06130606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06130606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=a5u2UxLC
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6bab1084463so332825a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795496109; x=1796100909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7aUybPiPpUnNn7ks+/w9bKIAWuxaQfEdz1JAzzHLFhQ=;
        b=a5u2UxLCNrsK7VRd60oZO5buypmGZPuD0TnPymvShS8nHmKzHhqoTfZA2TTE4susjv
         wrL6cbgkGgScnRXTPP3pWD7QI/prdh9o0wWVYBtoEaofJfdWVCUQZAvEDtP5dmi23p8q
         5O3xHY0+4NF174QAe7LM6PK02z4jYghqx3mb04JBVQIdUszZp4JDGhC4Glq/ryE+dp62
         kpFUPIQWsF+XxBqDZ32O9B6sgc7O0bGyMKZZySLgLXa3SH/9YnyBmg4lHGb0srHOzPd0
         HdWP5LnIl6UJ+kzsSG6KcWIdSVAV09endqLwlugF6z5r6GDdmGFzMBTSMwNAFaxUAIfV
         Fabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795496109; x=1796100909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7aUybPiPpUnNn7ks+/w9bKIAWuxaQfEdz1JAzzHLFhQ=;
        b=CByJ1pnU1zsh9d5ZtuslvEBQCrIC1ylsk3DUo1/pOwWqavxgdWFoySLl1i+WvKvsgm
         aqPktke/Pqjlr3Udkx1KKzj9wSqLf2zRbgnbrTCLXysHEfMkLgEu15+Px/5eF4ct/wv3
         uQgv4KXNsTd0TVGd62TKuYXV01DJDtUX/gUkSNSc+IIhBcKlnShNm7NrbQWH6KAgQRtk
         hF/6RH1R8HNXdaACiskh1k+tydtQPf022BmpmPydyaz5uQ2FrUzk0UwEdNiy4wWdDCkG
         J/8a9c7q4BDZ3RXx4sC5AZfRx7w8SZn4KlExArLeKAKCjQlJWPGLEA7QUfQd6mZ7D+ki
         lnNw==
X-Forwarded-Encrypted: i=1; AL+hErHhqsCdADYG8aYGQ96B7VVk0h+QmD1pN7iwMUHtSBhNfI23lM+8IlPYMp9AsxV27FAYx0GhcGXpKDoOPHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l9spmSv58aYHb49RFFQt2rxyeV5Oqf072we0dbKWmP9eIsaLH
	6bQpZRiHEq9nKMfCqeb3sW+afInKD3idCHbutT9t3pzfOnEdWcW+PKlX3PyHQSdG90iaqBzPUIJ
	znbPK6Kw=
X-Gm-Gg: AZFdTZciboCFHdRD9YZr1bkTYmbH8403myevY/V3OTu1LJaRzNNkdYRlvB0hif0KvCz
	fjeu74SqBB7QvhxxoTTG2/y5rgjCQmdCQNP5v+YSA3biPQi6XcNc/jJjmehKbYNgUwGK6W0yYYp
	ceNkNQOHzt1kFrTKYlZ3EVkRP09RtrQ5rG2jR6VeJ7cRBMc9ToclF74svQLc0nty00RPIcPoNSo
	SaQkybYfgkJG/BTezE49Q/fD1IIgJTbRJ8G7OaEr+ck2glh1+DtUnHy9vfHoauRLhL9b31iHQi5
	f3AcVAouPxJZ72ZX0UIcomkAcmQLClkDRU+eY999w9NslWvGPwHoq1ZP9xrWE5iWBNhTV5ot/pV
	PSkk/R/BfhCGJr3BlR43zY/kOxRJt049WgZbrhMvxpz+++BVS4HunqJBhXmWlWJIW1yAtlkw+HA
	vURZJUrThxfx0JXc47DsnseAoaRgKbOXtzMh4QqcKEiKL4TTYhiFjZCQnWsQpS+LaNYdhSeBYUe
	/mc9CDDMbUYLK+4zWOHANRI4/cJF9nM1fQioLA9BEIz0/FnCGUzguIdKQ3PY75Y4hYdgsG1Ga4l
	gCtxFAFUblxnYQFiHPfPIIeewysCcHQMCV2dGhM0hpI=
X-Received: by 2002:a17:906:ad93:b0:c41:8e21:4d62 with SMTP id a640c23a62f3a-c513a4391ffmr983299466b.1.1795496109341;
        Mon, 23 Nov 2026 20:55:09 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm20989085a91.15.2026.11.23.20.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:55:08 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v10 0/3] migrate ocfs2 DIO from buffer_head to iomap
Date: Tue, 24 Nov 2026 12:54:56 +0800
Message-ID: <20261124045501.10281-1-heming.zhao@suse.com>
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

V10 changelog:

patch 1/3: fix a typo (gridge => bridge)
patch 2/3: fix commit log two mistakes found by Joseph.
patch 3/3:
- based on Joseph's review comments
  - ocfs2_dio_wr_map_blocks(): move the condition check IOMAP_NOWAIT before checking fast path.
- based on sashiko's review comments 
  - remove comparing line in ocfs2_dio_clear_orphan_locked()
  - add re-accessing i_size code in ocfs2_file_write_iter()
  - add a comments for del_orphan inode pending issue in ocfs2_file_write_iter()
  - reject unaligned I/O even when DIO falls back to buffered I/O

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

-----------------------

Heming Zhao (3):
  ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
  ocfs2: switch DIO read path from buffer_head to iomap
  ocfs2: switch dio write path from buffer_head to iomap

 fs/ocfs2/Kconfig      |    2 +-
 fs/ocfs2/aops.c       | 1689 ++++++++++++++++++++++++++++++++---------
 fs/ocfs2/aops.h       |   43 +-
 fs/ocfs2/extent_map.c |   34 +-
 fs/ocfs2/extent_map.h |    3 +
 fs/ocfs2/file.c       |  342 ++++++++-
 fs/ocfs2/inode.h      |    9 +
 fs/ocfs2/mmap.c       |    2 +-
 fs/ocfs2/ocfs2.h      |   25 +-
 fs/ocfs2/super.c      |    3 +
 10 files changed, 1722 insertions(+), 430 deletions(-)

-- 
2.55.0

