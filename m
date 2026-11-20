Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201197;
	b=YuT1qwt+ilsi39WWcv8xlaGBvJ5japoJB1AYH83zQdcXyhXRQcRqrrFMU+FRp932d0D/
	 R4TAA9iqMn7f7TLlD8QJ8bFuYU5Apu2H8HUYTk6ZAUzI8Y5A4rTSAblgx9uyoT1w25d8m
	 3c+wfqBQDIVMxCydftFy9P2i1kM7MTjzzJ8zDkgJnvHneJ3dOMmEf+G1cjgy0mzf6keRI
	 JzT6usx8Nd+PhnI2Iu6EKexh9jq6jjhPaVp5DcXfywHxXQAQc+snSqHhz/2dxusrE6IeG
	 /EtI8FkVt3u/kbvO25d7zD8g3pZ2KlxhN1jUkmJO3/Gr5ed4twCi2vn9v0VWUOR37yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y+xG+koXTgpyKRztQQCKLUQgqoHofBaalUCYpzlKwFk=;
	b=pBjGSWV9W0DquASpyPUl1Ug0Aj/Q8LQzBfRLA2q4yYOGp/4PWIrbxNhSNwcO0L/R5CF/
	 joqO8St71u76LpPWwpf18+JYC4Dqnt2n/OdTDOGirJPN5yv6J5p/H6fRQhtcezcjXAPpS
	 cSmYef9RSRl+WO/9vmQWOScfmweH1ZRvGh5+3IBHgEc1bnMt63sw1gM7S+7N80lGNGJJt
	 2q1yIoO0AtIl3+zs38BC2MAn0Y5+Js1AgE5rf292oOGL4RlCwVQCd7bLIQ4v4Rdk1kX/g
	 rvcmrmLI27RMec4YLh/g86LhWnwXtMB1+OrWuqkVDhRRq3tTWr5vodluv0lfUYjSKMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZwJ3I/gf";
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4F760A2630
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A4F760A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwJ3I/gf
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so492711966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201186; x=1795805986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+xG+koXTgpyKRztQQCKLUQgqoHofBaalUCYpzlKwFk=;
        b=ZwJ3I/gfafwZiWA5aZDcO+609t3J7/x+kBEjaZHwXFdrLDUlZmBT8ZKqFYEwEX7Ob8
         ykNW7FobzosPR+C6Sz0Fdw5qJiQq/GIeyyFcKZxvMxXR+Mka6M74WbVWT45oTZIUatIV
         8qtng2vGdvk7OiLUYXL9BKQD8WEfaxScKpXsHREyR1kMEYzXCPF0d4vlUq426eD23JQO
         UtO4CDbwI/qfXZaOZoj9CxO3BVYjizp3+kddEc0R8JHtenCT8+yKt+elCXEWaNirbrEE
         03HYg0t7D/tzdeAPq1IF2ALgqzNFdFwBod+xSdSg0rTQRrJPksXrmsInAitjjot9hPYn
         cC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201186; x=1795805986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+xG+koXTgpyKRztQQCKLUQgqoHofBaalUCYpzlKwFk=;
        b=MPoH2dg/p6TvU90vl05Bopn3Ev88zBJYN+3TrLh+XeJbTsYdEF3J9w7q+/9PBPAtaB
         yclrj5HZDSIJAdU8Hrc4i3ZijofqeCjh5NJrVHLWXsEgT/06IMWTAI7j1RVofJIVzqA+
         DdN9RJGv7ZZjaKVwpF/P2mliqpc/X/rsKxnGu9zyM8jDA07BRFbZ0Ww3QIppJb3B4nKf
         KEUMTmfgsqb4YQxKMy72bcWfkU6Xtsq4gjL8NqTpqoK8PrX2G16nCEXf4+6Q66I/d+uC
         fCsmICgdFMRh4Mv5S4DNAZJ43X7BP4CzJ7H42ML/69Sr/sD8n7G/5jgUVFrhII5LTFql
         Y5Hw==
