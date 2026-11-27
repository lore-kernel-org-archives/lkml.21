Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795741966;
	b=PkhDnZlxsD9no/Gfjfk7V7+ULC75p8uqBZ06CoaE8zRo90GgiIZmm3w3AEVsfNsyLO2a
	 2pSmjsKDAcEk9it6qTSx2qHcqyheZINzIHHOJ/NAPnYl5/a5tc646uTq0YoD3dw0N+LqL
	 3Mr6G0J9Mhw23veHNGpnEFuWg16sTgmI96XCJoqQkVrQjVdBREe0+txgP3dYb5By/Nr1l
	 go9fX1aX5tpyy3wjEEpfUlOGAsSxUzGWiIVS6fTyAPAmEtK4h/t6TG1GO4izl6+nvRjoI
	 fBvMJqpKLO20rUsdHrYlQyfx0rrDZ/9dSKUeANt5mZNZo1WeKsadpWReF+dDipXM1jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795741966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rOaXMWz/87oI93lqqKPMBOKv2/6Eat6aF1tKcKKMg6Y=;
	b=4XvYUqB3RkWzSTuLDIdPjm79ETUuodFe26Nrp4KDgi4BpL7jdWGLrehQTOzCK1p4y4z1
	 YJEprz5x69rPOU68skVv9ysniuv8UI3Q0ulIBSDhirXt+aZGViUjEj6U1CoKmBqgWLop8
	 sCfZWEo+HXGgIClyZSLN1W5IismqASv/gSOmrve3s5oqHKNtv9aLgOFYcZXGbq3t1W7q3
	 8DfCGYJ0k6E0t5Vjnzp3kZsjYNDYGVGkxUlGE4sc3OScbx0eFQNfii9W8T+UP2V0DvXoa
	 +/DysSvytPqqVboSD4JFW+YLSJFRuFEHGTceMnUJoKx5AMAMA9DYQW1BkF/an0yTKsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p8M3/HG5";
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8CE606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D8CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p8M3/HG5
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so2969855b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795741965; x=1796346765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOaXMWz/87oI93lqqKPMBOKv2/6Eat6aF1tKcKKMg6Y=;
        b=p8M3/HG506gqQL/rWqvbZ0Qec/c5vpdIhPnwXHc8zIpU2EqDOO73Yk/HzuSXNDL2f2
         TgSfQeCa0e4Ls4fkjbEHMMevixc2Z8VPcHkFgvp+daOQXljU7E1x33d/j3cmE4H7E/lu
         0OD1TvMLqxZAkCgpo+dxU5iPY9d/y5g/GN5q6lPmmidbMQHS/KBQI+bvxIL4lbX+j10Q
         /bm4T5nISmNA84j+6a7Q0HsQMAoZiDMN5U0KL8Wia9BHXWdGpCNuLU+dBaqbyj2V0+VZ
         oKklRcW4j1C6KZgEigszHCfZDR7SVamsAPYMySo5gUCgRLYUAzhSZ3x2x8Co3lspQbNC
         v1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795741965; x=1796346765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rOaXMWz/87oI93lqqKPMBOKv2/6Eat6aF1tKcKKMg6Y=;
        b=Ri9vq1yjW4ZpUKNlOBr3yFRjPwGEWv9RjtCqyfQ5NcTF6iZ8k8CrxmThzJ9ohN2xel
         d6MV7DY75CEZtsr7pb03NCggpgSdvAXPl6s3LGMts/3GhICRxc3zeqkiC5deuzN7cjCy
         ZsOxePda3jVSA2HqWz39fjkdCKzzn63IY77v/x2eTNuyFFIHUfdBqC3qMuNBdxpnJ1tC
         1ntlGu9pkgCpzcyii54HNpzVaAA7tzEAP6BQWb6LlNZLUz8d4af+GUefe2Q3hijoC9KP
         BikbgZ2q0tksCCO8CuBUUe5ll7dKpecMSxoWiI+CXeVVjPxHuSjfoKxORbEdoQckxESD
         5hpA==
