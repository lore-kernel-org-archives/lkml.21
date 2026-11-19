Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094013;
	b=fsKBn/IirEpXmE5OSdbzSRnUO2dC6JOCiECVHYe+e5IW0s1g8ieBaBH2JDS8lSfB5LeD
	 ULLqVMvhilBVPzSa+giTJDDjyoSmGu0iI4PgLv3sUzDgYDk9HfToWoi6hmyyGJz4+9W0/
	 T0uNzirU86NuxmwUZ9/vC3x0UyGixDw3dsRDK58oTWTuKtYTPhPhDko4Hugr5pKU//rwh
	 xtVzUkt1dMx5JbJSEQu4vlT9nxAAN6YfmTg+scWkBjhGEFLraO97AT00/OIBqdmVk21BG
	 TbcQoULGQm0hd57BCid3j4Mf2+0TB0Ajfig0C3dsjYf/Id3aPGDnHIlba1PvPdb1YRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ia0GHjhj17aGyvrjUWwCw5HBsXsim8pYjVRtdPA8MUI=;
	b=UcRa12vaomtDQDnjjJFRVaalGQvKlNzbIxzDeZ7+8i0p1oKrX/TQ4uoMD2L4EIaDfpgn
	 T7Tfv0B+LPRMOVjYUOAT/cgjjx8NT7HKy5rPRTOwQY2sF1QBVkOPhk8aCfrKkeTkT6wiu
	 Z1HQ6gptF4R/UPrF9TUlEe3dHw9pEJvGbjrNICH7biIolXNkSnr/yM2zox21J/vVyMl3f
	 iGJfL8zhQcLhqRPjD1Uw270GmCqSVMhwyODD4cdFhDhDDgyfCVlPDL+6x13/iUJLnymrt
	 TEZSoystzsU9oeoPgYZbsZZU5FqxIHpuQ/xmmofiZZEPnCqH7s5ymhDnznPxOXg+lTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dmFk7gSJ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A342606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A342606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dmFk7gSJ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so23119615e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795094012; x=1795698812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ia0GHjhj17aGyvrjUWwCw5HBsXsim8pYjVRtdPA8MUI=;
        b=dmFk7gSJ8JHLQIyvEI45kMDsXM9le6SJFlPOiRSEvk3A2iqH9y2VtzrNjxwKpw5u+/
         T0/g//n9gnLwCm9sAh5EFXNJCYccDwhyG2IZcFqWl1o68W+93g/kwv+zKyF0TmYq2RTe
         dByYaSP0OSba+tSjL9fordc2hhvKe9/rvMaQ3nTleX76a1JYowCI7E9n04zJe+meM1pW
         FgU8OD+r/lFpw79BxSTwnQHhDeDmVdnHdmZckCoJjtW0ZdqegTdIis2KqhNbaJMEGjPo
         1w96qwRuy/PP0HDIQSxB4/F+u4+muMfI/y/DnJS4udEzZ0hKSBEUc+PByRd21mYGoAbG
         5Wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094012; x=1795698812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ia0GHjhj17aGyvrjUWwCw5HBsXsim8pYjVRtdPA8MUI=;
        b=gqNhx3mwI0i5oVlJVELFDrOi2icSii+bchTJCUI4NfFV1/B521jqqc3WAvCes31FTW
         /U6NYjWHhBwP43S3x7kd8dVnKGM6QEgssX4Ka6Y892HqwIaGYuJlGF8nMVEuhvFb2/fm
         qy76Xq90qiSu1vDlYf3Vjt/xNd7MP5wDRvXNOvEpXeLIimkUXQD4an+nsTiyoQjVjhFE
         +7BxcXJzDpDoGa8cvneU1r02vw2vlrYqPFHR0y/IW9lI/xVg8ACgSMvi6a3vSVfglQJk
         EXQpVSRyNm8Qz03iDWtCas0vwv0qDJPDt6pzKFJWlBsigibVMm2zUDHrD7BqxSEn875k
         OWXQ==
