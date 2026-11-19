Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131678;
	b=IpJPW4gS6aLWzxeKvZXd3PJagKr0yyVqwvV0GTacAcQDaa2Y4y9dLpKqC9ek4Vpn8lTu
	 jf02TSbFllHR1xxlZvpgtm3OPCmBWS1s7pwUh3+qMchV+V2UGMimEtS6OhQnj5wp1W/+2
	 MBOFj2GRlhyMSEM+aF7nmMhs7dIebRRcd8WgokxSbXtPzVlXoow7arCZNzG+KbK6VpUH0
	 dCuWfgnQV7Vkkp4J0StnV0nq58cLofxUeKTDGuK83dLxD4Bnq04haA0yif/tch11FpnYj
	 zTMrHMY9EcUE2qm1xJe7yEO1KpDoS/A9V1zlVS09rOVFiqKPhx6qGozxng0XpTlWBqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=an0U6IWX+qMTU2m+N9EdyCef/NSu92TzDqM2zL1EUns=;
	b=TCmjB9cpkvtqniyH92xkObNAuIVI4mOvMeHUHuCPLNtjA76+1beGFOtbH1CkrvG813iq
	 xcMeIpqVNiWcLAX/TjlWdH52lXXUKOxInmiUATSmt4bnZMHXupzGavzcQOj78bQPavTgm
	 q+7xGkHjSB0KZNv54+hOXsBszdJcyQWYWiScKwMBrzjRE7cU6JUf/rSxs3uEbLPOrnBo/
	 +7r9bkzQoLK6YSXtnXXX37WBl+cR+XVZfRefwzP+nEIcrWh5JJ7QB1rYrU2ibNr+04CuE
	 tvhsbHCvy/b/BfksfQQByjjXgzezl+fO67vGdPEMhGrKwXFlu3GGW6fftMwGWtyYXbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mmvCH7eT;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC99606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC99606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mmvCH7eT
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67c0bd676eeso293786d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1795131676; x=1795736476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=an0U6IWX+qMTU2m+N9EdyCef/NSu92TzDqM2zL1EUns=;
        b=mmvCH7eT+ZsfaHEcOVKyQWlk7NwPeG5ev0rChxrFHxv+ZZlx4FBMkAO8AfAAJmKw4x
         WCusY15ua8suD1gzCUOoWsTa92Jo/wKcYskQAZTZ8pgWV7a6wdnk4mk0aLrt53LCqkZg
         DWWnU6o3vyUJ+capamGrW8LdjVSXWinAHA8c8KZxjSvpznCpc46pAvj66WzUYpSiHVcS
         lemkx8YIOfq0reIWhk+N1rC5ninbnWJ292DA8gZPQmWGX+KPksoc0td30kbb+UU5D7sj
         AwD9yeLo27D9XbUn8/CUDSPYdGsp6cr7fz78pQubIwwvDgMDLyV6v2XR/13rySHAQs0U
         cfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131676; x=1795736476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=an0U6IWX+qMTU2m+N9EdyCef/NSu92TzDqM2zL1EUns=;
        b=dbKjinXQhnqeP2MQPIcj7KPglWGE9w/I3p/v+jRbtUeeF4UTEmcZaWEob8J9VBiVaA
         AqgN691WSSC9QiGLgYxlsq9IqIX54+9axb3U2na2M1/A0C4keVuwpc6chYiig+zqeErN
         JN4XVoiCsKzIwHCuyZ/drLW3qQobaNoBG4KN8XUrydh7Iro0o0gs6z8Z/P6i9WzPxey0
         T3S0MJJPct0bmsI0m5gmwObaPLZBGya7e0ah/l6gH+LJCEyLTGScWVpaSqbWGjzZlswy
         BSZC0/sSmt1VB7E4b4abMFbXOi/H2Ukz2/o97R/Lul3PmWeOIr0SVa3i4V/SaFaZCrXX
         WWzA==
X-Forwarded-Encrypted: i=1; AL+hErGb0LN3cwNffI22mfIC7ilvs3DjbO+ptOTZoyeh5Gi8ytsq2ASwEp8w8ulWLXRE/SRzm7t6A/yxOQwRLFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dpQWPPydQQJkPTtY/xQOuhDhlzGaZ08Mvey+sFWNVSCWWNPLV
	PbIsV24Wg6Ytzb0+fttAECQAazo+tWotqgoNEVE+4dEK3URVM1Epi6SUlOamIPjLrZs=
X-Gm-Gg: AZFdTZd28T5YOYaPtG2hWuT5azeJhqFhB6Sn+892Ot8/sdRU4kb/SBQF20SWopzaFV2
	rlMBGgh8ZIPSIDE2g9ZopqotEhja0FITVXjOjlkLFZrlS5srLix4cpw4Q+myZ9UVWOcrELCxVUs
	LkvgeUMhkSmMK1kQoZafUbz5gX7I9vt348htDQJTrwPrOytoWZdtGciAgeEHT6H+RR1v+OJbtSb
	6Qd3sA+szI4Jz+WJYiwG4O00wAojztul/x/1hw/XAZ40LjE4zC5fjGwk5AvZkrVA7z6UIOHiTLt
	DyxFVcceWXO1zooCFPDgrEMPoobtEslN8DrHjl8ycuVwrnpvXzhfZYqqJtXhLd2RHOlWTPlcNSs
	1ozgYbKTT6do4b8/jKHu0RqPJU2mkegMHIrHSzj+Tta8UguDh/FapGvqbuhpnN8GP1iwWOzIhCa
	w4oj71M/znGRRusByL82UTkWsMzU5+rePNIUuo87Su4xXyIfVAOtvagoIthgvOsQYZnK94S4ZP8
	ryC8oxc9JcCgDhYYC8IVLfq60PjyHDTNxpFEAW8mpJq8wB2ksoEYQxw5legGkQV85SqOnZinT4E
	oM1lCZVBbmWxsZHC/kmTKgnWx+OdzXb3fV/pDsmA5telnn2gWIQjGruLipLrdKUSf3iEy1r6Cus
	75t6PCG5YUDfQoiVcCKJhOrefRJlrm+9RXgcsTEyiQOpfEymTmE4ll6DzPdsCB2wodxs2tEI=
