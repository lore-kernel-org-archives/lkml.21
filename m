Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754559;
	b=gZQ0MEb8fuEYa9k6cPDMQHk/+ASNw48LAP8YqNvlUkRzqvrsl4aipOyPZQD+XNOg8ddC
	 juLmgBO3o9g8d+TyNbSNexLe+y693JRfRDb/a1LYcJO8f3tJobIGF/qno7h+VO9OCL88U
	 HRR6d1kwyw+YdAYGKPqug3kkkNhVk/knMyueoWmklIob6sICtu18ut0WxvYVUZu/PiI66
	 4LDozZ8+czIqXZlC7VsSfazn1uQCvzWLRAJVsirRxTbUPvNcgqtSCO4NPbbIy6gxjuz1N
	 Sy4ACySXmNmf1GqoAPANzQyoytIV+ZtSKtX3602Kgqxdv0+yQK8z8xKz0o8o5sLY1qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fTkNUFbOEJacY/AArIMMZE4synA3rFS1O0j/Gy2pLMc=;
	b=gyqhZyzis3oq3rF6Li26+MyyRTX3EQnc7YYcpCzPyc+Ntmz2vPOO8rnfLON55vArpSJr
	 Xe4/EpxryVjz458bf94FFziHP/drWRwlRJLSRUl/2c+n+YDaBwDJDJDVJulYa3WD0u9jW
	 oTBxU2+u50/UfznrpejX2jz8a1I26IP4t7QnQ5sTbqg3rjTA+/xHX0Xug+kFwnWJIL1Lp
	 yMl7ywLaEicroh/IeDpgb0IKxfHKMHE1L618NwTkYWs55LrTiq70MQk0xcAdvnudJVrzK
	 TuWR++HAaNih6l04jEIcvZKKcGsZKsqfsg9YQPWOyJA9UC7FjlFiTCVgyoh/CHSb9aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4bQNgov;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B29606A699
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9B29606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4bQNgov
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so1439239c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795754556; x=1796359356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTkNUFbOEJacY/AArIMMZE4synA3rFS1O0j/Gy2pLMc=;
        b=w4bQNgovzBqbn7wxOtFeBfzCfEE0u5Fil39UVkVXhFPypQYAdMCS1RQ+grYYbfB/GZ
         P+5SKNxUSFFzHSISI09IXvqpBKdHMWWLped1dL9ulASEktS8UgtIuYUdUqgcjohqYb+f
         MYLUP144mAKp0vK2ZrL0F1hwmFHh1dU66k+jG2Ld40jQowLRB7wyXe7d69ID9NU9PpO0
         o6kKT06AUBD9IHuGQ8IBOgsmp+Zozg46EMx/CEFIXdXO5wcMs7QuKhcB9UqHwS8YkKdW
         Alfe2fhsS/SxqXGaFNEHedVoBUVxvm9y+0pVY62nNewws/zdJyk4JKIVjnQ5fZqm6pXg
         QZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754556; x=1796359356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTkNUFbOEJacY/AArIMMZE4synA3rFS1O0j/Gy2pLMc=;
        b=wB9zNoVMBdxvYeGRNksgWsxwGPmm5EJBi1iCPSqal3cnHR8JGLsnWn5zydkWx5rAvc
         MIXYP960ZTIycciNGciTq4rIdf9Ur/c2WUh/MwQNv5tG6x0Lrnt3R64VNDFlmH81bVMq
         AxhktlONg3NHsSN3PEyKCW604hBDTL3PXbk32EqfrnNHT0iaak0V4LucG8oXbVR7Tq/a
         rufwq4/BKx9Qeg0/XyjKByiAMetU2zrCiT9SHzUVvjpXBAj1MMDMEW7eTobo9Bu5LaGk
         DRl1Z2Fg5eVoIut7PU9FEWst0ldh7Nhrf+mYa2q8hsvi8dt5+QHGvnYgPIcXpmDg1faC
         l72g==
X-Forwarded-Encrypted: i=1; AL+hErF7F9BI1UpOdWUkawmRTYDKUy92+rn80A51yB6EBKmoRJdo2mTE1y1vbeHhQNwrItHNl5TnFNgogRAPOiE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rly9ri1yTCqUR1qIbGiV0ZX5NWL6qQSCCDl04CemmLauYVVr4
	sU0T9AJVLcVSKU4V60BhkoWbwQOoYPhLAAeYeX+ySpxB5x2QgUFu0Oh+
X-Gm-Gg: AZFdTZe+qOLbOSLgxIP2SmabocXdTWbb8+vdv0BdZjsYtkuDIIBnU4sbSuKt8vPDH49
	UxkUKdBLUYPxh72cvb7PYW6oUYBIih1QTJdiHSArIl5t/0S8trSJZS3sWA4H53M7p4IyvAL2kx7
	WRS4MAosIi9RGbjYabaDYRMrSM8apj7bvsRptQ2weIAoamJcZNst06Jh5eUlQ2jiSz8cxKWpODw
	Dms/ue53J+BlexntOtXgg2TpWld6ApFypzH4LUJL09hFxMtGKf1uPiGa+F/NepU/OFaf4PIa/pq
	V0mSqh/blqSDR9XX9j/TNEeCNxh6RFdJnSlMyYzr46DXEBojDi7ISGzjPzxtgo17pP8/XsH+ljd
	pve11EG6xJJAVrY/u5j0zEbbuuy6V7aNGn1dAuuy1UdIcpvIUkhtxCbDOI/aLpu9gajrb0F0/+O
	UGsGap0gVeW79KbY9/QlUIAzRj7FFSzT7MNPjVHI4GD2oD8ykmnS2Gf9W+WmkCwshPJGccwQIgE
	ywjx9tKH0Wq/8OyuEyvXKfyUwWhvOLjdw4uQzlQ5fjdzRcphn9BfYWaCgAcqaxAw5zMnG3lg++S
	FhBabmLgpL+Ee7gBWuwWDudGQ0lErGUTDdMk/JwycwEifoIJ8i/57awkJwf7/TZq
