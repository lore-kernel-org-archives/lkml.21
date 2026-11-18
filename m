Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038049;
	b=AIFYs/L3y03/ntCH3mSm90hTk0TQq/aQEYOhUH4/3hjeDrTwQ0NH85HKkYHFrvSub7Ps
	 XmXTc/kJNV/wgFSppTCjpZCPX6IXkYaIf9NrQ0yo2L2QfDM3ArDCOVr8VIhb9UKzpADz2
	 RSKY7uMf7+uG8UbnobGkHQDH8lUymeBNGrRMlQa1v/pzojlE2M+oYMNG1EZxvpv47TgA8
	 +swJXgSTmDPWbW/5IuS2MmaO9uJttYopLQkBo3L/R5q1ANj8M6EJDzf7kYtX8kstJoJP6
	 18eSUjEyNbK6Ur4e5YXV5XsPThoEwQnl0eVUqKORTwuY55hktt6JhWd+2aMrgWFaXQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dKnQaHE9688yraIogV/DS41+AONmyX+Vuhqn/FS9syM=;
	b=K+eb6eYIEA/MlDXOr9p0i4KEafKJfu8GkzkEFtytAbqfl5oqpGtarx8DuI7sacGyGVPt
	 VoykukT+pUE7pBw1Rte/CAPxq6AqNWsQ3dOyT0cYnt2V8wzM1E4Z57b9KyOXOEHT5rUFC
	 YJve6jMt/4uIO9GsB/f7nV8FIg225feEwhAHp4BuPwUClQKsEIUlUOrOtTn2L0OMaiXPn
	 NNYk/o1J38Kd/c/RFHou92nbL1hk1vIUIOcc8UP7X5m8w/YJYHm8kSap/48z/O/Mxuyl/
	 U5oIf1l/04YL4vgqxbPspdzHX6WiTUZI68PVFAhhp+2zkgYEtlga4lxFNJS/zYofUsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i++I7ip/";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5287660A2604
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5287660A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i++I7ip/
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so2108845e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795038048; x=1795642848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKnQaHE9688yraIogV/DS41+AONmyX+Vuhqn/FS9syM=;
        b=i++I7ip/Vor6gQutqh9W8zTuoA0fLmE+yX2MfYkGiYQj1R8SkTsKhWXlZM33tskL6A
         9CcWbhZfWwxsBvfw3fB8xlM8SC58NNWOxxcbdLNFLCLJFS+T/gJn7GxJCONXEptxixXk
         KgHUjhMCmGm9+7zBd/7+HzlwcFuOyx52r7EHUY1G4qhuDjdryG/vtGazayDffMOG/uXy
         7MnGy6kmEQg0ak6bL9K1Va5BZ5hnLYfGuTkIJ0kbY649PpBJPIe8j4ke7ndAFHWgNrN2
         qBL2BweTBWnjjW1p+D15YqG4mF9+BXIiN0SmDqnI4o3gV+Vypd4Qabc5XTrmndCnIxpU
         upWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038048; x=1795642848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKnQaHE9688yraIogV/DS41+AONmyX+Vuhqn/FS9syM=;
        b=qzp0zc1J40D6/Y/d3ij7iQtqeLL77/4ff5ijOFXEoi43diKgI+/sBG0uPum/+Vz/qt
         5lG1X1+qhtGRbRAw/hOCsGWwR98YNL9x3i04WeKMfpVh2tbjjVL83Lrx3pbOM1u1SQq9
         rAxtn7wrkPgbhckxjfNoBX81/oQGITiViktdj0vKXoHp2F0DwLRHVQmYFMLX+PnQXU7U
         djtKU2K8xNrDp9KhkVPpHm2/xuoRQCIWsfj1kYn2LGL9YMpNmSQ5EpY+ES+rmo9S6FWK
         027tNtEjlKdDvi87zhXM/BgVP6cm0CuOn5U6bqA1OkIp6BJNyxDH7RDVyc5hD7vKdPg8
         6OqA==
