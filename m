Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685483;
	b=V67YgOBN8B3UaRNPj+K6PbT8VPMREBmIkwzGoJeNTWZj9dAkveaGkAmVCLefnMh+x/2d
	 KjaaMs7MAfZ/0qMihQ3n3hini9CxcKi0hSNAZ/SGOWwi6R/MMVlzsPBGSqpWMyEUtAGmQ
	 NgbPYlJfSGpJiEEg88+AUtYwvM1M+eZoV57SJBqO/XX3e430ZbrNrKU1doe1z5u1Z83Es
	 8QNWdWmpzGvMtHAUtQnGSq7qCWEkS2Yxfvnvmhp/Ey3z1vFvt+Lzio9ITevwlZvngHSuP
	 AO219u24CXGm2/kVxYuz9YAiNEPJip4I1YQkN+Dnmvn2NiS1NTBbKfA4TE5rF1lSoHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E/ftTHBn544yXnq15epikqQ+4mq3bhKo9jH8irlYVGU=;
	b=Eb1qK2U0tUb4ST/ZBE/FKuz/8LVRG7dNN40UhirHrun0eSgixGJD0D1BcmUsfbaF3f2R
	 brs1GcvKBprjpTbD77BiKTPB92uZ7pcUweJAex2489TPVWKvkd7hMf3e2yG7pHM1nBpJT
	 X9VrwJ6f7GUiIWgA25k5fFXPUevRxnITfWTL7UG/DcLs+vGwqZWFQfu7SHyMeIkOMaYcF
	 RFiVYWk/JzXlU3e0HtusA81cQfX1S8P2IvrMwOLuPakug1bMxo26LGFKL5rs2T3S9mYKH
	 p8t1H+WvwOvGcHtNV/DogjBdAnXCZQNT5FUkMWtoqGDoX9utbj6RXcUQH/RrSiOR8ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IIwECtid;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AF7606A336
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91AF7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IIwECtid
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c516a192844so681662166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685482; x=1796290282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/ftTHBn544yXnq15epikqQ+4mq3bhKo9jH8irlYVGU=;
        b=IIwECtidaIQK6vrOzQTObRsTceSkyoFgrZwJA8eGaN9/pI/BplL9rjyx9rSxxS95Xn
         Qc72IRVxBsbsa64bCeB1IU7O4AaGcBYEBjHODI47GXVTJF/EkMzToJfJYmYlylqPdtAo
         1RCYrX1N95gAeQ1SkC/29ibtj2MfGsEkCbaQrp8bnjDavLIt7ENrfwARo7l7HYITyyqD
         i6gbTKmSatgMNBgJxlF95WcjBG7335FuQu3nVi7Ywj+o9FMWNq/DIXiPFLWGxGK1uPD9
         v3WFtyBK+vsAQRcJVQvBKwaTokYmoBHrqwVqD35r2+02TDHFDIlrgdGrWKc18yred/FV
         SeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685482; x=1796290282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E/ftTHBn544yXnq15epikqQ+4mq3bhKo9jH8irlYVGU=;
        b=bgllpp+U2cANOEmkX6ptGpVvNXoBAus2pCx5xkfVku091E/isYCA4/CPXLgminp2P0
         kIs5pWI+R/jQ9i7tCJROJqeQeSWAjUt0ul+dZb8XYpMEhcgDwtVGVzOlopoF76BoVznm
         ConGCAs0J1+kVuEbIdO8/QhQNEq2p2lZHmorGwGUAMRHGppbK20zL1TwncPRxGe5cbGF
         YkaWW8yvcVIzuxw/DpqiHvY5LkYRy4RZ5Nlv8Xi5TEnw8UPwyCsQwOJVRzxjVw5ueRkg
         H1MlAQieuPfrU9I2xSI3QDYBPOGgFaVLoeJPKy4BOSeVIMq5s12O2laP8r/llbsPfTtj
         x+cw==
X-Forwarded-Encrypted: i=1; AL+hErFQIFdxk6u+0KcUFuhibXs0mkfupUgEFKKFvmKd1tvi32CqFGx4aIxgQ7HdH7I0lqmjRPb/lDrV7r/NQYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lrkDD8BJSNgOHQ4qBktB++3V2XNjQXPkqEY0byxvkb3ICSpzk
	dA5vxPgLKpSQyuK9sejOMWu/8me8alLNEaFzT/cocG3ixdGnYALzY8Wm
