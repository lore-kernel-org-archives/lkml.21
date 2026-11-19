Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091988;
	b=4Hd40WfH0Yk3D9dZzNA4HvXH52SW2n+dT2oLT1jI1UKZ+/0VhuQylpcOKite2NvCnFc0
	 kGD3MO0ppSkAGxTdzBs2SdQrYc1ezMOLx9Gvyz2jOc5SbELd7gsE8izAl0s+Piqf5+KuP
	 cJmkl4er+Q7Y08AWOdvAhqOFuhT2rg2IYZVIXPb3q5m4eydEZ4leKDyUSQDyUvTmVDo21
	 5MTHF5Vfi2ISLc7RoCte2mYkD4/mcn9R4Tq/xDKuzXDyF0s8JofzRMpV6Tk62okCS/gYH
	 lJE2OyeYE4kUrpxmEP+AXjLq6vuh1r+rFNsyNJ/7DHJDaxGpjnfJ72doiH2X3Lcfxvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZXV/NDYa2Pdkzz6z2M2q6Z+cuiaS+tSo+VUJSEvKuDA=;
	b=Fh0bJ8z4UOhxbdCudCwyU7ZdWimPHKfV2kX0y8jrQSkuyIavaDpAqSvP5o10Om4IxTkj
	 3iynAzjZKFhWuDOrDr022WCxjiGuP0QpsJKlsx9j6cvLy54SJRX2vaaRYmKLv05GjS7VB
	 LtiBfyxPyvXvOv1tnNPDHTbbR6O5ZmiI4LndhGdtUG4P/fAgkfQGA+u+Shd9J4W4Eq9qO
	 o2PGMMZRauKdNK1zSWDJNPu7ZlUP+FJWo8hZ1GyA8/El+l2nQOebQ0Pofd+5rt5j42ySn
	 nNJf6SQk4S78CdNIKk0cn8M2BJ+8eD9nMhFJmoIxbx6skL3huWWVsndWlgscNYL+RRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=rr1NXsnW;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B707460A3809
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B707460A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=rr1NXsnW
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso1161961a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795091987; x=1795696787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXV/NDYa2Pdkzz6z2M2q6Z+cuiaS+tSo+VUJSEvKuDA=;
        b=rr1NXsnWEbGqdZwi9g0bxM3wfH/EdhMxAkM1Vta4B/xmO4q2V/b5uDt2+M5nBBadFc
         0irANa1YbOJqCwiKdrihQ35JBrOBfuflFv57FAwzZpD8wH8dDZSKd1HbVKhbLOwuyLUK
         ee7ya1UiXXGotWNyteugMxP7eroTkdm1jGZhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091987; x=1795696787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXV/NDYa2Pdkzz6z2M2q6Z+cuiaS+tSo+VUJSEvKuDA=;
        b=Ir7gDQ9SavaqVawqPSJQAr8L/A/rYTAwsxXqhxk9NrjQkU15sC0PbjtuCpT07TI8fY
         PP93dQMRp8oStiOaY4+qQpiQ4CYw3wNVIY7Pevjz2u4H4S9dJqgLz8zX0HJnYVr5eVpd
         SeBrzt0+jgpSi+Ljdu/zlDkDIJUguq99uRY+eY8cWCO7xQliANpj+OwyWGR/+gEkl3OG
         NZKptWWxPOJlJUbLLP8w04ax2lcCz/D3xm13q+pJRD6mZx/hDwDGmxy3pjnbZJ4wdwWh
         tCcsufUpdao8k6bjtDy6EPu14SiLPcZLEQMkqlciy3aHo4fj2LdoXE8dfyHlmZEy0JkG
         kW+Q==
X-Gm-Message-State: APuU4Z8JMJ1NP0fb4wSisRwFZcx+5JVAS1TPKQVXFfNZrxmEv06JwTW9
	kQvua7FJM9DPBbhHOgaU56syDA+C5jCPCCLmsg/I91SnFM0siwvb0ulqSMp3E9fMXDo=
