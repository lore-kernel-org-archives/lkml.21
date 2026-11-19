Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091987;
	b=ZaFo+hYDlh/ryeePLlL24vHqSQjn/NPc35XRGRaQ4H5LnrZm0r7I1wTbXgnNLja52a9T
	 X2xqrhDCGQ/ki/q+b1eSYmXpQJJUnzA87TIU+KT5v8kVdQVwk4SC8u76Lo6B1b6eN2uBs
	 hEWlJmDMBU77aGR9YZ7fJxqMLjt9btfB7jbplW1c2reH9FiffuK+3N32m2aJWbLJ+rlUl
	 UkCbc8nHJTqS7iu/CfRL5JsKOpGS9hC0cCcQhIJzEMGtEtwkWwwRCNL6yDCCbF+hsqvcc
	 XPELFsCiAMScg+BminX+W4NVyaJ6KJENFVcF/Rq1SQ5caRaynZ4yCS58ez6FonC2Fag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZOzDteHpiC1ToAU60pHoyywRyeM7vqQ7i9clemCjSH4=;
	b=NRrcqOugineEr+qKfOfZH0p9F0YKHrk0zOHAu7boxID7WH1rw3f42BmhpgzfZ5A9DQM5
	 eolUpJPLwrSrg3rTSTAbJqx5+VzHJn709xotowCGzqCSxIhSEAU882CIirZ5itgwFJOL/
	 fTwQGETIPC3we77WQk1dAr1A0995cUdKwnPR2Y0xqRP9Az4vsLvFWUFgUQQh25gm/oWDd
	 jqr6314oEpPRdWCKtGgDqrTrTj09CrTdslp5Zh/469xxV8uCQj+Fn4g9QEUKKbIjjDFt+
	 +KawNOd8Q5jsop5vlRxFHGAFynbYYfEY0JdjV9kDjyBeQpfS5FDFjpHO8mcvaLQPIlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=DoJP1ATd;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046E460A263B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 046E460A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=DoJP1ATd
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b3af93b85cso1212177a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795091985; x=1795696785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOzDteHpiC1ToAU60pHoyywRyeM7vqQ7i9clemCjSH4=;
        b=DoJP1ATd9HgJUaytDz+ImWfFPvBFbRyKyiIou3d/F7MZ9HlOKXFXPsUDVpIP+mwUvn
         ALRcBFhoE2SCkgXUWFxD2SFys8fRHnkeb4+24DmqAZNe50YVNV+PV2bngylM/6j1vXvT
         7Q7vbpv46z2Zf+ZABQswVrfIaP4gk7zl/ulWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091985; x=1795696785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOzDteHpiC1ToAU60pHoyywRyeM7vqQ7i9clemCjSH4=;
        b=zvEBRWDIwqlsitJL8cgm1jvDPuJDm9YENgmLm0HM+COHoS+IRtNRzEbwLTgPbcwQsW
         Gt41sz4mDlE0q7x2a86OA8pkX8QT/2uzG/nwMfhp5f4izfX39u1tbg63KrJVrh4OCYTq
         p5xuVy6+5v6EPCEiilz7xROQdhD+H6JpiXx+Kb+WZeMxsMJLtcy31FA/6UQBcLKHemwL
         wqVBV473UJiGORDCYY2DHWPiJPw4CKmtdLfC6YQ0PJwbFbJS5Mhdx3ZXYrBmcqbtISeJ
         44MsAEmDu6av3s0bBQANl1gSzgCvv0LrAfQv7TkZLwauEbFtDxsB4XdJjoZr3XG0xWCf
         qbtg==
X-Gm-Message-State: APuU4Z+8uu13E0hrJjbvJavOt754yWLFRKVAyo5N+ZWr2blXir5YHPFw
	x9iJ4mVj2yBxTskoUqKJK9rJwqc/oL4e9T/f7oPvOhltIlQ+tJPyEz2nD2qky2+qB9w=
X-Gm-Gg: AZFdTZfnhxYXuut/Nw4LVLeHdml97HZlFaWr/BxjkPMZNu1uICoQuXylPrzFoQUQL/5
	J1QC+25lQ6UlJNKmhpSTYWLu+vMkFRlaGLtqm33+DHvOHBibFwkhV5Yqk4L8uoInboFdnw+bB4T
	8YCNBNH5bzVRafnknbR7lrWJ911+dvtzWiw8JP9ACjm1kMQVzpXSgxBlXXVCfYhfJI0y0vMCJUx
	X6t7wOhzkY4ACOeGU/J0r3Bh0eLnWct8vB6y0aHNvOcC+fAw4X4P+Nh1gFIrf8OQSF1khLK07kc
	xu/ZoSBQj3Pz/3ARDE3V/ekuANeSG1maVMvC0pH2XJMM+lKtUcMGp0Wx7khKN+ac161gq3vGG0j
	9OTpHG9W+BygspFCUGiAUciXVGK+rzJDpRD0eaR3vty/HAsdgj3UEur0n1/v5HJNpYJJWW6b80C
	3S9jPTUNcwq7I2DuTh8eYBviEnI+OrSMFyuQlzoR/oU5gyySqVfRE6KromBUA06M7KbWg1Q3Yva
	Ah2jk+/ZjeZ8ZOurV7KgxA4ap4vY2HxXBpDSnA214B4ncO9vZJZoDeDKujFM1t4Qemxsz0xX2c+
	qU1l9UHeC2bEXcHoE2Bws1yy0tRjpYCSEiU5NyVCJ046W/uzJpr3yW5Hkhje7AbpHqJ4ny8=
