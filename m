Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101186;
	b=kCOV4EOm/E+z/p+JlB8KSXtyMjyiFSgecIdhVZIWt6uLwH4aJfXDdCLnlSmk1TclwhJ0
	 1Fo8eP3Z8FQre0vUg2VlU8G6aomBy+0xwiwW1Ao7Hcef+C1Fz8Fdqh8e7c2OnvzAmczT8
	 SkNfHx3jTUO1FEVMGT0pSLqzCzrZodtma/pCLyyTeWubjJsJA0VVbUSLEaH7coHw9PMUk
	 +XGrvCR1d1pMlw3n+FSl2/0P/KSNHf61g0U+BeHu33AzvYAefDGcjUcYiplPJdSg1z9dw
	 oB+ZOrHeZPM6J/Xjibf2vjkiHMcFHfutML7YgMxGDqdiej2pz4SItFAg/dqodZWXSSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JpxIvevc+k3PDqIuz3tCAw053u2XWq+vX93HZah6pos=;
	b=Amru9DHGX62y0ZhoN/XQ5uq+/kB5iy9LTHdpGUfNi2rag7HoPRXlXOMjLUteztc3Qps6
	 ouhjOQoGZ2jkYlTs2qJ6bwW/Nqiduzb63GPXoTHuhTApeJ4JKvXWJJjzZqYpGMmgIRlmg
	 v5lM7V3s88W308R4Hh7BYBtLlXKePfjJfAvCDTxFceOlzIWW5BHmB+84YvgpKPVu7YWVy
	 iJjwIKty5/uKuCywlbA3uOECAOhzeWyyQsPNPZBpxkqTLzHuosvJC8xJPY3H1sMXaCvgr
	 yDI8uVkvOYWp3yoTeFilgjCMiCU2Dw+jPaiefDND9zHZNd5CQBl582AXHE1a/XRUpfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=heYsYuub;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C51606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C51606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=heYsYuub
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso5162975ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795101185; x=1795705985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JpxIvevc+k3PDqIuz3tCAw053u2XWq+vX93HZah6pos=;
        b=heYsYuubAj88xnLDnGgzj33y+P1bBnOQgnMwpeSoNMQBvdFMY9nGds0yIZ4w9VXDc/
         3pNXMT8IaGtnKgrk4iIyma+lBML4cs2BSD2HRKhs/BqR6ekgYn5aPgCkjgGxgRPV8GyD
         KGqQUD8+SiJaRYV9iVJa6aLafMCfNI32HqlnrOUxKz4UOiDXzjL1uSfWTC6P3A2HtLPt
         x/FgSYLhO+SamhZiZAo6h4TS8LvmCP5cxDJngN+6UCSI+HYIrR1MD9xcBdfPmmRh5HVX
         DOrXAtrzaMzYBjTVmdQg5ELPpH+OMtQ1HMUI09+AT/2lfsd8GpKmquTA3YZJHDw9IGUc
         1u1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101185; x=1795705985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JpxIvevc+k3PDqIuz3tCAw053u2XWq+vX93HZah6pos=;
        b=MHvaaK3a8lZ1VeNS2LNUD2HE471aKS/0BiXfhh12yRHt7di0xZjcDhxcpoKFn+qlyp
         aOJ4Z6jfaqdZ5CupCaUFAbvLwShlmOvPkMh48h0AsOOwF61lAsA+t4B+AirslK+F2A2X
         CgkEghLkAXDLLVgEXCS2VPH/YgGHGiHs+1QJiju0EaeG0vHbsBAYk9NPprerrNP+Olfa
         mxjHHMq82M6aVPMokdXv/DTOjn1NZ3xl1C4qS7A1PTI3fPnogpCyNJYd3b9chVVEzUEM
         gfwJI7MJzRfZwBNjGoqnHlTjBXZr8ABj1EUeiEO3MFf4OHq06xUSL9eI+64hsuhBPoNP
         uBiw==
X-Forwarded-Encrypted: i=1; AL+hErFMaWxnGYI2pkXoyg2SeKLjyzK2BKYXlMSxEoGm6G63PIRQAWMpXhBHUv3hCHtSgkykYn1urm9lYs6SYdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V4IogcqoY4YTzw+2gxtkf4PXTy0cwKjK4lXFHjutb5947og+h
	L9VdgFgJRtYeGjsc/Qm7zSlFcJDJSVVvgKv+PitF8yC6yrFAL3JelAQi
