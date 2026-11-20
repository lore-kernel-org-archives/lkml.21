Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203227;
	b=V16UsYa/QGTTWsOkK6I3OxI/v5sjsG+WZNyCilRUT+Dyy7nI4kNrrjPWtL9P472k0Ony
	 ENxuVIxcwWj/kS6VW3UV2sJmKtFa6sFEqvcXt4dfWtQw2p/TwdX5ya/2QS5tNDva2BDgo
	 V/HRM56j6Oo5hlFz7ZQzZ2RTJBUIEEYizbsm4WvB1MotqIJBZshL7E1eZxoy828lfB0A8
	 xSr82p4Ixnwc7sppz4Ixi2EJqf0R9bSsHpOzVVTkPisOR1iysuYq/k4W1HX6CZIw7LiGx
	 KzKSslQABY9SvuS9UWtK7I0SCuBpz5j41kRn8F8Fht1OqaZ7OjjdN5ki6IMBcE0MVjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=CbEMQyFndEQPpa9CfnVe3JHR8goha/OLm3NFkyD+X70=;
	b=OuI/6pfzfv3qZStGeyyGWIYsbHRmbNsXSnmTcGRxeuzhQDIZClBCPEigR590ON4QjZZd
	 WD2tuThpTlUz9QvfbFPxIq1kGah9eR33X5XUJMw48riUB3FGRWglQGgLUNVzXOlIw+NeZ
	 W84ze1DHPCfKSKZHAtuMatvM7ToNH99WGPWiwgL4BV2wl0WIpkusEdm8AuPPERWhCa8y9
	 sX2Gepc6TyfVrcRCckDcwG9id1xeng/Eoib/zUUdFn7SVx9sE0Tww6Et1HbaSz+58q6fS
	 zbdZCZDXkiZBmxt4xHIhTJ0+sqtObDC2FKARL0v+ptiBPuLdvv/ON8TLkKkk6rMe0Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYz9wkit;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4167606A6DE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4167606A6DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYz9wkit
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4d86f5328so9223797b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203225; x=1795808025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbEMQyFndEQPpa9CfnVe3JHR8goha/OLm3NFkyD+X70=;
        b=DYz9wkitjKu8+ehJ+L+PeaKc1T1nAXAI53L57Co/nwm5HiLJb/0LrjVFxGqbdsF/vE
         72WKpQwLn5hdJbjNWeeoiTH8mySwWP8OA2zeNTkDKZ6gOB3ax8WCUgfZ8hL1yyR+Ga7h
         ZvvwEeSE/VCspVZMEDaYpYV8f2SmhUZ8qiRjWINwLGG2f5fLWTJTpHAK3+OATLTe9t0a
         0zTxUC2K5P4lCX6gv2o1tEBVngC5+bkHv9Y1QD1bKWqpMjrKvfmEwieHxmi45ZmljrDc
         iYRqG8At941qXAbC0YffTquwYPJg8zo+Q/X9I017ouQCEt4tCGUH0L3Tyqk8BHjToLSj
         YVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203225; x=1795808025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CbEMQyFndEQPpa9CfnVe3JHR8goha/OLm3NFkyD+X70=;
        b=s4D6u2RhMppXDiuYT6eQsbasI19jBPn9Rs+OKtsvPpokwbDmotoTW+3ITLoWJ06nXp
         C9x9lQVNBnjNLunHCr1DwjyTa9csQ/15+S2Q+vWbq149Ny5NBnxTSDCkj6WMSG3y/NO4
         qaPcaH7AbNngSNNO5jhoMitdQKsKWVtiRMklPuVrbuR7JyFxBBAevZ4v/970GZ0d1hHM
         x8uWFhVJZr9q4qPmcIVFf4gCrK3N405J97EyH7mWh4wtb9Rjw3O+M5ZuamksDxvBFtCk
         F5JsjonAXFkRjhnNSVRXi5Ryqde+8oPJtarc819uuRhCBBk7+2dr12nPvTQiKU4uPBTR
         a20w==
X-Forwarded-Encrypted: i=1; AL+hErFOlpjpADF2duBY8WOCF7xP8cOTuO3k5GnYkCId3im3G+wyN7dR3VMck4aqsVahlgcNgfXm23W62NFPp9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9476BCui8fFqTHqNsqi/b9BXRJJ6Wi/TUH0cBnH10E2Eu717jG
	zTs2K98Fihc6EBZdVXmsfDQChsmu5DGu48Z0SkJYGdxjPPN5tbXAMu9S
