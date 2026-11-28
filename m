Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866737;
	b=lx7FNbIisaViyOLGo5pRoIU8nxgGfunqTD3w/uD6hZV6zjWQT8fAN1Mhl5454N4pIcQ6
	 annbYUIhf8/nLHg9G2+qEYGi+2MjeYC//mnvErRgyykhKedWgokv0W46xUo3B3sRf5l72
	 UYoUUfdizr2mQBvtReRunPeYDYUmli29guxVDZvyCpU3YPCAL8kCIe3T6Ie9VBrUvNuvA
	 YnLpw89mF6UKuZFOMiiCVsgr3NgF4GCmhIH1WSkohWBL0xo7AMITORfQfvsvpcGKQRlAt
	 PSownopN5v3OEXH0VFQVqJLWZm1E83xXcYo+kiVCTZyA/N1f9J0YAt0mWLXaGlyIg4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AMCCMFTB9S1Cvq8SlSHHPzrQndoGf5ALIJy+dGBBDm0=;
	b=BragdT11+HNuk8J5udn1dbXmhBMEx3n4epgO0wtkTc4f2sCcTzBwCGVAS8Rg8YBWHFgB
	 8DpNaUrt7PczFjhZklDNGWMZrFGg/7bT4auLQ/CbCbFC/CA/15DjVObji83V2h3Ffxn2b
	 TBvsm0hYJ86Bx9+Vxhs20MrVfakaphNQ+gVq8cJfhamxE4LIb7Enhkhr+l5zjOvwfiFTb
	 Swt55uqY/lRLc5Z6PIWYCKjLpPz7kPqKPYEan6uDZiLxANpjgxcyh7BNt+HE5FIN2elRq
	 pX7W4roQMMiLu6WS88yYUHLSMV/wcYco1eKApADkthltyXQ+7SlNEeCh+Ee1q13CdNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0SA3FblE;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD77606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD77606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0SA3FblE
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3866a784546so12410993eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866736; x=1796471536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMCCMFTB9S1Cvq8SlSHHPzrQndoGf5ALIJy+dGBBDm0=;
        b=0SA3FblEfN0nRomJY5TN8/9AZ8cYODfLS84aVM6AGnHmH/Yqbqa0q9U4RcdH3o3WqF
         DaIhJzDd2SVCgWakDQ17AmuBP+XgYDvixyU6WbbjDX0oIs2S9028bC4YiLZQJZir2jqj
         L/DO+LC7+XLPVMiSH4SFzfkaEtgyakccTbmUvv9UmkP4tseG2lAUcYqiahx3DvawdGlW
         WWKKGJGY7DR8VXJIz8cUT6FXj5uxh5w/6pfD/QHM8Jnq3foI3D8mtOrEa0J8msYO52Bk
         ND9DfXeQaVIzGLymiTzJsesllTgo39oH5Gg95/4F62pO0fE5YkQ1a1IbSee3rH7jS5UM
         OzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866736; x=1796471536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMCCMFTB9S1Cvq8SlSHHPzrQndoGf5ALIJy+dGBBDm0=;
        b=SA9dJ22AjOwI06/FdJ2fC/Ur+Mzri6DE1Focay3qO1ECd3ymH+ihgSWTk6OJwwSkf2
         ymZ9vVQDfuJMGuqRDh1lqAuNP7IMpKzk8gwSmXfRIBwkDOZRWpjHBqz7dDD7O4w8gXMJ
         F2EAS7mxzOT4zSjv4k1Kmv8prx2naHqFacjIVIPo1W7hiOvWhCReYHX/GbV1FtDo2gpo
         lOZG6vU6sMwebMstozdTSfCEGphix5Nys6mBiDlWZ2WJPpBm1876BkbxC0Vq5ktc6BuJ
         vWlBjevDkTSBgHOenG1Vl2Cm96S+qlNqdDEqupD1Gir7ZpOrRvNOnr8CbxuKafNabj+8
         uj7A==
X-Forwarded-Encrypted: i=1; AL+hErFIMDI4Jf9jPt/zKKjPe8Nl20yb7TaiO8gmw83AsQqFYY8bzeSFXJ/dogvquv58m2f8ACGenmUZWIZb54U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xAATJElk0J4z3EgXXijyz8Ix215fNiWwk/O/retkg1O/DrkH2
	J+sX+rKUmnH+kK9bkHwVcK4FBdVC5sGyToEXb38gQ56WL3c2UgdAJCkvadv7u27OPq0=