X-Forwarded-Encrypted: i=1; AL+hErEIlhbTn0Ukj3uulJ0NlTG3+8eP1LOmyp7o2q26EvxzB2/x2Zx8RSSGRriVo1QwdVeblKV6xqNPW95s9A8=@vger.kernel.org
X-Gm-Message-State: APuU4Z88PfOqku2OETLJAfxkV0H6lA/if6vf0Y9t4dGTuX2E602adFou
	iGXKRV0CyXHs3zL2HY7HHC6YyiXRvNrOoDnONIQJMwdpUsayjigaDa46
X-Gm-Gg: AYBFou0EraXNEP+OZe9fSAmiMHKhEEY6QY4o3HNxk1tzI6aFvsKpiWvTTC7b/Rme8OG
	wtoYim6v6S+1P3fuDSO6XQclGCYWM1dEN+4yBH3MzyczRZKNDx2kqL6c6UO2LUbPoF79T+x82xl
	0xGFimTLwDKFz/dmzD9eL6/n3V8PCKAAPGj921hxdiFbZuVLZU/20l5g0/Rrh1TUvJqwqmlq6J3
	8un16xoINNmg/Vtn607DhASylfeM5Xc7qgSDiHUf4pJCLYKT/MVr1DMrrnfPJ55TBnW4jdbdDDL
	d/QEpF6ZpBaprkPLk5sieaVJke2N5oS0nJJ8SmZxUPus6qd7A61Jpnvu7iCol0lYpIAkZQATCsI
	IS/r4ckJBP0LUnMdPU7K3PdTypjT5tQZqNw/07c6hGXxElb31/VU+EWDnWdv0fwOW4jhyzZHbnw
	nI/0EvtgSU/VPEmhVOEjvGklk4K8O1Ngdzr9phoVv0bdRmwERmsDukAoRmXAU5XXEa+xYOTrqtj
	DgTMo5d5beyTHoe3UE1mcEzqzFG7/pg1CoEV4vx7O+/Ls5eApf+9frMyJXozOxdva0e4B7NFA/e
	Y4Vv7HkqxxjmfHmpZlX+QkbZUVqeeI46mgyck18AGgadb2VE58mI19NO+hQ/ZsSvhUBNltvRW+r
	FXOp+5aVarmN6fcUaS84EN5kCGPO6/Hf6RiFK9gQtclgE9cM=
X-Received: by 2002:a05:600c:8594:b0:4bb:6816:127c with SMTP id 5b1f17b1804b1-4bb8328e7d4mr12662075e9.8.1795038047426;
        Wed, 18 Nov 2026 13:40:47 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3c6sm6361300f8f.19.2026.11.18.13.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:40:46 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: dwmw2@infradead.org,
	richard@nod.at
Cc: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] jffs2: check the data CRC of a node in RAM, not through point()
Date: Wed, 18 Nov 2026 21:40:44 +0000
Message-ID: <20261118214045.107562-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
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

check_node_data() points at the node data when the MTD supports it
and runs crc32() over the flash, which saves a kmalloc() and a copy.
That paid off while the generic crc32() read words (slice-by-8). Since
commit 5e3c1c48fac3 ("lib/crc32: remove other generic implementations")
it reads a byte at a time, and on a CPU without an arch CRC32 and an
uncached map, such as a NOR flash on a boot bus, every byte is a bus
access of its own, while jffs2_flash_read() copies a word per load.
The MTDs that can be pointed at today are cfi_cmdset_0001 (Intel NOR),
lpddr, map_ram and map_rom.

On an Octeon board with an 8-bit AMD NOR, with point() added to
cfi_cmdset_0002 (under review [1]), the first lookup of a 46.6 MB
file checks the data at 2.77 MB/s through point() and at 3.37 MB/s
from a buffer (16.8 s against 13.8 s), the rate of a plain read of
the partition.

Always read the data into a buffer. MTDs that can be pointed at now
pay a kmalloc() and a copy per node, as all others already do.

