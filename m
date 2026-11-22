Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334911;
	b=VUDnL0RK+M6lJcStMFz+ku+nr1VOsk09iZQwkbom94LJ91A3hiagp0nEOuTlaGwWMivK
	 jXZnR1VKy79W/9DXS6SBjp+T50GS5XrkmUNNbASAYMUxL8FptwZqhlEsnr8jq6Tk7HGa8
	 eNlRKEwh9au2U8EsxuO4WsH2qbbHUB8NaI1RRx9c/gHwaPrME8x+KQ/QCmST7nVI7e9Xu
	 nqcGitzge8vxCM/p8t2bs47vUyMcv7YE/lZR+pjwRclVGmj8E9cxNuqwKSF3m0xg4RIi2
	 bO+/9ajmHBY0KyLNkumnBCMO/rPppKXSYBmdvgiRckUNg7txRZoki+g4aKZaDfgd8Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
	b=DZM1o5G/3B8Ap0nuxFp3y5xbH7vxu5Zs1b5HVi4gMDCe7ydUj9k3eAKZCXME8w++f0sl
	 fma41jlWlsopebp4xr96NKVgl45s/VOrcmQ8TyhQnU/wa0idpKIIQWQXQyYnNwT5xz/YB
	 Oo0FU24X2CLUvV1dDVY2pIpFglEiwRsPxlrKpbPh0qLhAlG7go7Vp2tykhJW6QwLx5hbj
	 NrbpvTXKj5RRh1VZOe3EuDIN4QRgUKnXD1w/B82tXcEvJS0RC46aMgANcpo81AOEHdRds
	 9RyvWA7P9q+gfPZLz9Ocp1yqEiM0M4PudhmPKLqFtyGhjXhtUCTU07SjfP1rM0h1now==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVmh4DO4;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2FB606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC2FB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVmh4DO4
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso2986355a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334909; x=1795939709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
        b=gVmh4DO4zcFuVLCN6MTSTy/+0n5I9/HC2HAeGTKnEtGYEV9olxe43ouWELR70HVY1b
         8PFW1cmxOlQMuRah8QCAb0ftbRACIZBjBZ5M6oruHBdlh/DZC+bFpbzhWDvWsMhbQagV
         E9LSXw/f9CO7h7hDRz+pM40o/fOjXspY9EZybXzPPu4XAyrenSwqf32WIDqv4vPTwZZh
         cKB/GoZfl2gcopN1WR9m3OOUdumLMRP0Z3UqAWqCKD/RIo+wGMTuAy4GAXjA4WqQ6YUm
         XLyoXgtMEwPjvFbYXLLL5OwGyaSJfjBC7AYLiCz7aVrg5kQ6SWjxkNBddXwlNxk6kaCi
         6BAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334909; x=1795939709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
        b=2RKbhB6drscZLsHWR2+vGiykL98MPPuZRdwW7g1Zgq3XX7vxfhjqF+AQ1/wOWUmlmE
         rZ+GHqpOvVNK27YGQ70Dvl7Dcd4VIeeZNBxI1MOQOldLW6jYz/04zW4YUVfnnpYHEPoS
         mDxYgmald/fIMaK96TYfQP+o9f5NbmeWnEVVnuZc6byuu0Wqpay2NisQN4+C35enHPYi
         DSSPWY4uD0gX4o6WRzQGxcgbtGk2gLw4vTpCLtdV8xrn5RSyTS3uCEAxveL7jVwCOEJJ
         Y3Tr6w4baoA/WpgUKJlPjPExmnU/ffXeq76uDwezj7p34w+OUDSu9dTCrvpndBw4qaUL
         nG9Q==
X-Forwarded-Encrypted: i=1; AL+hErHsd9Zj+jAO07dcVyjlJzHB3NnWau/RSaxSAoEUbPCIu8jDAgG/aDu9nN4LZcNG3nNMZYxG0LqH6e7IBog=@vger.kernel.org
X-Gm-Message-State: APuU4Z8djVqXJBd/2GMYaAFuRoC7TyGxq+rUMmrneFXj4HKFM0l308Gp
	be11FY50x4H3/wk5LfEjEZHoesslK6c8n/S5rDAxKQOJHfP/739NX8ZcxkEtxQ==
X-Gm-Gg: AZFdTZf4/0nXR3P7aNzfgT1q0zI1/7gtw8pT1lBRiAIU1uBmo0G9dkxAuWe1UpL2DLq
	OjVCyQv18/qbTto6HqMNxdrKo0nz3sVZLKuv+iND4FhJbKBK/L+gIltsIlRUEtm3K1rnmVsY0Fb
	oSzDQP/0DDAqTPirs+Sdcvjx0p18hzkonYqondmRY7tzofzGPa4O0tFLWVoFijKfBlAbOdVLUCN
	MW2DufMvwPiXQM1dCIEb4YrkadA73XsZXqro1oFxI8qBxTqJ6YYC/QtrH5ZsIs8IZvYn3b0kBiV
	0HI8X+dg1Nc0vA+nynmQrY2y7SLU8MGLXYMtnyVyWsmG04VoeWqnai8Xtb2vNfQ1KYs1WBB6GDD
	uo1Wmdhr21D3iYoDMNUzAMoGJOA3aAYSWtGnrYT+jQvjpkLquyBkn4rxvIVLjDejfkeuu99INT0
	PGzdbelM8fa5jilv15MmZWP0PBRdRgLCgXxgrhHWHMq1CIORG6XvS3kPJHZPam2vQYv0/KEYfIQ
	X2QtItMiWmFNswjUO+C5CiY8Rq1Zh3pazMn5JqDN3bAlqvdaZfxSyVwNzDBGoUYDAH9as0UgoNp
	QgNSD6euQHUMgTUcZ3ueOHiIehJezXRkMcdmeXtmX5q50qTdxqOLrLW8JTBGbteIKA9It+z8mhj
	d/5hI/5uZzw==
X-Received: by 2002:a05:6402:2709:b0:6ba:1de2:7d0 with SMTP id 4fb4d7f45d1cf-6ba37d63cc4mr5009231a12.11.1795334909034;
        Sun, 22 Nov 2026 00:08:29 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710601esm3596014a12.27.2026.11.22.00.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:08:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
Date: Sun, 22 Nov 2026 10:07:52 +0200
Message-ID: <20261122080753.36349-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122080753.36349-1-clamor95@gmail.com>
References: <20261122080753.36349-1-clamor95@gmail.com>
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

The LTR-659PS-01 is a proximity sensor similar to the LTR-559ALS-01, but
without ambient light sensing support.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
index 20abd7da080d6..85ac3b540c206 100644
--- a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
+++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
@@ -17,6 +17,7 @@ properties:
       - liteon,ltr329
       - liteon,ltr501
       - liteon,ltr559
+      - liteon,ltr659
 
   reg:
     maxItems: 1
-- 
2.53.0

