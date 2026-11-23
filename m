Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432499;
	b=0OH/cCULY/MFf2Ikkc4Gqd8/ILn/0VrGU4c1hpUo5v9Xb3OAALN1RuHcPRsKsu5AI79B
	 lVIa0gwxTCeNN/o85PP88fsUO7UJJBJUDnXWUu5qyUolEP1IrbTI/WE42GmBt5VXdOMlK
	 YjEgxOQ3JUSZ/8QB4ediawPv1MbBs7KK/Txcevt6OtKGBltxF0FALqulk9Q72SArOiqzv
	 NK5RsVFoceMhbClo9oe776YfDLrRAr6+W9hJ4XV/CZFdVIB5yHtHS7wg5Oeu+DRMIeFKt
	 3FRCF9GqTsx5GqqkIBAomnwLWZS3ZU4TNtPGzVMH13Up9xQeskwIBqkA/ZhMkZUxuQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kvxCAFGhBWC5zf+uvhs+QtIakQF9t3AdFIsHU9D4+O4=;
	b=gYEGQ3IMWyIltVETZONajf5iPBDZUjRmmXG4xBK/CzsbCT0xfUVsueW5YQNt9zPvp/hT
	 F0Oy/jAOKAjaKr09oPyH/lJ7AAWBTl9OeyDksfTT/T+nso+5RD7lJWWYErt04P5YLtCCE
	 n0WuB1IGD6/JDSFEXWIEoorUeqy4Kx/wPBV8rvK2njxMIJhG38CG6fZLInM5APvqsBO4R
	 mfk+pyCLxIe/Irji2KKvCsmS3sOK09sbKoiDID5Q+nAC451kbo2Y0P3ChqQWWWfS/wnXt
	 QMpEZasEl0vVuK5YeC6lrQb7LfHNuJY9+jxqfZC2uTWi8ru8nkayrMN9rEK12ZP89rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wEuQYgd9;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6BB606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D6BB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wEuQYgd9
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1520026a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432498; x=1796037298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kvxCAFGhBWC5zf+uvhs+QtIakQF9t3AdFIsHU9D4+O4=;
        b=wEuQYgd9aTMaRZMu8Fc8uQ9+z8eQzvLYLuJRlLT7wIS7NWQ/wbFslmzkdbAmHbleFV
         w8KhFw2ZOd1rLauzizxyN/Q1sVkP9Hlku2rgQs63qAipnTqBr+GiOUkS4IF8Jlcz6A4U
         O2b/U7NmMQfVWpCjvZGK0QBmjLTg2yMbsd1Ar0m6fTyLnVbXWpldKB/8rKnh9ifygbP/
         x1DWX8gGyFeMxmsX9AmtaFoZWjjAUlwEDv9j33EYV9x8Tdcv5ktG3OriZNmXyNeK2vTl
         cPOzYd9xyQqae2bVqgqKzZstPwew4pN5OP8zL/JnzLKLW/gnJlidhE5g//FY4dAeySXI
         M3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432498; x=1796037298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvxCAFGhBWC5zf+uvhs+QtIakQF9t3AdFIsHU9D4+O4=;
        b=jGUeqizVX8XZiCYFH/2Ndiu9or4pMjwy8dchcyHUUQoOs1bwZkauyICmpVBcgH2RXJ
         sralGjTewE1hnCX/nB/vyxKOGPRoYVxEGwTN1D8C/06f124fy4JzmW9AHKLsFQByOPwf
         YHzFhjzkjRakTCCjIijrrI33UJPsGE+uw0LFUGR0g5VOVCQV+AMyQSD39lsa85VvrMay
         k+OpDwUscivKiYPZfn0canmz85WDp4iuTQbU2uFRuMVLPgs9kNJGqMSOHw0h/E4kzQbi
         zAzIWLnvBb4/0Z85c5ptX+g5nb/j80VeotsldaGOlOdQ+EdWSNBDdj46BLnThHv1gh9B
         x+Hw==
X-Forwarded-Encrypted: i=1; AL+hErHuC1LDzaewFs9UCL5kJ6ylQDdpyI8lJC0GuzTrW6AG5NvZOdy/uVrT089ClEuBM4H1ox5arygXRAW2cSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VRRloNBr1ilhAnM0OInH5FjlVx4XBbMwwMmGPVXDor+Ka54QX
	cqFt90rm86Bn+tdJpP/42qg6qAImODSLHoK4uBdnPnGjXUZsUl5d2+pU
X-Gm-Gg: AZFdTZcasB94ZR1AF/VkDSk9CvSm/0LBNoj3eo/HsN10uvtTJJhRFzp3jWLrQDU9aYe
	oeo3yJDqnv17QzK9GaCyi85SF34i8etb+5zfKtmvLiPh4d4sunizBhiUc80J+HINb7qCQ7hk7si
	FsVrgOpYPg/2Ju+LhGIJUIhCh9lkfxUxIMnNhddVEZ5VY2ItrhDbjXWEXE4HiCgNlMdMWR1E0jH
	PIuajUY3H3fIYiavsg/TST/7otxLpeEN7U1SGjbXzoKWCbsZhn98YXMv5g7HUg5wDnuRoZ2TIjp
	I9DdgHVfT5NUqksiOyiQvVd8ebSkHTQi4p+kQLGbqCb5Ne751U7OmWpVss0e//H9feDKie40xz2
	7QL+bZUrXo/qMdfvgic5iLrzyZ8ylenYomuvJX4ZIet/VxslmYsV7X/fxYegksIeRF0f/EjPi9C
	hOmo/9vT3KjI0bVZaeyT9YuGHVcJh6UaUhe2aTa2HUA/XF5Lj3J28TD/GhtUh/lYcMCI4XGtnTp
	asZaClFZoXzy1T1veUbn6Vf5HB7nr5YRNlg1x0AigtxC9Zq0TtMZmiVAGdJIqPVUpgWO5NUs+Lr
	lHfdCrO7yiP1wy5nUvwIjVt2HM1jxw==
