Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205321;
	b=UxyHq/rIjjPh75BWOOX+QTSpxIskkn7+SWZ3veAVSyA6/206ArPRlLYfft1ktAhV8Mim
	 DDhfAtZ0JtL+WK54LnbPzlK3z3qExm1XQzL9x5wNj7Hq8GfeUJh9HSxRrDkr5lSIg2wKB
	 W50zMvZCyARyE9UVNaeBFaMAumxHjRNHPUvo2mXoP8R+E+iKj0AplA4B0Uhy5X02yIXf8
	 goO7IsN/B9/c4w6gITIuaXG9wGprpdaq0eqVqu33GA3VhyFIoaPt1jYFtOSf2ZT3gXnqX
	 Ot/Be7ZQ2EfRBknToyiK4rSDbdMtFiRoGZ8TlVozF8PVGU0NnrUNNHHPtSJFyw035KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TfKzkJmtwO3w9lSwQG9nI6f6Idy1UggKZRrUE1Xn1HQ=;
	b=J9zbHaU9cGLsAAM8n+30XMoS2ROc4bi3sGmi7TBn3sb4kWeQFdoLQ0pEfVTkkarD6kEu
	 XEy7LkwgZLESf3grZX/Prqry5TNHObkVY9HjPIYzGnjskUPsVx09DUgIrCW7gGuEFlgvr
	 DbRdGv+X3En4QLwGEOum5IsXy9Etc6qiBFsV4q6aJml5RyI0n5H9e5sgJm3/WeyGgQmMi
	 7NtKrj8yEgFk3WiSa5n4GKakaec3jLDvoZ8Et73v9FEiTHyESB0qOE57uyA0yqJ+CNSMU
	 caBqpTo+HWmiz1hKMDSGnM5Q3rvlETgznlmpaSgoP0nMkmOmH/vIbb0/1cpxc7e7PVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KpE8IRBZ;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C56606A6E8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C56606A6E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KpE8IRBZ
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-862df509d48so942395a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205319; x=1795810119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TfKzkJmtwO3w9lSwQG9nI6f6Idy1UggKZRrUE1Xn1HQ=;
        b=KpE8IRBZAAY7UqsVzaoSkjo0jHxfTIg3ERFTA/JHEiQi+UdiSXa2VOyv9DoeiB6Unr
         nI26gEdehVdKl2MsdtO97UXCXlm39e0n6gh81xKpPK8V65NB45VIod2+nE99yCc5FBrU
         kXLOVKoIZeu1mC4FiNf8YGRzdsXUxrsO5VNaknqUHwZH3f35RxSc45oRLBUmal9zal0f
         +Jp/VcvMuumrWUgmZnMOrjLKkPl3DAJeXnsgW7pWsE5C2SI3lBQ9JD4z++x0tl2hVzDB
         cBmyAyzN6/KKbFmlAxnhJCMDuENoBmEodHzWiwUvhNUKpROcOZ8BeIxpK5l+So95HbfV
         YZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205319; x=1795810119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TfKzkJmtwO3w9lSwQG9nI6f6Idy1UggKZRrUE1Xn1HQ=;
        b=2o+Y7wW+Llf01itfcEm7HQe9WtEbGbeHOvpTyUFZzurx8YvVsNJlenvehIhmK1nglb
         61OYN4T04jksF2zCyyhZdwd4alQjahEYkj0zyGADdSSVbrdovSWRVz5KPIQpyOZK8RHS
         B7VuSBkXRWCdDqNaOh3uuXHAM6MZVIAEBnI23AGUdt/84nxtS6OOA8ycpSCvmC5DzS4i
         U7vrJeefuCn8te/J4+L9CUYNWNN1XzeriM18gzsQykZUQyMlDAcSz4Ash6gxqvbdz4ES
         n4U++A9XeiTbXSZrM0V6bNSzLu2kqXlcYGKNu7ouhKYWoTE8LqgGfxmXAHGUeUUFh86b
         F0uA==
X-Forwarded-Encrypted: i=1; AL+hErH1Q5UJZD31dLk0MCg5RxtyY+mKIhuC5t19s2uhDaqd2EQ3UXrsqIhsEBMoO7IAe+P3szcKYMuoRpQftj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E6jlR+q/fCGLZbJzq5P4xXKg9DwRBcXDnulRWFEUoLKvAxKxY
	w+JNojvIfQoGMePRZB5HQEat/c5E1hGEVWotIbHrb0Ve9v70hz7Dy9CK
