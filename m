Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754571;
	b=r3EhCCA3cG9jNjcJiZL/qEatQFhTzDf18QXbBeq6T2C6xzUME4PMVddUk+aXWK4tCSZ7
	 4XRySBAONlfffl2P4eUvhAYp7DFHmk3nQpJW/vjnGS1VjGoN6rRqGWo6SEi2VBo/d+Le8
	 fmIiSmg8k9ncRdz/JQYpc7EsKCuD+4KmCnUcyMGfIHhPpQfSKgcA6Dhxq4vaobrN8ykJ9
	 YoXc5p1KTXi2Euo8jKcugDp3JjJzargJb5KtQasIMETjaT91+/fg/KG1fe8BSGtV6hVYh
	 tUq6PzzohMIXOWmpgucG10GMmrNVhc/Kq1JkdsGRitqg4XoZ82Vjyh2PAj0twwdSKuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bMPrUEvOOl42HBlWFfjw5Fxko7mbQZcBgF1FR/Z2T+s=;
	b=xNfvtEj2wqcN8icTcpD56+RrV81qVVCBFQBW+o8ZDI2DIcpmFmgI5N3omSPOrBr/S2m3
	 EUjyAVAh1zprq2dPUFFatchaTHGLeE5Iv1xiTRE1D9rmle3xFT8HxZnyHGzzgZUXLXY5q
	 hM8GdzLPJVkefL6vylScodttbtzhVgwG4G+PUETCXX78wag/lsh2rZV0ueb0R6Nb9CY0r
	 oDae8xHdtlWiHGRy8z9bZbuctFct+afBlooyrFjOj1Z7LxKMu0z7AyQYNbqlQwv9jxVMH
	 8frmF3Lw53QAYXOcP7FQaMUxSFYUleV42HRYgtauQhykFAW+u8uIyCaLHZVYvru2+Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rXJr6Vxl;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D28606A68D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D28606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rXJr6Vxl
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2af4c8d00so7986588c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795754568; x=1796359368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMPrUEvOOl42HBlWFfjw5Fxko7mbQZcBgF1FR/Z2T+s=;
        b=rXJr6VxlyGpQqx8xuOAVZyMRvo3s6fgWg2buV2B+Gd5Zu+lsaluBTKSgRyyMI7hkqn
         AjbeRzNlcL9q5/EdS+271gqmJV2MndDsvEkhhxLyCe0vpK7xFVk3BhqEuVUGoz9Fpyhk
         6dN0dGnA8Yozr01j9vZXxCYh2qGhUZk6vjEMmKl63V70TsZ/JteN6q9ZXiikblpllJuF
         t0a0EXXYngM5vm7V+IXyMo/+NxAvpjOtiNzwoHfGJ2eLgaQzmF9HGA5cyJKNItdfQY15
         4GZiC+FYHWS8gfg8vJ+pdl9qrlQ/N8EiiYMVzs/7KcWyNq4rgzf/HAuDdzLFS82XibYT
         XgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754568; x=1796359368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMPrUEvOOl42HBlWFfjw5Fxko7mbQZcBgF1FR/Z2T+s=;
        b=Dqslr0f0jeTHLPg9m5r4IW6PP1SleJzW6CVj/fJNdp1RxoOaoY+d/WAehTspOpUCmG
         AAkPTPdXfPDSm9+c0t1fDYmRBKTzLKWvDH1qVZN6fmU6CcMeyCpSRJ9Qd4u94Y7BZVpF
         njlXzHXKURX3sjgAOMJNbXaxVR+4bhJULc4ftD3WRpbgbsj01jaFnnSy2zPbhAre6WAN
         9s/J6d2a+/b8j5hU3UZeejCCkFvJN6pnSzJUNKBs7miibD2ZUWEbtz4JIE60ylLaUJQG
         h0W5c+/pU9LEKmBcZs1fksgzLGxSldcztvsPa3mtXU//MtaWkBZEKsF1nB8nzm571bDR
         HxhA==
X-Forwarded-Encrypted: i=1; AL+hErFZZQqQV34G0lGgcQWOLe+TmKgY6dgixZmWzZyiedvuAJl9DeDaMty1ejRPKBA9CGIEu8ECCZ8jVIEsMhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wPCtc2TFiOM8trpL0oeZz3GhH9vU+0phg17sl8OYajPeA5Ys7
	68r1eCxzB379nZ88iVJfAzITzsANhFE/Tp4UN7MbLbGwVr/Ykyjzj2wI
