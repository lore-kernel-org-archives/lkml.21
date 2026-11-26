Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674455;
	b=nSMydchZ56DZ8F4U8Mkv49258btsDXczG7Ed+pwHH0xXleop2OmPhmdfJlzVwa1e9zmO
	 SzJGSX5Fag/fMSWDuyvk/PpxQ/B14BoEM8muuG9VZIH0zAMxvRq6Zb6poXEIpgOhd8GmR
	 O1t93+gP1zXAPpFxCGgo+7597UBqqwqQCTGkrTpGcpdrSzVOH4a8NS3OAHZ23GdSj27gp
	 gkwY5xLC5Ti03ua0drUQm5Wg5/4i0uqoJv7lBtBOgkmTUeoqGkwaofHrOFLzu24zBFJWr
	 3uYjZUaMD4wNUkOdDhbRuAXX1raxEfrGZczDorW0CoQeSMkVOzYGosL2t+Vb3G+eV7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RsKnYZ2E8rNUTMuCEjickezj/V8M/hHJIbnY/NMWVcQ=;
	b=SpFVzboc6MbrYzqaZEAdnY470cPq/ofdo23lxjwG6vberCgh6d8HKpU8xinEZ3bAA/ez
	 d1eY+DmP12DSAcAJCC0z47PIjjAOn5VotIDPrsuGEfjLvA8bQfDgCKXZl4P8uh6VCZ+6y
	 1EwHzMTFsCO4Dr2hZYJkjHJspBCMuKCldgcyZ0rxxmRj9yMw1iNCDQ9zqy6vPXSnUqp6g
	 2WM+iIWkx/yk1NVFeG5f7hQAjLqvqk0hOVArcNOOuC/fxSAAJP4SLWC2a9+mY17wHAjeD
	 dEh8rLLFtQ9A3nn8Yx7o0BhrFkopCCaf7tE3WGyc8LDkJr9DYNKfysF4+1NeWuo7rBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0XOwnmCz;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D963606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D963606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0XOwnmCz
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso3996183a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674454; x=1796279254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RsKnYZ2E8rNUTMuCEjickezj/V8M/hHJIbnY/NMWVcQ=;
        b=0XOwnmCzTDGf0x9VRmaVoGzWAWioDzfvw2VWEQkPAUNR/EJ/0ZlL+63pXnpiFWeSGl
         Q+5rFbQBZdVduicnpEUpyFwMPLn3fo72RFmD5O1ofYFicJp1GuHDj2M4XStk8hO5S1No
         Ne/mcRkiOwxEPsTwwIrFF9bRCId0EtiKb9+d/twj2c0fpNrF2MZDeog7IqeJxvd5VJLf
         C+zKKE4seyjziIS6DYVPBSLpQ8zSwn665Wx8Qn1zNHdPgGXqcK7igekTOv9nz47J4m6P
         VuyKZkPUBtiSMd0gV+Hi+/34bzN1KUtV3radSm/f3AdjY+13+Fdt6YOSZxTaZCzzU8SV
         sCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674454; x=1796279254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsKnYZ2E8rNUTMuCEjickezj/V8M/hHJIbnY/NMWVcQ=;
        b=JUBc9iN42aBchoZIWFs9h+xUQW3aphGBPrzA4PSsOGwNnreCyGWoJBMre0CRpeiEPY
         tDHNtLr2FW57XimPZJObiALWC3Y948e3X1M0LaCC9EF238T2hftQbn7uuQY7Qeck2oJJ
         G0tQu8RTH0m1McjXnykaGGzDg9VHl4vCGLmC48IkhDnbqAqPMCtOcDkI1Ih7zLTWVwpO
         scN34LvzC3lKSrVphyQ8bF3uEudA7sWnNpixAbshR5WEjmr9xuwY5B+E/Vmxp4b0kGSZ
         5gyHDwoJfhRJbIdDRyVj8jXJCaDydc6z1ym6Md8uTmDDZvjrTwXa+SolR6jH4SFHHNd/
         WAIA==
X-Forwarded-Encrypted: i=1; AL+hErGyx5VNqLaXCB9hRvUGwn/5oCSWzH/9/5qzxfv6wi9qvx7WGz1+hVlPYoURgk8GuKa+hkKGuvWmEbC3Zi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iiyISXRPdPOek71q8RkQfg7efR3zYkwlCeps+Tx5982mRar4/
	pBNkT1dIu0ni+ilNCYLX+VFxC+Q2loh8F5p/59u0AomatgiDzffWqmVSBBLIPSyKV3LpNg==