X-Gm-Gg: AYBFou3BH62+fS4FosPIHKNJbG3XZSvRQqfxw4xCq9NSdXNW3A2Om19JPMtss9GCasH
	By47iqB9/wtCd7zIJv2/n9hhZPIB8glJ2IliqGLwPeVMISYNh5B2SJZoJtaDj//krKBcjFeqQvh
	0SDMfOGv8veLifekpWXrOkvZ5NXCpHAzx1P51xoXwRp6WxMuwhtQ+FIPLmXfoT5hcpFvwhKw+dv
	gHp9W2gH6CH105aYdA9rJgCEIKDFVdulOQ0j8GJp+Yh8Vjmc7c0pI8p11kyutYo1mlHKTT++32W
	GJjCtW9zRs5e7D4nH2m3Jf93ERRyr9awuQmSxswDU2zXXoV1IIOqaX3LL4PqxiDpKC/35zTVu8H
	MJ14W4Ta1LVkAX7srRYmlAY/unyS/nmB0LBhM9h4dD5lUCCAnqnVZexp4Ls3x9j7Pt84nSWeSkL
	o93oRaHxLPThGZgs/0gGqgHfEFTcD9kzSZLpwOmT65DrctBEOTQMKdxd+d0S6cfqvRGkL1benlC
	JutJiyfK6jFTjKlBWu6ut2Qb8zrkvuxBrlY4OHRJNG9cr0Hvy65niJpAWGKlwCTOJe4W+9qXLrs
	aAxomp/UFzr3YqY2MqNHK1j3B/WtV2V1j21dmZOaddyM20Xbng8GlgZjLLv21K7um141LAKAiLL
	oKNlnBdzQ6aL8hSQPgNVhxSOrb+Oevha2lSex8IbzZsHM0zVMGsrle1G1SFmUDJX+2RNwUuE1jg
	HQdu22RJkD86Wft+b5Msx1wut8kRbl8g8Ww61ewDeXqJzzntHQUeMr
X-Received: by 2002:a05:6830:3143:b0:84c:58b:417f with SMTP id 46e09a7af769-86315491026mr4789532a34.5.1795205318952;
        Fri, 20 Nov 2026 12:08:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:32 -0700
Subject: [PATCH v3 02/11] nvmem: drain keepout and cell post-processing
 accesses
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
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-2-523610652402@gmail.com>
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

A provider can unregister while a read is still walking its keepout table
or running a cell's post-processing callback. Waiting for the register
callback alone does not keep that provider state alive.

Take the SRCU read lock once for each register or cell access. Use the
same operations pointer for every chunk, including the reads needed for
a partial-byte write. Unregister then waits for the entire operation;
new accesses fail even if they would only touch a keepout.

Fixes: 6a7b4134fb7a ("nvmem: protect nvmem_device::ops with SRCU")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 110 ++++++++++++++++++++++++++-------------------------
 1 file changed, 56 insertions(+), 54 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 03ea878874e4..32d36ca904cd 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -54,32 +54,18 @@ static LIST_HEAD(nvmem_lookup_list);
 
 static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
 
-static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
-			    void *val, size_t bytes)
+static int nvmem_access_chunk(struct nvmem_device *nvmem,
+			      const struct nvmem_operations *ops,
+			      unsigned int offset, void *val, size_t bytes, bool write)
 {
-	struct nvmem_operations *ops;
-
-	guard(srcu)(&nvmem->srcu);
-	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
-	if (!ops)
-		return -ENODEV;
-
-	if (!ops->reg_read)
-		return -EOPNOTSUPP;
-
-	return ops->reg_read(nvmem->priv, offset, val, bytes);
-}
-
-static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
-			     void *val, size_t bytes)
-{
-	struct nvmem_operations *ops;
 	int ret, wr_ok;
 
-	guard(srcu)(&nvmem->srcu);
-	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
-	if (!ops)
-		return -ENODEV;
+	if (!write) {
+		if (!ops->reg_read)
+			return -EOPNOTSUPP;
+
+		return ops->reg_read(nvmem->priv, offset, val, bytes);
+	}
 
 	if (!ops->reg_write)
 		return -EOPNOTSUPP;
@@ -97,17 +83,20 @@ static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 	return wr_ok;
 }
 
-static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
-				      unsigned int offset, void *val,
-				      size_t bytes, int write)
+static int nvmem_access_locked(struct nvmem_device *nvmem,
+			       const struct nvmem_operations *ops,
+			       unsigned int offset, void *val, size_t bytes, bool write)
 {
-
 	unsigned int end = offset + bytes;
 	unsigned int kend, ksize;
 	const struct nvmem_keepout *keepout = nvmem->keepout;
-	const struct nvmem_keepout *keepoutend = keepout + nvmem->nkeepout;
+	const struct nvmem_keepout *keepoutend;
 	int rc;
 
+	if (!nvmem->nkeepout)
+		return nvmem_access_chunk(nvmem, ops, offset, val, bytes, write);
+
+	keepoutend = keepout + nvmem->nkeepout;
 	/*
 	 * Skip all keepouts before the range being accessed.
 	 * Keepouts are sorted.
@@ -120,11 +109,7 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
 		if (offset < keepout->start) {
 			kend = min(end, keepout->start);
 			ksize = kend - offset;
-			if (write)
-				rc = __nvmem_reg_write(nvmem, offset, val, ksize);
-			else
-				rc = __nvmem_reg_read(nvmem, offset, val, ksize);
-
+			rc = nvmem_access_chunk(nvmem, ops, offset, val, ksize, write);
 			if (rc)
 				return rc;
 
@@ -150,13 +135,8 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
 	 * If we ran out of keepouts but there's still stuff to do, send it
 	 * down directly
 	 */
-	if (offset < end) {
-		ksize = end - offset;
-		if (write)
-			return __nvmem_reg_write(nvmem, offset, val, ksize);
-		else
-			return __nvmem_reg_read(nvmem, offset, val, ksize);
-	}
+	if (offset < end)
+		return nvmem_access_chunk(nvmem, ops, offset, val, end - offset, write);
 
 	return 0;
 }
