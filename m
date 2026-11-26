Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695226;
	b=fSR+QJX8K1SWH20ayAkjcX+wvib6BG4O/o0toO48HiIppg84EyPl1wSDPzlP70FUI6HC
	 gC4tL9tX66sl8njmAjfH1nnql5tzT8zPh6pfWEp1voj5tjp7MRnCA2M86Uu6fB72n1/2r
	 /eOXeNfgYZb5EhedRmOjK5vPVdpBHMP/ej2jh0KIHDz3RkvV1+HEk4nYf/pRZ713neU2I
	 VsupKOxq0pVkPmluhvnAJPVPZqJExkZ8weAT8UPTB700838yxoqw33nuIgiKHr6h4Qdjw
	 PyGKzHqUJsOLZ1OT2nWYgAR/5n8Qj2PIkLC34sRjiGVc2AxsIGAQzXw7cWlYYIOJBdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IKo51XN8NfxEpTsepqSSjLtEqea01Lke9oM38577tNE=;
	b=ryvMjD/lnIXBV8r9tfamb+GsmQscXKtnaj1NachTutZLZDWgY+WhL5EwwBBtjfCtmh4C
	 NQDytkDQJyeErrHJP+oqPRxE0txu3zehGx3q+8pbTFJoFh7YsMOj5C2HtLYYatAO1MLok
	 EcUq7NA3y3IIkPrBrrKtB+pjC2F2mzbtAJVIq8UCMrKWOSYImv8g8q4Pufe9txuMqO0C2
	 wPxj4qnG75mJ+pvdGU4rTaWu3ZGp5RS1VCLP7FG19RdQpEqpVmka1ROqMzjHQihGi4J1Q
	 YjFGBt/QpVhNbc4MFBeQh6SkfTiiIyaaBmp7gENti0Ri7NyNe7WwavsKkmCHtOU7ppQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZmfgwZ+y;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6378E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6378E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZmfgwZ+y
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3afa1c39d76so15711961fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695223; x=1796300023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IKo51XN8NfxEpTsepqSSjLtEqea01Lke9oM38577tNE=;
        b=ZmfgwZ+yVNUDOm+Pni5F6B76OERMzyyBtswaeBekBLzeIOigrnptcsVOguQyL6zInq
         PDLjeupiVgUFuFjvlHUek93Y+8dpGJc1V4fE6dHr2GxMMi/2R8+LUbO1eKn8Sj9vl3Ei
         GTQ3aYYDRhC7TkJrd/Tx47LHN//NNBJ4Tn8EZ/FEHd2v7dcvngtaVlogn2tEkmynbb/g
         wwA6/om1EpPEAmS1X/tkchCLsXBSHr9fxIfF2b5axcH4Nk7t6Hnz7ya9c++rOibtqclM
         1s2Z2Y8z2EFKPST3Zf9rYc+AbcrFoKk5zPCadG3DzELXqJZUWo4QGUZVL1CC364x7NBu
         0XEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695223; x=1796300023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IKo51XN8NfxEpTsepqSSjLtEqea01Lke9oM38577tNE=;
        b=u5paBn4HOgeOAQnF3eq7yUr54colNJJ1wJTTqPSmF66AgZlo78QtGKi73Q1RCTgyKq
         5mQZD435iHQCH7sYyhwzGgyyT801+ySitQm1x/URlbMsYn/6DID7Sr0law8PwhlclxNq
         qrQmK4RGcLWVWst/bImQxHCso3Hl4uEWmVWcig+TEOoH069KVCxl/QppfILhSurKOvGn
         ZGg3Km9pDiFHI48ji0qIu3JlSMimsXT82fAkJ4RZTBBERTk6T6oK19sQ5LMFOTHUW0UL
         PfZug+0apkKQhei9ULYfvN5/gE5cAd6huaQNeXL3Nza7KiptMsCmMFbnIrfZMu2Equy2
         ZoDg==
X-Forwarded-Encrypted: i=1; AL+hErGSiwYwQXEZ9ChSxM8yii08C4OEtvrs7g7RlOQ60pF3K2OsZk80XA5fSTmkGWImxVk7VKqpNNa9wl/7Oik=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zN8SUR6fxSKsgMyLdN0rIxZJt+i7kCmsnwLQNxF32Ogz7SEAb
	9jhHDPRzAFeZE7L1y+7L3km0TB3zD/4xTRkDUB63QIqIqAsvmWgoly78
X-Gm-Gg: AZFdTZfs3Rp2rVQMhVIbweJEqpItDZ+ca4Y+uBEreF2e+1bbXdyjPxSTO9hnp0GnHwU
	FRgl+YNco6CCWUEElBq/2zZrsqj+Ggq5cXWhlvT2Jaq9p4pIOGPf8h5wGxeHX6E0eKTFaophbOP
	/8WuT6fKrJjZ2rPulT9Vvj4hrjq/hp/Gmlq9OzgPEAGRM5SwJ2Ut2usrsf0PxZEnhXuyuVV1LXm
	Yl/TvhzR5/TMN0ODK+YTAsdJ+r7MuwTP90xzSyZCNfYNByGd7b1MCaVoeEOwnXAXjhN5d61H7tY
	rRUmiTGokxkjb2z8dDcNqC8UCWB9ooBCZLIS6dBYHN/pD41fOMrfQtzxuFqNgNb56iFJ/ACl53E
	08zc+Off48JMDBKJpHjNSAg44CPNh5lO3t6l9f4IgxGgl8jTnqDxKXMGejhBVXBzfTj7sFp7mU3
	Xdo1oybcvwH0ZHbVLe00qdR1i34BU2zK0NrcHxe8Q10+JMp/8TcjQVx1vL/KSGpkR1YiSwg6Muj
	od1ALO6WqlsmcAIDZ3BmMpDzCTQ0/M/T8oMvyxfd3BpMaJ7zAO1id8Mao9S6ffu4dgvMqWVIwac
	kTETBjGqtcEk+931UY6BDhUyX6Yhtf8999K5F6PeyKeDBCtUK4vIAOG9mVj0XCco9Blsj1dRr2x
	mVNonMDCMhwwriDoKv6+aBjBbD2QFNVIOZGwdnHYY1jKwxUgxAAMo9C8FWQ==
X-Received: by 2002:a05:6512:304e:b0:5c1:4bbc:45cf with SMTP id 2adb3069b0e04-5c1bc8a5cf6mr6545422e87.48.1795695223318;
        Thu, 26 Nov 2026 04:13:43 -0800 (PST)
Received: from yantra.. (nekmmqtmzjx8yvukhae-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:68b4:f70:61d8:6e86])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e8e0sm56541791fa.5.2026.11.26.04.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:13:42 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 2/7] iio: pressure: dps310: read the coefficients with get_unaligned_be*()
Date: Thu, 26 Nov 2026 14:13:25 +0200
Message-ID: <20261126121331.10438-3-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126121331.10438-1-zoone.rupert@gmail.com>
References: <20261126121331.10438-1-zoone.rupert@gmail.com>
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

No functional change intended.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
v2:
- "No functional change intended." (Andy)

 drivers/iio/pressure/dps310.c | 36 +++++++++--------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index ce83bd3691af..abf1652980ea 100644
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