X-Gm-Gg: AZFdTZfZ6LIzwJvXvSmzrA9lJSnmsVKXKb8Tqn0SVAiThRcm9LNdDa9cz9vN5U9Yj1l
	OCaTLrd8wLi8vNmc2QT4GzJdgxbQAlEPLHppPfc2l4qa1PgU07SKQaNcI43sGilCfbcponcReyZ
	TKR8OsZdOvcsME9JdP6dhlwpJo2m7gD8tESarbO1YbWnjkMIqAqz0WzcwHNm+b6F8T83CZsTiER
	cBaSUTOBwkEtUeaKKnaY1/ibEs5B0qFWmuz+EzFP885pssSfetQk6GZ/bmotXGF7JT+NoVvcIZf
	fEnWBMTFVnFz8zGEwdm3ejwHlvvBwBDozeWAPQYomjgE5UAw/C8nVht7mfVuHVmCHIP/+i3Isx7
	B+FV8V8O3/gPsIfoYzpYHlV6SNyKwVYzajh2eTZu37kt9NkMSqFSfzk80WOIN5m6jFaRa3kxeR3
	tUlhWYSgb/OzSbM5MHWnh8qeBym7JlfxqCUuxoDXc5nAl+0fhVLi2n8FaJQwzpAQVUJosXbOM8F
	LM0NBI8kSZTuq2yLGwrMkqV+4Mql6x2Ep5IBlBbkcFB8CZIxNxJAMxS+kQgkiUDj+8j8WM7Z8Ta
	egvK8B/4Un7fv+/CTHxubECTZJ2k+brkdhXrxytCoWc3BGQ9+wA1SoNivwF9nJnM73Az5O/s/CP
	m0GMT8ENxwTrEkEKeA+9+uV+HmSAzfgmst5R6eN11UzK8zxlQuprqnFv2hlEtl6v/1yA9b8xyQZ
	XgDNlI185qMVCtzWZOaqYR1pwBPC9pWt9yT2Ti80qpXA==
X-Received: by 2002:a05:7301:730c:b0:381:2114:99d0 with SMTP id 5a478bee46e88-38571415bdemr25231867eec.39.1795866735943;
        Sat, 28 Nov 2026 03:52:15 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm74256544eec.20.2026.11.28.03.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:52:15 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 4/4] iio: proximity: aw96103: reject out-of-range debounce and hysteresis values
Date: Sat, 28 Nov 2026 17:21:41 +0530
Message-ID: <20261128115144.557411-5-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128115144.557411-1-kapoorarnav43@gmail.com>
References: <20261128115144.557411-1-kapoorarnav43@gmail.com>
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

The debounce (OUTDEB, INDEB) and hysteresis (THHYST) settings are 2-bit
fields of PROXCTRL. aw96103_write_event_val() passes the value through
FIELD_PREP() without checking it, which masks it to the field, so an
out-of-range value is silently written as a different one: 4 becomes 0
and -1 becomes 3.

Return -EINVAL for values outside 0..3. Both debounce fields have the
same width, so one check covers the two directions.

Fixes: 07b241262dca ("iio: proximity: aw96103: Add support for aw96103/aw96105 proximity sensor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/aw96103.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iio/proximity/aw96103.c b/drivers/iio/proximity/aw96103.c
index 82353be284a7..2ab92fac9a0e 100644
--- a/drivers/iio/proximity/aw96103.c
+++ b/drivers/iio/proximity/aw96103.c
@@ -401,6 +401,9 @@ static int aw96103_write_event_val(struct iio_dev *indio_dev,
 		return regmap_write(aw96103->regmap,
 				    AW96103_REG_PROXTH0_CH(chan->channel), val);
 	case IIO_EV_INFO_PERIOD:
+		if (val < 0 || val > FIELD_MAX(AW96103_OUTDEB_MASK))
+			return -EINVAL;
+
 		switch (dir) {
 		case IIO_EV_DIR_RISING:
 			return regmap_update_bits(aw96103->regmap,
@@ -417,6 +420,9 @@ static int aw96103_write_event_val(struct iio_dev *indio_dev,
 			return -EINVAL;
 		}
 	case IIO_EV_INFO_HYSTERESIS:
+		if (val < 0 || val > FIELD_MAX(AW96103_THHYST_MASK))
+			return -EINVAL;
+
 		return regmap_update_bits(aw96103->regmap,
 					AW96103_REG_PROXCTRL_CH(chan->channel),
 					AW96103_THHYST_MASK,
-- 
2.53.0