X-Gm-Gg: AZFdTZef14KHHm7aw9Ac6ZdzhC0pFqKmFYo3f8YYp8y0JmhFgIB72sGpWmgiq2peDbK
	hV0bTwZ71R71QU2W4LtLsm2hphaF783hw/MVoDDb967sd8crKRCn+yDe6rTs3M2TQD7pRPnwGBk
	kobgqmV8F7evYDvl8dAOgrl4Ss18eMGK1F/yhTPsq+U068kEAVYIFSMdyHD58TzskrtN7vHADCG
	yp30J2RhVZ++CXC6pzUIaVsuOEI1O0qCWHblTsfhQ/XRVfDUkDuwuRSQgPQ8ktz2I8IcBMsoK9C
	gbES4W6SF1VNapl3/GRZMBc8IcSAFrDW3TIz9z7knCC9UFWkbRK17I4SqJAWgTEbBuWTIzVN+8O
	cbgjBCsRmHfcBPsIcOxaAJBFiGAQJ9fILhWyHRm1vqRzjQCL+PV3F6A2uM1qhVDNnKwTPfRwb1l
	qRzHoE8zpwtFIuYHsxEGzj/8rdhyBUXGmEjvLJYmEwkjv6STamnqdtTAz6fe//mOKU9UiQoqafe
	fJcYposGIgUpHyAiXBYl/T/gZk+WSEleUUq7r8wk4pC5ga4Iwqy95ut9aWMYMKm7ZHEhl8+i+de
	3VbQkaig9BRCk4AyU8A0+zwQn6JVWaM/x+7VTrphupPeDt8/2gsBQFj3p/b3GWFwQts5gA==
X-Received: by 2002:a17:90b:2151:b0:3b4:a63:d55c with SMTP id 98e67ed59e1d1-3b40a63d999mr666356a91.30.1795091987154;
        Thu, 19 Nov 2026 04:39:47 -0800 (PST)
Received: from shiro (p1799054-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.155.54])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm2696299a91.5.2026.11.19.04.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:39:46 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	gerg@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 3/4] m68k: Add helpers to read and write the 68060's PCR
Date: Thu, 19 Nov 2026 21:35:57 +0900
Message-ID: <20261119123558.2108296-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119123558.2108296-1-daniel@0x0f.com>
References: <20261119123558.2108296-1-daniel@0x0f.com>
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

We access the PCR in a few places and the next commit will
add another so refactor the PCR accesses into a little helper.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/atari/config.c       |  7 ++-----
 arch/m68k/include/asm/m68060.h | 19 +++++++++++++++++++
 arch/m68k/kernel/setup_mm.c    |  7 ++-----
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index bdafc86241b7..a63117891410 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -47,6 +47,7 @@
 #include <asm/hwtest.h>
 #include <asm/io.h>
 #include <asm/config.h>
+#include <asm/m68060.h>
 
 #include "atari.h"
 
@@ -512,11 +513,7 @@ static void atari_reset(void)
 		unsigned long jmp_addr040 = virt_to_phys(&&jmp_addr_label040);
 		if (CPU_IS_060) {
 			/* 68060: clear PCR to turn off superscalar operation */
-			asm volatile ("\n"
-				"	.chip 68060\n"
-				"	movec %0,%%pcr\n"
-				"	.chip 68k"
-				: : "d" (0));
+			m68060_set_pcr(0);
 		}
 
 		asm volatile ("\n"
diff --git a/arch/m68k/include/asm/m68060.h b/arch/m68k/include/asm/m68060.h
index a69ccde11693..3d9d0f1a741f 100644
--- a/arch/m68k/include/asm/m68060.h
+++ b/arch/m68k/include/asm/m68060.h
@@ -12,4 +12,23 @@
 #define M68060_PCR_DFP		0x00000002	/* disable the FPU */
 #define M68060_PCR_ESS		0x00000001	/* enable superscalar dispatch */
 
+#ifndef __ASSEMBLY__
+
+#include <linux/types.h>
+
+static inline u32 m68060_get_pcr(void)
+{
+	u32 pcr;
+
+	asm volatile (".chip 68060; movec %%pcr,%0; .chip 68k" : "=d" (pcr));
+	return pcr;
+}
+
+static inline void m68060_set_pcr(u32 pcr)
+{
+	asm volatile (".chip 68060; movec %0,%%pcr; .chip 68k" : : "d" (pcr));
+}
+
+#endif /* __ASSEMBLY__ */
+
 #endif /* _ASM_M68K_M68060_H */
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 7abff6266837..41b595256ad1 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -230,14 +230,11 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 	if (CPU_IS_060) {
-		u32 pcr;
+		u32 pcr = m68060_get_pcr();
 
-		asm (".chip 68060; movec %%pcr,%0; .chip 68k"
-		     : "=d" (pcr));
 		if (FIELD_GET(M68060_PCR_REVISION, pcr) <= 5) {
 			pr_warn("Enabling workaround for errata I14\n");
-			asm (".chip 68060; movec %0,%%pcr; .chip 68k"
-			     : : "d" (pcr | M68060_PCR_I14));
+			m68060_set_pcr(pcr | M68060_PCR_I14);
 		}
 	}
 
-- 
2.55.0