X-Gm-Gg: AZFdTZeokXQusoVfsUabLMHro2wwBofbK0JX9s5j7+Ul5Pt2xyff0vbD5ZzEwxrL/mA
	nLK48rmF1Sa4hZ+/HBIU+Kxy81vIgtGPtNLGuNwKrJqxWBiXW05128WRM7tilWuzvEUMD/I0fBg
	Gz+T9BlXk/QHffoQewLYuKHYA4evSIbvCf4mxKtMC+mUQwaHdkTEEt0RzaGlR4VPQmsuJNzT6YA
	evrkonQ7HT++88dZfPD7Fz/BhO9qAhIGqZ60IZw+hwy+yrZWWPsuEtJ+sk4C5aG3MUevv52Rs9O
	3d303k6+V9z6Kvl9LjGNSUqTO0VZcLUVNvvbRSkj8b1KsLNcJp7FMciQ9CGTr84lpyPucyqdcqz
	N/UOGfEFrzY9RT2QfKnJFMW5ZrqpCOQzNceYisZs648/2tqV9iKxzFSAC30v2C8Qnu/ZidETBif
	JEyeUC1SjLoIcoeJ+SmO+qr2mHkL+Ac3Pjb7O5Zv4sknclmZSKXjCdSmEhpcSMkXk/NaJylMcDk
	aI+mYjBsozGWu64TB+ppwrIUS+J3wp+CP98XArKIwEu4LA7yRj1GrBJxUhJGSDjgATRycG3rzcL
	9c3f373rLk7LZVb+dQDl+qakjvFRiwBMt704wKPIsXgKAkKV+AHaxeaTBeyM+Ds=
X-Received: by 2002:a05:7022:290:b0:1b5:283:79c8 with SMTP id a92af1059eb24-1b5567a6eb4mr22486826c88.4.1795754568445;
        Thu, 26 Nov 2026 20:42:48 -0800 (PST)
Received: from carrot.home.local (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm88000388c88.9.2026.11.26.20.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:42:47 -0800 (PST)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Wang Jianjian <wangjianjian3@huawei.com>,
	linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Zheng Zheng <fengaojigui88@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 5/8] nilfs2: save DAT entry blocks to shadow mapping before freeing
Date: Fri, 27 Nov 2026 13:40:58 +0900
Message-ID: <20261127044231.37630-6-konishi.ryusuke@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127044231.37630-1-konishi.ryusuke@gmail.com>
References: <20261127044231.37630-1-konishi.ryusuke@gmail.com>
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

In preparation for restoring removed DAT entries when GC is aborted,
modify nilfs_dat_freev() to freeze the buffer heads of target DAT entry
blocks before freeing virtual block numbers, saving their original
contents in the shadow mapping.

Cc: stable@vger.kernel.org
Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/dat.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/fs/nilfs2/dat.c b/fs/nilfs2/dat.c
index d2718944368b..b4156945e433 100644
--- a/fs/nilfs2/dat.c
+++ b/fs/nilfs2/dat.c
@@ -11,6 +11,7 @@
 #include <linux/buffer_head.h>
 #include <linux/string.h>
 #include <linux/errno.h>
+#include <linux/math64.h>
 #include "nilfs.h"
 #include "mdt.h"
 #include "alloc.h"
@@ -306,11 +307,48 @@ int nilfs_dat_mark_dirty(struct inode *dat, __u64 vblocknr)
  * Return: 0 on success, or one of the following negative error codes on
  * failure:
  * * %-EIO	- I/O error (including metadata corruption).
- * * %-ENOENT	- The virtual block number have not been allocated.
+ * * %-ENOENT	- An unallocated management block was found.
  * * %-ENOMEM	- Insufficient memory available.
  */
 int nilfs_dat_freev(struct inode *dat, __u64 *vblocknrs, size_t nitems)
 {
+	unsigned long entries_per_block = NILFS_MDT(dat)->mi_entries_per_block;
+	struct buffer_head *entry_bh = NULL;
+	__u64 start_vblocknr = 0, end_vblocknr = 0;
+	u64 rem;
+	size_t i;
+	int ret;
+
+	/* Save the DAT entries to the shadow mapping before removal */
+	for (i = 0; i < nitems; i++) {
+		if (entry_bh && vblocknrs[i] >= start_vblocknr &&
+			vblocknrs[i] < end_vblocknr)
+			continue;
+
+		brelse(entry_bh);
+		entry_bh = NULL;
+
+		ret = nilfs_palloc_get_entry_block(dat, vblocknrs[i], 0,
+						&entry_bh);
+		if (unlikely(ret < 0)) {
+			if (ret != -ENOENT)
+				return ret;
+			continue;
+		}
+		if (!buffer_nilfs_redirected(entry_bh)) {
+			ret = nilfs_mdt_freeze_buffer(dat, entry_bh);
+			if (unlikely(ret < 0)) {
+				brelse(entry_bh);
+				return ret;
+			}
+		}
+
+		div64_u64_rem(vblocknrs[i], entries_per_block, &rem);
+		start_vblocknr = vblocknrs[i] - rem;
+		end_vblocknr = start_vblocknr + entries_per_block;
+	}
+	brelse(entry_bh);
+
 	return nilfs_palloc_freev(dat, vblocknrs, nitems);
 }
 
-- 
2.53.0