[1] https://lore.kernel.org/all/20261117214141.3826637-1-orgads@gmail.com/

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
 fs/jffs2/readinode.c | 65 +++++++++++++++-----------------------------
 1 file changed, 22 insertions(+), 43 deletions(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 1caabff9d..18a47b432 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -31,7 +31,7 @@
 static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info *tn)
 {
 	struct jffs2_raw_node_ref *ref = tn->fn->raw;
-	int err = 0, pointed = 0;
+	int err = 0;
 	struct jffs2_eraseblock *jeb;
 	unsigned char *buffer;
 	uint32_t crc, ofs, len;
@@ -61,48 +61,32 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 	dbg_readinode("check node at %#08x, data length %u, partial CRC %#08x, correct CRC %#08x, data starts at %#08x, start checking from %#08x - %u bytes.\n",
 		ref_offset(ref), tn->csize, tn->partial_crc, tn->data_crc, ofs - len, ofs, len);
 
-#ifndef __ECOS
-	/* TODO: instead, incapsulate point() stuff to jffs2_flash_read(),
-	 * adding and jffs2_flash_read_end() interface. */
-	err = mtd_point(c->mtd, ofs, len, &retlen, (void **)&buffer, NULL);
-	if (!err && retlen < len) {
-		JFFS2_WARNING("MTD point returned len too short: %zu instead of %u.\n", retlen, tn->csize);
-		mtd_unpoint(c->mtd, ofs, retlen);
-	} else if (err) {
-		if (err != -EOPNOTSUPP)
-			JFFS2_WARNING("MTD point failed: error code %d.\n", err);
-	} else
-		pointed = 1; /* successfully pointed to device */
-#endif
-
-	if (!pointed) {
-		buffer = kmalloc(len, GFP_KERNEL);
-		if (unlikely(!buffer))
-			return -ENOMEM;
+	/*
+	 * Read the data into RAM even when the flash can be pointed at:
+	 * the generic crc32() goes through it a byte at a time, and on an
+	 * uncached map each byte is a bus access of its own, while the
+	 * read copies a word per load.
+	 */
+	buffer = kmalloc(len, GFP_KERNEL);
+	if (unlikely(!buffer))
+		return -ENOMEM;
 
-		/* TODO: this is very frequent pattern, make it a separate
-		 * routine */
-		err = jffs2_flash_read(c, ofs, len, &retlen, buffer);
-		if (err) {
-			JFFS2_ERROR("can not read %d bytes from 0x%08x, error code: %d.\n", len, ofs, err);
-			goto free_out;
-		}
+	/* TODO: this is very frequent pattern, make it a separate routine */
+	err = jffs2_flash_read(c, ofs, len, &retlen, buffer);
+	if (err) {
+		JFFS2_ERROR("can not read %d bytes from 0x%08x, error code: %d.\n", len, ofs, err);
+		goto free_out;
+	}
 
-		if (retlen != len) {
-			JFFS2_ERROR("short read at %#08x: %zd instead of %d.\n", ofs, retlen, len);
-			err = -EIO;
-			goto free_out;
-		}
+	if (retlen != len) {
+		JFFS2_ERROR("short read at %#08x: %zd instead of %d.\n", ofs, retlen, len);
+		err = -EIO;
+		goto free_out;
 	}
 
 	/* Continue calculating CRC */
 	crc = crc32(tn->partial_crc, buffer, len);
-	if(!pointed)
-		kfree(buffer);
-#ifndef __ECOS
-	else
-		mtd_unpoint(c->mtd, ofs, len);
-#endif
+	kfree(buffer);
 
 	if (crc != tn->data_crc) {
 		JFFS2_NOTICE("wrong data CRC in data node at 0x%08x: read %#08x, calculated %#08x.\n",
@@ -133,12 +117,7 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 	return 0;
 
 free_out:
-	if(!pointed)
-		kfree(buffer);
-#ifndef __ECOS
-	else
-		mtd_unpoint(c->mtd, ofs, len);
-#endif
+	kfree(buffer);
 	return err;
 }
 
-- 
2.53.0