X-Forwarded-Encrypted: i=1; AL+hErGurcuXhmjgBtlgsARSe3xPAiP5GfPAFH3H3YAkqLbAGaxfO+DBM46KtUI5Hom2b1BazXoVlmM/HpKLNFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BVIreDLOcF7UllySGjEYIBtH09HPUUg4o99VqQhXO9ytMaInG
	T/dy1VFZKhUdSOrtuOw9Bv/6mogLazaNHBQ3+7YVtFCiFE+5W40NE1eD2XMYmA==
X-Gm-Gg: AZFdTZfwCMZ8ZYZi3nPvAl/NaiYUcmEpXCY/P3EdFvNuY+NvaeNn8tG5gaPN07YQLUR
	piS1uPKw4OSs6qwD12hJKRAXfxZaPrhu6KS0zytpDa9Meznv1DsbptS5YLtpBqrKbDcDF6HBOKT
	DVzeEpAH4QQygX440L4mWib7z6QmqplhbDTZ3GzD4RkMsWXr46LidvYmJPGmbERy9WBe80+9mxC
	6ta5muyZ4T262OxT5G0rXWcHScVZZzrKHQa6CnYWMmI1cES41S9pcv0HBdkUhGvEGbZuThu5xCo
	tVG5kcB/i3ipm6dTL5nukePjkVH7FI0/pSjidLcLZesCszqhp3ch7tRrNlYzdF9LihpThx9ucU2
	p7QqXZ2ghl454LacmIXp2ONZZSzm0GqkGGF7t9PmkvIkjHW3MfkHObv2juezEsfJCHPEifcPgt5
	OG+EJCDsdPFhsIkckYKaDvtPHx1zWMS5xc3ynoxMqK5XESmXZ2b8V5pNkXff1nzJrzoU4FZlShF
	8YiQSMNqOgXUF5raYEKXx1BX+Iss//KeB8Sqs3xxWpMWBW80WOC9hWGGOp26OvfTlX2QSwtJKz6
	/8y9KmE2KAHvym20+GzUo7DgsfUFf+tcKWBGw51b20ZN7oWDDw==
X-Received: by 2002:a05:6a00:230b:b0:8a7:3c62:30f2 with SMTP id d2e1a72fcca58-8c87cc42cfcmr18473116b3a.36.1795741965249;
        Thu, 26 Nov 2026 17:12:45 -0800 (PST)
