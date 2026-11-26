Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683552;
	b=aZ5g1A2oFtnZ3MBT0vUyyzJO00Y38Z0NTWc5W0t78jxSM7pjUv851d8lXgGIihfyQP8d
	 ctZAjicBLqmz9CFZB7vSUC4IhC8FTrjZPQcCXeebIVrWxUNCI26Rqn4XHj8yJlVbNop6R
	 4KlnsWgkDSr3TvN4V5LhpwQkMETubIlKTzLgg0/V1Qm/FSwaqfUw/DdlATfYFIeinRp0E
	 i9OLCubcIrDlPmjENvVd4IXZtYWkXJRgpMPpoIIe8Td/9dPMFEwBDdvmjRlhYdPYiBPgz
	 lOo3jihehgwDy57CIy4gpGbxN3kFkfoFON2AUbTug2+8QvmwLenGwjSQCbnjdx1RQGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zk1U6OrL5ve/ZLld4Y9bZjNucrlJcjMr3XUErdzixqc=;
	b=UOH+LLoywV5dWXjjTgQwCpcIXYEEWHwTlP1gxVAf537ShqNBMCswhzhfbw3W8LUYRYv1
	 s/ZfpCTpKiaDjcUz2/EydJJ1WzLknZhNJQS7l5fgvYBs8nvZkkFnN2k9G1bJuYGoikcFI
	 kT7MW43SABGlI3/ifRjpiMsRNMSHAqKfqXgA038+eZaT02chqOyTBgjH2n87ayeV27He2
	 DJ1CBWJj9L2OGFb8MncEmDTPwMp54uNayXj85G4uHB6Z0Rb/zl+d4UbsB2aLuOR3CuSYw
	 zM/yqwmuk9WFRaHqUVKDFUQ1wdUDEfWpzkI1kewVXEV/AvtRPUOhBIHnYCqXIX2soPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KELR6A1E;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7079E606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7079E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KELR6A1E
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f0a1b685so4719591f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683550; x=1796288350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zk1U6OrL5ve/ZLld4Y9bZjNucrlJcjMr3XUErdzixqc=;
        b=KELR6A1ERHJ5dyS1Xl9ZW83pgdM9j8mqX0ssemh3XbXSN9ByW7uitgvbd6tEf79eTA
         2spdOQ79mT3ctHZNxMwLuNrIetDY6LgtDoc5voCo5YyA99GLKCVdcnuHZl0+fQUJaboo
         r4XHFv/oea2MX2dfQsnF51sLQdVfmNUdnxY39fSYuQLUbNulECNc5M3aerMBPzmdBWWq
         tSaiih3HaM3HP2EK3E5N6KlQ5Chd1gm9bH8s4ob+9eR7YDTTOBmafJfsUebN7NLdZCCK
         B+4cI2v/1+CfidfP52ihW6tEppDa8OSexe3y/T2Jn6tveWlmlf53yFndakJ7xHwUT6zJ
         tFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683550; x=1796288350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zk1U6OrL5ve/ZLld4Y9bZjNucrlJcjMr3XUErdzixqc=;
        b=ew1q8MmNlbvPjA7sXxKVevFl4Pdz7POX6all8oDmgvzL+wLXJOJ7QSA+O5ZHaqoEQ5
         wYJBYz7Nnq737KkNdCXTy+Btv11i1qu2o+/mSPUcZ5L+SQcdEmoQ2Gnl0QnhgLjr3vgR
         5TeH/t8ryPAFbBHxJj+u7fmgEHbCv55w+kFc2a3wlAr38/qvTVOviiZfMn4jx7/yDKRs
         /KNrDJuiA/QfHMlHnNLesYkgirwU42ZAdfI1HPRelB4psc3EqpX2SVtRwdRll5lmiz+Y
         rQy2OMhIPPoX8ATWCNnPknxvT/Ajtp6+vOxxEI34fMsRU6Ow7fDClbgLTQuqLJyVeBx8
         KdZA==
X-Forwarded-Encrypted: i=1; AL+hErHfEBcmICTB7ywfmrdMr0U9onmhG2QaTvW4DdJybRqOnsEecL2T/u+s8BAT8OD1o+edy/89t3siPEfK3yA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lkX/+7A3h3Gh1X7yWR3nnHmtrgbL85UJA+DPThkdiySqCEBXw
	ZFqFmx0YKFy6L0sIQSqR+Bhha9QW90UrgOBEaH8wE62WittFGX3jA78j
