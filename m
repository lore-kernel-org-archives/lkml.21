Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106552;
	b=LNX1H1juhUwPV6GuJdN/TDfQ5UYxXb1jiB1ETgIvQKYrOt2i5lpwP108vcnY1FKGMCtI
	 hRTZifgZ05kHl7iVQNWDn39EsEfu6E9RUUnzgxYSedT66Iau64AY9HZoB7HpV+gIOlEUV
	 z2SZY3QrqTIJSyWgJp1mGljVNMPaQcerSRYUwBB68QdXutFDTNSh49v+g0fuSSe6VjxrL
	 tReqsr3B2ihJefL1IB/QojET/YVptjsIkN4+wJTqPh41lnoyevS2kFzmHRmOsS3mXXKZZ
	 k68sXxWEAXk5PSQenQOG3EmAvN8kyH0GWkWAqI+jg/cm2Lf9fdmJZ4iMLo38xDknWVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TfKzkJmtwO3w9lSwQG9nI6f6Idy1UggKZRrUE1Xn1HQ=;
	b=i2nkluqWaafMGUqUUyIu9eSlyNGipQ/IXI3oZ3DZGJj19BSSvDy3v5s5xwwJsIWyxsNp
	 udKJIXCFJEuYCHerbLakOW0vb7d3+nZIJ2N/GRMIwL/lmAU8rAsK2WY0gH4l1lZLxHetF
	 a8LU6kwibV9MhDTKgAV3dHTdkfbjDZZa4Rl0UHWTzHi/XqOODB6ou79JIM0hKt1rjgQ5q
	 RU/5UrVtqTnKU5AWwbR2yErABMPAotM1OBLmcjQ9paDoDDpgMnSm8C/5oUYrqRe0APcM1
	 Pboyhn1+SdBU32jquKMiyKlFuiC1P20bHBagN0Snl9sQGP26dDAOmIX5JmZhI/Fslwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JSG3Rnys;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F6A60A2611
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F6A60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JSG3Rnys
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6ddef424972so2063645eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106551; x=1795711351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TfKzkJmtwO3w9lSwQG9nI6f6Idy1UggKZRrUE1Xn1HQ=;
        b=JSG3RnysIdY/UFIksmxpu8l0P/COJD+wyfmmAbkOVCGOyEkO5tbOvD5hBYgc/IzXtl
         GJdUhG9C28lpMR3+Qa68rCySUs2sJjoRifzEZ57YrbytOdzwXwEaAZ1YalYmMxxh9tXc
         eJ9sf0QljIyQsQNdsR0UlC3z+omLSfxJMIb28+KLmNMOZ1nWB9lTaXQwqOiSdDUbwHeX
         JtGy/iocTIOZvy/EbwSk0cXUMvq57hs+H/MmpU16LW1akIJ/0meOOSjvvH+ppSjHzszm
         J7B9nkgY4RHakASaafgLaIOlRS3J6ganyaRc7+QEeMy7VZvW76rcOIBlFWNeIiwKOsG4
         ZM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106551; x=1795711351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TfKzkJmtwO3w9lSwQG9nI6f6Idy1UggKZRrUE1Xn1HQ=;
        b=N32GTYabKmFLPOABg/tYuJMPOBb9LtctPRWRhct8IcPx4zX8F0SwTz6qXiLVk/Dkq7
         mOZCyRYbZX7xGDzS736MzG6hK4qScti4a26gldGR2D7/dpWGeFQNXRju9xlBo3yYj0ti
         Yv13UkzZlBqjLj5fAyxBknhaSAt0ZG5yK4d4TjNcZlAV9bfBO6qi/UEnizzoi9i9MUv0
         CrNFnRVxxnSkHelJ0td5GfVugG5qgAZDfxFZK171m5zEg1kd22wGSfOQ9mfkk/wF0cb4
         lRidVt08mpJihRpftyhGtUb+dmjHd+QDldD74YwTaqw3KjToSbmUzs5ysh5Kd/CSEFif
         COyQ==
X-Forwarded-Encrypted: i=1; AL+hErEa+YuRWXF+ZVtZt2V/j8QOSuvKNu5blgTajSZHDXMbsTSbtLQGa2MQrTszjf8ldK6b/hcpDO53R4Xl/48=@vger.kernel.org
X-Gm-Message-State: APuU4Z8t3kKkGhGTSGSBhQnl2hzJMW52kIzOinJxjpYw0GWk7zFiUu1P
	1YWFX710FdcPqgzQ4lpuuF2/kJ2ZJNHRQh9xpBciCiV6KYSct9k6T2wo
X-Gm-Gg: AYBFou0g9/1bgTSqCa0ZrQgj06Ww58jM2lqGIVSBTnR36PkQ/Ooq0xED+8zZWxb7uox
	Tla/xSeNkp7v5PMX3iNOzeigBjSqNb0IfH3Z4Q4i1WOI+CK4iHm1mP+sel1pl27LB6h2LRfm2sQ
	aqFa000+T7dTOrnRqMu20B5ne3L7Az8cr35WpcSizPfVmCdcINiGce7tvpBmHoEBTzTHxu+N7lD
	6sNBnaC36ouh3arIPVrO3tfRGkAQS0OWn0kj3z6AAXruaKNKIS+T47dGiq4+UzpEU1IgvuxC5dg
	wbT9FUPwYFTE8p1MEfDErX63uXAbxPOZySOAZKwhfJ3LkVSYTwinHkXcFwcuT1Ey4qDThlYnrqO
	Ecwe/y1kVDb4Z4RBOebIWbCg97gxAA0X/VtVBgO3uNoxSjNQwkN4+lXAFcjIKpFhFND2MX4GNRf
	XcddrsnygVitXt2LRd0KBcIsLYetd7eCmw7kkdrdX6O5hNibDR5wfQUM3b65LOD39RBTlJSc5/w
	BvafEud71J4W/cBhg0ylMlh2pdrGAR02hSsvzPcmPLIT8RRolNRhW3QjiZ3JcDDyeYfyBnW1BxI
	EIC3NeE3C4FRxu2yHcFjKLwQOpFtli5CJX/KGHt9qHTftJY1ONYMk5SbYT6J7Qo50DRhnlJKPJe
	mDtYFNt+1+YaigciyDD3dV4ZSq2cX3N7XgPFIFpBOTCFkWStbKns6oqYfvfnntef6P/glmpbAl6
	KEi0Jo1YQZx81EmBz1gk4eqvL0hxQ9//fZD5cm1v2hRdPrQjZj+9c=
X-Received: by 2002:a05:6820:4186:b0:71a:e4a8:bed3 with SMTP id 006d021491bc7-71b3957f53emr89958eaf.77.1795106550861;
        Thu, 19 Nov 2026 08:42:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:00 -0700
Subject: [PATCH v2 02/11] nvmem: drain keepout and cell post-processing
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
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-2-8fca3ec5f18c@gmail.com>
References: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
In-Reply-To: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
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

