Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795061652;
	b=JF6gKn1FR9eYaSWpcndQV3tD1ENLhq46ePVnB6Vf6vgwP9B607TUaehRYUYBIdtivXNg
	 ZFdV6oXxOf4uowppJc4BzyPYDG0FOoOJajgh66HS+YpHKKtTtcpHpKv346b+pj9/9d828
	 58BS49lSPu3HQOGkTHIPXG+SCjY4FEZWLg+blfsXEDAtmuGccB9Q5mdT+FpnPDZBJ0Lca
	 wdXBqtaqnCFEob+cm71uMN67NTrTn505bbVl4RgvR7kClydSSXpueuvbGCzLLNbpjXoIG
	 eILpmXqDqv3xWzcHWjqwiuSDITKxpNG3nJ9ma4WRWqtqovOwpfCmE4MAarXIAhSkCDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795061652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GikVTWoTtBeNiGifZTjdMmvaA9rmr+argKFGtvFCNYM=;
	b=nBZm4xvufKUhQ88lVMedEUSW+mUyNUhYeN0vc8XySKzj9c/Gp6OMb9aiIqhGB9pwsGWi
	 13tqXd7FjixWr3/6zDEeMBPcCe4/WvassWTEMsqWf0+c0eRIJbyWfygpKqO79o43ipRi9
	 BgHuetJARSub+Fsg4p/CwXo5Ok9xmf+vxvMBY2CqOVfQi78gwJHu0HUNo6NgJEH++E0c2
	 er3/YIanuFEWJNkAzBqPR9Bz35SPKe2COAmzx5LVZJNEGpN6H1jst18c+ltEpT/YiFJtw
	 U2WBSkWwFEww5+ygaQGTiQEPKkWXNiJ34uVNyKzx8KzhQcXBazzV2z/7b4u4l7SYFRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QhqFOgim;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D09606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44D09606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QhqFOgim
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1124497a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795061652; x=1795666452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GikVTWoTtBeNiGifZTjdMmvaA9rmr+argKFGtvFCNYM=;
        b=QhqFOgimL0a6Fj+Kd6AaRM+UXj0uP39fHE6FIzbjjkc+D7442cjcWow5zrqBfF4dgK
         CmTpJ6F0+frwACH2E0nmfJaA0ADIlHqA4m+zE1L6YFawz/T75Kwh/qmas4h3EgI4hamg
         hbKGLuECa5dYtyk6yMxrmSYwJvNRmytIWLP0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795061652; x=1795666452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GikVTWoTtBeNiGifZTjdMmvaA9rmr+argKFGtvFCNYM=;
        b=sLivvoe1SeFnGf3Qtojg1CoORj4aozvdHgJOrNDotCl37d5SjHayRKfwbly2jkugCx
         GtsZbc2oO3Yk3kiHEhTacGTqTwAMWlcP/wUNy0Nrz+e9//lohZwxFtKivXV26vwMvAbE
         JF4DLmcn2j1hd+3IQxaLic1UVKc6Sc6vd1/nDQIzuXc671SKWOL0YyFe14a+JJHzqSPy
         kqc0O8WuOk2CJzAk1/ZwqLTCATpbvoRv+ZV/4eO/KNP1oRXvEKvqoIhk6WX9wgQOdPoj
         1dUqr9x6uWYQp8078O0V0HlN8J50OdvDr7ID9s5KOF0gQDszvKlK6fhV4t5YbWMVoTi4
         Xmqg==
X-Forwarded-Encrypted: i=1; AL+hErFho1cY80/tRIBmmjEv6XllQEKGUl04U+nVvZC4isPvzvRh7zEpavnaP6nUjjEkhSIqxe2Ohzmr2q4Px38=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YQm7L2DPrPw9JYlRJP7NY2hbV86AhTUx+rYFTxtAQjrfEYZ/6
	yH0Xa1mTI+C43fz+uEOT6lXux7ZDbjV0NPrCQDXH+lDe/4tfZyfEhKP4T/eMSH/LWA==