X-Gm-Gg: AZFdTZfTIRo+bdVstituNodf2bSQxMzX1c8mG3QLJGlOIohuhh/+R6d+SN8PX52VNj4
	wF+1x1XQSzebQXtC9vQFRdx7lx+6ITPUpVtojoSL4zHCZwHy/EBs/OjGTlvXaWowyGcLHmbCat8
	OMW+ZwJIlhqMSYcpEr1GnVMEhqjXpdaCkxrt0cinY25GZ3e4X2R2OA+Rr/zopqIFJ4H03HspVgr
	NEqWGiijo2uuST5luSpJPA//9dEuGw5BzWFUyu7lbcVaN5l9q0eBh40izM60poS3KK5LCFLAR7J
	VjGZ6BxLShmwxWCKfOe6M7UaBaP96rgYGSsAq2HJAjsQR5D+u/M7h90xQOh1oVgvYthC0XjYTd5
	+GNXJR6VWZ7dVcF6/HIc4VQR9AQaxnL7btCHnnQQXmYk7O5SqzFE+8hl1P5gWh4VmH9pAsxLAIg
	xJ73l7Hd1bla+6kd10rfVl3OOc9a83KOlPMzvFJUHNida6g91Pyp4QglHA/PbaOO7/uoiNYDB0B
	/mh4IUWN3HvSfvpboO8GGkfjGdwj7y7DjpZoxDjWNPBa5DpJ5gQdj/dHvq5lAb7giqmEjUskpNC
	+AF3bNoJMt04dUXzh1zUffeKbdTf1qAFl8L0uQig+mzszbl4OT3/en3JGeQ7LO5benF2Vn4=
X-Received: by 2002:a17:906:a11a:b0:c4c:d96e:80de with SMTP id a640c23a62f3a-c513a5dabbdmr1290596466b.8.1795685481732;
        Thu, 26 Nov 2026 01:31:21 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee82sm597090066b.66.2026.11.26.01.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:31:21 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 02/18] sparc32,leon: retain SMP TLB shootdowns
Date: Thu, 26 Nov 2026 10:30:07 +0100
Message-ID: <20261126093106.1345825-3-linmag7@gmail.com>
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

LEON replaces the synchronous SMP TLB wrappers with local operations,
leaving remote translations stale after a mapping change. Keep the SMP
wrappers for LEON. On GR-LEON4-ITX, all 512 remapping reads were stale
without this change and all 512 were fresh with it.

leon_switch_mm() passed NULL to flush_tlb_mm(), which the SMP wrapper
would dereference. A context switch only needs a local flush, so call
leon_flush_tlb_all() directly.

This is based on "sparc32: retain mm_cpumask across TLB shootdowns" and
"sparc32: enroll and order CPUs before switching address spaces".

Fixes: 8401707ff645 ("sparc,leon: Sparc-Leon SMP support")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/mm/leon_mm.c | 3 ++-
 arch/sparc/mm/srmmu.c   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/leon_mm.c b/arch/sparc/mm/leon_mm.c
index a43c5ffbbbe5..c19eb23b62e2 100644
--- a/arch/sparc/mm/leon_mm.c
+++ b/arch/sparc/mm/leon_mm.c
@@ -264,7 +264,8 @@ int __init leon_flush_needed(void)
 
 void leon_switch_mm(void)
 {
-	flush_tlb_mm((void *)0);
+	/* Context switches are local; mapping changes use the SMP wrappers. */
+	leon_flush_tlb_all();
 	if (leon_flush_during_switch)
 		leon_flush_cache_all();
 }
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 145a63a5fda9..fb95865d7ddd 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -1746,7 +1746,8 @@ void __init load_mmu(void)
 	/* El switcheroo... */
 	local_ops = sparc32_cachetlb_ops;
 
-	if (sparc_cpu_model == sun4d || sparc_cpu_model == sparc_leon) {
+	/* sun4d supplies its own SMP TLB operations. */
+	if (sparc_cpu_model == sun4d) {
 		smp_cachetlb_ops.tlb_all = local_ops->tlb_all;
 		smp_cachetlb_ops.tlb_mm = local_ops->tlb_mm;
 		smp_cachetlb_ops.tlb_range = local_ops->tlb_range;
-- 
2.43.0

