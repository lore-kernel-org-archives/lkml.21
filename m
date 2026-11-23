Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471627;
	b=L1rlzbU7oim1Y9q9wJM69SzdZceA/4cro81mamKNl+wOYYHANWHYT1AIzRz+PIxMswBA
	 MtGFTZfwJ53NaNnDAaOWN9CcF4ryheZikGhUprMRkdJNVqBP/QoWR1KHQUi2apHKxCuSS
	 7IuoyGJrUrykngqfrWG+DGbpPUtELFr40aJwvO+dXMJxLQchAobaRNKL39dhP3gXAOixP
	 bFXkOQfGYHYNpdetb0/ml1DjTKEerDpEN34jCMw30XaMUnG50lEFowkfJ9ze0JtJQa/wH
	 wWZCcnbvaI0AMLuoH1bDn/pR0HAZpaEW4t4sF8EwnWj9rAIMLpqaJE6z432ehN4NBcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2Wn4ycrprsEYpxFTIDDs955RXGY/aWC7MHO3eiRlG/o=;
	b=wK7epVB5LvA+It0OlBL5+eHwJNghQAdIKXalnkCDtz0fM2e3AIy1TQdJJNO9kmsLx2dF
	 sb71K0Ht4SSG25wnXsGpzY0GEG0ggY0wuvvLGiuQqz8gV6TB+Zfw8kPl0+KH+UWKgkpgd
	 9NPBFhakkjn95K2obIwgTTwNW0BkiriYdnbAUJMV/6spZ3YB+lnCTajKJ6rCPZWZi02Um
	 1YORmOOG6xWJluoiMR+u8uyASfNKwItoDmDHAXks23msHWk9fnkRvE9jiZdLb8uWSd+09
	 Y6ypvq2ZdzcZtZoK/LXnLhuCLKO14VqOewdAy3Re0lvpRf4pJ8gq3TgFDYmehFFpWBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRvUA3EG;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA90606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AA90606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRvUA3EG
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so32944711fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471626; x=1796076426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Wn4ycrprsEYpxFTIDDs955RXGY/aWC7MHO3eiRlG/o=;
        b=jRvUA3EGFqhKqeQken3DAP1tNWb7GE9oi++ZNu9bBetTzacQ8OIi73Iok4Wq5V2Wcu
         MOwJNF1ukSBPJZN4E1aw7v/5OLtL1E19Ehtpxh55xrS+uJ7iEKqyWs2q9HNtZYDPWsf4
         VXUST5heajjuzNJORkJGhpeJRt2ER1AwiUxjYvlXSe1NNr3Pbw/mNXriHi2aFGek8Op+
         PoU1R2rOYUyO9e9BOSeSMrKX8GiG3oo+gcXSsrZ6rEox2t3QAijYHebZp4i/4G3/2cNr
         fFxtR3Gcjac70uMruzcl1S2OQGCVzn69h8r5eQdvAvEVyMzmSA952pnB8IwPZTzUAsLp
         OEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471626; x=1796076426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Wn4ycrprsEYpxFTIDDs955RXGY/aWC7MHO3eiRlG/o=;
        b=fTYkIYCHzGPhjjU0Q8GHWUe/g4fsndev2IAjIC34NWsJBZSOQouF5KYMrsI+rXYC6B
         3GpEz6QXD4r+CUX9241R3Ivlt2MBZ3BB0QrxCc5yxJypoYkDstwt2GeTIXY8S325R8l1
         hjgpD2NxfY+dzpjj/sf6CsfeF5DwXni27H5WDT2JPoN7BtYaYjTmBWtMu/QJlxo9F6sr
         ECASJv2LTh8S431Kw1ldlxFSWP9MoR5LmRDNG1uaI9yXWAlOrnf613Q3ukwhMQ0YhmX6
         eymW6E+u+O6H+j5wbCNRK+aVYucDwo/R4QA+47E5N2vB292ygWDPlAJDWOALLAqb1Ob4
         jGrQ==
X-Forwarded-Encrypted: i=1; AL+hErF6QSaxu4xmuL+quvNxiSXoXCZCEw8/yYzFRUyDKj8nbbD7MwMtCRyfCjDg7IcvFrHAU4KNI+MFl2ElUJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6U21GCbGQiANhWz6Fe6b+3uCMtekpFdwySp7Zv0NuFvQv+oU5
	67Vd4f3+/PpAXpjuepw4cLJjAbiwy0b/L025WN+4eiraCagUtzK9ZBvK
X-Gm-Gg: AZFdTZc3X73+lqzxHcAQYL8gQTPSwdUUzeRAKFSsvlql/ARyfCoKLK59sPGVnW2m5lh
	h5JNQVFCxTdx8Tn1uFHercdNdzlYdPgQO7KV2U46UnP5PQQv3Z3gXxXOqQHdJQGuYHi6y9LotK9
	M3grlUcymZDF+GmIDWHm5I+pN1Q8jVP/ghe0Kk6Ig/Jjn4R4PXC5zcg9EGJyc7IskAIZHrfY/mJ
	6sGrM8TEFXzemCatCSEZHayxADoAcpd/0Yt68tEZnxX0eRJr4NCepi/iDbS+1Bnrb72wnqCVE7k
	1H8VlUg+oBsqFQWMkVuetOfZK7OhxRhRBTAiRoSo7CEnqrO1zjZn1xOem19Wcxh97kOIxi2zxw4
	xROcGyDkq5hq+kqUAHjT1zQUn0PWHkIMFmyrTX/yDG7PzvF1rdgV83M74k3a/k8F1QRWZy2lmKu
	ZZ+Vnmb40lajNpmWFUilG3rzJcL3gxdmv1W0f3QAgp6eWtjbpYUxzGT2HhNq5T71W9SZYpNwdKy
	pmtCyNPoX/0JwLynvgXQBZvmczcEkvqdJXPmKTIerLhREC9SUPVLA1LjOpzmi7H3jmYErSXsHb8
	E5hMRs+5QkIT+Cksp67wTIhWpS/d0ShAc/6k1q7wcW8q/l1iKIOdEJZlm++yTokkNHoWK34vN4M
	ncR7cUGYYFP5nyx4sHJBZpikDkL3IwXwGw9FLaA==
X-Received: by 2002:a2e:a9a5:0:b0:3ae:25c8:dc3a with SMTP id 38308e7fff4ca-3ae7f9a6918mr42861991fa.8.1795471625467;
        Mon, 23 Nov 2026 14:07:05 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805215ccsm34272021fa.21.2026.11.23.14.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:07:05 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH 6/7] iio: pressure: dps310: drop the unused i2c_set_clientdata()
Date: Tue, 24 Nov 2026 00:06:48 +0200
Message-ID: <20261123220649.36887-7-zoone.rupert@gmail.com>
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

Nothing reads the client data back.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index eb5715f75e9e..7581ea4c99ba 100644
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

