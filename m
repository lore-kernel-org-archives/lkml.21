Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068004;
	b=s1Sj4JWCmn7eenLJXapvfPi3vdWXhK9FJEvoDjznAdbsabH3hT0dKbkNerjn5/SZQijv
	 yBIaRjUt0kAi0QH1EEoWG9y19zU3GhFbg72rMH/XOtLiEbaJSUbpoEa4V3v+Ql40CnWOL
	 1WfvVA/xLvmt0tFSX44WYXZDkg38M5X+BFtHc4JvupHHogSq+doJWNE0bBDnznnPDFob9
	 3vGBgzcIi7rz4OHvMyaUpAEt3CCMIUvRMXtp4tlz3yVEfuu2AwuMZFynQhvy6oqbXOPTn
	 Yyi4lsulXrFhk8w6xkxhvjtoZOiPNEIWEWWVvdYh0m/FJgRkpepoOIrz/4QWCir0anw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068004;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=CZb+ApQ62+vTZSHJN9i70rwloY1LJP4NE3C1eXAaHCQ=;
	b=RBjFd8GniwOZ401OrxhFPjMRA4X7kVFVKjwoca7aTmYiuy3gogh1ZnhM5BqVlffCrH1O
	 ORymhLuxFwtoiyMhBlZ9h9y1SB14rPmnIvkSJvgRFqmEuSTyvAE++5AslZ7w/fUp4qFu2
	 j6Jtyfo4qlrqlVo/GDrx29KOEl+kCnBuJzAarFI63mbxQctna+H3MzEM43s//8tnyvyC4
	 jwImnuMXGybuBOqF7ZTaHd+ppD55F9y4xoGjy0def0om+5DvPkpS7kWfIpMBDvs4GxsjO
	 Nj+I+5GD0E6hRwkhjKpZbD3tsduJlEOhGZu7I3Aw3uY7MFD+Gm6sp2rEU4ZRElY3n6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fIbbVPwV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D29606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fIbbVPwV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FCE1F000C4;
	Thu, 19 Nov 2026 06:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795068004;
	bh=CZb+ApQ62+vTZSHJN9i70rwloY1LJP4NE3C1eXAaHCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fIbbVPwV0QEhjE8X2vs2dupy5ICmQQOT+FMTaXY3bQbbNbPsylACUaJ5VPjxOS/Vi
	 L6vNooxc4uwG/FkYNBIbT+ieGTJOSXuQHLRzX9OCx3813D/xGkI5KCmyh3y3IgUCKr
	 1KwGbf+0vlZsZeb3wEZptKTw3ammDROXrepPwjXwMeYFWaDe5MFrkG98mu4Y/eH8l3
	 cj7u/t9a3fJ2g+j+HvtjWkCefnMKER8s5+pTEjVlsuTOnP5UkpxFWEb5nj1eDVSt7d
	 aMRj9LNkxYRlr5THz7I5W7/QHW1Zpc0Zq8iMDB7dMDyZO6umE4DKvowLI7Zv2w16fF
	 nBIg3wADBtvTg==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 2/4] ARC: math emul: use existing lib versions of libgcc routines
Date: Wed, 18 Nov 2026 21:59:56 -0800
Message-ID: <20261119055958.1621709-3-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119055958.1621709-1-vgupta@kernel.org>
References: <20261119055958.1621709-1-vgupta@kernel.org>
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

Use the existing lib/ emulation.

Divide/modulo need some mention: technically emulation is only needed
for hardware lacking the insns (ARCompact ISA or ARCv2 ISA based cores
configured w/o divider and/or those insns disabled in the
build (-mno-div-rem). But to be future-proof (thinking modules)
just add them unconditionally.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Kconfig           | 10 ++++++++++
 arch/arc/kernel/arcksyms.c | 23 -----------------------
 2 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 80e61175bf52..9bf747882f2a 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -25,6 +25,16 @@ config ARC
 	select GENERIC_ATOMIC64 if !ISA_ARCV2 || !(ARC_HAS_LL64 && ARC_HAS_LLSC)
 	# for now, we don't need GENERIC_IRQ_PROBE, CONFIG_GENERIC_IRQ_CHIP
 	select GENERIC_IRQ_SHOW
+	select GENERIC_LIB_ASHLDI3
+	select GENERIC_LIB_ASHRDI3
+	select GENERIC_LIB_LSHRDI3
+	select GENERIC_LIB_MULDI3
+	select GENERIC_LIB_CMPDI2
+	select GENERIC_LIB_UCMPDI2
+	select GENERIC_LIB_MODSI3
+	select GENERIC_LIB_UMODSI3
+	select GENERIC_LIB_DIVSI3
+	select GENERIC_LIB_UDIVSI3
 	select GENERIC_PCI_IOMAP
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
diff --git a/arch/arc/kernel/arcksyms.c b/arch/arc/kernel/arcksyms.c
index c22055e66cfe..bba133fdd1b6 100644
--- a/arch/arc/kernel/arcksyms.c
+++ b/arch/arc/kernel/arcksyms.c
@@ -7,29 +7,6 @@
 
 #include <linux/module.h>
 
-/* libgcc functions, not part of kernel sources */
-extern void __ashldi3(void);
-extern void __ashrdi3(void);
-extern void __divsi3(void);
-extern void __lshrdi3(void);
-extern void __modsi3(void);
-extern void __muldi3(void);
-extern void __ucmpdi2(void);
-extern void __udivsi3(void);
-extern void __umodsi3(void);
-extern void __cmpdi2(void);
-
-EXPORT_SYMBOL(__ashldi3);
-EXPORT_SYMBOL(__ashrdi3);
-EXPORT_SYMBOL(__divsi3);
-EXPORT_SYMBOL(__lshrdi3);
-EXPORT_SYMBOL(__modsi3);
-EXPORT_SYMBOL(__muldi3);
-EXPORT_SYMBOL(__ucmpdi2);
-EXPORT_SYMBOL(__udivsi3);
-EXPORT_SYMBOL(__umodsi3);
-EXPORT_SYMBOL(__cmpdi2);
-
 /* ARC optimised assembler routines */
 EXPORT_SYMBOL(memset);
 EXPORT_SYMBOL(memcpy);
-- 
2.53.0

