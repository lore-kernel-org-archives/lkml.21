Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471624;
	b=v0MdaBaKbNJMbL/vrRaAJYB1R41yyQcHEtII89SzMgFzN8JfWGoUYNg948GZhsu+153N
	 WsrPBEQB4AbqYsjoN3ReIBL9odFp37CSQ+1JjkL3XX8wARy2yTS2v9mWxV8Hd4UqH8hM3
	 yEZvcMSJWnvGHM4Gouf01WAbVxkeqdEcMEdqua8tKtEWXbeJUjA089ObcBsPSR96xryKl
	 +C+td+Cw5VtNBHulj8VLMMw2Qi41OkMfcHT34SmGahmqZxlT+bkFSHIlfULrLRJxcqphn
	 QTEE/72dMQTr/nhWJrF4dYc1TmEM1p83V19nLTR4TQSNo//ALIO2sapJ4nf7G1Sc7tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cc3Yze4XZSoWd5COsCahsRwXKqXznpMqPrcsRubO3Y8=;
	b=vWz9EW93uQ2eZKPnXFe9TYQRzwOZ1Exynz7FmJfMTinZYQihgq1CYvgoco2hhQpUTXae
	 T5VI+++SVYTPAGHWLdyw8EwTDddUAvy454DSC13wGhlbJmfQXnftvwQFyMBXKseIO5ajW
	 IhljEl8eSbCGV78TyQSb1MRa2koZUKk95i84bGlD+Z7gz5UYtayP1SqwKOiISGFUQzMIO
	 w4UfJ5I3EsvAJg7Ykj5HUExQLqMkSzByKnMTB8kxXjrsN3YSzzmFsDnRVdFIsiDVP28mr
	 a5csnYi1KslEh6iaXyYR8+EIZANBn7oSLh2jDkRodG6Nlvx0fB5B0C6gKR29T2F1PJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUU5+aTV;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B091C606A334
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B091C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUU5+aTV
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3adfc004920so35734111fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471622; x=1796076422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cc3Yze4XZSoWd5COsCahsRwXKqXznpMqPrcsRubO3Y8=;
        b=dUU5+aTV1huIgZIo4bNmRi8Exz/6ZCURgC0RvSb8BoUkrCcVtOcin2V7HB+C9t/Q1x
         15QW0riFtSdUila/eZvD738KypsrIM9ULOvJsv8utLXv1CMELTnFZ6TTcCO9JVr/XC6u
         wLzJxe06JgSKY1fxksz4GJB9kHhCKzGfbWU6C97EkqRVzDusL/SZ9/esQCtGBOe1RThq
         d1OrUoUgmWPC3oqtTDAaPorVbmPgYHDG8qOlPNF/VkcojiH5Ox2ggjK86iqMfxzLjMhb
         emYXQQFlhh18Bin7BzTmWwBsbND3NNit7hx8KlRDxM3ZjZSAuFpknAudXMMLjaS4jOw/
         vFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471622; x=1796076422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cc3Yze4XZSoWd5COsCahsRwXKqXznpMqPrcsRubO3Y8=;
        b=pEq+uL6Jyy0OxraP7xU+yYdhKmgRv0o6/k9/E70YTGP3nTgdPgYNxrwpEzeXL5c6ky
         Yj+aVNZLwqunXmgdq1w/wofYR31cSfNXrtJ5h1VTrQOZ5kAOW5OfXc+z3INsT/vjtG+v
         aMZjH0eAwHwpYgfzmv2kJq7M09cTiMmb1rjsZyOOXlH8DTRXNraJSBFIoJutilAYixk4
         YZX02UdGc5fWd9YLJdvbweYw0DGzfOFRMFaSAYGqAXVqhkFbby0ZDwWickozOiII8zN0
         BCCZem69myIzMbOwhKWQimVpV5/NEl0VOWyQj3KmYmbQNdhbOPVccv74ujK5RExh1JTn
         z7DA==
