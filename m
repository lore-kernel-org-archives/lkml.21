Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131679;
	b=OtZEHipM8NPh22q6LmlvNbEf7pKuihgbtbVUsD1IZ7it27ZBhE10LwfSNdmnJGLbEtiw
	 4WSHw95LHPQtnd+gQnSoFT6NgtXJ73CjgDB0g83O6rnCsJacSOEhNvs/3bdcIPOU2NMl9
	 Cs5Vm6ZDjzLVIy3IYbPt+Jik4KnR2N5hR7XuDn5IFGDfCarsP4m8x6JC5tgsSNcQGYYIz
	 /7kNEm/n/MGbkvg+JeXgWJFNbyYOFYeWKbSnv/Qqrf1HkqpuNemwmv3lGMRz7NCBMHmLj
	 1ya8tpTCJ3qVT60VFSy7ZfjmAPi1r7xRGCRT0s7EjxNf6f9aQkCCJDyEWzF5Eh4RszQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rrqe4OL7rF0jVL1e4A2AH8iDIiTDyxz7nVkoEsGHoek=;
	b=WWFSyAtCYOi+p8ExJwfjX7PEAC5a+rtkVK8jr8ULQz67lj2Vu5TeocsIs0clDM2Q5u2V
	 huB2g2OgPA8NuX7hokaprGCEkR8O+5IviCo6HBlYzYgxokCBEAi7zELfjRvo1av5NgP3a
	 x5HPcJukMIiNEjUtvEfLqsoVpLSF+90Mb2TEe+Kv+rXF4ra2ZW1USD/7AkR0QfB+ZKrMP
	 Pd7S0z+71b02GbxmpLHroip3wRidhxb3eMvnixanhIa//ka7jPMOoEj5VVgXIndAHEGiP
	 mrGuRRcOZg/YOjApx1W2TR+pmf0tshThwbYEDcBha5iaLShBQmaReL3nyr5MzqRvubw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Wbw3MVau;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4F0606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C4F0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Wbw3MVau
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67da3d03263so500532d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1795131678; x=1795736478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrqe4OL7rF0jVL1e4A2AH8iDIiTDyxz7nVkoEsGHoek=;
        b=Wbw3MVauYF6euxivL0WLepHbMXlTv7BP7mivKx337xquqBERVRSuxX0S9xm/kQqqH3
         MswqeI+HHsDcb4ZkH5xaAxBVFI2vzmPk1fgl9e899tlflMpxuVJqqaZ4ey9sgzMcbJGD
         w/VOtxnvM61uiYQ/Lx9vxVbz1QAeu/98IQI9KnScRqdniDmPWi0LA9FHTBC78FXsXihW
         An7Fgxq65QOO+SH8897pKPRH1RvXvOqDtBHcJC/I6kdnfI6WXuNAywj2AyO2O3qnGvwa
         1AEx5BVcHl9Qq/JA4NYy/+r/Q6Iik0u6+4M6aZA6UKZc1EF/mx/FzYgUmuYUyq4SImv3
         qpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131678; x=1795736478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rrqe4OL7rF0jVL1e4A2AH8iDIiTDyxz7nVkoEsGHoek=;
        b=RvUqAjyGSyR+vfmfPYCRqS/KEMY9QRXJxJDRzSfon0px/6pFMtUov6EecikhQsk20k
         2Aurd99ZlrgKKyGXKxRxIvdglnQoB6kkSjv1meOvvC9tAEXZDsDf/7BaWEbywp419Onb
         eFr4YqsA6azx9ZzHyjBELBnquuNHkIUeuvg3KWNfLJ1HNJkDyqfba15ILPIzBpIUv0hE
         CgrpIG89jgSaDjuO7le1FmRVqRCsOGqffudAYibxk/eTwRjwgmNG1x2Q0yGVVqU0PAGw
         6qjGg1meuTpA1L+g/sye6ZCN23hKIAsw5t6856pcIEG+Wvrf8fqcJpSIDmfjdF3gOd7z
         9LGw==
X-Forwarded-Encrypted: i=1; AL+hErF4h3WE1GW3ut+FnHnaci37+xA6PBfnpNYfONQRbIIfp8KBZxVeRuSioqh8FkcSf9stWoFJrDSWoSfzKgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3Y+OPDMR6YSlGXm8w1QmPwsUV592On9G+UA/d4gDEXIorQA9g
	Cxrb4H5QpDpjR5cfrwU6zOjO/hgQ5Zu+VXmVs7yFzWNTYJP271s9+ak/eu6eiA9oZto=
