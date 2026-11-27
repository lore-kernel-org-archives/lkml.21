Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768867;
	b=V0V5Muc1PT/dePb30aBC2jNJytghs2prgSPPqsr5ZQeVRT2Adhtjx+AQKJ/q7rpvzYiq
	 G4I5krhfIDHPHiTNR4t2Tczrc/CDzHYmjr8Z2luD3DQuLpftlAQgI935+XgU9sZmkKhHs
	 /5Xvn4Cj5Y8I/4TKrgMCVAUjgUQ9ijaSxj5hXuOpuUVnn9n5HGi2saplXFhGrzbz7ed5L
	 4nUva7Npyumu7knaIzrb6vi7ojTP9db00AdNXcPYRxKX9K4Wh/7Pbaji8c4bhPNsNSFPH
	 eZANOmk95J0ZL/lMz8uY3OTZqmnzN+MJ192T061c6zjX0ekl8o2PqSKD3T6NgZ5j8Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768867;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FAZ1Ie2a5PV9PZg9qSZ/uFMXiu3UXlY8gqilin0ejXQ=;
	b=GMgezegVankUve30O675DaMB/tJKsUA87bUF/vXR2DCAkb0JKcKut2lrmznXjO+280Go
	 k+fA8EeyzINkzV7/wYpB11KIJ4iDiwiNTD/LzJQ+X/OzN9J1B3jIApPUhUYyFyorK5fHW
	 F4xHBzNVOxKZs/dpPk0iVwHJPpAQSHgfB6jR11iUas5Rh0kfe+p+fcrv/G7lAL2FiSxVt
	 uUPBcJEL2Rpjdj1lD3qNF1S5oT0uz5PA8W11N5MjeEzZ8R5GikHDOJ33y9lAcly0sXxAo
	 qNmcJoMpwII/oeDWydKOsxuEj/w+1bSR/Kaj8Yp/DMeaIZvV8PStPULQzmzjyeCgAjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mXdrElBP;
	arc=none smtp.remote-ip=95.215.58.116
Received: from mta1.migadu.com (out-116.mta1.migadu.com [95.215.58.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D17606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D17606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mXdrElBP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8nByk3lQkziV+ndmJCL42CLKc9ffPkb9kguxLpVEBMs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795768865; v=1; x=1796373665;
 b=mXdrElBP/pXgCaDw4GN5gO13UfMuk+7GBuvMNmF0y46Ar4BA8s63rWGib5C/pEgH/UBsk8ps
 KG6fMWyigm3Xpzor00o1hIju4/7Mc4+gItrJXIVEs+73i4DC4bf6IgWOsA4sksXFFGtLPSvx4II
 pkMiNfJtLnndZhSVxwk6UX/4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b3551a7f456a19a0;
	Fri, 27 Nov 2026 08:41:04 +0000
X-Mizu-Trace-ID: b3551a7f456a19a0
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	anshuman.khandual@arm.com,
	tabba@google.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: Use symbolic constants for the ccmp NZCV immediates
Date: Fri, 27 Nov 2026 08:41:01 +0000
Message-ID: <20261127084101.295792-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
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

The ccmp instructions in the EL2 setup code, reset_pmuserenr_el0 and
the hyp vectors give the flags to set when their condition fails as a
raw NZCV immediate, #4 or #8. Which condition that leaves true for the
branch that follows has to be worked out from the pseudocode each time.

Define CCMP_NZCV_EQ and CCMP_NZCV_LT from the PSR bits, named for the
condition each leaves true, and pass those instead.

No functional change intended.

Suggested-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/all/asIQ1ZwUjkmNJbRP@willie-the-truck/
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Changes in v2:
    - Moved the CCMP_NZCV_* definitions out of the ARM64_S390_COMMON block
      (Catalin).
    - Rebased onto v7.4-rc3.
    - Collected Reviewed-by tags from Anshuman and Catalin.
    
    v1: https://lore.kernel.org/all/20261009072147.474952-1-fuad.tabba@linux.dev/
    
    Based on v7.4-rc3.

 arch/arm64/include/asm/assembler.h | 2 +-
 arch/arm64/include/asm/el2_setup.h | 4 ++--
 arch/arm64/include/asm/ptrace.h    | 4 ++++
 arch/arm64/kvm/hyp/hyp-entry.S     | 2 +-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 020670814bda6..64a54f27c1b06 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -474,7 +474,7 @@ alternative_else_nop_endif
 	mrs	\tmpreg, id_aa64dfr0_el1
 	ubfx	\tmpreg, \tmpreg, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
 	cmp	\tmpreg, #ID_AA64DFR0_EL1_PMUVer_NI
-	ccmp	\tmpreg, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #4, ne
+	ccmp	\tmpreg, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #CCMP_NZCV_EQ, ne
 	b.eq	9000f				// Skip if no PMU present or IMP_DEF
 	msr	pmuserenr_el0, xzr		// Disable PMU access from EL0
 9000:
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 12a5001812911..7a23189cf437c 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -137,7 +137,7 @@
 	mrs	x1, id_aa64dfr0_el1
 	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
 	cmp	x0, #ID_AA64DFR0_EL1_PMUVer_NI
-	ccmp	x0, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #4, ne
+	ccmp	x0, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #CCMP_NZCV_EQ, ne
 	b.eq	.Lskip_pmu_\@			// Skip if no PMU present or IMP_DEF
 	mrs	x0, pmcr_el0			// Disable debug access traps
 	ubfx	x0, x0, #11, #5			// to EL2 and allow access to
@@ -422,7 +422,7 @@
 	mrs	x1, id_aa64dfr0_el1
 	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
 	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
-	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #8, ne
+	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #CCMP_NZCV_LT, ne
 	b.lt	.Lskip_pmuv3p9_\@		// Skip if < PMUv3p9 or IMP_DEF
 
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICNTR_EL0
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index ad0ad30b36cda..346ad105d34c2 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -26,6 +26,10 @@
 
 #define GIC_PRIO_PSR_I_SET	GICV3_PRIO_PSR_I_SET
 
+/* CCMP NZCV immediates that make the named condition hold */
+#define CCMP_NZCV_EQ		(PSR_Z_BIT >> 28)
+#define CCMP_NZCV_LT		(PSR_N_BIT >> 28)
+
 #if ARM64_S390_COMMON == 1
 
 /* Additional SPSR bits not exposed in the UABI */
diff --git a/arch/arm64/kvm/hyp/hyp-entry.S b/arch/arm64/kvm/hyp/hyp-entry.S
index 03f97d71984c4..8621eacd13738 100644
--- a/arch/arm64/kvm/hyp/hyp-entry.S
+++ b/arch/arm64/kvm/hyp/hyp-entry.S
@@ -46,7 +46,7 @@ el1_sync:				// Guest trapped into EL2
 	mrs	x0, esr_el2
 	ubfx	x0, x0, #ESR_ELx_EC_SHIFT, #ESR_ELx_EC_WIDTH
 	cmp	x0, #ESR_ELx_EC_HVC64
-	ccmp	x0, #ESR_ELx_EC_HVC32, #4, ne
+	ccmp	x0, #ESR_ELx_EC_HVC32, #CCMP_NZCV_EQ, ne
 	b.ne	el1_trap
 
 	/*

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3