X-Forwarded-Encrypted: i=1; AL+hErEY//6k5vSSRthImbLhv7hxDBW/2YKicvpaEEYcPKmVHM1bdQF6V1ra6zeNDI/oAvM08MTYrNGRGcoy/Yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l9RI7kBM1hl0jtPAkiYvVrW1Tiscxr2yuv+VgtWUXZ/1Cg8fM
	njOfbS0N6I8fFfzCCvdZKRcUn/UhNWxGjPbNoSyGaMbezQ2hqqKJbN0Y
X-Gm-Gg: AYBFou2BayXoB9sxKgdxGfPSE9Q9IPD1Zfodk92jF1iaDwS8IN2YveVDoc99P1QwHuC
	c+ZwPDLxPQYTVgPvVNTyx1o59GIjkMh+MIEpgl36ya3GBEhhysCSTE47OsmhO2pLHr9tRtjnaki
	m49x40GT3a8RLugnZNvuNHLOgnB0UsziroK9qtEA+mV9mrd4wl3YWlp3GhSZL6MZx1JP/xztdfd
	sEvZBuTamq0HqALbVP9ykytOwv94mNfjBxzuGrdw8QS5dIjruqabQtyeMzABU19Rx6UO/5oiWeX
	JOsHJm4mQRlpk16qDYtT7XdI15k+rlTEMja7wVuXo8fHQGVGQUrOpvwZuHjccXAB1eBlLJOpXZI
	wJhE3Xs5755dK7sn2V6po/s4F7tZDJHLcT8jUTtB1JuWWzHhZBcWjFdNN9qXFS30wL0NktQeleu
	weuw6V5V6xiGlbwJzeHM3MKDFraQ1qnpkFX+Wlznlqk0z/c5UVcPTPTTdlOEPkRblEqxo/baKb3
	karMAMJ4D6drsDChg+gzxpRfu0oy6+rBYOIz92Y65/vDMMtC2lweJWtg2JXW9l0/UkkJnMkiKdt
	G5Ib81fpf7ONsGTym3zEt+U0sPzwxJMkSvfq
X-Received: by 2002:a05:600c:354b:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb7da3a1bcmr117516075e9.26.1795094011855;
        Thu, 19 Nov 2026 05:13:31 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:477f:ff00:c2fd:f9b8:4971:d270])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e5edf5sm18258045e9.4.2026.11.19.05.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:13:31 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: m.szyprowski@samsung.com,
	robin.murphy@arm.com
Cc: ailiop@suse.com,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2 1/2] dma-debug: Skip debugfs registration when uninitialized
Date: Thu, 19 Nov 2026 15:13:24 +0200
Message-ID: <91e9fa52ed35754f62c7fdecfad266a7213d4602.1795093513.git.thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795093513.git.thnkslprpt@gmail.com>
References: <cover.1795093513.git.thnkslprpt@gmail.com>
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

dma_debug_init() returns without initializing the hash buckets when DMA
API debugging is disabled at boot. dma_debug_fs_init() still registers
the debugfs files, allowing a read of dma-api/dump to traverse an
uninitialized list and dereference NULL.

Skip debugfs registration unless dma_debug_initialized is set. Keep
the files available if debugging disables itself after initialization,
so previously recorded mappings remain accessible.

Fixes: 173735c346c4 ("dma-debug: fix debugfs initialization order")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
v2:
- check dma_debug_initialized before registering the debugfs
  files instead of guarding both dump functions

 kernel/dma/debug.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 36c1f7cbb2ae..6e554dcfc9b9 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -839,7 +839,12 @@ static const struct file_operations filter_fops = {
 
 static int __init dma_debug_fs_init(void)
 {
-	struct dentry *dentry = debugfs_create_dir("dma-api", NULL);
+	struct dentry *dentry;
+
+	if (!dma_debug_initialized)
+		return 0;
+
+	dentry = debugfs_create_dir("dma-api", NULL);
 
 	debugfs_create_bool("disabled", 0444, dentry, &global_disable);
 	debugfs_create_u32("error_count", 0444, dentry, &error_count);
-- 
2.43.0

