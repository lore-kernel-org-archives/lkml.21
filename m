Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212272;
	b=F4DbjL7R/BN6aGG2zXqvMCt4ZEF8tSNt0+NImcGLQt9nDZJHpUZw1c0nW1lVYIScZG3u
	 ULBb6Niu8cNpkTSpKor82VkwUZmD963mmGXzjItYL3cs2hibhNBsA2z3bo2r3TCEYscbO
	 swacAkb40c/pwXT11hY6TBfUoFipQayW2cVwadnAfJUwOW7UD1AEfWaTEjWjH2EnG0OeS
	 6gJ5aNAEeLL41spVsPIKWpOa8K7mWmiid0Pq9O7fy03e1SK1HSLX41Gh4Ro8Qm4lZDIaG
	 OMb1nsp3pJSNwTkLIEYzge/v9grnBh4N3TrhLHKxLqVQhnIPuthntZVjEihufbnO5ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aa7qEaxeOlG6UrT9v6iaZAnn/jfDxPey+mYNfYgCTvs=;
	b=hBc2pCEnr26xqRzP63kbhH1auTD04XvdlCfhkJRe8dRCdyRoVGFN+S8K7O+rXoZhguCb
	 bzX1/oWqHrQQ/NpD0+vzk1TuZOdZ1vwU/BD8xtkcbhdEJXDKGw/4/98iVeGLLoKS0PiCf
	 H3QMrmYy3ATsTVED9EKfj7xZRomyer9fGziBKjDqJO4mEu7UxEYI7xhOBGFaUgRQlBTOm
	 mR/Vdwzx/nDEw43TBQf9tlubpW4MRCHRCBZWH7wNLX8wPaw7iEOcgCCoMtq3YwDS9S7F8
	 p5vttg/BsK1P3weOD8R9Ip0twTPymr57CWHGMmzZBbEZEHOCj/2tdny5dAiptHDNnpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cg+8Bhwg;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ECA606A6A5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43ECA606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cg+8Bhwg
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso667962f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795212263; x=1795817063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aa7qEaxeOlG6UrT9v6iaZAnn/jfDxPey+mYNfYgCTvs=;
        b=cg+8BhwgWbN2VZWtTAwg5us6kIYKWVDH3XaOE5L7EweTD2fWI4FPIVM5Gpk3DZ0Dz5
         uAQOwVFUx4wAO6fS+ImuvU1Irf84hJ9Wdd1qy0HBJx/JKpLVUNXbFEuU8Pdfmyfgg2W1
         ecX0vZQo/hmo2KrLnsd/kHP3Ub3QbLLYxraLlMQGCxaC/ZT/TtIpmS7blfidlkF7/OY2
         GX9R2t2F//APRQXoeZYDiFg1I3q/LXrsZxOeoiyISxjt/ybh6IwjY70Li7N3j9GcnN8i
         7LmDxTrITawHLsTvrgwpVe+FMaea4NuPEuXt8D+rDQ4Bi5GzfuKFRr47kpGG/sTWmmeH
         6mGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212263; x=1795817063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aa7qEaxeOlG6UrT9v6iaZAnn/jfDxPey+mYNfYgCTvs=;
        b=dNo4KOizk5HulO0n8Wk9cE7ZTTinJOhmwOjU8xDOqRmOG0VFrTTpCuAh/iTCzVGxLf
         Mt/rEWO7k84QFjZQbWjtWnqW/gYJJLg3Tj9lhO2M7/GZfS/ZUyeKrAx2Buco+yBf/QeQ
         pXbN/o4Ntjw0o0sHFbONdmMbhYdUWL92fxFGxhoX1s+WDcpX0fCgXO2TiFsNzvsmy8Qt
         LV893r1oxLVtsDlRX6vnj0bbSlfq8/4J+bjXS6OiVL1xO9/W7XubyGcr/m+2/W+dS80V
         yV48jVKnoEOAC3D0RmIv3nu2ReFiAee5FtVJEeQJsqPBSnggrsID4FjYBJI17mtWHGpJ
         O5Ng==
X-Gm-Message-State: APuU4Z+m8G9bNCySqKUfg5vbe41JKZH5W9ap2KcxhpwyfxdyPBPl4gzt
	1GSI6OyzkE55M6FPmvRcJ/fi2fLBcwFIyiFIhlBaBQg9CxeuoaL+XwwRkJPrS+vk