X-Gm-Gg: AYBFou0B6TbbcMwW4l4gxdyKDhbdOj54J1zNF0F25fHBnCiLjg5UQOtFJGsSdGIRdEd
	DI7Xa6LkR+BR3PZlVhQ/AikPtcI5HJGwbD7j3rjFEI8vEmWez5MAyw8loahTTjzUCPSnXNO1Xys
	htuiHer2ImL3C1EGpbhrD00mAJUf8feGxqZ5SspmB9fyxM6svr+KcX/qtVrL9jiWkDnQ20YHolW
	57x2oh6XP1ZJR0uS1kGBGY4wRByremOgw8sSTLxjn2nsf/1F2v7CedI8g1oWAmfIPAAUh1QBefC
	YVqs3rwv8a1INqVt6g7GKp0J+0jm/u2FGVdejVPbe66e3nYabl5P9blqSb88CB0mQLmZ9JXr4Nq
	kUWbfXTsezPnRy6MNVka1P/tGli4fUaAveAl1Pw/Db06UdiPgbcoZ6blRfrfInkXPan+hL37cnG
	lkaZn8mupKu6XWA+APsWsc692Z7ZaBfsgG+58w7l+ll7vVcdiMLSCHwy/vWbNZapFiRNd4hKX2I
	mfLz4vouceeRwCeqrfjNTPajDFneFoWKqVCR8DRvn9dNDVbQZMNNx8TI9wDhoquk/G0FPAdtXW6
	xU2oMDay2JUanTmIFEhMcTldRyPz6AHwEB/lZo2v4M/VRg==
X-Received: by 2002:a17:903:198b:b0:2e8:95d8:6423 with SMTP id d9443c01a7336-2f0320782aemr12269375ad.38.1795101184871;
        Thu, 19 Nov 2026 07:13:04 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm1157095ad.67.2026.11.19.07.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:13:04 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH] fs/ntfs3: don't prepare private mappings for writing
Date: Thu, 19 Nov 2026 23:12:59 +0800
Message-ID: <20261119151259.3965463-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_file_mmap_prepare() allocates the clusters of a sparse file and
zeroes the file up to the end of the mapping when the mapping has
VMA_WRITE.  A MAP_PRIVATE mapping never writes the file, but it gets
the same treatment, so any user who can read a file can make ntfs3
write to the volume, also when it is mounted read-only.

With -o ro, a MAP_PRIVATE mapping with PROT_WRITE by uid 1000 of a
4 MiB sparse file zeroes 4 MiB on the device and marks 1024 clusters
used in the bitmap.  The runlist is not updated, so the clusters are
lost.  The same mapping of a 4 MiB file with 4096 initialized bytes
writes 4190208 bytes of zeroes.  On a writable mount, it allocates all
clusters of a sparse file that the user cannot write.

Only prepare shared writable mappings.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Tested in a VM on 7.4-rc3 (20eef29b7c84): with the patch, both read-only
cases leave the device unchanged and the sparse file is not allocated.
fsx with mmap on 4K and 64K cluster volumes and on sparse and compressed
files gives the same results as before.

 fs/ntfs3/file.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 6c84a3e1c7fe..3da8b65793e1 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -388,6 +388,8 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
 	struct inode *inode = file_inode(file);
 	struct ntfs_inode *ni = ntfs_i(inode);
 	const bool rw = vma_desc_test(desc, VMA_WRITE_BIT);
+	/* A private mapping never writes the file. */
+	const bool shared_rw = rw && vma_desc_test(desc, VMA_SHARED_BIT);
 	int err;
 
 	/* Avoid any operation if inode is bad. */
@@ -417,7 +419,7 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
 		file->f_ra.ra_pages = 0;
 	}
 
-	if (rw) {
+	if (shared_rw) {
 		u64 from = (u64)desc->pgoff << PAGE_SHIFT;
 		u64 to = min_t(u64, i_size_read(inode),
 			       from + vma_desc_size(desc));
@@ -452,7 +454,7 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
 	}
 
 	err = generic_file_mmap_prepare(desc);
-	if (!err && rw)
+	if (!err && shared_rw)
 		desc->vm_ops = &ntfs_file_vm_ops;
 out:
 	return err;

base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.43.0