X-Gm-Gg: AZFdTZcs2zO4vFliuj/3VxfbCzQhc6w+uadt6J/DtJrRTwsZ2UA6pe3ZcvM5jt1BJ2L
	XkSEirTVfLR5o3bO7UzYyVt9udepzlGscsOHE7VD1YXdbwW4EQ/MfedXmRS6knqiW2W6dG0ZrNt
	At4zgIhI84je3w6puepYvs4Pm6hCxmsv/DtewOLZlFRbWs4NtmAJPaJQiw7wYYTu+bRkAQSZb5G
	SUsbCCCmMBWS6XkHT5f5pNAwSwJlf1MTNDxIGL1RK0MZlVRVnMydw59BPNLkKcMw67dBN7FKWZs
	e+NohfN64ywAezAmHxZgNnO3x6s0nTzlKZnMyqTEOHqDZzG1ni4rsLg7CbapJJlR1M55b1cULJZ
	CZXHMomi0FCCBAgp9xtsTFJeIVBd+zuH6ZUdztyjQchpQI7jOre+kGJL086cKZdMfUcTeT4Qg73
	dehw/VKCSvlsnqm/GuLtyCTLkJ2vM4gVoF/+UUrrtD82l4SAa/LCwvwuy6FuTzDgj4QMu+A/RZ3
	0s6XZ0fpPX+zGeqfrHpjfmz49vYZjRmj+4t3ZVVUl9HyvBsQURg00y3Hx09tJFYvD6oJMLQXbCV
	LjZZ6DvcXUl57kD1Tzpcq17FkT641ktuDlV8qbfHbAeXNprtdp81HR9oN+TVjlcY5DkKG91mpN3
	7MCZuBA20qi35cHtXDBaCCDICK4Dr5s8rpg7dDjhHJ+oWzgPBM+k8dgJCFENmq4quOSS+qYg=
X-Received: by 2002:a05:690e:14c4:b0:67c:608:b372 with SMTP id 956f58d0204a3-67df441e4f7mr413834d50.66.1795131677626;
        Thu, 19 Nov 2026 15:41:17 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:1932:ad09:1827:11fb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df338e8fesm796893d50.16.2026.11.19.15.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:41:17 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	Zheng Zheng <fengaojigui88@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/5] hfsplus: reject special files larger than their allocation at mount
Date: Thu, 19 Nov 2026 15:41:08 -0800
Message-ID: <20261119234112.720963-2-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119234112.720963-1-slava@dubeyko.com>
References: <20261119234112.720963-1-slava@dubeyko.com>
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

The volume header describes each special file (extents, catalog,
allocation, startup and attributes file) with a fork that holds its
logical size, its number of allocated blocks and its first eight
extents. hfsplus_inode_read_fork() takes the logical size as is, and
fs_blocks is derived from it, so a corrupted header can make a special
file look larger than the blocks allocated to it.

Syzkaller found an image whose allocation file has a logical size of
0x800000000800 bytes but only one allocated block. Deleting a file on
that volume frees its blocks, and hfsplus_block_free() reads the
bitmap page through the allocation file while it holds the deleted
file's extents_lock and sbi->alloc_mutex. Page 0 of the bitmap spans
fs blocks beyond the first allocation block. As they are below the
inflated fs_blocks, hfsplus_get_block() does not treat them as beyond
EOF: it takes the allocation file's extents_lock and searches the
extents B-tree, which has no record for them. Lockdep reports
recursive locking on extents_lock and the block free fails with -EIO:

  WARNING: possible recursive locking detected
  rm/922 is trying to acquire lock:
  (&HFSPLUS_I(inode)->extents_lock){+.+.}-{4:4}, at: hfsplus_get_block
  but task is already holding lock:
  (&HFSPLUS_I(inode)->extents_lock){+.+.}-{4:4}, at: hfsplus_file_truncate
  ...
   hfsplus_get_block
   block_read_full_folio
   ...
   read_cache_page
   hfsplus_block_free
   hfsplus_free_extents
   hfsplus_file_truncate
   hfsplus_delete_inode
   hfsplus_unlink
  hfsplus: unable to mark blocks free: error -5
  hfsplus: can't free extent: start 74, count 1

