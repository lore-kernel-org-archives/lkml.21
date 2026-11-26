Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671085;
	b=e+HKaItxyoq9RV9ppmCjMcpnKZfbkP0o6kogUzVRKHfnbnl0GjIm0kyixiPRrzVc42Gq
	 fcZHP4bUPSy/6hw5HUbmACNdD5plnRZX0+znQFrN+rELGgq6QNvc11L0qUHNAy59OMBOe
	 Y7+7dVC7iDm5c4u1A0oo1fb8tFTMGpCfMUEi/jod58mFku/ALjb8+n7ue/guFnTags/sG
	 Q/J0FF2ZSpz4xeJL5r4AQ9eMOlY1ZnwN1ZfZLb3fquzDT260ZmVJJhG8r4SSci8ZD36Mc
	 +5s4eQ5zH8LCLwGNuRjZe+QBPrV3sYAhooXkt9hN1C6oNXWp87csIhh92LfxNadUe3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SaQxUBzvPDkUX6JJATROn1MzfwU+l51Jz8uEr7sIMqE=;
	b=RGlmBy7gC7FMoHlABybnRtXEuDk9qW99niTfFGJ9GbZpNZ8t5IzjGnIIpMeflByb6z+2
	 WbpouZq0RBK38gVSgnXYqgi8JeGvlV/joOvYRPMwlaBv2k1CLNZma2oNxObZKHwGP6fjn
	 eNi42sVfTR5FrKklECW/WN4mKZDTaXV/fhc6esPQSl6EpW5nBRCqJ6h1eCB4GyuDJMtbX
	 9ybDNtnFGcD5ZlNKtrMbmAlX0wyLuMI0TM3rjMgvIlMC0MyLGZCjJsX/SqRKtYV5ATVc8
	 ExC26AsJM1FYWchooa19stclE50fMSXAvtS/Qr9Zurt+gN2j2J9Y0m5vbQubeMt8H7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Shh1rc8V;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D701606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D701606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Shh1rc8V
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso3215293a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795671084; x=1796275884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaQxUBzvPDkUX6JJATROn1MzfwU+l51Jz8uEr7sIMqE=;
        b=Shh1rc8VN19gQuDTe1+BTKbXrtc8OhJ5ZXeGQWSgzwBhjEn7GmivVeYQ9KCcfuNnKi
         c8K7UQPF5zvqhYVkEuLic2K79uX7sqy+Gfbf6X3fZoF9GWL1HHhuBv5xMfp7/12xT1pH
         tpmlwF4/ON4RRW8TYFzpwYfSC/O4WleOXznlBHP1lCQOnNFo3glhn9iIiYKcHaZ74b6j
         2FopkxR4J/wZsofnHBYesp5eMB6Jd6itOJ/xX/NQ93mc6HN/JxQ49R9oFRTWWQfEIPHt
         QntBZaRo5YI0lkfZa97LP9oCnd91gb3e7nFonNfVYigGewkq2ueJX6sEJcAw9PfK3z96
         LHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671084; x=1796275884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaQxUBzvPDkUX6JJATROn1MzfwU+l51Jz8uEr7sIMqE=;
        b=kRgkvEOuycoyu76zdnoa0k8P0JeYGHIGw7yvCnJxSoIsMj3CrcOhFpvkQ1MabHsNja
         uI7I9l3I9fCZbZacw44hxcCcZBrzsBp0YM5EAOZ67eMCYP/w8+rCUEaenORmRhb85mZ3
         Ib27DXGANkRoH0hhuI3f9rd/kX1hFYRK2tdSI8dYQEd3qx9/4Q2Eiym7TsKSWpc8w8Ro
         4584GmeFgZPuShz0hUS+g4YLQF+YFTtFV9FDC0ci/21gERd9ya/2W/DmG82FPi6jYfda
         r8nSR3wle9l8Dy7c2XK0NZ8j6GXQ7AiP/Kqw/xuGQX3QqBOFjCpQ5GSnZWkPmo48anSz
         gi9Q==
X-Forwarded-Encrypted: i=1; AL+hErHmtxO8a7IuehPaRtOdGtjexvmpkjc1sa3zc8fMcowSDdMEG24eAn6mWTm/m7o5XYzzjQDDZmesKtH/eQ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BHeCur6Jx3yHpARDSVPefa5EnboYRM7+/Ksn6kldKjCBEnVcp
	wFk+c8FUA2Apb8zxVBz5Y3w26E8pkbJIQK+KJskfTpy3MqEfzcZh1kht
X-Gm-Gg: AZFdTZfEIU2/AitGIXb5sqFne6B3448xcF0DhAYZsb2F6ovMBjWPKLXwbPyCABGQ/EA
	izxcbaeBskrrbcKL3StqDqB2g61VSC+vLuh0IOjYsJdQ6mS+ca7l6vCNLA6iAKM2kzlWD65Diso
	y/s03CHhMm28G0EU6FsvSCfsF/nF379TocTmeF6DmhK56IW+/bU0MzSxHaQRAXSYU36ZaY+poi9
	EAfamqj3YcZTu/lUsVZxespSWbqkXSv2rVjFhPZApWvZ7U+sICqB6tV0gRWjElMM+zkb/tgyVVf
	n3FqY/r+fJ4+0pG7rYelxQjYpL8ZG63MJLvD2yk6FsM6yE6jiixnSQ4BR9kTrM/8AJiv8fZqc+I
	FbWDY6QninjuuAJoJa8Z0C+0V0ZeGNnU3MNhVggTKKAqAsErSPx8JJWFhEz422fMFh+BsopZPf5
	tx405vatEqQMeFa1/f/8f/nSKavcMt+vPa3O9LzA/3nNU8APVAig60zlEw9jifggXUso7dKarsR
	nQDffjPJuKqoyIK7mOx6QITQUvML0VAgChn6W/DnFurlXBFRfijEvUDGW9vY+ado7pogWXB9mXc
	5y52e25+nVQ8/pLG0kVC85gqq4OedY8935eihFd8LkauS1KB9dt6BVewlFikNwhx8YzGTm8472X
	1i023co7th4aRxoYge6ha/S6Imvs/pgQjpOrA8WqlQOFkGyORnMdrz9/Zg2jbE2F87VrabZ+t/P
	fxxs163RNb4yzmQtFwHp3NKcY=
X-Received: by 2002:a17:90b:5546:b0:3b0:a1c6:95ae with SMTP id 98e67ed59e1d1-3b41c941f9amr11689057a91.31.1795671084563;
        Wed, 25 Nov 2026 21:31:24 -0800 (PST)
Received: from kapoor ([149.40.62.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm33700520a91.7.2026.11.25.21.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:31:24 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Wang Shuaijie <wangshuaijie@awinic.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 4/4] iio: proximity: aw96103: reject out-of-range debounce and hysteresis values
Date: Thu, 26 Nov 2026 11:00:28 +0530
Message-ID: <20261126053033.603086-5-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126053033.603086-1-kapoorarnav43@gmail.com>
References: <20261126053033.603086-1-kapoorarnav43@gmail.com>
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
index b4aa31a65369..24557a8f764d 100644
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