@@ -164,19 +144,27 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
 static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 			  void *val, size_t bytes)
 {
-	if (!nvmem->nkeepout)
-		return __nvmem_reg_read(nvmem, offset, val, bytes);
+	const struct nvmem_operations *ops;
+
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return -ENODEV;
 
-	return nvmem_access_with_keepouts(nvmem, offset, val, bytes, false);
+	return nvmem_access_locked(nvmem, ops, offset, val, bytes, false);
 }
 
 static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 			   void *val, size_t bytes)
 {
-	if (!nvmem->nkeepout)
-		return __nvmem_reg_write(nvmem, offset, val, bytes);
+	const struct nvmem_operations *ops;
+
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return -ENODEV;
 
-	return nvmem_access_with_keepouts(nvmem, offset, val, bytes, true);
+	return nvmem_access_locked(nvmem, ops, offset, val, bytes, true);
 }
 
 #ifdef CONFIG_NVMEM_SYSFS
@@ -1649,10 +1637,15 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 			     struct nvmem_cell_entry *cell,
 			     void *buf, size_t *len, const char *id, int index)
 {
+	const struct nvmem_operations *ops;
 	int rc;
 
-	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return -ENODEV;
 
+	rc = nvmem_access_locked(nvmem, ops, cell->offset, buf, cell->raw_len, false);
 	if (rc)
 		return rc;
 
@@ -1708,6 +1701,7 @@ void *nvmem_cell_read(struct nvmem_cell *cell, size_t *len)
 EXPORT_SYMBOL_GPL(nvmem_cell_read);
 
 static void *nvmem_cell_prepare_write_buffer(struct nvmem_cell_entry *cell,
+					     const struct nvmem_operations *ops,
 					     u8 *_buf, int len)
 {
 	struct nvmem_device *nvmem = cell->nvmem;
@@ -1727,7 +1721,7 @@ static void *nvmem_cell_prepare_write_buffer(struct nvmem_cell_entry *cell,
 		*b <<= bit_offset;
 
 		/* setup the first byte with lsb bits from nvmem */
-		rc = nvmem_reg_read(nvmem, cell->offset, &v, 1);
+		rc = nvmem_access_locked(nvmem, ops, cell->offset, &v, 1, false);
 		if (rc)
 			goto err;
 		*b++ |= GENMASK(bit_offset - 1, 0) & v;
@@ -1746,8 +1740,8 @@ static void *nvmem_cell_prepare_write_buffer(struct nvmem_cell_entry *cell,
 	/* if it's not end on byte boundary */
 	if ((nbits + bit_offset) % BITS_PER_BYTE) {
 		/* setup the last byte with msb bits from nvmem */
-		rc = nvmem_reg_read(nvmem,
-				    cell->offset + cell->bytes - 1, &v, 1);
+		rc = nvmem_access_locked(nvmem, ops, cell->offset + cell->bytes - 1,
+					 &v, 1, false);
 		if (rc)
 			goto err;
 		*p |= GENMASK(7, (nbits + bit_offset) % BITS_PER_BYTE) & v;
@@ -1763,10 +1757,18 @@ static void *nvmem_cell_prepare_write_buffer(struct nvmem_cell_entry *cell,
 static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, size_t len)
 {
 	struct nvmem_device *nvmem = cell->nvmem;
+	const struct nvmem_operations *ops;
 	int rc;
 
-	if (!nvmem || nvmem->read_only ||
-	    (cell->bit_offset == 0 && len != cell->bytes))
+	if (!nvmem)
+		return -EINVAL;
+
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return -ENODEV;
+
+	if (nvmem->read_only || (cell->bit_offset == 0 && len != cell->bytes))
 		return -EINVAL;
 
 	/*
@@ -1780,12 +1782,12 @@ static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, si
 	if (cell->bit_offset || cell->nbits) {
 		if (len != BITS_TO_BYTES(cell->nbits) && len != cell->bytes)
 			return -EINVAL;
-		buf = nvmem_cell_prepare_write_buffer(cell, buf, len);
+		buf = nvmem_cell_prepare_write_buffer(cell, ops, buf, len);
 		if (IS_ERR(buf))
 			return PTR_ERR(buf);
 	}
 
-	rc = nvmem_reg_write(nvmem, cell->offset, buf, cell->bytes);
+	rc = nvmem_access_locked(nvmem, ops, cell->offset, buf, cell->bytes, true);
 
 	/* free the tmp buffer */
 	if (cell->bit_offset || cell->nbits)

-- 
2.53.0