X-Gm-Gg: AZFdTZelith5Eof4+F0xF2Jom1Bvqspd2RU/7+HalUSTzZQJNFQDh9xQSgQuVLjNHfT
	B3DFjVIMLOETdG3sqEh6Yat89kBXz6EQ1nGnfP+b2xVEFl0yC0g1OrU5fNofEj0iZjTAasr3+TA
	ujqQRPulKIsR+gg6OCcZMAY6a9Sx9ZFdHa7ZD6WKC4ojv6zIABzBje33UHFeYCokyJgPY8vaP6U
	oJPtFmIEIy5Sd/TDiDz3GTJFsLd0WBsR8jKPekJZ+65U0il6SwhF1RCEgbHq7JfBnCmdPN5buhj
	jRjphCQZd3z3CChxtAD0R8SAU2RYO2Fdfu92waarqWA2g1EOWAcIObc0YGbZd0gtT3FHhd6+r8I
	TSHLdJ+C+cxKlOAQJfzTNNwWLZiL/k1AZhuq3ME9GEaAOfVz8Bq5IxmrDXAQY4nn6ZdeHGAR9HB
	yc2s/tJoy3ti/FAKIvd21m+wQYtm6Y+yKxs4cMr1qIZRgZIugiXcWBk6SnAAL/KKhEwhUW/A/wW
	q277kxiaCEH4uKtibvxxbim8QyuWpIfR2pMi0Qssw/1ygRAxVtIh9ZhVGbAy1lVXoPsoDphRv7/
	tphbxVAUFMY5eHtkqu7vok14nqHmHRQGj/9cmWbVVipXDG/TGbVZMT+dCfgvipfNVucxpnd82se
	fSXWVshe9l8vd3RuygApO
X-Received: by 2002:a17:90b:5287:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3b41c7c22c0mr19868266a91.6.1795674454345;
        Wed, 25 Nov 2026 22:27:34 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad0:1caa::2db:4c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm34221015a91.10.2026.11.25.22.27.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 22:27:33 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Zhiqi Zhang <zhiqizhangg@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi: dln2: validate frame sizes reported by device
Date: Thu, 26 Nov 2026 14:27:28 +0800
Message-ID: <20261126062728.82734-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

dln2_spi_get_supported_frame_sizes() builds the SPI bits_per_word_mask
directly from the frame sizes reported by the DLN2 device. The response
length is checked and the count is bounded, but an empty list and each
advertised frame size are not validated.

A zero count leaves bits_per_word_mask empty, which makes the SPI core
fall back to treating the controller as if it had no explicit mask. A
frame size of 0 makes BIT(rx->frame_sizes[i] - 1) evaluate a negative
shift count. Values greater than 32 are outside the u32
bits_per_word_mask representation used by the SPI core and can also
trigger an out-of-bounds shift.

Reject an empty frame-size list and frame sizes outside 1..32 with
-EPROTO before adding them to the mask, and use SPI_BPW_MASK() to make
the mask construction match the SPI core convention.

I found this while reviewing DLN2 capability parsing. Codex modified the
code, and I reviewed the change.

Fixes: 3d8c0d749da3 ("spi: add support for DLN-2 USB-SPI adapter")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
Tested with ARCH=arm64 W=1 drivers/spi/spi-dln2.o and CONFIG_SPI_DLN2=m
in a Docker gcc:16 environment.

I do not have DLN2 hardware for runtime testing.

 drivers/spi/spi-dln2.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-dln2.c b/drivers/spi/spi-dln2.c
index 60085ed04a..ec673c650f 100644
--- a/drivers/spi/spi-dln2.c
+++ b/drivers/spi/spi-dln2.c
@@ -71,6 +71,7 @@
 #define DLN2_SPI_GET_MAX_DELAY_BETWEEN_FRAMES	DLN2_SPI_CMD(0x4C)
 
 #define DLN2_SPI_MAX_XFER_SIZE			256
+#define DLN2_SPI_MAX_FRAME_SIZE			32
 #define DLN2_SPI_BUF_SIZE			(DLN2_SPI_MAX_XFER_SIZE + 16)
 #define DLN2_SPI_ATTR_LEAVE_SS_LOW		BIT(0)
 #define DLN2_TRANSFERS_WAIT_COMPLETE		1
@@ -336,12 +337,17 @@ static int dln2_spi_get_supported_frame_sizes(struct dln2_spi *dln2,
 		return ret;
 	if (rx_len < sizeof(*rx))
 		return -EPROTO;
-	if (rx->count > ARRAY_SIZE(rx->frame_sizes))
+	if (!rx->count || rx->count > ARRAY_SIZE(rx->frame_sizes))
 		return -EPROTO;
 
 	*bpw_mask = 0;
-	for (i = 0; i < rx->count; i++)
-		*bpw_mask |= BIT(rx->frame_sizes[i] - 1);
+	for (i = 0; i < rx->count; i++) {
+		if (!rx->frame_sizes[i] ||
+		    rx->frame_sizes[i] > DLN2_SPI_MAX_FRAME_SIZE)
+			return -EPROTO;
+
+		*bpw_mask |= SPI_BPW_MASK(rx->frame_sizes[i]);
+	}
 
 	dev_dbg(&dln2->pdev->dev, "bpw_mask = 0x%X\n", *bpw_mask);
 

base-commit: 7ccb044c27720d48175577080b851f047ddcfd1c
-- 
2.54.0 (Apple Git-157)

