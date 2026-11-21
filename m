Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223470;
	b=P0wKMKZ3TksUhaEKkNm7KLwluqUSe/4Fzxk80TeXAFWiTV+bdgq2mm/WZDiTr2+Pg7Ya
	 W+VMKS/umU/jUTtA4FgMv9qpBks/RQSd9hNiKByupkdDr8YbWCuiGGVtELGMF+7G2VRuN
	 WVZfjJPSU74Uc74OLBYQtorTNCwqjWdTpmN6gjFWjH+3XXpK9XlVf30+jESGBhPvkpvEG
	 yGD4fviw3djp0G+pHfg2QrDnnvqfTOb7JIb2s/hUJnRqJNV9vV3ikBYent9hpT3rV52QZ
	 oX7ke+cb7RX2RfYjrr794rjnrzFD/h6TBzB3oWDf0RXgdNr0aeUnHsJxpY6W3e0u4NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qRrftGPwx46kokq6Qlnqorb+rnqytcdDxCR8IL9gaTA=;
	b=iEtjwQZC/SkUUi75x5hN0IH45WpWDqg+GOW5nrbxl/c3TFeSn0RFD2nt5VOluXM8FAtD
	 ggqs01GHu8ixCezl9cW6PJU2c8/y6t/PrPWXZTCUUrjSph0iWoPnioK0YFigiN9/5fu8h
	 VQwjhfM+4eS83R1R3lrp9SJIX+wayMXAv6/JOcOZAcMdlJ+UhMMnGnULvxQDAUKmAM6FP
	 k07Xen+P8RqONcw6a0LJ+OsxvcmqOgvM4u2R9i003gLQR/oYtaRCpQKJh84/T24sVeXI8
	 0E22s+JDnL6zmbaraUp0fGCfR/kLesh6UnOWlE+u2hotXt45YmiMNWhdYhMTJHX2GZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urHA8UV9;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E31606A6AF
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E31606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urHA8UV9
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4adea5b7a2fso639881fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223462; x=1795828262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRrftGPwx46kokq6Qlnqorb+rnqytcdDxCR8IL9gaTA=;
        b=urHA8UV9aC9N/3eLeoNbfkRK7TFK+v/AKaDDkdh9ymQgcv7WDKnq1ql//pWdy6BGUH
         NHHon/zLIuUbD9ipU9zLNKXcK0P/b6hKHsRqZkPk/+GJ5mnFZXffcAcPYEYwLB1bjVbI
         4fnEXZwJixKEu0gmRZz8fwEYqggdEpXx6WlkS1FMBosr78lB9WiH01IMcRT6T8NtNasY
         2iqs0aMTllNEzFaBVg7ci+F9anEN6o/Mh8lHg0wRTW2LpQlsE7vZDyGBs2mtq6A/oMhi
         8261VDcwywEe9wb8uWyL7OiLPyKt+lYe2pXkzlVILuoxpRhzCHtWjOxKYN+Vx4OFkO23
         IOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223462; x=1795828262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRrftGPwx46kokq6Qlnqorb+rnqytcdDxCR8IL9gaTA=;
        b=nGDycz9LUGD3mVZAAtcNtMh1xnnz9t/KS+1dNooxIaw2VeYGlcRG4fP7lA5HsZcjIz
         mxc0zhrmR3TRi+e2KCTmKBkskbV3DrwhTCdvO0cvuvRw8sIO0GxwOEsfSMyaV8Wo/pWT
         yKWpDJdVv1Vj57BX9Gs6WxhUVLSv2WLSkaECZ3G6zZpLDqHQpe7hOL+wHxHsfL+G0/gh
         ceuVW4VoWvxJA30YNOw7JynB7nnQ1jPLopQgvbRPY7xCsS4DnsGx+FQ8oIzY17UDgyIT
         +qgvuN/Lr15i51YGDY8IYb3pkeSLY1EvlcMCSFnOrHRUn9s6phNL4Zg+xovVQUExBhn6
         UvtQ==
X-Forwarded-Encrypted: i=1; AL+hErEiY/fN84XyTjyXa/mUF0D7gpv3h4ZtP1pxJar11bEmf5lPIaCqDiBB3XL5LjmjHWwvfYbUL9Jura3AoeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GJ9lbU4xMqLdSC0j+Na0A/wNSNvsLjkpM7LkKsClOAeNHzMz6
	JjOzfra0tqUTlxUBpTObqvuGRi8koyt1A0tGNb6v7AAkHXCrkyx8I1g6