X-Received: by 2002:a05:7022:f516:b0:143:26cf:8615 with SMTP id a92af1059eb24-1b5568ded03mr20134659c88.25.1795754555855;
        Thu, 26 Nov 2026 20:42:35 -0800 (PST)
Received: from carrot.home.local (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm88000388c88.9.2026.11.26.20.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:42:34 -0800 (PST)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Wang Jianjian <wangjianjian3@huawei.com>,
	linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Zheng Zheng <fengaojigui88@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 0/8] nilfs2: support GC error rollback and avoid infinite retry hangs
Date: Fri, 27 Nov 2026 13:40:53 +0900
Message-ID: <20261127044231.37630-1-konishi.ryusuke@gmail.com>
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

Hi Viacheslav,

Please apply this series for the next cycle.

This patch series rectifies an early design flaw in the garbage
collection mechanism itself and fundamentally resolves the task hang
issue seen in the GC ioctl (NILFS_IOCTL_CLEAN_SEGMENTS).  To make GC
safely abortable upon errors, this series strengthens the error-recovery
and rollback logic for metadata updated during GC, specifically segment
usage information (sufile) and virtual block address mappings (DAT).

Historically, NILFS2 GC was designed around a point of no return: once
the log writer started, it looped until a full-format log (including a
checkpoint and a super root) was successfully written out.  Because GC
runs exclusively while holding ns_segctor_sem for writing, any
persistent error during GC blocked the log writer thread and write
operations indefinitely, causing filesystem hangs.

An initial fix by Joshua Crofts (commit ce5a5ad1a833) took the right
direction by introducing an escape path when the filesystem
transitioned to read-only mode (-EROFS).  However, two issues remained:

1. Cached GC inodes were leaked when GC exited on error, which Wang
   Jianjian addressed in the first patch of this series.
2. Persistent errors that do not trigger read-only remounts (such as
   -EIO or -ENOSPC) still caused infinite retry loops, as further
   reported by Zheng Zheng.

Whenever GC aborts mid-way, however, an underlying issue arises:
bailing out of the GC loop leaves irreversible inconsistencies in
on-disk and in-memory metadata.  While this was previously masked
because the escape path was only taken during emergency read-only
degradation, expanding error exits to general errors exposes this
problem, breaking subsequent GC runs and causing userland tools such
as "lssu -l" to fail permanently.

To build upon commit ce5a5ad1a833 and make error exits safe, this
series implements dedicated undo mechanisms for each metadata change
performed during GC before allowing nilfs_clean_segments() to bail
out on general errors:

- Patch 1 (by Wang Jianjian) fixes the GC inode leak on error paths.
- Patch 2 makes physical block location updates in the DAT for
  GC-relocated blocks (other than DAT blocks themselves) reversible by
  restoring them from the shadow mapping on error.
- Patch 3 makes the removal of GC target segment usage entries in
  sufile reversible by saving and restoring them on abort.
- Patch 4 fixes an issue where stale nilfs_redirected flags remain on
  primary DAT buffers when GC is aborted.
- Patches 5-6 make the deletion of obsolete virtual block entries from
  the DAT during GC reversible by saving and restoring them on abort.
- Patch 7 defers this virtual block deletion to a safe stage so that the
  freed entries cannot be reallocated while GC is in progress, which is
  required now that GC can abort mid-way.
- Patch 8 updates nilfs_clean_segments() to bail out immediately on
  errors, retaining only a minimal bounded retry loop for transient
  cases.

Thanks,
Ryusuke Konishi


Ryusuke Konishi (7):
  nilfs2: cancel the relocation of GC-targeted blocks if log writing
    fails
  nilfs2: restore segment usage from the save buffer when aborting GC
  nilfs2: drop redirected buffer flag from DAT when clearing shadow map
  nilfs2: save DAT entry blocks to shadow mapping before freeing
  nilfs2: restore removed DAT entries when aborting GC
  nilfs2: free virtual block numbers just before collecting DAT changes
  nilfs2: avoid infinite retry loop on GC failure

Wang Jianjian (1):
  nilfs2: fix leak of gc inodes on error

 fs/nilfs2/alloc.c   |  14 +++-
 fs/nilfs2/alloc.h   |   3 +-
 fs/nilfs2/bmap.h    |  23 ++++++
 fs/nilfs2/btree.c   |   8 ++
 fs/nilfs2/dat.c     | 181 +++++++++++++++++++++++++++++++++++++++++++-
 fs/nilfs2/dat.h     |   5 +-
 fs/nilfs2/direct.c  |   1 +
 fs/nilfs2/ioctl.c   |  36 +--------
 fs/nilfs2/mdt.c     |  41 ++++++++--
 fs/nilfs2/segment.c | 108 +++++++++++++++++++++++---
 fs/nilfs2/segment.h |   7 ++
 fs/nilfs2/sufile.c  |  27 ++++---
 fs/nilfs2/sufile.h  |  37 ++++-----
 13 files changed, 404 insertions(+), 87 deletions(-)

-- 
2.53.0

