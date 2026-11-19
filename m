Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074836;
	b=ihch941L06t4OrbLORafdNFK9L7VNyqSGe3K3oGZWsKUrRmfySsfr18rBW519/RZzuXq
	 1O+V9OLXyxlWC3lmHybvJkmOaVFgrEwXqHkK4aEMPo+p4kq7bjFobD2g6JHbbfAjIIeHc
	 DHKciqIIT0Yajfd15Z9zwwiwsez+yoSZcTqBgyEr/quSAskEL6YXYC3manoMuNQhBPzFg
	 FGyOH3ZAONvCrHNMVbN9f/94kGj9FsmEEjh6o/ar3AYj5J6R5ws5WpA4C6oOsHxSE7Zve
	 Sc1Ka0XIbLtNqGiGhcn2F9vjs9ULohl7ke0lM5zvY09zecmo4M8PVATAWdtbfU8f8RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074836;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy;
	bh=QpmY5BXHdsltKZQzujCdGSGSHKAmLFdk06khfGSK9eM=;
	b=TJUv4HJENKlwGMKSJ8e9jjZ1GzdSfFw7ndMZ+PUxom70sS3ZXDYZU3Rg1gGXkz7Iq+CI
	 fkmA2pYzLNwezfr9H8+Q+tHW6RewJ7fH4S/mSW98c1U5GjSOkSkAvOObkVWzWwSqaevNv
	 n8SbZFBEueaG1n3gQ1kWKVqhhqFmjf64M4iSjJtfk6eVMACtVO7xZzD6dQ5Vj9s5ARrDs
	 GabEW0+6VsybfTfTi/v6yfTmPV4NbUJRlUiB3GBF+AFtEhbu83jGdjduKO2+hLqoAS3sW
	 BX4RYvZSJToreIUGocmsO/AuC9CSqgw/hllqrcgKuucpnZjt00V9/LguWc2bCagl2+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D663606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D663606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jVW1f3QcWzVcB5;
	Thu, 19 Nov 2026 15:53:42 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jVW1b3S21zg1cV;
	Thu, 19 Nov 2026 15:53:39 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 87D9F3195827;
	Thu, 19 Nov 2026 15:52:37 +0800 (CST)
Received: from SH-H119QV3.Hygon.cn (10.0.238.96) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 19 Nov
 2026 15:53:38 +0800
From: =?UTF-8?q?=E7=BD=97=E5=96=84=E7=AD=96?= <luoshance@hygon.cn>
To: Borislav Petkov <bp@alien8.de>, <x86@kernel.org>
CC: Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <luoshance@hygon.cn>
Subject: [PATCH] x86/CPU: Fix FPDSS on Hygon
Date: Thu, 19 Nov 2026 15:53:30 +0800
Message-ID: <20261119075330.961-1-luoshance@hygon.cn>
X-Mailer: git-send-email 2.41.0.windows.3
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
Content-Type: text/plain
X-ClientProxiedBy: cncheex06.Hygon.cn (172.23.18.116) To cncheex04.Hygon.cn
 (172.23.18.114)

From: Luoshance <luoshance@hygon.cn>

Hygon family 0x18 CPUs are affected by the same floating-point divider
issue as AMD Zen1: the divider can leave partial results of previous
operations behind, which another attacker thread can sample.

The Zen1 fix, commit e55d98e77561 ("x86/CPU: Fix FPDSS on Zen1"), sets
MSR_AMD64_FP_CFG bit 9 in init_amd_zen1(). Hygon CPUs are family 0x18
and do not go through that path, so set the same chicken bit at the end
of init_hygon().

Signed-off-by: Luoshance <luoshance@hygon.cn>
---
 arch/x86/kernel/cpu/hygon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/cpu/hygon.c b/arch/x86/kernel/cpu/hygon.c
index ec51c2b..0bccb93 100644
--- a/arch/x86/kernel/cpu/hygon.c
+++ b/arch/x86/kernel/cpu/hygon.c
@@ -228,6 +228,9 @@ static void init_hygon(struct cpuinfo_x86 *c)
 
 	/* Hygon CPUs don't need fencing after x2APIC/TSC_DEADLINE MSR writes. */
 	clear_cpu_cap(c, X86_FEATURE_APIC_MSRS_FENCE);
+
+	pr_notice_once("Hygon FPDSS bug detected, enabling mitigation.\n");
+	msr_set_bit(MSR_AMD64_FP_CFG, MSR_AMD64_FP_CFG_ZEN1_DENORM_FIX_BIT);
 }
 
 static void cpu_detect_tlb_hygon(struct cpuinfo_x86 *c)
-- 
2.34.1


