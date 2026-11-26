Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685485;
	b=Xb0aBHSEduvy53NsrzLeDCcfD+avD7gzud6je93PkdLikuMU9p6gwYSBT8D0s7+i0lPM
	 Am/ucALmY29zudG1XkeYa3vYVo2aE7q1FuZuHFYCmsHFDNKcs0/lCGlWKNjWqnTkaHvwY
	 f6Y2okrnQwl4JxI9tfeL4jLWk50tOIxWozXdqGvsmdketK/eRtHu68NIRvos0EMsB1H6N
	 UdWbgjikOrgAuZOLcqUUVqhU0d7S0DkIZcUlm3xMIB/xdl6TWhVrN55wyVtR1HuTOInms
	 W12HQWMP7+waSue0c6AUUtPr2Ty+SllkXV2FtYgppL0KveSSGvM1SAFy25dyZOHHgmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KxYz0Rx58uvG878VN3POGtPURCrxZ6nQaRpf1JD8omk=;
	b=sKoo/n562gPMpKGiY2I/lFEUDvN11NbyX2oh0KWQrnAA/8Yq7uIZXxIG93muWQ31MUlT
	 rO0zuolzrEoQfcKcmwuD3btahc1zwVJfxm55shlomFDUIxHQLWXsCLHyqf+9zuj8tOOqd
	 NkkqIpPcYyqYyUvgBdxThLRMh33PsqDWBEqTG/w97eHlz2BjHJpAsIIhOhaD6cuvnBrgE
	 2+xfhQvpJi5I9SUmOQ7vzbZhxiTKuiMeVowQi/WXCVqMLeMMhKLbe9qH74tn8bjBSjFIP
	 dZPTXtA3yE+LhREymsVfJG0U0gY6nQmncxDkbkkl50HQDY2CBsWOXC5aK5BW6tNMJVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zbssfSJ7;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D75606A680
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D75606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zbssfSJ7
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1237901066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685483; x=1796290283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxYz0Rx58uvG878VN3POGtPURCrxZ6nQaRpf1JD8omk=;
        b=zbssfSJ7kR1tm3zM3tuzkXG/552spqHTV5kKqqofoN+VyodkEEjs2vYFuLekFgrJIb
         lg+Gr4GD4PH7RlMBBqLVrCWQxnumnh/QK3PNcev68ONjmqLugeN3yFlicfc99TidF/0P
         Kock3PcxjXPRTfJuFyytLa0sTnMq4Ekzt8LYJj3E4HPRPTskjvysCpDQ4u+7IIMh01sH
         a0AMbrg+7pcSti83ZiTdQfqxtTqrXSMstgyipvUzXdhlS2Kar3GCujw3VW/asv9Qjo5Q
         w3e2YRT4yz32aCtj7Vwhs5OUux9t1jLonF30dbTWHpjvbprccujmyaPqcXzYmYKRqRQ5
         7w3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685483; x=1796290283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KxYz0Rx58uvG878VN3POGtPURCrxZ6nQaRpf1JD8omk=;
        b=Fnxx3QcAV3baLinwFxt4Dc1Qj6V5QFFT0alM00p5Lc33PgnbRXrAcMXdEwamSyhf43
         2dKbv3QbLS+F+MXoTyEHKFuCka5G67PAahAOAxtfhDY5/TayU3eMufVKWiWa3bAy8FCk
         +1h61QZ6dexTwi1sxEtAG8wODya/xJtscUVP98Wp6vsV1df3rPKRnRKu4DLuT538rmue
         VK8+3owQwU1OCQinJUTwlSNsutrwoi0exdKBfGPwk6CLHxBa+rtdUW34ED6IzTs8P0tV
         Tyxjf0Xmo6WrUoVMHOqaeQmkCkXltowG7EqbtmTLsWO58xzJ/FqpeZzF5mJil5AKLDWu
         2vfg==
X-Forwarded-Encrypted: i=1; AL+hErFMXMTIiSVS0M0xZFrEnwlrVrOzB72j9GuDm+BLjOMVcYTdlwKdB0YjL8Pt8ei8gvozxyq1TftovlXsoZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z89cxWDi+CH3+MXrOJASAimPRYYRdl+hxDT3hVCoIaF4vW97qeD
	+GBWFIi7mfatmf8Lfqg+bbx5cSQi6jmANbTR+uZ7FOPzNSAILNgzz89+