A logical size beyond the allocated blocks is invalid on HFS+, so
check it when the special file inodes are read from the volume header
and fail the mount if it is exceeded. The error is reported as:

  hfsplus: special file 6: size 140737488357376 exceeds allocated size 2048
  hfsplus: failed to load allocation file

Tested on a KASAN and lockdep kernel: the syzkaller image and images
with the logical size of the allocation, extents, catalog or
attributes file set one byte beyond its allocation are rejected, the
image with a consistent size mounts and its files can be deleted, and
generic/001, 002 and 013 pass on freshly created volumes.

The analysis, the fix and this changelog were drafted with the help of
an AI coding assistant (Claude Opus 5.5) and reviewed by the author.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Zheng Zheng <fengaojigui88@gmail.com>
Closes: https://lore.kernel.org/linux-fsdevel/CAO-4RZ1a46EoJY7x6euiS+7aTOb-T9X62E9nGyToRcyvKU+eHg@mail.gmail.com/
Cc: stable@vger.kernel.org
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
---
 fs/hfsplus/super.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
index f3283e9b42c8..33594e1f8367 100644
--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -26,34 +26,62 @@ static void hfsplus_free_inode(struct inode *inode);
 #include "hfsplus_fs.h"
 #include "xattr.h"
 
+/*
+ * The logical size of a special file must fit within its allocated
+ * blocks. Otherwise its page cache would map blocks past the end of the
+ * extent records, which the code accessing these files (e.g. the bitmap
+ * code holding alloc_mutex) does not expect.
+ */
+static int hfsplus_system_read_fork(struct inode *inode,
+				    struct hfsplus_fork_raw *fork)
+{
+	struct hfsplus_sb_info *sbi = HFSPLUS_SB(inode->i_sb);
+	u64 size = be64_to_cpu(fork->total_size);
+	u32 total_blocks = be32_to_cpu(fork->total_blocks);
+	u64 alloc_size = (u64)total_blocks << sbi->alloc_blksz_shift;
+
+	if (size > alloc_size) {
+		pr_err("special file %llu: size %llu exceeds allocated size %llu\n",
+		       inode->i_ino, size, alloc_size);
+		return -EIO;
+	}
+
+	hfsplus_inode_read_fork(inode, fork);
+	return 0;
+}
+
 static int hfsplus_system_read_inode(struct inode *inode)
 {
 	struct hfsplus_vh *vhdr = HFSPLUS_SB(inode->i_sb)->s_vhdr;
+	int err;
 
 	switch (inode->i_ino) {
 	case HFSPLUS_EXT_CNID:
-		hfsplus_inode_read_fork(inode, &vhdr->ext_file);
+		err = hfsplus_system_read_fork(inode, &vhdr->ext_file);
 		inode->i_mapping->a_ops = &hfsplus_btree_aops;
 		break;
 	case HFSPLUS_CAT_CNID:
-		hfsplus_inode_read_fork(inode, &vhdr->cat_file);
+		err = hfsplus_system_read_fork(inode, &vhdr->cat_file);
 		inode->i_mapping->a_ops = &hfsplus_btree_aops;
 		break;
 	case HFSPLUS_ALLOC_CNID:
-		hfsplus_inode_read_fork(inode, &vhdr->alloc_file);
+		err = hfsplus_system_read_fork(inode, &vhdr->alloc_file);
 		inode->i_mapping->a_ops = &hfsplus_aops;
 		break;
 	case HFSPLUS_START_CNID:
-		hfsplus_inode_read_fork(inode, &vhdr->start_file);
+		err = hfsplus_system_read_fork(inode, &vhdr->start_file);
 		break;
 	case HFSPLUS_ATTR_CNID:
-		hfsplus_inode_read_fork(inode, &vhdr->attr_file);
+		err = hfsplus_system_read_fork(inode, &vhdr->attr_file);
 		inode->i_mapping->a_ops = &hfsplus_btree_aops;
 		break;
 	default:
 		return -EIO;
 	}
 
+	if (err)
+		return err;
+
 	/*
 	 * Assign a dummy file type, for may_open() requires that
 	 * an inode has a valid file type.
-- 
2.53.0