X-Received: by 2002:a05:690e:441c:b0:67d:bfa8:5d7a with SMTP id 956f58d0204a3-67df4493953mr356954d50.91.1795131676297;
        Thu, 19 Nov 2026 15:41:16 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:1932:ad09:1827:11fb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df338e8fesm796893d50.16.2026.11.19.15.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:41:15 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 0/5] hfsplus: fix locking and validation of the special files
Date: Thu, 19 Nov 2026 15:41:07 -0800
Message-ID: <20261119234112.720963-1-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
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

Syzkaller reported a lockdep "possible recursive locking" warning on
the extents_lock in hfsplus_get_block(): deleting a file frees its
blocks, and reading the allocation bitmap took the allocation file's
extents_lock inside the deleted file's one. Looking into it showed
three problems around the special files (extents, catalog, allocation,
startup and attributes file), patches 1-3, and a missing check of the
allocation file's size, patches 4-5.

Patch 1 fixes how syzkaller reached the warning. Its image claims an
allocation file of 0x800000000800 bytes in one allocated block, so the
bitmap read mapped blocks that no extent covers through the extents
B-tree. The mount now fails when the logical size of a special file in
the volume header is larger than its allocation.

Patch 2 fixes a real deadlock on valid volumes. Reading the bitmap with
sbi->alloc_mutex held can search the extents B-tree for an allocation
file extent, while growing the extents B-tree allocates blocks with the
B-tree's tree_lock held. When the allocation file has an extent record
in the extents B-tree (which a fragmented allocation file has), a
single writer deadlocks on the tree_lock it holds. The allocation file
does not change while mounted, so its extent records are now read once
at mount time and its blocks are mapped without the extents B-tree.
This also removes the lock nesting from the syzkaller report.

Patch 3 silences a lockdep false positive on valid volumes: growing
the extents B-tree takes the B-tree file's extents_lock inside the
extents_lock of the file being extended, and with one lockdep class for
every inode read from disk this looks like a circular dependency. Each
special file now gets its own named lockdep class.

Patch 4 rejects at mount an allocation file that is too small to hold
one bit for each block of the volume. The bitmap code looks up any
block below total_blocks in the bitmap, so with a short allocation file
it read and modified bits beyond its end that were never written back;
fsck.hfsplus does not catch such a volume either. Only
hfsplus_file_extend() guarded against it, by failing with -ENOSPC once
the blocks in use approached the bitmap size.

Patch 5 names the two constants of that guard in hfsplus_file_extend()
(bits per byte and a margin of eight bits); no functional change.

Testing (KASAN, lockdep, x86_64 QEMU guest):
- The syzkaller image is rejected at mount, as are images with the size
  of the allocation, extents, catalog or attributes file set one byte
  beyond its allocation; consistent images still mount.
- The deadlock in patch 2 is reproduced, before the fix, on a volume
  created with "mkfs.hfsplus -b 512 -c e=8,d=8" and edited so that the
  allocation file has one extent record in the extents B-tree
  (fsck.hfsplus reports it as OK), by interleaving 4K appends to two
  files. With the fix the writes complete and fsck.hfsplus reports the
  volume as OK.
- The lockdep report in patch 3 is reproduced on a volume created with
  "mkfs.hfsplus -c e=1,d=1" by fragmenting files created before a
  remount, and is gone with the patch.
- A 64M volume whose allocation file size was cut from 4096 to 1024
  bytes mounts without patch 4, fails writes with -ENOSPC at half of
  the volume and is left with an inconsistent bitmap; with the patch it
  is rejected at mount, and it mounts with 2048 bytes (the minimum).
  Filling that volume fails with -ENOSPC at 0 free blocks and leaves it
  consistent.
- xfstests generic/001, 002, 013, 075 and 112 pass; generic/091 fails
  as it does without the series.

Viacheslav Dubeyko (5):
  hfsplus: reject special files larger than their allocation at mount
  hfsplus: map the allocation file without the extents B-tree
  hfsplus: give the special files their own extents_lock lockdep class
  hfsplus: reject an allocation bitmap that does not cover the volume
  hfsplus: name the constants of the allocation bitmap check

 fs/hfsplus/bitmap.c     |   4 +-
 fs/hfsplus/extents.c    | 141 +++++++++++++++++++++++++++++++++++-----
 fs/hfsplus/hfsplus_fs.h |  20 +++++-
 fs/hfsplus/inode.c      |   4 +-
 fs/hfsplus/super.c      |  89 ++++++++++++++++++++++---
 5 files changed, 228 insertions(+), 30 deletions(-)

-- 
2.53.0

