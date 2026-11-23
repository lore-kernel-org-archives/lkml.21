Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471620;
	b=B2WYFJ+4YL8TfGSkNEFvAuPtMDPaJsGOJ6qEbaZuWxag847II18TGlO4AkXBkz9nA//f
	 r5u8ecnrFMhMIx+mAXavhqv8oQ4VAgyt/Cphvn5po7Tqwb6eQeAECxV6NCg8vEFt7zYWw
	 iB+nJgeVmb/zc3+J8gv9Dfd2ucz6xz8ia3MsVr/YkOm9YkJgLhjgogClRRTnlNE8qdUnS
	 x6S7o/HHnQYEk72I34BAhnLe8gKqGGCOL+XnUvLY4Xa6glapTWD1Fx3Ix7tFLLS7kn9D9
	 +Va5E6+4P0nGas7v8ZrHlWObTVyj4sdVKTB4bakcsl6atHz9Pt7o3pKybEHQroz0Seg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tk5uD5V8TbLVU7b4UvMj1XLTNRvdHu0DZPTcg4okPo8=;
	b=yo72UYeUcDSahDHnooN4NJB4MzXydEdAdgEXx98ZaKauQT2PWlwm1ZapWNFC1IT6A/J6
	 wZGgGeANE0lMTGMoSE7l+u2poWJ/VrolqZ8MYP7KEWKVKkzWYmedfSoth/ArjsYSLX6w2
	 BIo0Nh4qCXxVB/OfDzcRcgeHVKqH2o4iGZcgJB0FeEE4qFPAeNfc5z+SrgkjbIwBLNUhn
	 xuY4Yix4/mh5Z37vqmhMaLPyC6MbDweNClCYxCD822WoOa9KyJ4JBaQQMJ6B9MyUw61ZG
	 4ZgQT1667aizn47OzKtnLYfXaksuPSw1xnqTi5AnGXPZH4GHhc4sH90ld104bmthPDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IRaV6suM;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252A1606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252A1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IRaV6suM
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so32943691fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471618; x=1796076418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tk5uD5V8TbLVU7b4UvMj1XLTNRvdHu0DZPTcg4okPo8=;
        b=IRaV6suMaATEzy7Z8xlAs82gQKdSOD5DxtdJp7vzrttrtp4P5eruedMcoebET8FIuP
         El+in7pWOjjlLTi290kTMLLEXdlXAxi3f2RE3yeJoWVv0lUFalJ6DwRIcS6XHb2ayeJQ
         32loRqtMNq8/OiBwFU8Q3HfYDfitKTsxpNplR2SIXjvjFpHPn4Kf7tvpfwEGf0nM28Bi
         BleBdGntVKD+KNEyoCMg55JWPIWupPpgdQd7jrZHcR0jnQ2/PM5Oifv/kiHwCjioy5s+
         Pta/9VXVg9Qt+Jsnz6EmvrlE0CjCpzycrIzUVQThnPk+PHbo1zO4rvXaMzGVHuEhpNzi
         ngNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471618; x=1796076418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tk5uD5V8TbLVU7b4UvMj1XLTNRvdHu0DZPTcg4okPo8=;
        b=Qp7+n9ubkoL4xDa54mwJ81NOzNxEy3VLoI3uZkNd/ccQh7zzBfrLFa4MfKj5g7rDft
         xFUaV/uOI2jpBd5VA7do/Cbm5gJpwSg+qpdeNuE4lDw9H+U2wWwroGdQi3wDy2LwPTxX
         U7S8gmxiIODuCOLau2HlwQ8KFjhd51x3V+aWaV5hHnK60JARkPxdictViwu49tZj02IH
         o8whE/3ss6F/xPjUGoy/I+93VbsG5y3fKS+XcOaXbfzQmmRBRQZEzamXn3jME54vwVXv
         nTOPMiYFroddLubRiFc03QF79LWxXcO2jRUuU+JXku0uo8f0+U0Xjik1MZ4xewiA0I5p
         XqWw==
X-Forwarded-Encrypted: i=1; AL+hErEeTZp/sQKHnvg69kCjlMMfSKjvy+UD98MBh3DdQftCO0tYmOHZvcbsj5dYt4PlGOgMxsfttGZ+b+Xu0JI=@vger.kernel.org
X-Gm-Message-State: APuU4Z81j3qlbBswt7yAEKuHnziI1HsXj2xw2ElF4vxOdoxBTYae9/J4
	FfiMLk+AZ1XJ2XwZvkTnFhUNKJsVtnnS7OhHSvz4/YUhmMZ+cPw6H2HMYIaH8w==