X-Gm-Gg: AZFdTZdxdxvqeLTKg7Gus8QuWUgXqcUtR6BbpIyBV0bRBTe5+dJfzxZNiRqoOjoqG9G
	CjDiPFnyCQKPqjN8SmlOywk+PL7F5m7cpY0rgrx9GLdLL4saorXxSwcxNr/uYwBq8fF3AY1AlIc
	Dgb9xjQ5RtmR44nq+5jBcMWuUzhEYmhh+NRyJ1+X6+VnDZaRXF1msUKiPbP9ISS7UUb5tlmgIXI
	wyBSajJu86bT9SrSJAzrFRcLD/EOx1agBi2ParzbpZVgN6trmqAyhb4imtBWnOR/TOdWithbFvF
	CW4Wra4sTdwsws2R27u/URnpLjwGRwyutdxrFrBfEXVux4Jojumpqf+LeEsEz8I2KCHi2VVVq5N
	A58EwnQKZEHCzSXd0cufWAraEmD/MeJc81AEIlYsoY7/nSExsorZhKfU5bfPK7vVQ+Knz9hsk7E
	MsLrzZcmfFyBfLeOv2b7ikEAty0aocUa+bwCn9g17a6BwjNjOr884F0YdqA2kFY325Olzl+TgpH
	tiyQN6+Vo0wb2VrNmzHZ73iQD5CFOOdHloyU0NoR29D+gz0pi1NMpW8+J4meo/t9kkLoAnR0LzI
	GbVQv0/ZZGJk+rk+IcKvncxSrKzFOnZBklSyBwMidNGHbJQtWIULOw==
X-Received: by 2002:a05:6000:4812:b0:4a9:1b17:4f34 with SMTP id ffacd0b85a97d-4abb57f7036mr36892313f8f.50.1795683549791;
        Thu, 26 Nov 2026 00:59:09 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:09 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH v5 1/4] mtd: maps: only point() maps read through the simple accessors
Date: Thu, 26 Nov 2026 08:59:03 +0000
Message-ID: <20261126085906.814373-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126085906.814373-1-orgads@gmail.com>
References: <20261126085906.814373-1-orgads@gmail.com>
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

map_is_linear() only checks that a map has a physical address. Map
drivers that install their own accessors keep one, and a pointer
bypasses whatever those accessors do:

- physmap's IXP4xx support: the expansion bus only takes 16-bit
  accesses (the reason it cannot use memcpy_fromio()), and on
  little-endian kernels every access also flips address bit 1 and
  swaps bytes;
- physmap's Gemini support enables the flash pins only inside its
  accessors;
- lantiq-flash serializes the external bus against PCI and copies byte
  by byte because the EBU cannot take a prefetching memcpy;
- the cobalt PCI driver's flash map (drivers/media/pci/cobalt/
  cobalt-flash.c) reads at an offset inside a PCI BAR while leaving
  phys 0;
- the Octeon bootbus flash map takes octeon_bootbus_sem in its
  accessors, which a pointed read on an Intel NOR skips.

cfi_cmdset_0001 hands such pointers to jffs2 today, and the IXP4xx
boards carry Intel StrataFlash. lpddr, map_ram and map_rom enable
point() on the same terms (map_rom unconditionally). Add
map_is_simple(), true when the map reads through the simple accessors
(always true without CONFIG_MTD_COMPLEX_MAPPINGS, where the accessors
are inline), and require it in all four before enabling point(). Maps
with custom accessors fall back to copying through them; on big-endian
IXP4xx, where pointed reads happened to work, jffs2 mounts get slower.

Fixes: 9d3b5086f6d4 ("mtd: physmap_of_gemini: Handle pin control")
Fixes: 2aba2f2a704d ("mtd: physmap_of: add a hook for Intel IXP4xx flash probing")
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Imre Kaloz <kaloz@kernel.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: John Crispin <john@phrozen.org>
---
v5: no change.
v4: also gate lpddr, map_ram and map_rom, which point() on the same
    terms; those three are compile-tested only. Rebased onto
    v7.4-rc1; the Assisted-by tag is dropped (an LLM helped write
    this series).