X-Forwarded-Encrypted: i=1; AL+hErEhuq3GUtR1ETOR2FMKU4A4tppKpwxrkJ5MwgWK6q9mvmgSEoAP3l+qGk1hPDe4rDFn1spxxoBHLvIHGQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z85M/qtn3eB8Kr34I2uq3Qv4j+1w8e/GzSyEwV6xNxn+CAPS4K7
	hEX2WhmXQEnauCLeHCtHw+6zL8/8afFf4hKBlFY/16wo2tPWlL2/nvgO
X-Gm-Gg: AYBFou1fiXDEBacyWLgOMMLD6IPCjnzd8ArZel4HNd0s7Yv+9LOqElAQ3BUjwjgsm0a
	cZ7/W2yCdX/JkC46OFxG86DgSvIRwf3B32nS81dm4H6AkPgeRYm6qyfFF+ysfDDWz0fyppOn1bH
	xaxgD/UDyOyN8TOHBdUeNR7+8ais1PnHIySXFHmP4pEwfHLxqTGvJkQ500ZeovmaCtrLHC0rs7Z
	H2hyJfetTxZKtr7YkuSzv4u7j7cqjsSo0y3y3GxLIMQH0KZq4xJoq9qfIr9ni4g7GVn873ZyvEq
	5bmC+aPBqI0+KRcqvh4PYT9KYeF969LJOV7bMj8VX1qRmPS1JL2OneRDqf+oig0kxCD8bi97vMF
	oB867KxBkMPCo8QLmjFwTz1lQ52+ZjiYmmFn+OM+4RSEUfD0dWltHflSyvuLQOKenVGpMvspJ2+
	bqp+k6HyH4+p4ud/gimcJNQvIDQjL8ru/IlEtK/d8H53Z7rK1cKZOJQmRWLbLTwgmqUlmdwf9j0
	47SlgKU8TnXBIP/fJJZlv1xDbVOidjQ3m0u1osWqXcgGpADevWQmRJ6ULPPTVkhiR0jX5T2HEX2
	9M+4+1AYiiF9FI8snO6pG4WA/ijVF5pEEgGdBSgxWLR+ZvXlD0sx+jcTwrfElG0=
X-Received: by 2002:a17:907:2d23:b0:c40:2439:4d9a with SMTP id a640c23a62f3a-c51319c24fcmr565365066b.28.1795201186217;
        Fri, 20 Nov 2026 10:59:46 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm125205266b.85.2026.11.20.10.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:45 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v3 0/3] i2c: omap: add support for DMA
Date: Fri, 20 Nov 2026 19:59:10 +0100
Message-ID: <20261120185915.150228-1-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Hello,
This patchset introduces support for the TX & RX DMA transfers in the
am335x/omap I2C controller. I tested this implementation on AM335x 
(Beaglebone Black) and things seem to work fine.

Kind regards,
Antoni Pokusinski

---
Changes since v2:
* dropped patch "i2c: omap: remove unused is_rdr and is_xdr function arguments"
* added `omap_i2c_disable/enable_pio_irqs()` helper functions
* probe: added `if (omap->dma)` before the DMA free
* xfer_data: signal DMA completion in the case of NACK interrupt
* complete_cmd: signal DMA completion in the case of bus error (e.g. AL)
* xfer_msg: removed incorrect checks `if (!omap->cmd_err)`
* xfer_msg: added handling of DMA/IRQ cleanup in the `b_hw && stop` path

Changes since v1:
* new patch "i2c: omap: remove unused is_rdr and is_xdr ..."
* probe: added `goto err_dma_free` instead of `return`
         in the case of failed `i2c_add_numbered_adapter()`
* changes in XRDY/RRDY, XDR/RDR interrupts management:
  - init: do not enable the above-mentioned intrerupts
  - xfer_msg: enable the interrupts before any non-DMA transfer
  - xfer_msg: disable the interrupts after any non-DMA transfer
* xfer_msg: added checks on `omap->cmd_err` to catch
            NACK or AL error occured during DMA transfers
* general: moved scheme-related macros to the top of the file

Antoni Pokusinski (3):
  dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
  ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
  i2c: omap: add DMA support

 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml |  12 +
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |   4 +
 drivers/i2c/busses/i2c-omap.c                 | 373 +++++++++++++++++-
 3 files changed, 368 insertions(+), 21 deletions(-)

-- 
2.56.1

