Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629144;
	b=SJxmZoEYZ2BEOWx4cKXsZSbHzP3XKhN/bVUDWgLJT+sZ9zlhVSgwVC1wTatCh1RwYqcE
	 UcxTPM+1zxe5bfuKHwYqJ/uTbZ15newUgvMN5trwwQFGZ+iuapOccERYa0luhwFDwF2X1
	 9uRdbMJM+Ts7aWrJciJHie85ZY0iBciQ4r6gTxsljmTQKN7qm8g53coNJr0WKthEcII+3
	 K+2vjbwJ95UWoALXn2Pi+7ze/FkP4YMdVbEu0X7Tq+AWWlXTMCyoIwJGtbmRWXA6LAVjv
	 Wist3/QxzCVfCVhAVz2/NRShxLyayPbJwtKcBl4jxRtsbpU1W3xbJrptvF0siEW+59Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5dvNWiEKCiCVzbc7CPonI/rPA86Zu+UL//PRdf1vg2E=;
	b=LyEX27ndAltV9pYO3XuyUNggiXkvr/NrTmQYCHJ+PgJ2nACPZE9cScjxS85frj3NNzzb
	 kYU75xg0Ukyyrhv9SisXSGBlwSn7O252kvYPX11Y8R6V58OMPNZrScbZWPAQ7mSqN7xEV
	 HwLfFpFK3oCEch/kcnoWlrUOJpoaFGg9Wu7GSDGCUwZI+i3t3RkRZqFiFzYpY1EVAg2eA
	 Y8VKNJpTU5/U8SvfU233yc+Wp6kq9fEiK+QpQL55S4EtT+K5E8ZtFGOCuaUqekAyjqvD1
	 jex7pGkBbeLzhdXmVGx8ZptqPQdGiOMnICpFNvg02rpU8txGuMZFwMRl/1WaYZt/x2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fv5q8tcf;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF71606A680
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF71606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fv5q8tcf
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso75667635e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795629141; x=1796233941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5dvNWiEKCiCVzbc7CPonI/rPA86Zu+UL//PRdf1vg2E=;
        b=Fv5q8tcfF0dsa13Fxw0V3dHDPJymXpgPDdSQIc7tOLOHmdmH8nYz+FpFDLUpCGokGR
         tS53iUIBtxsgLhavMmlOh/MWvc+1P99Tjlrs4ffIqJPjXwdFKaqBH5CHSanAQUUkriCg
         IHpk4Lu4nMQ652vNnY6C1/Lz87zV1rwBo7Pu+iEt4mgqh9+7axme/nvvSSZtNhjPsCVW
         zYPjDwRAOuTLPaksUvEH4F5R3WAnH24k8LplJLgqyseNqOf/HB3QAZx01DeaYSG4Q9OS
         vRzE1jARjyc69OXYjqU24NIofhDhcAq6adVrtXxYGiuh1f3oIOFmO6LzIbnAK187j5oT
         DOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629141; x=1796233941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5dvNWiEKCiCVzbc7CPonI/rPA86Zu+UL//PRdf1vg2E=;
        b=F31hTSlAk+ATsHbZ+ZG2h6Lx4ipb9DK94OBIfEURvQhxcTb533IRXj3t5jk7ug+HAJ
         8civUsWdYqVDHIKDQBlOXeqSB5O4z2Zd5XgmnoFuI2Q/D4Z84MQ3lnvoRbJKAB26Alzt
         5oiBn/wk7wqJNonpJOCNsRYo4GEqUOOqDQK+TDB7nTLsBPcGs1VmV3WA5gI8VC+TIQT2
         zBmyHQhd7v9tS3BXoCFBLue1H5lZk7ZMO7kne3bLKBkg0x6zDrCLMQsMWqzUvU0DhrWc
         hFoY+vsZD+1PpJRQ+r4SWw4OUkSCbkNXcVyvPUy8icAep+5fMvwAeiBg0WnOxDkfoX1a
         VZVQ==
X-Forwarded-Encrypted: i=1; AL+hErExR+H/R/yVAuMaP6aJk/7dbA5ArQY4TBCW9Qw8+LIPiPScHtvONhk5G9rF3LVjYPEDaR5n4IglYX3sEuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fOc2xjQJD6kzpwmpif6ZJ7xEJj8CznsnRImLSWOon2MSNSTrv
	RCfgjO43oQm94jXCItTDljmBB5YTGwnRbcWDNctzN4vMsL5azpflYSW2