X-Received: by 2002:a17:90b:1dcb:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3b3d064115fmr6130281a91.3.1795091985385;
        Thu, 19 Nov 2026 04:39:45 -0800 (PST)
Received: from shiro (p1799054-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.155.54])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm2696299a91.5.2026.11.19.04.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:39:44 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	gerg@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/4] m68k: Add and use defines for 68060 PCR register
Date: Thu, 19 Nov 2026 21:35:56 +0900
Message-ID: <20261119123558.2108296-3-daniel@0x0f.com>
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

Add some defines for the various bits in the 68060s
PCR register and then remove the magic numbers in the
places that use them.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/include/asm/m68060.h | 15 +++++++++++++++
 arch/m68k/kernel/head.S        |  3 ++-
 arch/m68k/kernel/setup_mm.c    |  6 ++++--
 3 files changed, 21 insertions(+), 3 deletions(-)
 create mode 100644 arch/m68k/include/asm/m68060.h

diff --git a/arch/m68k/include/asm/m68060.h b/arch/m68k/include/asm/m68060.h
new file mode 100644
index 000000000000..a69ccde11693
--- /dev/null
+++ b/arch/m68k/include/asm/m68060.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_M68K_M68060_H
+#define _ASM_M68K_M68060_H
+
+/* From MC68060 User's Manual (section 3.2.2.5) */
+#define M68060_PCR_ID		0xffff0000
+#define M68060_PCR_ID_68060	0x0430
+#define M68060_PCR_ID_68LC060	0x0431		/* LC or EC */
+#define M68060_PCR_REVISION	0x0000ff00
+#define M68060_PCR_EDEBUG	0x00000080	/* internal state on idle bus cycles */
+#define M68060_PCR_I14		0x00000020	/* Reserved: errata I14 workaround */
+#define M68060_PCR_DFP		0x00000002	/* disable the FPU */
+#define M68060_PCR_ESS		0x00000001	/* enable superscalar dispatch */
+
+#endif /* _ASM_M68K_M68060_H */
diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
index 502eeae49eaf..7d90069e9af1 100644
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -264,6 +264,7 @@
 #include <asm/entry.h>
 #include <asm/page.h>
 #include <asm/asm-offsets.h>
+#include <asm/m68060.h>
 #ifdef CONFIG_MAC
 #  include <asm/machw.h>
 #endif
@@ -1484,7 +1485,7 @@ L(cache68060):
 	/* MMU stuff works in copyback mode now, so enable the cache */
 	movec	%d0,%cacr
 	/* enable superscalar dispatch in PCR */
-	moveq	#1,%d0
+	moveq	#M68060_PCR_ESS,%d0
 	.chip	68060
 	movec	%d0,%pcr
 
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 51b5881078cd..7abff6266837 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -9,6 +9,7 @@
  * This file handles the architecture-dependent parts of system setup
  */
 
+#include <linux/bitfield.h>
 #include <linux/kernel.h>
 #include <linux/cpu.h>
 #include <linux/mm.h>
@@ -35,6 +36,7 @@
 #include <asm/fpu.h>
 #include <asm/irq.h>
 #include <asm/io.h>
+#include <asm/m68060.h>
 #include <asm/machdep.h>
 #ifdef CONFIG_AMIGA
 #include <asm/amigahw.h>
@@ -232,10 +234,10 @@ void __init setup_arch(char **cmdline_p)
 
 		asm (".chip 68060; movec %%pcr,%0; .chip 68k"
 		     : "=d" (pcr));
-		if (((pcr >> 8) & 0xff) <= 5) {
+		if (FIELD_GET(M68060_PCR_REVISION, pcr) <= 5) {
 			pr_warn("Enabling workaround for errata I14\n");
 			asm (".chip 68060; movec %0,%%pcr; .chip 68k"
-			     : : "d" (pcr | 0x20));
+			     : : "d" (pcr | M68060_PCR_I14));
 		}
 	}
 
-- 
2.55.0

