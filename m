Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334989;
	b=2lf0qawanXOnEGAem95tzWvbz2Xxadlk/izJMv5+Jaq3XmAwBONx9NhsClCUlgqx6swR
	 pSmBwg0uBfWkeFXhCIw8WBVkoVb/rqPCsZr27s7Yf/d/JdSKh9qPK+TguNT5ciJZqwdDJ
	 7X3RA6JxNBePHl0KN4rp7J2SULOBrdBGwyKBzILD1pwXx2hr3QQMoJN04Q/0zN3Loq++A
	 Jj/CNbFMhCsFxtIBARBkQuE0jyfhXZbhFvTHmxy5ibZcG+rEtL4UJQ6A2bQXmYJe//VYf
	 wKAov80Pv2rnQE38PEeuDapI+wHqPQamEWEVws+8a5hvFFvyUlUCESgfsePdQEhoFCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7sQ15HfMbTEZX/7ho4424kJ1+Lm1T94EL19j/wJnx9Q=;
	b=pK+8qIWtaL7z01xpC4+TSl3/TI5bwilVOyWFRV3iVF7km/hiBB3NVz9PP7EvZrI5/Izs
	 tRKdtxDMm+aJ+HOfttJgQGWqVDOgkzcPPa5afLw6lCZ5mrs0qEu0IXRxu09E/unGXnUOS
	 sAu+lrHCijFaPrG1Cy/x9lwy7QHjgpXAtJ3+VyzVubSbacuIolgbtnTBr7eG2mVZyhWCs
	 1qr5nbOXIQxXWCfL5cDLdABzET/7Zr895wKvqVyi7g/WzjYgLX/lgAtDwaMdsMO8660kT
	 b9Yr9HLOPLvSR26Zw6YW96Gr4HWfqCAE6c8Lpbyx7lbpfoseihA0ug9bjjn6uxaq8zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qNmRuw+H;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066ED606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 066ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qNmRuw+H
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f07a960666so4060355ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334988; x=1795939788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7sQ15HfMbTEZX/7ho4424kJ1+Lm1T94EL19j/wJnx9Q=;
        b=qNmRuw+HuPilsrEaCz2kvC0415fix0TFkIfAFjcj81lls/1P9Hvy0dE0vg7qT/BI1l
         bJJzKDtnCo3cVkSP5kohGLEPeuMmFBRMCi7fJCgoBqXOF090KNUWr4CkBqxVsccErCZE
         QEiMKdf1mj6IoJ4QaB2yzw6EKIuD86R7OulDZv/yAnDd09Kg/YHXSWfW+ziESvxREE8q
         z+QAgHPZZgYN5HGiZQqxtZNa96LngR7wd9gKJvcq89DMpS6aLYsjOMxc3P1PxY0dol7r
         9+vNt86XtLCdOh0WqKW7VPt8tDBlA2zREIKTtLwCi82QXMasXbGv0q3SzWQE/zZYXxbH
         MZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334988; x=1795939788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7sQ15HfMbTEZX/7ho4424kJ1+Lm1T94EL19j/wJnx9Q=;
        b=mN+RQE3ogVCivzeDvkpzb8GClxEE7hGyRM8acmXA9V2GUAH++hvthBVUeIc05C7lJx
         xfB6hz9cXf1DdLXxHCN0+BEcMtKvzhp1ZGlMLjBylP9CphEa4Svgk/hQcfB3fhXuiln4
         +B8XfKxM67SCgxqf10cnj4xYmr6s2n/ROKCwyhNLvO5YvLHHY/0K7AHQ01U8x/L+Lr9Y
         2K1sblYKklpV75mvRraVwHmVP0OOxMNBZTY21kLKCiaskOW+p3IZDsgbFQi5EqZlMm1y
         MHQGd/YmjdqAsLedPHDho1LPC0L2VijifFAPyHWvUgodJr5bD8YsuJKfyoUJygHe/j/S
         RRCA==