X-Gm-Gg: AZFdTZcHabTsh6bHNuYX0c+4CjckiHrj3x0xV0k9ckZ39Ygs8ZVI/87Aukz8QBzFZwi
	mr+5GWNeLUAf+sHZ/SUxhtFZNdhIdMtnDnZa7xUjZh+bew0qUPxOYW8bQjFc8I1Tu39Gc9lqyfp
	QpscpsqkqT4SaGEPf8Qamc3ktEImXpm1LUuLVPy9qMBbioRwxcqELO8c6SBmoe3/TazU2VOlcRw
	OIEzAucMQBkJ1Or0XNZ/JiXmu+Hb/hQ1ClDGVCulIaORCIKkB38DxSiIa3Aqrwk2stvUpdKLSei
	AFijsJx6VkS8P7cmYXt6wgPYJUCi/3sqov/Z+e/dSAaj/hVb0A5VZzV4aR+2SEIJOs+47i8ePRR
	540p6MxfFn/vNjB2RWyu0pMKb4jC9aVCWr/Jos/jXt0C5hw27lgwyq/nkitfDop3abmvVGnEQWs
	/p0F2icYtjcqeoQL93cfyObq9nGOwzo1tP0dpGvJCbp5a81/mLldrrLGCOQaolTnxTlAzOtUue0
	ln/z52tH5xbLcwHkZ13CcTQ1p7YB7Wl94mKrMEJ1vUw7bvYWvCFw1F7j60ky/FranD4KBUKyeud
	N0ZhtG0fCERRMpXpRruTgRBcKkIdvjjlfbw6O50IcICEwyXPEbXDtlAurj4gdvspYEpjnHT2qj/
	9dMA2F+/R90brpVJdLw==
X-Received: by 2002:a17:90b:3f88:b0:3ac:a203:e0a1 with SMTP id 98e67ed59e1d1-3b3d07a9f77mr4492120a91.37.1795061651613;
        Wed, 18 Nov 2026 20:14:11 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9297:4989:4c44:dad6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40593719esm438795a91.13.2026.11.18.20.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:14:11 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 1/2] zsmalloc: fix SPDX license identifier
Date: Thu, 19 Nov 2026 13:13:51 +0900
Message-ID: <39f6056e0c8834fc3eca2001fcb44f3b6048f74d.1795061575.git.senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
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

zsmalloc is released under MODULE_LICENSE("Dual BSD/GPL") so
the existing SPDX license identifier is incorrect.

Use the matching identifier, (GPL-2.0-only OR BSD-3-Clause),
and drop the license text that it replaces.  The copyright
notices stay as they are.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/linux/zsmalloc.h | 7 +------
 mm/zsmalloc.c            | 8 +-------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/include/linux/zsmalloc.h b/include/linux/zsmalloc.h
index 8971eef333ba..3232bc9c33b2 100644
--- a/include/linux/zsmalloc.h
+++ b/include/linux/zsmalloc.h
@@ -1,14 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * zsmalloc memory allocator
  *
  * Copyright (C) 2011  Nitin Gupta
  * Copyright (C) 2012, 2013 Minchan Kim
- *
- * This code is released using a dual license strategy: BSD/GPL
- * You can choose the license that better fits your requirements.
- *
- * Released under the terms of 3-clause BSD License
- * Released under the terms of GNU General Public License Version 2.0
  */
 
 #ifndef _ZS_MALLOC_H_
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 4a6ec43f418b..f571b3c9e9ca 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1,16 +1,10 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 
 /*
  * zsmalloc memory allocator
  *
  * Copyright (C) 2011  Nitin Gupta
  * Copyright (C) 2012, 2013 Minchan Kim
- *
- * This code is released using a dual license strategy: BSD/GPL
- * You can choose the license that better fits your requirements.
- *
- * Released under the terms of 3-clause BSD License
- * Released under the terms of GNU General Public License Version 2.0
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-- 
2.56.1.708.g77570a6a1d-goog

