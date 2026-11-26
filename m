Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685483;
	b=1qfNRKZFeHhqk57BCfn47nLy1bOpl0EOqvAHmkbp4HLOMG7Lwgsxz9Iil+4yY+1W7QOZ
	 OE+BZg26y5XmeGhB91yCiXscLIAcIxL5tRi1fLiEepj56obDNablkL8SU4VHpXWLSJa2g
	 2tMXwnTfRyP95LVEA4ECF6+vlKu/zURIvvJzYuVyduNKJBWQxxzc4ROWIkkvLMFl3zZWh
	 sL++/KiwBXezMuUCcs//4pgswoD4c2HAmXlwzGOD/ddPGyCJ3CQCTlm9yFvy+M4xuSloU
	 KBo93Q6myuJG4KNvVGNOYDcmD+iU/VzZO6H6MrUB18Kuaqb1+3XcZuhXvYZILRAqGDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nwfQ/uhT3WPczWnDNwIoPHc9UZao7lfTv4ZO8Ma8hAU=;
	b=lZjn/st1Ro++5Z1iqoGagJf9fRwGPdRmV/A2SC0jaWbO55fpxL3kn10VnnhFpSGa7le+
	 YyQfC0xmS+sf/fKLTC3j/nKHoMBNwh7loDTGaYdHqV3gwG4I9zfRIpCVmK0Cp1AA+FQIL
	 aMEV2/L4RX4doJIWQCY19ZXuYStkx5zLG204xUmoaSch2NjdIK6NJVgTch61+VM2l8Cd9
	 2sB6ZvsHTZP0tOIRr/B5hVzuuoGkiiy002Woe58vi9B7EgINkkxm3iVrdHQjGU6uym1jA
	 uCAJydOcc0msQ+b3moATiZ0gL60AaiRUVf54MFJLN/7OM01n7rXQdycXcojK2FxYMHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w1CSvlZo;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADD6606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ADD6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w1CSvlZo
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1133534766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685481; x=1796290281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwfQ/uhT3WPczWnDNwIoPHc9UZao7lfTv4ZO8Ma8hAU=;
        b=w1CSvlZop21uujTolx+tFq0YkK2DVk9f2VwdkVB6t5zvRszi63WyX/iLfgjT3CsqnN
         uFmosd3dS8/cUK1MbQNWCxMZDLZBGFupA+CcKA2cYzJIR9Y7Z3nxL//MlMXQ7M16RTQJ
         PZCgWEoswKwUkvYLmnroOZgzmFccl0AyKLRS+VhwbTk64LSVTZTi59oqscc3RkQ+ECgJ
         FaRTOTdu1Fmjmbarox2lFeKvYOkbt/dIRLttvwaaY2hzPMzi5NvpwnvXz85y/ZMT8DiF
         tqpNyWJM8kt6w+eUN8iAGbxD6F7jNmSvVFM2OG47K2g4VUqrFsGphZ1e/g2fznjR/niQ
         Zd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685481; x=1796290281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwfQ/uhT3WPczWnDNwIoPHc9UZao7lfTv4ZO8Ma8hAU=;
        b=2B1pv0XAu47vYq5FBXwlIoCbZjXrc2aBaXIzPgybJZcB+iPgpB/RglgfVqgo0gbiTn
         TZicxNx1Lml7wu0OFUuVtsywJHoOrnd+cZhRv4Icpoz3chHaw6sLahdvJNM/vVgNOTbN
         eCGw7TWJp4AueBJeqODHYQ1dzqIuRmumFiS/IDOdU8LMoQOKlpxwwi1DjUCESCwwQH8e
         hm60OO/fQKvvCZ6bRnocojmtDboymIdXQ2RC7hGKSyw0CyMlNpphCVRt4ldj6mZ6X4HL
         1ff74r9sOsjtjh0VwcX50To4UNe5AqKq7WposzyQjOcv2NmVgrrx7HV2Mta/OWTVvbIR
         HiVQ==
X-Forwarded-Encrypted: i=1; AL+hErFJkY5XN9TEVpbdEN7FWSMvnODzfP8ebNXO7GLerIXYzs3XbJWogpnGgTldwkeh/Fa9q4Ua14LT+2RkT3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GynbXmEL3azku+Vc7/UzOgysIWS3LAJe3puAgcpXN4mIgiB2k
	Or+GQQ51g8/RRBEyXjwsrICmQCA/NFsRpStYYm8FJnSRxpgpmeGQqq+5nihS7x9g