v3: Assisted-by in the documented form.
v2: no change.


 drivers/mtd/chips/cfi_cmdset_0001.c |  2 +-
 drivers/mtd/chips/map_ram.c         |  4 ++--
 drivers/mtd/chips/map_rom.c         |  6 ++++--
 drivers/mtd/lpddr/lpddr_cmds.c      |  2 +-
 drivers/mtd/maps/map_funcs.c        | 12 ++++++++++++
 include/linux/mtd/map.h             |  2 ++
 6 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e5805eebe..42fb0427a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -299,7 +299,7 @@ static void fixup_LH28F640BF(struct mtd_info *mtd)
 static void fixup_use_point(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
-	if (!mtd->_point && map_is_linear(map)) {
+	if (!mtd->_point && map_is_linear(map) && map_is_simple(map)) {
 		mtd->_point   = cfi_intelext_point;
 		mtd->_unpoint = cfi_intelext_unpoint;
 	}
diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index 2dde70e74..77c912f1c 100644
--- a/drivers/mtd/chips/map_ram.c
+++ b/drivers/mtd/chips/map_ram.c
@@ -74,8 +74,8 @@ static struct mtd_info *map_ram_probe(struct map_info *map)
 	mtd->flags = MTD_CAP_RAM;
 	mtd->writesize = 1;
 
-	/* Disable direct access when NO_XIP is set */
-	if (map->phys != NO_XIP) {
+	/* Disable direct access when NO_XIP is set or the map has its own accessors */
+	if (map->phys != NO_XIP && map_is_simple(map)) {
 		mtd->_point = mapram_point;
 		mtd->_unpoint = mapram_unpoint;
 	}
diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
index dbc34e886..65daa1454 100644
--- a/drivers/mtd/chips/map_rom.c
+++ b/drivers/mtd/chips/map_rom.c
@@ -54,8 +54,10 @@ static struct mtd_info *map_rom_probe(struct map_info *map)
 	mtd->name = map->name;
 	mtd->type = MTD_ROM;
 	mtd->size = map->size;
-	mtd->_point = maprom_point;
-	mtd->_unpoint = maprom_unpoint;
+	if (map_is_simple(map)) {
+		mtd->_point = maprom_point;
+		mtd->_unpoint = maprom_unpoint;
+	}
 	mtd->_read = maprom_read;
 	mtd->_write = maprom_write;
 	mtd->_sync = maprom_nop;
diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index a4167ee5e..23f05500e 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -57,7 +57,7 @@ struct mtd_info *lpddr_cmdset(struct map_info *map)
 	mtd->_writev = lpddr_writev;
 	mtd->_lock = lpddr_lock;
 	mtd->_unlock = lpddr_unlock;
-	if (map_is_linear(map)) {
+	if (map_is_linear(map) && map_is_simple(map)) {
 		mtd->_point = lpddr_point;
 		mtd->_unpoint = lpddr_unpoint;
 	}
diff --git a/drivers/mtd/maps/map_funcs.c b/drivers/mtd/maps/map_funcs.c
index b0054933c..59917949b 100644
--- a/drivers/mtd/maps/map_funcs.c
+++ b/drivers/mtd/maps/map_funcs.c
@@ -41,5 +41,17 @@ void simple_map_init(struct map_info *map)
 }
 
 EXPORT_SYMBOL(simple_map_init);
+
+/*
+ * True when every access goes through the simple accessors, so a reader
+ * may use map->virt directly; a map with its own accessors (byte swaps,
+ * bus locking, address fixups) must not be pointed at.
+ */
+bool map_is_simple(struct map_info *map)
+{
+	return map->read == simple_map_read &&
+	       map->copy_from == simple_map_copy_from;
+}
+EXPORT_SYMBOL(map_is_simple);
 MODULE_DESCRIPTION("Out-of-line map I/O");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 75b0b2abc..ebee3fe1d 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -449,6 +449,7 @@ static inline void inline_map_copy_to(struct map_info *map, unsigned long to, co
 #define map_copy_to(map, to, from, len) (map)->copy_to(map, to, from, len)
 
 extern void simple_map_init(struct map_info *);
+bool map_is_simple(struct map_info *map);
 #define map_is_linear(map) (map->phys != NO_XIP)
 
 #else
@@ -460,6 +461,7 @@ extern void simple_map_init(struct map_info *);
 
 #define simple_map_init(map) BUG_ON(!map_bankwidth_supported((map)->bankwidth))
 #define map_is_linear(map) ({ (void)(map); 1; })
+#define map_is_simple(map) ({ (void)(map); 1; })
 
 #endif /* !CONFIG_MTD_COMPLEX_MAPPINGS */
 
-- 
2.53.0