Received: from HP-Pro-Tower.mioffice.cn ([43.224.245.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm11593461b3a.29.2026.11.26.17.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:12:44 -0800 (PST)
From: Zhijun Li <zhijunli.leo@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chen Zhangqi <chenzhangqi@xiaomi.com>,
	Zhijun Li <lizhijun3@xiaomi.com>
Subject: [PATCH v2] f2fs: stop checkpoint on pinned segment allocation failure
Date: Fri, 27 Nov 2026 09:12:31 +0800
Message-ID: <20261127011231.1564680-1-zhijunli.leo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022120833.1698722-1-lizhijun3@xiaomi.com>
References: <20261022120833.1698722-1-lizhijun3@xiaomi.com>
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

From: Zhijun Li <lizhijun3@xiaomi.com>

f2fs_allocate_data_block() updates SIT before rotating the current
segment, since SSR needs the latest valid block information:

	update_sit_entry(sbi, *new_blkaddr, 1);
	update_sit_entry(sbi, old_blkaddr, -1);

If the rotation fails, it jumps to out_err without reverting the SIT
update. This is fine as long as checkpoint has been stopped by then,
because the stale SIT will never be persisted. do_write_page() asserts
this with f2fs_bug_on(!CP_ERROR_FLAG), and every failure in the
rotation path satisfies it: get_new_segment() stops checkpoint on
-ENOSPC and -EFSCORRUPTED, and change_curseg() only fails after
f2fs_get_meta_cache_retry() has stopped checkpoint.

Pinned allocation is the exception. Since
commit 48ea8b200414 ("f2fs: fix to avoid panic once fallocation fails for pinfile"),
get_new_segment() does not stop checkpoint for pinned allocation, and
since commit c966d29e01bb ("f2fs: support resizable tail section and unify pinned allocation"),
it may also return -EAGAIN for it.

That is intended for f2fs_allocate_pinning_section(), which fails
before any SIT update. But when a CURSEG_COLD_DATA_PINNED segment
becomes full in the middle of a section, f2fs_allocate_data_block()
calls new_curseg() after SIT is updated. If it fails, fallocate()
returns an error and the filesystem keeps running, with a block marked
valid in SIT that no node refers to, while __allocate_data_block() has
already reverted valid_block_count. The next checkpoint persists the
SIT, and the next mount fails in build_sit_entries():

  F2FS-fs (vda): SIT is corrupted data# 513 3 vs 515
  F2FS-fs (vda): Failed to initialize F2FS segment manager (-117)

fsck.f2fs also reports "SIT valid block bitmap checking [Fail]".

It can be reproduced with CONFIG_F2FS_FAULT_INJECTION:

  mkfs.f2fs -f -s 4 /dev/vda
  mount -t f2fs /dev/vda /mnt
  touch /mnt/pin; f2fs_io pinfile set /mnt/pin
  echo 0x100000 > /sys/fs/f2fs/vda/inject_type   # FAULT_NO_SEGMENT
  echo 2 > /sys/fs/f2fs/vda/inject_rate          # fail the 2nd segment
  fallocate -l 64M /mnt/pin                       # fails with ENOSPC
  echo 0 > /sys/fs/f2fs/vda/inject_rate
  umount /mnt
  mount -t f2fs /dev/vda /mnt                     # fails with EUCLEAN

Fix it by stopping checkpoint when the rotation fails after SIT has
been updated. The early -ENOSPC return for curseg->segno == NULL_SEGNO
is not affected: it happens before any SIT update and is the expected
path once a pinned section is used up. Pinned allocation failures in
f2fs_allocate_pinning_section() still don't stop checkpoint.

Fixes: 48ea8b200414 ("f2fs: fix to avoid panic once fallocation fails for pinfile")
Co-developed-by: Chen Zhangqi <chenzhangqi@xiaomi.com>
Signed-off-by: Chen Zhangqi <chenzhangqi@xiaomi.com>
Signed-off-by: Zhijun Li <lizhijun3@xiaomi.com>
---
v2:
- Drop the SIT rollback. v1 claimed that change_curseg() may fail with
  -ENOMEM without stopping checkpoint, which is wrong: the summary read
  retries on allocation failure, and f2fs_get_meta_cache_retry() stops
  checkpoint on any error. The only gap is pinned allocation.
- Stop checkpoint instead of partially reverting SIT, which also left
  ckpt_valid_map, discard_map, mtime and curseg state behind. This
  matches the existing assumption in do_write_page().
- Fix the Fixes tag, drop Cc: stable.
- Add a reproducer. Tested in QEMU on top of f2fs/dev b61a029304bb with
  and without this patch: 200 rounds of pinned fallocate with
  FAULT_NO_SEGMENT at random rates (1..12) and sizes. Without the patch,
  138 rounds left an image that failed to mount; with it, the same 138
  rounds stopped checkpoint and the images passed fsck and mounted.
  Rounds that failed in f2fs_allocate_pinning_section() did not stop
  checkpoint either way. No lockdep/KASAN report with the patch.

Alternatively, we could check that the next segment can be allocated
before updating SIT for the pinned curseg, so that fallocate() fails
without shutting down the filesystem. I'm fine with either way.

v1: https://lore.kernel.org/linux-f2fs-devel/20261022120833.1698722-1-lizhijun3@xiaomi.com/

 fs/f2fs/segment.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 066b7cf813d7..5499f20d6428 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4051,8 +4051,18 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi,
 			stat_inc_seg_type(sbi, curseg);
 		}
 
-		if (ret)
+		if (ret) {
+			/*
+			 * SIT has already been updated above, stop checkpoint
+			 * so that the inconsistent SIT won't be persisted.
+			 * Most failures have stopped checkpoint already,
+			 * except pinned allocation failure.
+			 */
+			if (!f2fs_cp_error(sbi))
+				f2fs_stop_checkpoint(sbi, false,
+						     STOP_CP_REASON_NO_SEGMENT);
 			goto out_err;
+		}
 	}
 
 skip_new_segment:
-- 
2.43.0