X-Gm-Gg: AZFdTZd1ShZod7Iw39nXrTkEWfGvW10GJ+jLygk1s1xVWMoz9IpWnV8qpxS80aaiu4f
	ZUZy8BVDgDmL3vDM/LTj5hPDmJOhZILGmfVC0XjIqYybNf+YUBZGW+2aofdz7qwNK/oyhEFwGTl
	OmzJGNUzSVMAhRcfcis1JIuhp2Dna7xReIsa9D/vvdKwPesYmET4uk8sH2mVTPO6ycCP7RlCL7C
	RP/PoDrXzsr3OxuZ9gedQ2C1vtUyjnmXSm8ktSRHNw5DC60w0uEQrIrkYUyqPZjzb0igfzUhXtP
	mEx/CeFyWdBIgDuP/Zo0pwKtY0M9L2UKWM6gYvr404YUzGHHRpMIwd7RwdvW63Q8rxV97Psw3EM
	2BvolkFdhuj1H3ru45g5bWYLUZQZ1g0kVQxQ68LcV3NvT2D/kY7mK3fwNVtSyEhH3wlSTMSWn1L
	ZgL0E3ytkr6z2W4m+CUwZ4YH8JIvGzR2y2kMOfnqZzjDCxj57t2k7YV2ca1Enq2zAqEeyHmfCOZ
	QOqfppjVbPs2313t1Sb1/2WMoxFPp5HScPLwP35RQmhdYirMaLEodvEgqTj1NDcAeuTmV32Duht
	M0gUp5hHqbRhLVzQOu64tsjAZ4Yc2tSjPSbe6lcKH3Pwv7yKzKnrh4QhCO74dpkWdem5msg=
X-Received: by 2002:a17:907:6089:b0:c4d:f63:642 with SMTP id a640c23a62f3a-c513a99e69bmr1991282966b.33.1795685480823;
        Thu, 26 Nov 2026 01:31:20 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee82sm597090066b.66.2026.11.26.01.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:31:20 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 01/18] sparc32,leon: give the cross-call IRQ highest priority
Date: Thu, 26 Nov 2026 10:30:06 +0100
Message-ID: <20261126093106.1345825-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126093106.1345825-1-linmag7@gmail.com>
References: <20261126093106.1345825-1-linmag7@gmail.com>
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

A CPU can spin on cross_call_lock at PIL 15 while the lock holder
waits for it to acknowledge IRQ15. If firmware gives a lower-numbered
interrupt higher priority in IRQMP, that interrupt can keep IRQ15 from
reaching the waiting CPU.

Put IRQ15 in IRQMP's high-priority group before enabling cross-calls.
IRQ15 wins within that group. Preserve the priorities of the other
interrupts.

Fixes: 8401707ff645 ("sparc,leon: Sparc-Leon SMP support")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/leon_smp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/sparc/kernel/leon_smp.c b/arch/sparc/kernel/leon_smp.c
index 1ee393abc463..649f219e2b69 100644
--- a/arch/sparc/kernel/leon_smp.c
+++ b/arch/sparc/kernel/leon_smp.c
@@ -159,6 +159,7 @@ void __init leon_boot_cpus(void)
 {
 	int nrcpu = leon_smp_nrcpus();
 	int me = smp_processor_id();
+	u32 level;
 
 	/* Setup IPI */
 	leon_ipi_init();
@@ -167,6 +168,14 @@ void __init leon_boot_cpus(void)
 	       (unsigned int)nrcpu, (unsigned int)NR_CPUS,
 	       (unsigned int)&(leon3_irqctrl_regs->mpstatus));
 
+	/*
+	 * Cross-calls must reach a CPU even while it spins with PIL 15.
+	 * A lower-numbered IRQ in IRQMP's high priority group can otherwise
+	 * keep IRQ15 from reaching the CPU until that IRQ is serviced.
+	 */
+	level = LEON3_BYPASS_LOAD_PA(&leon3_irqctrl_regs->ilevel);
+	LEON3_BYPASS_STORE_PA(&leon3_irqctrl_regs->ilevel,
+			      level | BIT(LEON3_IRQ_CROSS_CALL));
 	leon_enable_irq_cpu(LEON3_IRQ_CROSS_CALL, me);
 	leon_enable_irq_cpu(LEON3_IRQ_TICKER, me);
 	leon_enable_irq_cpu(leon_ipi_irq, me);
-- 
2.43.0

