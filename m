Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792331;
	b=a7tudhmz9xdK27+Kri+qq8x0yRp/nHkbXS90LXLOIM8WVG3cj14IrSsv5kNIO/rmpvd0
	 Eo8zZqSsSX+alcPKRXUGRCgMxFQldVS5mQu9v7D08otkSOciZitaSWhp7mC1Cc6xb6DHu
	 nsn9/LO+QADT6a7KJj1hbH1PWMtNUtwwxEnA6GX7LaKcWU5ch6h1/vK+mrmgHR447kI5i
	 1bWYV0wwqzfC64ABXktwaYl+ys9WEgqc9XF1GdvRXcB2hvrz3aOMmkcVaWSAsHL3B0N6r
	 hhxS92y8HsqCT8WcQiRcShR7U2lJuY/wuQcgJh+hu3t2U/QuTHqv603aBwcxZ0To+ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792331;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EW6O7IX+lZj9zLE/PiayELXWaVWN1Nbov8vCucdwVl4=;
	b=5BZM1U0bt9QsFj4lpT43SqZBiv7T2u4S9fu2tI1JBfRvS9jqbey/YucBRpxsQtGeGA6E
	 x5a6BDRpQP/F9Du1CH3U8mMgb4mjEYouczOXsZSWEzro3zDYNFa0h7ygc1uSr4uAOKejb
	 NW0TPix14UzZaR/ghedbuVOBn42BiI8jM7762EsyaJR+4FHaYTGhUH24Pu8j91v1z0ilm
	 liVzxoq700+2qvVbW61qK11ycMV2NQOezdSyCXnbVahfDltusOlFmm79D4eNOFUaF4gpE
	 hYsrwk1vZ870hAbtFsyxX9vfbLnLO+jASgWBehCy+8kk4WkidVbQi9Bah6fHpu/hncQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A7gq8Wxq;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33714606A329
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33714606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A7gq8Wxq
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DAD81758;
	Fri, 27 Nov 2026 07:12:06 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FAEA3F632;
	Fri, 27 Nov 2026 07:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792329; bh=CqJyYJhYvd31ezVbNyoKavdQzrZfJ6U+MBqZ2Ikozgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A7gq8WxqiRTqGer77NYMKxxKmoGbcn8544O0XLdXB/VqIc7TDuRTsbEJITz5jlm2k
	 +0uiif8pbKmzVp9aQ5pg2uaif/CGy84d7zaQUSsZKvloa3UbLZPxnAIdLci3c5HuKd
	 GfQ0ZKOp16414Hw7fN4gmWo55Y+lMZWLEbHw9QLQ=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: cputype: Add Cortex-A320 definitions
Date: Fri, 27 Nov 2026 15:11:54 +0000
Message-ID: <20261127151157.406111-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127151157.406111-1-ryan.roberts@arm.com>
References: <20261127151157.406111-1-ryan.roberts@arm.com>
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

Add the Cortex-A320 part number and MIDR definition. The MIDR_EL1
description in the Cortex-A320 Technical Reference Manual specifies
implementer 0x41 and part number 0xd8f.

These definitions will be used to identify Cortex-A320 in the BBML3
allow list.

Link: https://support.arm.com/documentation/109551/0002?lang=en&rev=0002-04
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 6002d1d5f55f..abff1ba1c305 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -103,6 +103,7 @@
 #define ARM_CPU_PART_C1_NANO		0xD8A
 #define ARM_CPU_PART_C1_PRO		0xD8B
 #define ARM_CPU_PART_C1_PREMIUM		0xD90
+#define ARM_CPU_PART_CORTEX_A320	0xD8F
 
 #define APM_CPU_PART_XGENE		0x000
 #define APM_CPU_VAR_POTENZA		0x00
@@ -200,6 +201,7 @@
 #define MIDR_C1_NANO MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_NANO)
 #define MIDR_C1_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PRO)
 #define MIDR_C1_PREMIUM MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PREMIUM)
+#define MIDR_CORTEX_A320 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A320)
 #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
 #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
 #define MIDR_THUNDERX_83XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_83XX)
-- 
2.43.0