X-Forwarded-Encrypted: i=1; AL+hErEN/B23tQ3tZ2EyaQMFRefnTzXgDnM221s6cg9R9AZWtHAmUXJf6tk25HCsxdzDT4SYqX2D4SurVF5SECg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FQijGqhb2khEyShpQ/5kI0YUIJNpU2YRMA4xUzR4q1HBRFNN3
	e22EgW7CiGZBlLsu8XLMfOrBcEI8ufbc/fOWu0dNS9WJYy0Q6J/i/V6b
X-Gm-Gg: AZFdTZcwtP9TA1nIHRUelLXrtnZGEedXTNAaUOgZ2VgXGn5J98wgwAsMJEqFytrdSqT
	i7+P3z5IuJQi1TZ/ZRFP0HzrusYWKprVteMseJiPQPPk3icrJ6zW7QazxxRcmpvi8u3FKZqejgy
	4fhkUPn8VwdAPRyhUJAntWgO2vshRSYOQS5yJb0zKM/vm9DkKj4lm6mcINdvr+wxt/1VK/Il/rS
	5aw6Uk10/ZaVZO/NBW8Fe8NKg8Xl3SL7LaFYf6/WQW0/b8u21RR6a+el//zwdDXOx+V/wQVU0Jq
	dmksgEDj84Rqs7Ya3LIIFTJYfp/YBVOHz8IAKOc/kOOt7lhYg8P/GGJnJM1+OBg2pb3XVsul/7S
	ddew/P4XyRBwT+OPCMk5YfTPIkfD5/B2/jysg+WemLxr6h9qDeQcKwhGM1nSnSYuZ/Gtg9Oz4rI
	mVo6o56JHWlBPh3SOxPYmUS2ArvCp2Hm48LCwuG+NqZowLW1am57Qt4+WtocGAnArQ/5r5qqGE2
	hDl921Kna8TpxPUZOBY3pkEg9RQUOOuX+GH7hv/Uy+PrUr8xCo6/IBm4esThmz4Vxpud8KZbgCO
	VZ6JB6jrZV+4/vfDHM/o9YUbttSbei3hhdnmMdzmF5kLjzBgkA==
X-Received: by 2002:a17:902:ce0b:b0:2ed:acb:aa96 with SMTP id d9443c01a7336-2f03f11c934mr89527635ad.24.1795334988319;
        Sun, 22 Nov 2026 00:09:48 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f191464sm35915865ad.1.2026.11.22.00.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:09:48 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: ulli.kroll@googlemail.com
Cc: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] ARM: clean up trailing whitespace in cache-fa.S
Date: Sun, 22 Nov 2026 02:09:46 -0600
Message-ID: <20261122080946.167126-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/mm/cache-fa.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
index e1641799569b..236ea21fd128 100644
--- a/arch/arm/mm/cache-fa.S
+++ b/arch/arm/mm/cache-fa.S
@@ -8,7 +8,7 @@
  * Based on cache-v4wb.S:
  *  Copyright (C) 1997-2002 Russell king
  *
- *  Processors: FA520 FA526 FA626	
+ *  Processors: FA520 FA526 FA626
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
@@ -29,8 +29,8 @@
 #ifdef CONFIG_ARCH_GEMINI
 #define CACHE_DSIZE	8192
 #else
-#define CACHE_DSIZE	16384 
-#endif 
+#define CACHE_DSIZE	16384
+#endif
 
 /* FIXME: put optimal value here. Current one is just estimation */
 #define CACHE_DLIMIT	(CACHE_DSIZE * 2)
@@ -202,7 +202,7 @@ fa_dma_clean_range:
 	add	r0, r0, #CACHE_DLINESIZE
 	cmp	r0, r1
 	blo	1b
-	mov	r0, #0	
+	mov	r0, #0
 	mcr	p15, 0, r0, c7, c10, 4		@ drain write buffer
 	ret	lr
 
@@ -217,7 +217,7 @@ SYM_TYPED_FUNC_START(fa_dma_flush_range)
 	add	r0, r0, #CACHE_DLINESIZE
 	cmp	r0, r1
 	blo	1b
-	mov	r0, #0	
+	mov	r0, #0
 	mcr	p15, 0, r0, c7, c10, 4		@ drain write buffer
 	ret	lr
 SYM_FUNC_END(fa_dma_flush_range)
-- 
2.56.1