X-Gm-Gg: AZFdTZd/2yda5Lj9IVovMvYg87tZ6PIhDlO0wB2v3x6wqPU+RM0OnXLNsaWN8qhrLIR
	Wk8TN0c0e/NZSrbMEN+8PzdSb9NDyPNyBjc8RXGeSBZNSyJ7xoO8g3xEhfSPL0fhzwGaY03ByVq
	Wa8biwlZfMvv/hL8E7YXCKumnAR4oZo/+3Rc0XyVv0YO8JhlPRPg486QtmSPU4jsEL6SeOs75GS
	qb46+EmhyWxLNRGrMxX6Q6+Gw+UW3PtjmFRGO6pv8RsCiAqVVFySiAPhby37yn8I9TIAMdkscIc
	DQcvCRfv3UOItmZJSKf8fs/1zyv4pW+4OalPPTxTnFLHm5hEj0ftgejCElCaRMcq6pENGAtTqMA
	p0T3VLKS9Bgs6eLGnwgkaxeQMJ8ZUnXS1nP8SQtriD8E1Z11YghfsaAY+23RgJ/TAt2c1hCuNu+
	Y12BdAxi2wNAN6iIkzZ8tVYJVtHvyZ/kt3Hv/wXZCiFWGoKgAa+AmFVrPyeSNG5yR6VaIsrcj5O
	FvWrlVFAB/9OPYgYsR5r2Zjv9fmzkr7g9AX3YJkg8qLgPQzts3pIQPTostV6bLoNYzFVUEb+2IO
	dgTGTOgtHvNcMwshmx1PZ3WP6jd+JA0tndf+DuDIAx0yH7kkRkJSoMKmsjbJ/OE9JEmXBmwhX0X
	NKs6EW2ya7mshITc/6sOda0kGKnGVm9h996byYFEDYQ==
X-Received: by 2002:a05:690c:dc5:b0:8b3:4122:f464 with SMTP id 00721157ae682-8b5204f191bmr23190407b3.55.1795203224695;
        Fri, 20 Nov 2026 11:33:44 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202b085bsm17631997b3.16.2026.11.20.11.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:33:43 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 20 Nov 2026 14:33:40 -0500
Subject: [PATCH 1/4] powerpc/32: Decode MPC745x L2 and L3 cache machine
 checks
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ppc32-l2-ecc-v1-1-98fc8e6e0a32@gmail.com>
References: <20261120-ppc32-l2-ecc-v1-0-98fc8e6e0a32@gmail.com>
In-Reply-To: <20261120-ppc32-l2-ecc-v1-0-98fc8e6e0a32@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, 
 Tony Luck <tony.luck@intel.com>, Matt Turner <mattst88@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-edac@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7638; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=VRO/XG2kWpmnUT7mAvBKhs8RiHjgk1isVl1A350JWDY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIZFkyxdpOVVbIvCupavdxTcu6K5KtLb2x/29Fn/HK9q
 iN7j1ZuxwcWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFwTf4uR4eSC4yvlz7
 591b5m+dPbm+dsz3YWzDla9mnOxl1T36qvXfeJ4ceGt511zyKV2yJMnVZsCmTffXRX8go/Dr4ya
 b286B0v2AA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

On the 745x, SRR1[MSS] means the memory subsystem detected an error, and
MSSSR0 says which: L2 tag or data parity, MPC7448 L2 ECC, or L3 tag or
data parity.  machine_check_generic() reports these cache errors as "L2
data cache parity error" and never clears MSSSR0, whose bits are sticky.

Add machine_check_745x(), which decodes and clears the MSSSR0 cache
error bits, and use it for every 745x.  Machine checks without one of
those bits still go to machine_check_generic().

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/include/asm/cputable.h       |  1 +
 arch/powerpc/include/asm/reg.h            |  5 +++++
 arch/powerpc/kernel/cpu_specs_book3s_32.h | 22 +++++++++++-----------
 arch/powerpc/kernel/traps.c               | 28 ++++++++++++++++++++++++++++
 4 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index a3be81c47df3..8445533c946b 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -34,6 +34,7 @@ extern int machine_check_e500(struct pt_regs *regs);
 extern int machine_check_47x(struct pt_regs *regs);
 int machine_check_8xx(struct pt_regs *regs);
 int machine_check_83xx(struct pt_regs *regs);