X-Received: by 2002:a17:90b:3d4d:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3b41c92cfe2mr10003902a91.30.1795432498380;
        Mon, 23 Nov 2026 03:14:58 -0800 (PST)
Received: from thangnn-ASUS.. ([2a09:bac5:d452:16c8::245:e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm18070874a91.12.2026.11.23.03.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:14:58 -0800 (PST)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>
Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	David Howells <dhowells@redhat.com>,
	Paulo Alcantara <pc@manguebit.org>,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+deb8af81d91415fabac1@syzkaller.appspotmail.com
Subject: [PATCH] ima: key iint mutex lockdep class per filesystem type
Date: Mon, 23 Nov 2026 18:14:52 +0700
Message-ID: <20261123111452.237422-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
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

syzbot reports a circular locking dependency between the iint mutex,
a 9p inode's i_rwsem and the sb_writers of the cachefiles backing fs:

  sb_writers#12 --> &ima_iint_mutex_key[depth] --> &sb->s_type->i_mutex_key#25

The three edges are:

  backing fs O_TRUNC open:  sb_writers(backing) -> iint(backing inode)
  9p open + IMA hash:       iint(9p inode)      -> i_rwsem(9p inode)
  9p truncate/writeback:    i_rwsem(9p inode)   -> sb_writers(backing)

The last one is inherent to netfs: it writes to its cachefiles backing
file under its own inode lock. The cycle only closes because the iint
mutex is keyed by s_stack_depth alone, so the 9p and backing fs iints,
both at depth 0, share one lockdep class. They are different inodes
and nothing waits on a netfs iint while holding the backing fs's
sb_writers, so this is a false positive.

Key the iint mutex per filesystem type as well as depth, as is done for
i_rwsem with s_type->i_mutex_key. The overlayfs case covered by the
depth annotation is unchanged.

Fixes: e044374a8a0a ("ima: annotate iint mutex to avoid lockdep false positive warnings")
Reported-by: syzbot+deb8af81d91415fabac1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=deb8af81d91415fabac1
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested in QEMU on v7.4-rc4 (syzbot config, ima_policy=tcb): cachefiles
bound on an ext4 disk, 9p over virtio with cache=fscache, then 50 rounds
of write + O_RDONLY|O_TRUNC open on 9p and on the backing fs, followed by
20 IMA-measured O_TRUNC opens through an overlayfs on the backing fs.

  unpatched: "possible circular locking dependency detected", same chain
  patched:   no lockdep report, debug_locks still 1; the syzbot C repro
             also ran 90s with no report

 include/linux/fs.h                |  3 +++
 security/integrity/ima/ima_iint.c | 11 +++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 5b3a100aba77b..dab32eea21fc7 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2325,6 +2325,9 @@ struct file_system_type {
 	struct lock_class_key i_mutex_dir_key;
 
 	struct lock_class_key d_lookup_key;
+#ifdef CONFIG_IMA
+	struct lock_class_key ima_iint_key[FILESYSTEM_MAX_STACK_DEPTH + 1];
+#endif
 };
 
 #define MODULE_ALIAS_FS(NAME) MODULE_ALIAS("fs-" NAME)
diff --git a/security/integrity/ima/ima_iint.c b/security/integrity/ima/ima_iint.c
index 00b249101f98d..bb964847af149 100644
--- a/security/integrity/ima/ima_iint.c
+++ b/security/integrity/ima/ima_iint.c
@@ -39,19 +39,22 @@ struct ima_iint_cache *ima_iint_find(struct inode *inode)
  * files both on overlayfs and on underlying fs, we need to annotate the iint
  * mutex to avoid lockdep false positives related to IMA + overlayfs.
  * See ovl_lockdep_annotate_inode_mutex_key() for more details.
+ *
+ * Depth alone is not enough: a netfs inode writes to its cachefiles backing
+ * fs under its own i_rwsem, and both are at depth 0. So, like i_rwsem, key
+ * the mutex per filesystem type too.
  */
 static inline void ima_iint_lockdep_annotate(struct ima_iint_cache *iint,
 					     struct inode *inode)
 {
 #ifdef CONFIG_LOCKDEP
-	static struct lock_class_key ima_iint_mutex_key[IMA_MAX_NESTING];
-
-	int depth = inode->i_sb->s_stack_depth;
+	struct super_block *sb = inode->i_sb;
+	int depth = sb->s_stack_depth;
 
 	if (WARN_ON_ONCE(depth < 0 || depth >= IMA_MAX_NESTING))
 		depth = 0;
 
-	lockdep_set_class(&iint->mutex, &ima_iint_mutex_key[depth]);
+	lockdep_set_class(&iint->mutex, &sb->s_type->ima_iint_key[depth]);
 #endif
 }
 
-- 
2.43.0

