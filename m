Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621280;
	b=aE1SuiorP3UBiBhEpzw/H4hzzuQKB8g26wstabqT2o1SjHG1t/+JSD7fw6M/tCAdFpB5
	 d/06bs5w4FNoJRtnDn7IjQ88NcMMoy2jeBUPvhX3NxmMHJV3X5QpNthQ50VT6DRbj1MtH
	 Mm9/j+0YJ8Da1fKTB1/n2/ZHuY9c6zBS+bd/jgzyAV1p4itgJOW6HyYqhZlK962PxcXcy
	 MMvU08GGPBWHGkZ8wZ2ooylo3SsrPCURDCCpVwcPjNl8LdHY41hnHKF+x1kg9MWriJCJ8
	 cvXm2O7opjcOy5u4qvEepumW2DKDcNSb/Tz6gwWtYwJ4bAXsMBmhFjz/mZ3fbA/LcRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621280;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GUOCNiu7cFer54u4izVvBECwy8EsL27hiy9L0uTDTa8=;
	b=WQtXMSYh3qyVQ7QDDZxggyDQOYJvLBZDIXKfTpcFj3cdFvj0jj09k1u2h1lLPO7zjocj
	 N6D/2kYO2ZRvV81v/iZSPtZXg2zb1nGoGzOI90Oy6ojj4g23D2AFE9tFTdH6aziHjuRJ+
	 o1j71OhRSzVhe9o7RnKhP5jtSw/oBZ2/FjcowmfAVAt7iFMUfIq9jV/UR7+hrlcSx4IJG
	 wleMfZ/9HDIR8m6LPG1+Z5ZDm/eN69hXZan8zTMghnkuZ0b8zA5YotMweF9cNyIK/otow
	 VruYfToKGqrP4VQ+oVPnHMbSSZhcmY/AICIvmc4a4gyJYyXmzUfIiEpmxcgja9zn1lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wBn2T8vC;
	arc=none smtp.remote-ip=91.218.175.220
Received: from mta0.migadu.com (out-220.mta0.migadu.com [91.218.175.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F34860A2610
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F34860A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wBn2T8vC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WX5/WDt3Ch560GkYrbupqthKzPK+92bD6UTcsA1auYw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621278; v=1; x=1796226078;
 b=wBn2T8vCn7idCne3+4wyIid6/RU+zbRpwGwDEy1df6X3t8KSyqU27AYgoQ+8+jWreSvevA9J
 thpHHoBIi78XLJ1EUh6e/q+GUPRhqfZf1KXY2v4CZZfnbUlwKwS0FYe7M9Ei6dmu9XvGMXGM1sa
 eIzD5XEfkyQcgB83osrjw7eQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 496adf252b9d071e;
	Wed, 25 Nov 2026 15:41:18 +0000
X-Mizu-Trace-ID: 496adf252b9d071e
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 20/20] KVM: arm64: Advertise ECV, HAFT and ETS3 to protected VMs
Date: Wed, 25 Nov 2026 15:39:11 +0000
Message-ID: <20261125153911.106793-21-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125153911.106793-1-fuad.tabba@linux.dev>
References: <20261125153911.106793-1-fuad.tabba@linux.dev>
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

Advertise FEAT_ECV, FEAT_HAFT and FEAT_ETS3 to protected VMs, with ECV
capped at IMP and HAFDBS at HAFT, since CNTPOFF and HDBSS only add EL2
and EL3 controls. ECV's self-synchronised counter views trap under the
same controls as CNTPCT_EL0 and CNTVCT_EL0, which kvm_handle_cntxct()
emulates.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 4b95128663aa8..770ba0bb0a400 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -172,16 +172,17 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr0[] = {
 	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN4, IMP),
 	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN16, IMP),
 	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN64, IMP),
+	MAX_FEAT(ID_AA64MMFR0_EL1, ECV, IMP),
 	FEAT_END
 };
 
 static const struct pvm_ftr_bits pvmid_aa64mmfr1[] = {
-	MAX_FEAT(ID_AA64MMFR1_EL1, HAFDBS, DBM),
+	MAX_FEAT(ID_AA64MMFR1_EL1, HAFDBS, HAFT),
 	MAX_FEAT_ENUM(ID_AA64MMFR1_EL1, VMIDBits, 16),
 	MAX_FEAT(ID_AA64MMFR1_EL1, HPDS, HPDS2),
 	MAX_FEAT(ID_AA64MMFR1_EL1, PAN, PAN3),
 	MAX_FEAT(ID_AA64MMFR1_EL1, SpecSEI, IMP),
-	MAX_FEAT(ID_AA64MMFR1_EL1, ETS, IMP),
+	MAX_FEAT(ID_AA64MMFR1_EL1, ETS, ETS3),
 	MAX_FEAT(ID_AA64MMFR1_EL1, AFP, IMP),
 	MAX_FEAT(ID_AA64MMFR1_EL1, TIDCP1, IMP),
 	MAX_FEAT(ID_AA64MMFR1_EL1, CMOW, IMP),
-- 
2.47.3

