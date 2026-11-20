Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151325;
	b=BO9sWPHHsOCkIb8gYeDFaxDwxx3MUQU/GDyTE5HC48wDZB9mpYqb8DfYX79yeml28lYH
	 MvIikdy3Wohbw4zlVr4IQCWLOABkfsEvINDUoUxHOtvnJyVttgXmH+1m+QiqA0t0zSMz+
	 asdHmALE+L65ZVwjXzKwN6DXT2PD5Y4Rpqsbo4xA+u1B+B36a5T4HZZWsyyw4QpgtH1rf
	 J84hKmu+jZNpSgRnB2hfRK550YaPWoI/sZzQqyKt9aGcYYiZcypx7XxM/wb7b/pzhQTzZ
	 h/t+ZKTg+3Z4GUuQ48vV7l8A/p0raoeoqoSld7uBEKUkTNVEDmQTgEQJIxKsw5XYojg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dJ3qLBYattYfDuWuotFyeF89FeAbvQLDg4xUYhMHPLk=;
	b=oTG+OdwDHiePYs+8pyk3FFq3WRgUpFtEXvXUTsIYODkf2OEtIJOcXL7CETQnRxLSy6XV
	 d5eN7KPYC8/4RSZmFqkhBbk8rg1pPfF2fKuvXrUgJPpaDt2YXjhgc5a966dxP3wSADdtD
	 yyC7e8Ce318XWVmrXExGEALSuQaLeHOneDG2Z6rBk9B13PEL866NQO9NMVjv2s/z+huuA
	 x53otgvhQiIbZ9rmMad/bJ1NbIEnYSN1Ibjxqo6K7Ni+nfeGDIk1UHOUAmHQGPgHKYdCW
	 gwBAHwYRehoyAkDEn4SAiSQeSyMITisIbX1E7dzvaMmZZ3+cBFvEXhxlicT7V7jUtRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySOdvT6L;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBB3606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADBB3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySOdvT6L
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so1233173eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795151324; x=1795756124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJ3qLBYattYfDuWuotFyeF89FeAbvQLDg4xUYhMHPLk=;
        b=ySOdvT6LJJsEWiqKG9X8EKRQElyfVvtGtzpk5tmXh3sKlmIeUom+b6c/lV9tW95ZHy
         nnQ/45q6Co/MS87UrDtMt8U904T1p8jA7FCo0rYtkgYsIu8g0d7TOesI0n4lKXgFjnkB
         9zMDmoNhyz3AQ0M/o9pplT87wTWHlcF3YNwD8nJRywAOqFzawGiL8LgsVw/y9cM6fZPQ
         ciK2TdNtd7w+RGSAyIFhOKUZhpc/PyYBokUSmRMUrOGFoBGPp7LsX3zRYSc7ogVpD2cJ
         dcbTT4P9n59wwDoYir9k1J4jAEDYoKsqAyV0C+J+5iCAfN0VIeQ+IRGk8/rZMV2YHB8F
         EbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151324; x=1795756124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJ3qLBYattYfDuWuotFyeF89FeAbvQLDg4xUYhMHPLk=;
        b=TFjNgBqczBGbvlrErE2cF9x2FCs/nZzdFI75QltBzFNdWdHzTf2w89awhGneZpRpl2
         wy0CICd3YFjLT/YSwcm+XiisqnFSwaRGw1gyGzdmB9sJLfgGqym0ad1nwOu371b2giNG
         qEEEdgx5xP/0o+u8l+zCo5HFVO59lYkUIrdr9IS/GSLFGoks4371cyGwhUdlsgn8RnsE
         jP92YVs4cjiui96ovsqOgOovEKatD3AOn3TO33VC2iL1Sit1IudgADCwxLfDaUxeAjfD
         /wu9AbsgLJ1UAEO7ZtD1q733gTP3wEFDP5mM/jEFDQN4OJk2MsvfcY9jf0zXVXX+kEvD
         sdQA==
