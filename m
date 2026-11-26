Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695228;
	b=GbP4SLWIOH6zyNArh/AE9e+IPM1ZDxlUBINXwpe1hg48wxCXTsv++gwr8I0bpHNrNYHF
	 kpElzw89YjkemeARkY53gV6dxuxHYGcr5YVmkn8oqnQHMEamQl5yA9mmJudwLoePP82+C
	 B4ZrWqE7nhdVIQazBK68u6XENnuA6AwVZKHxSESls63YpBkTiYOfLNdh1Nn+Vopasc4CV
	 iBu8HFrothHIye1D4PUwvYL803rdiI8MTt6h307nLISbo0Zfn0VgSlwJLOfiVFlFL2Cm0
	 P3pNmy4Ak7tVOqzNXdumnqxzqGYxnRL+hzWAgeT8V887AJqoe42eWOElIJ55ZPYBPTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6jLIDA3Ejr90H9Zg8hbSIbmc5S8RY3wVmyD2CGchRzM=;
	b=hUsCy+Mhz1VTpceEGP0bSinLRu5hxGD3Rb/eXMUSEJsP++DWs+wFhglTjcPRKszDjKQt
	 Rdq4OfzR+Z/zXmx1OAyRna9px24NXmNcB0ujQ7TKNJNNN+C+3hTpMdvsfO5XCiCdz41w7
	 ESgyNlQaN4ej1Nqy6CgVWV7VlQHBQerOZ10cRyhXgbZ/eKtpXgvQmxoELAjVJjLB+3RkL
	 mE7YekU28w72ZNmYnJCSWttMVlwXrX+Oujd5Z0sIzW6iy9XE0CrzAYgX10bfn57uqffca
	 bRjk3biCcC+vjYWsukSX/VjqMA1zLf2hJXf8DKhdY6h8c6y+0xl/b4FioCCft5FYuJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EVXs8yh/";
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850D0606A699
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 850D0606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVXs8yh/
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3adfc004920so65938521fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695227; x=1796300027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jLIDA3Ejr90H9Zg8hbSIbmc5S8RY3wVmyD2CGchRzM=;
        b=EVXs8yh/L+xJYUHOegpswY3XEw5d83Sf0dUzaY1LcMxI+gdpgTGyKdl6qaV7aaIQ0F
         y2HxEINWwimbGYG4qZazDP7cruA14USn84c/MrUgUCJhyHi2sfq4nkGpz9gyI9iR7lxN
         WUHEDBu4vBzo+D6YTWkJENjNL6VQrVSVjwXBaO4GKuqOXiVsMSd9Nm8+DVJg++2WZPTH
         L8BbtgSqmIzfDM0aoYceSkUBOFdzP2IO6IUY3sR0EDuyg95Va71T/D4FkcW28/AEIaHc
         dfiJSCvAgUjCL+IJVUFZ0BJGpUDswUPoXW1LrC/fjfMlTolS2TyoXGbcIuEUXwZSAQSr
         +fsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695227; x=1796300027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jLIDA3Ejr90H9Zg8hbSIbmc5S8RY3wVmyD2CGchRzM=;
        b=Mrqf7IlZQGMWdamBAEeOUbcHRVEihs066xBFO9sOuDaM2TVC/wXVC4T0B85W+udmBl
         XYvjs8ZiZhXk0qbscW7lnF1eH5fJSiQQ7MPAMsoxrsbzzp3Ve7zahCHITMPg54bV51Av
         TP90B4jX8E4Um94XQiH2/byHGySygN91kmXK3sG4/julv9IbTJmXHkvoguP27oyXMYZ6
         TiXr7NX9ZB8WyK6BQfLKPBxqZbYG+Fdx7uacsqnzZDbcTpdS3cU4+45ZO/my86FHH1tf
         Ng6vivR87SdyOB1Op+qQPSde9CcFi6EfrlJbI0c/CMZF3UYRti40+7DKE+Wkm63iTTkj
         PJ0g==
X-Forwarded-Encrypted: i=1; AL+hErE5xZvHdA5/JAoEdHP70jzT5SlFQ3Si6FZqVXm67njSA/PMvastoonFWuuRxcEEGBb9QonMr9uDEcf6GvM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nycHm5UAtq6Kqi0xG1n4ALbaNL0J81Lxfi65cnFbdGAW0Mit2
	GZmlUXzuH3IeQH/C7R3Zol8Ce1Uc+NRx+4/+XWi3BapcLzdvOiFmvMam
X-Gm-Gg: AZFdTZcOwJK34tzzYIz4OgCETgt3ALCpwRXqgoQQoV3Nrq00I0t4CVmrS7H0Vi+P7OO
	8+7mbT+ntH1LbdJvYyOLKP6EQOws2EBZG/E0SGs270DZLd/22YavgfvfG4NBPGJO0TXAF3EV+zQ
	8woxJo/e6mciHqxChQ8wjEuz17V6H8wxxeFd1nMmrr1rV3mdc19hxX7c+wcWg5QkGCEQIpcLQEI
	Tq11XzUSAz+5a1KiyH0OfFcD3Ca3iWiMxkSiG2XHYM8dquo/grDh48NDXWBtWxjfvsUvKfvLQD4
	MKOZEtBkDqPedP7sr/ERkHUWDKbQOpPBIVF2TnD0fiWzNfjVKQpaVfanQjev3dZiMBuyTW/6Mdq
	UKVuqxL8aNCWw8VDx/fLq+/ckDCfmLzXG7dQjVSUMWjqM6zbsjVwbgfc7v7NW7R/HDzjPIVWNoD
	bfP1qrBWYpV43UcN554Z7aegUR+mvk12/nohydT7O0n7/dgP42l7Nrx87VM7pOHIKzEW2L+JH31
	85v4ZHU0iptazYlLXfSHkOVvBOv91UttqSQmu9GtB7zWDwSaAVRl3XyA9sPo2eh5JSBrMWjwg4i
	SfASO85tJAlSurqHpoM8QD1gPrwiwSKFCdlpJMYyID+SrC/jJLW+9DrgEiiVS2fQlGDjwmU+Syk
	ds5AG+zKp9vgfGaEZK4nXMTXgxMbTMUnZAAfj
X-Received: by 2002:a2e:b8c9:0:b0:3ab:1862:25fe with SMTP id 38308e7fff4ca-3ae7f9a4d78mr73688421fa.4.1795695226613;
        Thu, 26 Nov 2026 04:13:46 -0800 (PST)
Received: from yantra.. (nekmmqtmzjx8yvukhae-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:68b4:f70:61d8:6e86])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e8e0sm56541791fa.5.2026.11.26.04.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:13:46 -0800 (PST)
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
Subject: [PATCH v2 6/7] iio: pressure: dps310: drop the unused i2c_set_clientdata()
Date: Thu, 26 Nov 2026 14:13:29 +0200
Message-ID: <20261126121331.10438-7-zoone.rupert@gmail.com>
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

Nothing reads the client data back.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 1d46817ad04a..72f62a1aa3ea 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1633,13 +1633,7 @@ static int dps310_probe(struct i2c_client *client)
 			return rc;
 	}
 
-	rc = devm_iio_device_register(dev, iio);
-	if (rc)
-		return rc;
-
-	i2c_set_clientdata(client, iio);
-
-	return 0;
+	return devm_iio_device_register(dev, iio);
 }
 
 static const struct i2c_device_id dps310_id[] = {
-- 
2.43.0