+int machine_check_745x(struct pt_regs *regs);
 
 extern void cpu_down_flush_e500v2(void);
 extern void cpu_down_flush_e500mc(void);
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 541a493e13bf..82a85d44776e 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -729,6 +729,10 @@
 
 #define SPRN_MSSCR0	0x3f6	/* Memory Subsystem Control Register 0 */
 #define SPRN_MSSSR0	0x3f7	/* Memory Subsystem Status Register 1 */
+#define   MSSSR0_L2TAG	0x00040000	/* L2 tag parity error */
+#define   MSSSR0_L2DAT	0x00020000	/* L2 data parity/ECC error */
+#define   MSSSR0_L3TAG	0x00010000	/* L3 tag parity error */
+#define   MSSSR0_L3DAT	0x00008000	/* L3 data parity error */
 #define SPRN_LDSTCR	0x3f8	/* Load/Store control register */
 #define SPRN_LDSTDB	0x3f4	/* */
 #define SPRN_LR		0x008	/* Link Register */
@@ -801,6 +805,7 @@
 #define   SRR1_PROGTRAP		0x00020000 /* Trap */
 #define   SRR1_PROGADDR		0x00010000 /* SRR0 contains subsequent addr */
 
+#define   SRR1_MCE_MSS		0x00100000 /* 745x memory subsystem error (MSSSR0) */
 #define   SRR1_MCE_MCP		0x00080000 /* Machine check signal caused interrupt */
 #define   SRR1_BOUNDARY		0x10000000 /* Prefixed instruction crosses 64-byte boundary */
 #define   SRR1_PREFIXED		0x20000000 /* Exception caused by prefixed instruction */
diff --git a/arch/powerpc/kernel/cpu_specs_book3s_32.h b/arch/powerpc/kernel/cpu_specs_book3s_32.h
index 3714634d194a..90ca26405c1d 100644
--- a/arch/powerpc/kernel/cpu_specs_book3s_32.h
+++ b/arch/powerpc/kernel/cpu_specs_book3s_32.h
@@ -426,7 +426,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7450 2.1 */
@@ -442,7 +442,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7450 2.3 and newer */
@@ -458,7 +458,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7455 rev 1.x */
@@ -474,7 +474,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7455 rev 2.0 */
@@ -490,7 +490,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7455 others */
@@ -506,7 +506,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7447/7457 Rev 1.0 */
@@ -522,7 +522,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7447/7457 Rev 1.1 */
@@ -538,7 +538,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7447/7457 Rev 1.2 and later */
@@ -554,7 +554,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7447A */
@@ -570,7 +570,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7448 */
@@ -586,7 +586,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* default match, we assume split I/D cache & TB (non-601)... */
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 3a8f5416e3f6..4fb1610baa51 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -788,6 +788,34 @@ int machine_check_generic(struct pt_regs *regs)
 	}
 	return 0;
 }
+
+#ifdef CONFIG_PPC_BOOK3S_32
+#define MSSSR0_CACHE_ERR	(MSSSR0_L2TAG | MSSSR0_L2DAT | MSSSR0_L3TAG | MSSSR0_L3DAT)
+
+/*
+ * On the 745x, SRR1[MSS] means the memory subsystem detected an error, and
+ * MSSSR0 says which.  The MSSSR0 bits are sticky, so clear them.
+ */
+int machine_check_745x(struct pt_regs *regs)
+{
+	unsigned long reason = regs->msr;
+	unsigned long msssr0 = mfspr(SPRN_MSSSR0);
+
+	if (!(reason & SRR1_MCE_MSS) || !(msssr0 & MSSSR0_CACHE_ERR))
+		return machine_check_generic(regs);
+
+	mtspr(SPRN_MSSSR0, msssr0 & ~MSSSR0_CACHE_ERR);
+
+	pr_err("Machine check in kernel mode.\n");
+	pr_err("Caused by (from SRR1=%lx, MSSSR0=%lx):%s%s%s%s\n",
+	       reason, msssr0,
+	       msssr0 & MSSSR0_L2TAG ? " [L2 tag parity]" : "",
+	       msssr0 & MSSSR0_L2DAT ? " [L2 data parity/ECC]" : "",
+	       msssr0 & MSSSR0_L3TAG ? " [L3 tag parity]" : "",
+	       msssr0 & MSSSR0_L3DAT ? " [L3 data parity]" : "");
+	return 0;
+}
+#endif
 #endif /* everything else */
 
 void die_mce(const char *str, struct pt_regs *regs, long err)

-- 
2.56.1

