Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685498;
	b=u+Nk7TS2ii/1vt7TGgI3B/LIvUDox55UglwihUZ7knUn3l7S8aaunxR515xIsUhYo6+z
	 2ypSIzB/FNPstUQd6LCd2+znopoNiNeK29inXsUa26BYJe4gLu8F89vypM2xw9GkydiTS
	 Ib1vglmRg6gAMzHENBPxUaBnyOughNT18XYgFfNy7WF87dT83aJxfL74FCfk2TBBwvfXX
	 6s6cfYUgbrCuRf89su7b0CtLAIPB7svAxzO2EPq7/1nCkDQkKhR+mmE4qYtzhN2Cd0qzA
	 cWxPauB6m+Kzt6NzFTZAn3YmEzUPtJfwyVCTc/NkFaU0QmE2esz9tIqpBNjlqZTENuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rYtDI3t00yBsJ7/8bDa0K/Ek0vbIf+lbsMzxOdG7umk=;
	b=YAPgCYz2TlvyP9l/XlWnzKKvZ88eqCYwJbMDHRViX2DysvV6PFIGv0cwWEhF8cFqSA61
	 ROc7mkBmyD1fWvHldzd13iCH+8NCyrFZ0zpvh4a97pJtEZGNYT/aJR/qfy7rgrVlfhpZE
	 ns6gHpKsSgoxisKfDBgxc9j44nWlYZhCmEINRptfLgVz7Gi4yjB5H2CX0H1JZvBs70OJG
	 HQr3j5bcMi0mYIiVssSbvsRk6EWuWo2F2BLk6Ad1dHZ+md6ImQTSAFk0VpT46i0AM2fKI
	 AlTFowtyo7x/0J3LmG0SieDid4GPQJzhYxQRh2FBHsMDHM7UYtZ8RTnC/Mon9qau8AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jsja5psw;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7913260A3802
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7913260A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jsja5psw
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d581da0aaso941233966b.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685496; x=1796290296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYtDI3t00yBsJ7/8bDa0K/Ek0vbIf+lbsMzxOdG7umk=;
        b=Jsja5pswQ+lFRlkYENUKRUttHAb9XEX+lfj9k90hF0veUq8vITYp5KB1CAzSlz2SQf
         vBqkMgwBf6BShA+nh+twiJhVukFOjNHrmMvrA9MOP0gBwxSdkukVvUXW6fImprqYnWgL
         H+uFGsD1bT+dZukyFYp0wbcbqxvUg37T4MyubI/B4SSUomD58xdD4v7jjUSS7GWlHLkN
         WEHq9bL4H2rQS/a+/SEv2Q4lPulx/DZErg/KAQq5KgChL3ZMyPS4//SnkI3yoB3QDnXV
         A+uQlbtjrRwLWoihk5t+jumL2kFVe8dMO/miErdO25JO9oDjNDzQfvZ0vpy2qM5txxTD
         rr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685496; x=1796290296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYtDI3t00yBsJ7/8bDa0K/Ek0vbIf+lbsMzxOdG7umk=;
        b=anmxQIondtPSPzkQTETirLkKnOMEtO7zdc5cu+zNJOSEN37ETxEORjgGOSN7uG8kHm
         rPolpu80JOD7tH7KNtDE/tFLKrXP5bGYoPPHcIDplITxIu3Pmf1Sr5IbcQrFwcVMcBze
         3UpLR9eKHuMDg0ma5lScKR8bJrz/CeSAAmRGCbMPNYclrDj9zGme0j/nohbDFrMjULiF
         1lD6V6Y0rvmGJNScWiLr4WcYd6fXFrJyumchaJEkYvk9iXe5AXg/iEz0LwJc/spaQdJy
         hW1uliPM6ImwohTesfHUfR2c8G9ew541RbBR+HZCpput2aPCBweqZrYN/YNCFaJt94l1
         BmxA==
X-Forwarded-Encrypted: i=1; AL+hErEy/8G7CIVIwiTWwn0lgkc1J81t2H+tAGkFpoKyaQyhKgwFTYFj4i0Ay+xIwWrOl9yCvByhyELMHDmIBAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qMXWkej4PsZK+IpCKHUV9OYZkhUOE4qjJPubRnjYSCGVZmIJZ
	q+EDJ4zDpwFkDgYqXEm7SgaTf1+c39Yhw2qj9jvbybf36eHcFyzes6TC