X-Gm-Gg: AZFdTZfNLam1nYTUnjFTItYTiWjXcuhgqEQ3BZZfJU5n2BC3qTn5M7I5f+tgbjeY1Ge
	wegCJRnCDkMsHArva8F3KgPB3lQ2BmNsStzt0ypJLZlPq/guxGb4FXmh3kIRiAOyjLQIBgwoJkg
	U1+jUgT6O4Xx3pFXy3yMF71Q3CgNeJKVKKt3/OhquY3cYofnGKlJarwFlpzOmWeNh8qwNlPieGe
	yY6AwMu/oJkUaaaT0gbr2nXjiC5tVPmOD1EVBZkLOVc3fF8ZobiVnbcC6+VpcCcWzl2dPrti8uG
	DyqunXeyNdpI4bRZGWykJjVgsAjsbRFS74jh3c15whPj+V3eixVh2lU3AZpeeIc2qFfEv086AEK
	Z3vA6pcZVBipHRTruzogj0yufo/FlPH+Rn982ezPxJbrd2TIaZDFLXE+r4ecAo/f7+PAegOZRcO
	h9IJhG9YbtPmaIbrq7WTvt1vlE7QFZ9q+IvzhVo7PwoeYnP0JvuIompjCbTZb0NiWKziG3XBPko
	4XquosIzqstjYKx33ldNupcdTYAuTWi4f+9DJS5GwWXbQBYkgaOoqbB+xAyNHoCd7ztCdwB9v/q
	HIN76Ukrn35RVxMUj4Q+9BWzRLfW9/UAKA1tkgKJjzcWHauIesogSS+Tk6XL19cxST42W0dYZ1w
	ky/SkxT45/nzRvPZfN7ZhrNhcWGHNHAY2l4wN0g==
X-Received: by 2002:a2e:bc02:0:b0:3ad:f36d:41ed with SMTP id 38308e7fff4ca-3ae7fa19f9cmr37612581fa.19.1795471618073;
        Mon, 23 Nov 2026 14:06:58 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805215ccsm34272021fa.21.2026.11.23.14.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:06:56 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH 2/7] iio: pressure: dps310: read the coefficients with get_unaligned_be*()
Date: Tue, 24 Nov 2026 00:06:44 +0200
Message-ID: <20261123220649.36887-3-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123220649.36887-1-zoone.rupert@gmail.com>
References: <20261123220649.36887-1-zoone.rupert@gmail.com>
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

The coefficients are big endian fields, some of them 12 or 20 bits
wide and not byte aligned. Read each with get_unaligned_be16() or
get_unaligned_be24() and let sign_extend32() drop the bits of the
neighbouring field, as the ZTS8032 coefficients already do.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 36 +++++++++--------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 02dbc5a8ac37..48df5a28c140 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -239,8 +239,6 @@ static int dps310_get_coefs(struct dps310_data *data)
 {
 	int rc;
 	u8 coef[MAX_COEF_LEN];
-	u32 c0, c1;
-	u32 c00, c10, c20, c30, c01, c11, c21;
 
 	/* Read all sensor calibration coefficients from the COEF registers. */
 	rc = regmap_bulk_read(data->regmap, DPS310_COEF_BASE, coef,
@@ -252,37 +250,21 @@ static int dps310_get_coefs(struct dps310_data *data)
 	 * Calculate temperature calibration coefficients c0 and c1. The
 	 * numbers are 12-bit 2's complement numbers.
 	 */
-	c0 = (coef[0] << 4) | (coef[1] >> 4);
-	data->c0 = sign_extend32(c0, 11);
-
-	c1 = ((coef[1] & GENMASK(3, 0)) << 8) | coef[2];
-	data->c1 = sign_extend32(c1, 11);
+	data->c0 = sign_extend32(get_unaligned_be16(&coef[0]) >> 4, 11);
+	data->c1 = sign_extend32(get_unaligned_be16(&coef[1]), 11);
 
 	/*
 	 * Calculate pressure calibration coefficients. c00 and c10 are 20 bit
 	 * 2's complement numbers, while c01, c11, c20, c21 and c30 are 16 bit
 	 * 2's complement numbers.
 	 */
-	c00 = (coef[3] << 12) | (coef[4] << 4) | (coef[5] >> 4);
-	data->c00 = sign_extend32(c00, 19);
-
-	c10 = ((coef[5] & GENMASK(3, 0)) << 16) | (coef[6] << 8) | coef[7];
-	data->c10 = sign_extend32(c10, 19);
-
-	c01 = (coef[8] << 8) | coef[9];
-	data->c01 = sign_extend32(c01, 15);
-
-	c11 = (coef[10] << 8) | coef[11];
-	data->c11 = sign_extend32(c11, 15);
-
-	c20 = (coef[12] << 8) | coef[13];
-	data->c20 = sign_extend32(c20, 15);
-
-	c21 = (coef[14] << 8) | coef[15];
-	data->c21 = sign_extend32(c21, 15);
-
-	c30 = (coef[16] << 8) | coef[17];
-	data->c30 = sign_extend32(c30, 15);
+	data->c00 = sign_extend32(get_unaligned_be24(&coef[3]) >> 4, 19);
+	data->c10 = sign_extend32(get_unaligned_be24(&coef[5]), 19);
+	data->c01 = sign_extend32(get_unaligned_be16(&coef[8]), 15);
+	data->c11 = sign_extend32(get_unaligned_be16(&coef[10]), 15);
+	data->c20 = sign_extend32(get_unaligned_be16(&coef[12]), 15);
+	data->c21 = sign_extend32(get_unaligned_be16(&coef[14]), 15);
+	data->c30 = sign_extend32(get_unaligned_be16(&coef[16]), 15);
 
 	if (!data->info->has_c31_c40)
 		return 0;
-- 
2.43.0

