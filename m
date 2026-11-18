Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035188;
	b=pBdzFEYi9iyuXWGo2dBX7+p2OYh9SERlkdfy3NN4kqwC/GupI4DMZxfps87EQ9YYsquZ
	 ASXS2fHRYTK4WHHiNopB7cjw12VB550/2PDtwZ8d2FNC5UHGQ7KGZ0ahE/Vjc6Elds0L6
	 G8fu4u6c5WIKjFko2MlOS3EvLnafR+EBkCs2gPh6ARqcKI/rSct3MLXeSpWn68fe0brb7
	 LSNhx3jKQWIUf6Sb1MiRa2wt8Rt/rfXQQ2JlPXOIFGCxBCwGaAtjvCJz6PST1/QKHKS2A
	 a3z/6S+4pA4QU00314sKDX4rgpFTqN2XBxttVDIo1r72mWwvOG242sddYzcuUTYsp2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
	b=hMBYa6hQ3LpBBRIEyMx8KG8fYwG7zWjD5E8JtwyXv8XnjM9puHaHV9tH2g/0qtKNufYD
	 hDkH3bWaz0U5j1jZ+OWaMSvndHN0NM3RWM2b6cKqZRJqZB/PR6uZt1F8q1sWPprLjaPTg
	 fKGH4uP0WLbW49ceWk8Fgb5dOIrNHltXT+bsNKRL69L/XXOlaqL/H8u1XYVYM6SLFdDPr
	 XeethuzN9G4uFxtVyl5ZXIVqVyqqZ772JOM+c/88j4/kyYC7gztRo24yh3JpzMoJDZqHN
	 KR6s5AHV+gOulV/TaFb9i/Use849P0cAnpzuDi10wkExNCQLQeJQ+FKX+ewSBysJP1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnuOCiw+;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABD8606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ABD8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnuOCiw+
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so236132266b.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035187; x=1795639987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=mnuOCiw+XVWApfJrSVasj2ZwbRaCZD5TnFi3wMHnkk89jysXAwnStHMDwJduYhvMWM
         Q2PvQAilIlElLPf/ESHCmtguPGq6fcjQYD80EbW5p6p0h9w58qWo0WoNsgOv87jk2XBu
         /6WscvhGjJen+7AUTwNMx5B6jyDT3P35kUvp6+OsGBq9ckOPsugUbOhRIAiTbbo1yvHz
         wNA72pMm0g/h4/82Wy7xLDShzDOW8g2rwWHflod5hXoYXdjbsupIWjr48douNVW96rIp
         +LuAqYmahyoe/zpNI7SmwNshZxmL0DXh/aB86mxWTk2jaz3aYAfN2sO2aQ9Kc/bzhEZt
         dADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035187; x=1795639987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=VvrT5+UIiWkFetBS3+Wc6EYc7PkZUrVykkLo4JSWdR51wL9kDULfIYv8G02EjnmFbR
         0c0yEB+Q42Zt0PMYY2h0Pp5dBcBb3q6Wc8jz61pInGiTyLXj56HC7g5sQPZ8e9OAIYrO
         hRZrEBduT0FSkaAvolKOMaYhMtjhbfRHfwllazr4aP0cl6veAGNvM8ftK5xusIPEGSbS
         k71oWQwm+mXQ8TqnvMyKNdtY7z3mYbVvFBDqYvixSp5Rv/cBPbp8nRDedgNWl8ctoTeL
         zTb85ZdxXSKy2CevLi0gmcvMGML6w4Z7N8bjvbksbKXx/D0t97hN4co+4710fQHXgmfI
         tBVQ==
X-Forwarded-Encrypted: i=1; AL+hErEyDdnfd7GUuVXP//AmB106nropdJPh706bZa90Juw4qLpTS2jLhMYzybfBoubXbL3neFsXPZk4GgXo+qQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R7JsQrdF4vHjAnU8Es00j4TabD5ZP8alhenIRQ4gBV7nUXMC8
	fiu+FuN4iN4Cd6prIksDyGWIRI44rvvsW+lMHyrnYv8I3+qm3JeZ69il
X-Gm-Gg: AYBFou282QNK2exTWZC/vPW5wPVVmg53G5DvNkf+5HaiA3w9A7lRHUbSxBeoKMyBUXX
	ngjeeWNxgvWRuXWbGjSIPpTTTLGOAqjqiE1po/HwChy132Mv+DcDSNe14r9qysGbEtj76saitlO
	H1LFiOsTpKG4oiY1sagOhM50SggWcknKJVOJn5fn3DgapJAIXJ2bvzjOLk3e1if7xqoLX/69gse
	2bYk0j6YG2AiYiWEAu2bFxUHmMsYjfNyhXZ6FwxUaRAwIC9t8QZIjrYOWKiCd9Mjn5XHoRyoqVh
	NwQ03PSS2/T1s9O8w/3HN6OcrLvsUQ7d7LNkpV9JDB9vbhLYCKBAUeZCgRXOEirKlGQrgVzdVrp
	+eS2KiZIhIsEMHfA0I6laWgV3jop9qqaFJrNQgqWE6YX8MsDabeHfrlwMz5GwFkqy2+LU7Mmwhh
	FFASB+z6N86NTyfErw0qaErZpgz6Rrg0j+LK51hjuLblLICVsGRUxSgWEWaHjXxSDyJ1YVpNLke
	T/KQBgVd28baX47+eZ0kRIRfNwjKK+GC7v88JNLWKg0D6DUGML7GE1HjkA2ELkykJIwk2/+eEtU
	pX3CPANL9WlPBgkA/qBTzdSppNAtgAUrPddnt0GG+PQrfDx65/BUPwNT3JfRMg==
X-Received: by 2002:a17:907:6d1b:b0:c51:691:c76e with SMTP id a640c23a62f3a-c510e35c6camr355946066b.36.1795035186781;
        Wed, 18 Nov 2026 12:53:06 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123421612sm35303166b.41.2026.11.18.12.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:53:06 -0800 (PST)
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
Subject: [PATCH v2 2/4] ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
Date: Wed, 18 Nov 2026 21:52:05 +0100
Message-ID: <20261118205213.88778-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118205213.88778-1-apokusinski01@gmail.com>
References: <20261118205213.88778-1-apokusinski01@gmail.com>
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

The i2c0 and i2c1 controllers on AM33xx support TX and RX DMA
requests. Add the EDMA request mappings and DMA names for
both controllers.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index 57a45609f9f5..89fb1d1eb049 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -239,6 +239,8 @@ i2c0: i2c@0 {
 				reg = <0x0 0x1000>;
 				interrupts = <70>;
 				status = "disabled";
+				dmas = <&edma 58 0>, <&edma 59 0>;
+				dma-names = "tx", "rx";
 			};
 		};
 
@@ -1189,6 +1191,8 @@ i2c1: i2c@0 {
 				reg = <0x0 0x1000>;
 				interrupts = <71>;
 				status = "disabled";
+				dmas = <&edma 60 0>, <&edma 61 0>;
+				dma-names = "tx", "rx";
 			};
 		};
 
-- 
2.56.1