X-Gm-Gg: AZFdTZe0dagAoh5sYCb+HLZ17C51y4HcqccnNY5XgcXo28hdp07Y4vCWdZJLboKY0y7
	Uk/9ND5mPTceViLzisUZkYW07q9h0u3AMLn8Mt0BWSed+ALuoxSehi5l/CHNUnRrgGwZqTzoqKa
	4JLIP/62bhX0EdtFB7X71WaVMTo71Balx/PkQfdqmIBq0miV718T+YT/sJcG3o+rCHmYoLyhd1e
	qndIqg+QX8NInLUjbB956tQwCL2r3pFyHBCawXrpIX3SDr+mQxIfGKs/miSb7atZZ5cravb2I1g
	fYS/Ii4dxeiq3gLMKk8O/R6gstZXn034NVIgOYb+vpoYWQ8rjTLSY5RjCM3u+ef6/lhvOX79Vvs
	mROXMCRWWiyCS/DtYzq7ay8MJEzgsxyiQWRNIbMLyBnwOZR0xJIxDcZbe2rWJQJ+BDZcNu6WVKv
	CeLpVJvMH4bi1UaG1ebe35X5S8BD0LKseIYtANRph8lsRq6TLMjsXaxooRfVJ8dvcWSuff2BvZy
	1DvZklhvvU68k2qlc/Jk7Wqwvv5Oc/1u0AM6KBZv7U8no8iC4fY0RlwOw4Ibo1Dt0hSmxFkphP3
	XiaV19Dvp9zMiUivEBVIjYO1/efhLQzxdeb6gZiHZDdz/uNc25ZLQC4K0w==
X-Received: by 2002:a5d:588b:0:b0:48e:66d0:664c with SMTP id ffacd0b85a97d-4abaf64be12mr10171630f8f.15.1795212262648;
        Fri, 20 Nov 2026 14:04:22 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm7156629f8f.23.2026.11.20.14.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:04:22 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	syzbot+6a0633f11d3fb88860bf@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH] qnx6: fix divide-by-zero and silent magic check in qnx6_mmi_fill_super()
Date: Sat, 21 Nov 2026 03:03:54 +0500
Message-ID: <20261120220355.137600-1-arbabhaider649@gmail.com>
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

syzbot reported a divide error in qnx6_mmi_fill_super() when mounting an
all-zero block device with MS_SILENT and the "mmi_fs" mount option:

  Oops: divide error: 0000 [#1] SMP KASAN PTI
  RIP: 0010:qnx6_mmi_fill_super+0x228/0x870 fs/qnx6/super_mmi.c:68

Two issues combine to trigger this crash:

1. When sb1->sb_magic does not match QNX6_SUPER_MAGIC, "goto out;" is
   nested inside "if (!silent)", so mounting with MS_SILENT falls
   through instead of aborting. An all-zero superblock then passes the
   crc32_be() check because crc32_be(0, zeros, 504) == 0.

2. The second superblock offset divides QNX6_SUPERBLOCK_AREA by
   fs32_to_cpu(sbi, sb1->sb_blocksize) before sb_set_blocksize()
   validates the blocksize, causing a divide-by-zero when
   sb_blocksize is 0.

Fix both by moving "goto out;" outside "if (!silent)" (matching the sb2
magic check) and validating sb1->sb_blocksize against
QNX6_SUPERBLOCK_AREA and sb_set_blocksize() before computing the second
superblock offset using a 64-bit addition and s->s_blocksize_bits,
matching qnx6_fill_super().

Reported-by: syzbot+6a0633f11d3fb88860bf@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6a0633f11d3fb88860bf
Fixes: 5d026c724220 ("fs: initial qnx6fs addition")
Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
 fs/qnx6/super_mmi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/qnx6/super_mmi.c b/fs/qnx6/super_mmi.c
index b8afb6f38..bb4243872 100644
--- a/fs/qnx6/super_mmi.c
+++ b/fs/qnx6/super_mmi.c
@@ -51,10 +51,9 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 	sb1 = (struct qnx6_mmi_super_block *)bh1->b_data;
 	sbi = QNX6_SB(s);
 	if (fs32_to_cpu(sbi, sb1->sb_magic) != QNX6_SUPER_MAGIC) {
-		if (!silent) {
+		if (!silent)
 			pr_err("wrong signature (magic) in superblock #1.\n");
-			goto out;
-		}
+		goto out;
 	}
 
 	/* checksum check - start at byte 8 and end at byte 512 */
@@ -64,12 +63,9 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 		goto out;
 	}
 
-	/* calculate second superblock blocknumber */
-	offset = fs32_to_cpu(sbi, sb1->sb_num_blocks) + QNX6_SUPERBLOCK_AREA /
-					fs32_to_cpu(sbi, sb1->sb_blocksize);
-
 	/* set new blocksize */
-	if (!sb_set_blocksize(s, fs32_to_cpu(sbi, sb1->sb_blocksize))) {
+	if (fs32_to_cpu(sbi, sb1->sb_blocksize) > QNX6_SUPERBLOCK_AREA ||
+	    !sb_set_blocksize(s, fs32_to_cpu(sbi, sb1->sb_blocksize))) {
 		pr_err("unable to set blocksize\n");
 		goto out;
 	}
@@ -80,6 +76,10 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 		goto out;
 	sb1 = (struct qnx6_mmi_super_block *)bh1->b_data;
 
+	/* calculate second superblock blocknumber */
+	offset = (u64)fs32_to_cpu(sbi, sb1->sb_num_blocks) +
+		(QNX6_SUPERBLOCK_AREA >> s->s_blocksize_bits);
+
 	/* read second superblock */
 	bh2 = sb_bread(s, offset);
 	if (!bh2) {
-- 
2.53.0