X-Forwarded-Encrypted: i=1; AL+hErFw/8Jo5wh/rxSolW7n4Scl+RQrfPXCvUAgDeWdYK3EhAhqvy8/Ct2PBY7iHjjh8H4SJkrdh6uE7xYTjAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hX7UZbCmu/YN/Chsv6T6KH6QNGRssfPy8ViZ34mLhRok5Fn4w
	MnhKMUyTS+GOyQ9vtEJrF/5R2+zWKKQZx532Fere6mQIIo4SM+eO+rFjIiw6RA==
X-Gm-Gg: AZFdTZef5uJ5FvawBqNqTQn+p7arFQvyDyy6FlqrgY7P6G1mAnJmxrS7wfq/HnSQh1y
	E2ZNNkfeALZgfc4Ts7zznfV4rFxqxGbCTxJREF6f3Iw8kkP/2K2cUiFufolYjrTCplkcyUXcAU1
	hqiqrigEul82l9ZyTKreNB86hOIba2JBaDKBt4fvrrO5Vza8QKNIXXKSVSwyAFGDr3hhiRYRfkS
	evfNTA3yIQ0/kGVQBsgvjQM8VOLcePUPJGT+fD61KBthEvDpVWM25jUlmNqWHL+ktAdMwr3fyK5
	KSgxJCuTWLj/02nEBY23dSc48CsrVsdSYHQLStVpEuSnIPJoBv9f4FjpRE7IsgjGKp1HrzwrQqT
	542KaWS1ewJ8+N41SEKznDrXRj+q4Y8ZwOj+V3m5wO9hdhkwe8RiIBiKCXOeb/JlyQBYhTJHWNP
	xDY3jITQMS2gtG7i0asVp4M6AoegNO1fsRDnsAjPLdn+AbSP7zCz5511TEganWC1HIV7SPjum1t
	g7oLdCcXSWt3AIR7bl2/y/QniGZMrWC6O4O3WDFulkxCWLS1a04shiLulQTUIz+M56DiwWWUbl3
	qwpoj0pO
X-Received: by 2002:a05:7301:4209:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-3857054b988mr1696587eec.39.1795151323663;
        Thu, 19 Nov 2026 21:08:43 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm4652750eec.5.2026.11.19.21.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:08:42 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: Ingenic: Allow assembler reordering in the XBurst secondary entry
Date: Thu, 19 Nov 2026 21:08:26 -0800
Message-ID: <20261120050827.804767-1-f.fainelli@gmail.com>
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

Remove .set noreorder and the two explicit delay-slot nops from the
XBurst secondary CPU reset entry. GNU as emits identical reset-entry
instructions with reordering enabled in both the CI20 and generic
MIPS64r2 Ingenic SMP builds.

On CI20, two baseline and three updated cold boots brought both CPUs
online. Each boot passed the CPU affinity check and 100 cross-core
idle-wakeup round trips in each direction. Codex assisted with the
assembly comparison and hardware test campaign.

Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Thomas, feel free to fixup into "MIPS: Ingenic: Add XBurst SMP support"
if that is simpler. Thanks!

 arch/mips/ingenic/ingenic-smp-entry.S | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/ingenic/ingenic-smp-entry.S b/arch/mips/ingenic/ingenic-smp-entry.S
index 290e23c65707..d6aa4b4b1a17 100644
--- a/arch/mips/ingenic/ingenic-smp-entry.S
+++ b/arch/mips/ingenic/ingenic-smp-entry.S
@@ -16,7 +16,6 @@
 	/* The CP0 REIM register only stores the upper 16 address bits. */
 	.section .text.smp-entry, "ax"
 	.balign 0x10000
-	.set noreorder
 LEAF(xburst_secondary_cpu_entry)
 	mtc0	zero, CP0_CAUSE
 	li	t0, ST0_CU0
@@ -32,7 +31,6 @@ LEAF(xburst_secondary_cpu_entry)
 	cache	Index_Store_Tag_D, 0(t0)
 	addiu	t0, t0, CACHE_LINESIZE
 	bne	t0, t1, 1b
-	 nop
 
 	mfc0	t0, CP0_CONFIG
 	li	t1, ~CONF_CM_CMASK
@@ -50,5 +48,4 @@ LEAF(xburst_secondary_cpu_entry)
 
 	PTR_LA	t0, smp_bootstrap
 	jr	t0
-	 nop
 END(xburst_secondary_cpu_entry)
-- 
2.53.0