X-Gm-Gg: AZFdTZcJgJ/suOsw9eW416TiwMcrbJuENXyHqSLdAa/bYsZy2fJibN8utGv2H+m3c0/
	K8pR/aNs8FiCVWkyCATXtXeSkJCXAhSlbWoVd62OHtQsT/FbANgUzk3aX9U+Vn89mpP1seLe44F
	0ylM99Z5Yr/sE81PGpMs6JfSHscmRKYb8AWWvjgQ8RYhIbp70YfhBE/S2HVzBS8beCT+6Gn2bHG
	ddNlNdW7KnlxBibntVE4CZy+bff28/r+oJPCR7yt2CjykqMsy7gG+V49VmAotapZzR9m4gzJkjt
	lMq7f5FPdIP5+L0Kkea85gaTYLacZZpN8qY7lKW0vEb4zW/41hH+eQOmSy/sNqZQkfMIoXRPYx4
	fygP9knlSPgpSApeckVcL4RPgcPLthYRkBGxa+H62wxQEKFOf9psz+YHFVFllLsL167yMn2Q9Rz
	t+IwYeWPXEOtKPAdqbb8a8RNvkGIShXkOAuOdH98wAhkBNMLmAh4Ee9uLr2DF+oLTA81IEJXId7
	70I2wPff/KbzEJlhtB7auolWH5b6WhHpy+XHiqydOsNPZWFDvnuxyyXiiZU08ii42AZgfF6xrcb
	BccBfINSZYoviNcA0tmohxzdy3/f279lD5MOBfxlHHllEFtoo+vbymj3AeE7p+d56nEaaw0=
X-Received: by 2002:a17:907:fd15:b0:c50:f1c5:f815 with SMTP id a640c23a62f3a-c513ab49777mr1628525566b.31.1795685482808;
        Thu, 26 Nov 2026 01:31:22 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee82sm597090066b.66.2026.11.26.01.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:31:22 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 03/18] sparc32,leon: publish instruction updates across CPUs
Date: Thu, 26 Nov 2026 10:30:08 +0100
Message-ID: <20261126093106.1345825-4-linmag7@gmail.com>
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

flush_icache_range() is a no-op on sparc32, so another LEON CPU can
execute old instructions after code is rewritten at an existing mapping.
The LEON4 data cache snoops bus writes (GRIP 104.3.8); publishing code
also requires invalidating the other CPU's instruction cache.

Flush locally and through a synchronous cross-call with preemption
disabled. Keep empty ranges and non-LEON systems as runtime no-ops;
generic SPARC32 kernels can detect LEON without CONFIG_SPARC_LEON.
This covers in-place code updates. The module loader already flushes
caches when creating mappings for module text.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/include/asm/cacheflush_32.h |  2 +-
 arch/sparc/mm/srmmu.c                  | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/sparc/include/asm/cacheflush_32.h b/arch/sparc/include/asm/cacheflush_32.h
index 9fee0ccfccb8..4249663efacc 100644
--- a/arch/sparc/include/asm/cacheflush_32.h
+++ b/arch/sparc/include/asm/cacheflush_32.h
@@ -15,7 +15,7 @@
 	sparc32_cachetlb_ops->cache_range(vma, start, end)
 #define flush_cache_page(vma,addr,pfn) \
 	sparc32_cachetlb_ops->cache_page(vma, addr)
-#define flush_icache_range(start, end)		do { } while (0)
+void flush_icache_range(unsigned long start, unsigned long end);
 
 #define copy_to_user_page(vma, page, vaddr, dst, src, len) \
 	do {							\
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index fb95865d7ddd..d2963fab829c 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -1736,6 +1736,20 @@ static struct sparc32_cachetlb_ops smp_cachetlb_ops __ro_after_init = {
 };
 #endif
 
+void flush_icache_range(unsigned long start, unsigned long end)
+{
+	if (start >= end || sparc_cpu_model != sparc_leon)
+		return;
+
+	preempt_disable();
+	leon_flush_cache_all();
+#ifdef CONFIG_SMP
+	xc0(leon_flush_cache_all);
+#endif
+	preempt_enable();
+}
+EXPORT_SYMBOL(flush_icache_range);
+
 /* Load up routines and constants for sun4m and sun4d mmu */
 void __init load_mmu(void)
 {
-- 
2.43.0