X-Forwarded-Encrypted: i=1; AL+hErGZIWNkQmLV9GB840JWeepU5vnc78laloWbwYZUxmpxfoLPLdtRPh4v8zNFQe9vLmTPBE/bLvDfiTnoOzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HjyLwV1qNjRujWPed/QPBbfnrsQR6c9LT0ShQDG/UxE+oebjF
	SGh1GIqVtVv8ImuCymFCUvAieGtXFwjVmce8f0MjCSvtW1RpTfVRFpSo
X-Gm-Gg: AZFdTZdgIaFv0MRneqxcdJkh0tMIdUBGUn0yyb29xj+N2zg9J+Bwr+wRTPO3xLLeY5M
	+TNWVF6y2LSidzEtqdcDvLXQ6c4hWyqUSJ7O943QET3seoQnw7Xkp/4nFZ9ubhCbf+hKZ0TGwmt
	gPYaPQpUMSwChtIE5iaS7FyIcPCCD+IfvcI78KHsM/vDVyHJZQMdmXvJolSXDSJ3Ta4Dk3h4XES
	vPZeW3ApwzYPzlPHffbbT+cIAWq2C5ESQB085caAefVAma2UxeoYjxXW8duTcoHWOuU/w8UAAln
	u/yyVTefZ6Tcvih2TMyYaONF76aLnoscHU/sCZJ7zm9l9XkIfKx2J8MOZLUzFt86dRWg0GKeHWI
	G46XOQTzAn7SP5SJmT957QsnTMDrcHYZTzEwCxY3kRA0biaRRwvvXy6LN7hy8s+kiGGd/zi5wFu
	SRMuPSKo91OF3cLV8pLoIZU1l8P1ib9JHGwhqbTNO9Bjt2Bm06BZ8i8xt/1brCjdCSHyyIeN1UQ
	Ih3d5ZtCxo4B0oNlOviSdlyHazZ/ZRCf8DyTRXq0wbDxJlLsvdpBNNnjXexzk2Xp+eBVXetF2WZ
	lF/9Wsvzr9UQ2NKxclDXvFkSoWdD4Sw5hBv8mQ061FZ5CrhOHp5VzzIlbrjsmumQwKduYH7rp6d
	lITqDuQHTP3QY66Ku1N3q1n9zv2Ixrx7Sx7oLbw==
X-Received: by 2002:a05:651c:c018:10b0:3ae:854f:d042 with SMTP id 38308e7fff4ca-3ae854fd127mr23047811fa.12.1795471621752;
        Mon, 23 Nov 2026 14:07:01 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805215ccsm34272021fa.21.2026.11.23.14.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:07:00 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH 4/7] iio: pressure: dps310: use KILO for the Pa to kPa conversion
Date: Tue, 24 Nov 2026 00:06:46 +0200
Message-ID: <20261123220649.36887-5-zoone.rupert@gmail.com>
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

Spell the Pa to kPa divisor as KILO from units.h, in both places.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 535b77da7654..e5a89dac1325 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -33,6 +33,7 @@
 #include <linux/slab.h>
 #include <linux/time.h>
 #include <linux/unaligned.h>
+#include <linux/units.h>
 #include <linux/workqueue.h>
 
 #include <linux/iio/buffer.h>
@@ -895,13 +896,13 @@ static int dps310_read_pressure(struct dps310_data *data, int *val, int *val2,
 		if (rc)
 			return rc;
 
-		*val2 = 1000; /* Convert Pa to KPa per IIO ABI */
+		*val2 = KILO; /* Convert Pa to KPa per IIO ABI */
 		return IIO_VAL_FRACTIONAL;
 
 	case IIO_CHAN_INFO_SCALE:
 		/* The raw value is in Pa, the ABI wants kPa */
 		*val = 1;
-		*val2 = 1000;
+		*val2 = KILO;
 		return IIO_VAL_FRACTIONAL;
 
 	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
-- 
2.43.0