X-Gm-Gg: AZFdTZdmLnBJkLRn/ojj5pLhbHEop7uA21m3LFmpd3fDA9qZMuymnVbP3muW4vOXtK0
	Xgl4yRTyRumCWt3vqqGLnJX8N6l52rEPL9xyCdkGSFf0lV0pYgrj04QOblaoXBfXkn66xrdshB4
	uZIKlCd3Cq0doZBlekKX1Z1iwztXfne9f1P2qnJXW/r1zN54Qi6Vfp38a9/OK276Tl4TySAZfHd
	RzvlSZQee53Nc0oEpF9JG8h2c8Bn4lWlTChJSiG1ZVYrBkVSm9RisN1OyafmBKub6M+t3zxQhyh
	LI64f7D2ap18qcU0S0SRcBsJWBHdOtlcj3MG8lZ5YuJuuM7tOoqZdlBji5fbTrJEBCUFiQ4XZhL
	KVVwWFD3/Zs5qsaBdqI48AoAowmU2F6xK03RbIQYUOvkz7lVmzubJUb1RWHDy6iAPIP5b734blv
	AkWqdf5+7AG0kiZ+rEc7yq/H+8NlxGFwaoV1JExmbIzzHG/BBTS2BIHrVW81E2ePMuq/6ssnBw3
	20JLYjC2FShbRI0sFhoetK9dl1vvjCS8fUZ75AWkZnrNujUQixXxjVmxMmjKykIhaobTOi9+3r7
	nRihPEWxfzSkMkQ7KQQK0/hTikX3kwQnbQy4rUfsfWAoZdi4LZmJiBTRJTYe4AsMiqxw6i0=
X-Received: by 2002:a17:906:d317:b0:c42:102f:15df with SMTP id a640c23a62f3a-c513a99abd8mr1309198866b.8.1795685494372;
        Thu, 26 Nov 2026 01:31:34 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee82sm597090066b.66.2026.11.26.01.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:31:33 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 15/18] sparc32,leon: skip the GR-LEON4-ITX PROM mapping import
Date: Thu, 26 Nov 2026 10:30:20 +0100
Message-ID: <20261126093106.1345825-16-linmag7@gmail.com>
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

The factory U-Boot maps SDRAM with 16 MiB leaves. Linux reaches the
PROM through the linear mapping. Until now leon_swprobe() rejected its
context table at 0x4bffe000 because it lay at max_pfn. Adding the upper
RAM raises max_pfn and makes the importer copy these leaves into the I/O
and vmalloc areas. The first vmap() then faults in
__vmap_pages_range_noflush().

Skip the import on this board, including the high virtual addresses
whose leaves alias RAM that Linux will allocate.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/include/asm/leon.h   | 1 +
 arch/sparc/kernel/leon_legacy.c | 5 +++++
 arch/sparc/mm/srmmu.c           | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/arch/sparc/include/asm/leon.h b/arch/sparc/include/asm/leon.h
index 67f2822d5fc6..9e51f1fb70fd 100644
--- a/arch/sparc/include/asm/leon.h
+++ b/arch/sparc/include/asm/leon.h
@@ -226,6 +226,7 @@ void leon_update_virq_handling(unsigned int virq,
 			       const char *name, int do_ack);
 extern bool leon_gr_leon4_itx;
 void leon_init_timers(void);
+bool leon_legacy_is_itx(void);
 void leon_node_init(struct device_node *dp, struct device_node ***nextp);
 void init_leon(void);
 void poke_leonsparc(void);
diff --git a/arch/sparc/kernel/leon_legacy.c b/arch/sparc/kernel/leon_legacy.c
index fa978620f4a6..d6c9efe59f42 100644
--- a/arch/sparc/kernel/leon_legacy.c
+++ b/arch/sparc/kernel/leon_legacy.c
@@ -39,6 +39,11 @@ static u32 __init legacy_read(u32 address)
 	return LEON3_BYPASS_LOAD_PA(address);
 }
 
+bool __init leon_legacy_is_itx(void)
+{
+	return prom_leon_legacy && leon_gr_leon4_itx;
+}
+
 static bool __init legacy_is(u32 id, unsigned int device)
 {
 	return (id >> 24) == VENDOR_GAISLER &&
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index d2963fab829c..2ecc42f6c935 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -767,6 +767,10 @@ static void __init srmmu_inherit_prom_mappings(unsigned long start,
 	pte_t *ptep;
 	int what; /* 0 = normal-pte, 1 = pmd-level pte, 2 = pgd-level pte */
 
+	/* The ITX U-Boot maps only SDRAM here. Its PROM is in the linear map. */
+	if (IS_ENABLED(CONFIG_SPARC_LEON) && leon_legacy_is_itx())
+		return;
+
 	while (start <= end) {
 		if (start == 0)
 			break; /* probably wrap around */
-- 
2.43.0