X-Gm-Gg: AZFdTZcVstV7x65sVYMwXLNHKYmp82adeBBBwcTo2o4UVyLFQUAxvJV8M6v8x71u7/7
	YMCe/ZM9ceuzBdTH/VWpQmiAuJ6kFzcUo4o4klcmj1Xtyu5+qEqbsS2smOfxqaqMBPS+PTvkvQd
	4p8MBWO114Y7QqkXE4pK0hxHykQMWC04QEdbz+rxLgpUiFklaml/4VkbaJcr5MtzDdUWvHcNbni
	QSxlG6DrkPvT630VymmbPRkKdkfFnTS4x6cqH9WtJ4i+4QhTABMvziNd+G3GtMIeQfLqtchaKNX
	s/eT2VS53UJyjNvBA04i89/yohXtKILRH6u8sfFJwoCPZy0dnYjh/JtuaNs1CjxjsUiu3S7rWC/
	SfG/4Nz2hyjWuZkevuqMSlHQibLb/QWNDIbJ9xnXICVHhKGjPTSTe+HMbNQBZbyiIyPHYxJUPze
	dZHkNHWx8HGQzuXGeIIXW/ojnsve4viDwQljfgkaJEOPhUnK1oOWFrGd74vw5p9SjKNXlOT39VW
	0vlbuxvvbhBvo5oIda0MZCaWSWbcmLHh3C9fckPfFXWipwTiuO7zSdQT+sPH8eWTU4Ag9RuhFY0
	poYjNiT8hTfGvXfGXU+BJeLqKZJn76L/HbI+SHCP5vhYfccxVdcfz5/pHBUQ9QKGzO2ox5o9nB6
	n7YHF+uwPHLt0kKWE69G5Axtp
X-Received: by 2002:a05:600c:5395:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4bb8880ca2fmr371843305e9.20.1795629140120;
        Wed, 25 Nov 2026 09:52:20 -0800 (PST)
Received: from PF5R4XJL.retailmedia.com ([212.115.152.74])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm32949906f8f.25.2026.11.25.09.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:52:19 -0800 (PST)
From: Erwan Velu <erwanaliasr1@gmail.com>
X-Google-Original-From: Erwan Velu <e.velu@criteo.com>
To: Borislav Petkov <bp@alien8.de>,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	Erwan Velu <e.velu@criteo.com>
Subject: [PATCH] x86/microcode/AMD: Warn when a patch is skipped because of the Entrysign cutoff
Date: Wed, 25 Nov 2026 18:52:03 +0100
Message-ID: <20261125175203.1003294-1-e.velu@criteo.com>
X-Mailer: git-send-email 2.55.0
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

Since commit 8d171045069c ("x86/microcode/AMD: Select which microcode
patch to load"), verify_patch() only considers patches which are on the
same side of the Entrysign cutoff revision as the microcode currently
running on the CPU. On a machine whose BIOS still ships pre-Entrysign
microcode, every post-Entrysign patch for that CPU, be it in the initrd
or in /lib/firmware, is skipped.

This choice is made silently: nothing is printed, neither at early load
nor on late load, where the write to the reload file in
/sys/devices/system/cpu/microcode/ even succeeds. The microcode shipped
by the distribution is simply never applied and the CPU stays at the
BIOS revision, or at the pre-Entrysign fallback patch. Because nothing
explains this, it is very hard to understand why the microcode is not
loaded: one has to read the loader source to find out that a BIOS update
is what is actually needed.

Print a one-time warning when a patch for the running CPU is skipped
because the current revision is at or below the cutoff, naming the
patch, the current revision and the cutoff, and pointing at the BIOS
update.

Patches below the cutoff are still skipped silently on CPUs which are
already past it, as they are older than the running revision anyway.

Tested in a KVM guest with CONFIG_MICROCODE_DBG=y, a guest CPUID of
family 0x19, model 0xa0, stepping 2 (EPYC 8004 "Siena", cutoff
0xaa00218), linux-firmware's microcode_amd_fam19h.bin in the early
initrd (it carries both 0xaa00215 and 0xaa0021c for that CPU) and the
running revision faked with microcode=base_rev=:

 - base_rev=0xaa00216: without this patch, only "Current revision:
   0x0aa00216" is printed and a late reload succeeds without changing
   anything. With it, the warning about 0x0aa0021c is printed once.
 - base_rev=0xaa00212: 0xaa00215 is applied early and the warning about
   0x0aa0021c is printed.
 - base_rev=0xaa0021b: 0xaa0021c is applied early and nothing new is
   printed.

Fixes: 8d171045069c ("x86/microcode/AMD: Select which microcode patch to load")
Co-authored-by: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 arch/x86/kernel/cpu/microcode/amd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index 6cdc410e7547..ea7a8853d509 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -568,6 +568,11 @@ static int verify_patch(const u8 *buf, size_t buf_size, u32 *patch_size)
 	if (cur_rev > cutoff && patch_rev > cutoff)
 		goto ok;
 
+	if (cur_rev <= cutoff &&
+	    ucode_rev_to_cpuid(patch_rev).full == bsp_cpuid_1_eax)
+		pr_warn_once("Patch 0x%08x skipped: current revision 0x%08x is at or below the Entrysign cutoff 0x%08x, a BIOS update is required\n",
+			     patch_rev, cur_rev, cutoff);
+
 	return 1;
 
 ok:
-- 
2.55.0