X-Gm-Gg: AYBFou0detES8uus47rVY5HSViGmoSlYuqxi7t7Yu2riMEtt0UGHh/jZIhaCiYcBFBl
	R9hkPspdv/Lqpyi+KtJIXBROWcBw2bRsPwPnMaQyDuHQZnZ4Pykjgpw8sqlZ5s1ecegYS35Pk5c
	++beWuINFvqi9d0cFsaF71krkhTa/PAaabJcf4X0AHW+3IwPqbp2VdCLeBDtI1HysbXviSyU5tB
	NlTkN9+e73WU6P7h8T/JFmtzn2lmHy9giovvG/O+JQs9jXR1c6Vyi1c2WHX4gTvZ9e8ZYJUSYzP
	/qvJahv9tS8AlMsWXd7c3J5bj+jgmk7Dja931cKgHEiQwCGcwqV0YlufyZ3mDXnYcIpZi5atdI8
	NF9cskKZDn7YsdfSKx97OatIUWtap8lCISkPDExYpyGMASRRpwnwA5xDIkfO91a4S2YRR/XExYU
	2vwKcWWdXc5YRLlV8NQ+N8UacFi9kJDjVM3Kwqj3qhdkqLZaOBhTK57TUqPKTTevKT9ih4MfGA0
	zwCshrQxdvl5UreFIP2lYzlI5m4nCHoNXWe/MsavkM1vp1zeX3Dy77PhW9aRQ4Kmwi11sFbCpBM
	jt2sTWPOkCv9Fg8TbY1EisQn0hHZPUXmcZiEHOgyAQUBINxY/W1cRK/IqcdjAOLg43U9QKVXG07
	slSmSJthVuX81Zuirnp3oEE+t7Jmb57fk1R7XcH7Bj2bsxftBT2kH1vvMNCDM9xUnTOeE8N3C5K
	d2RAZKzTzh80I8eJmFwnhc3MlQHa+nBfNxH+ZwcsfT76vaniIhzQyT
X-Received: by 2002:a05:6808:e8c:b0:4f3:e98f:fa27 with SMTP id 5614622812f47-57a09c1107cmr6207418b6e.16.1795223462573;
        Fri, 20 Nov 2026 17:11:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:28 -0700
Subject: [PATCH v11 05/26] mtd: rawnand: sunxi: reject ECC layouts that
 overwrite the bad-block marker
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-5-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

On 8-bit NAND with 512-byte pages the factory bad-block marker is at
OOB byte 5. With a 512-byte BCH16 step and 32 spare bytes, A10 and A23
can fit all the parity, but only bytes 0 through 3 are user data. Byte
5 is generated parity: programming a good block can change its marker,
and a mark-bad write cannot set it independently.

Reject on-host ECC if the marker is outside the two bytes reserved for
it by the layout. Leave the on-flash marker at its NAND-defined offset.

This also rejects some configurations that used to probe. On A10 and
A23, requesting a 1 KiB hardware ECC step on a 512-byte page could
trigger a fallback to software Hamming. That fallback kept the
controller's OOB layout: its first three parity bytes occupied offsets
4 through 6, including the marker at byte 5. Selecting software ECC or
no ECC explicitly does not install the controller's layout.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ffbe851b87c7..086618dee999 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -221,6 +221,7 @@
  * On H6/H616, this size became configurable, from 0 bytes to 32, via the
  * USER_DATA_LEN registers.
  */
+#define SUNXI_NFC_BBM_SIZE 2
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
@@ -1939,14 +1940,9 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 
 	user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, section);
 
-	/*
-	 * The first 2 bytes are used for BB markers, hence we
-	 * only have user_data_sz - 2 bytes available in the first user data
-	 * section.
-	 */
 	if (section == 0) {
-		oobregion->offset = 2;
-		oobregion->length = user_data_sz > 2 ? user_data_sz - 2 : 0;
+		oobregion->offset = SUNXI_NFC_BBM_SIZE;
+		oobregion->length = user_data_sz - SUNXI_NFC_BBM_SIZE;
 
 		return 0;
 	}
@@ -2099,6 +2095,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	if (mtd->oobsize < sunxi_get_oob_offset(sunxi_nand, ecc, nsectors))
 		return -EINVAL;
 
+	if (nand->badblockpos >= SUNXI_NFC_BBM_SIZE) {
+		dev_err(nfc->dev, "cannot store bad-block marker at OOB byte %u\n",
+			nand->badblockpos);
+		return -EOPNOTSUPP;
+	}
+
 	ecc->read_oob = sunxi_nfc_hw_ecc_read_oob;
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);

-- 
2.53.0

