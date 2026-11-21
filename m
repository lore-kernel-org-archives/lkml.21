Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795240525;
	b=UKdi3YRu7sVm9e01pvDjYPl8y5GJPL8TwJ8mt6SiMGDCejYwJ3CV5FSP+yEaoeL604yZ
	 Osd2Lv0YCoG4UzWm1ay+uvnmQS8tPIWpOJfMPARR5dMDrvUfXO47xVn6qPieUWHGK+pWL
	 zycjxv+MRgmiM6nf3uYOVVnS4N2pS6R/27Xbvt1jehtBtQR2frsBxDV7AToMt4u+WqgzC
	 44Z5Kc6oHpAb1dPX933UPKTQSOUm1t3T+L0OUSVG4aYmLT1EDhDFUNTl0+r/xmMsIr+LN
	 Z40TANjmVUpNYCxJDgbwjJrA3Ts7k+iJkFBwRJRIoTDOr94aj4zw/v4gVsPX6rXySrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795240525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NPYFuPEgu44jhRwl9AuTqHxhKDURTNdBQkYhdhcmNfk=;
	b=ELNHHAFhAvRq6xbAyf6Z6Vt53IK1fP66Yw61SkhpusEt2OIuqsVwks7twG9Ib7q3JAhV
	 jXnenOyxUUUDGdg1tMhwznnk41jU8+wMB6f47ODA193dsegxaNwQrUDPcZJukT4gCoTrr
	 iLhdB0+qiMphkbveMYFwpM3KPaMhriH4M+C22qG+xwXym/NasOOTwp8L/wSG40/peXK4t
	 kGsqczyXXQBhf/cv5zhFcVESPVVnvsiEensgUaKdj+Y7VEXpRqRqlvPa6urcA4nq84eTE
	 azbe9dQu5Psx9T3Ot6BvFAvBRLerWJ1flApFwVWHAKGAN8uqneOF5ArQ6bp33m5d07g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z5FMl4lK;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACDA606A6A6
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DACDA606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z5FMl4lK
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3863db981d4so1676919eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795240524; x=1795845324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPYFuPEgu44jhRwl9AuTqHxhKDURTNdBQkYhdhcmNfk=;
        b=z5FMl4lKPo5jDTZak4fyIIWTlt6W2K8PrGOgBBb8aEWjMSRIocc4vo6nRWZHfxm4L7
         Vgu2oKjOnuyXSxGT3D5Rz+YHuulKC+fzS6Tno0D4BI1du5okq/NMQMv7fqeaqG2kUteT
         6XgEvlTuzx8ljPCOd/eZQRIIL53MQkpjEKQzlg5UpJwAb+MaG70OgnXP1I/F07zRylL2
         Wxsn93eQrAesTmNKM7DXtUiXhkRq1kO76tskmDfLeFlIdss4d5gQ8QBWuGncc7rWwtQ/
         dzx0IppAUmcaz/pcwFYhxnRaxAgaH94uMrfZfIoN6NP9xAgPipogFd8mLwMpOjQRcFnN
         ODFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795240524; x=1795845324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPYFuPEgu44jhRwl9AuTqHxhKDURTNdBQkYhdhcmNfk=;
        b=1XMbbg1jDDM/fuOIagXG0MuTPKJOrGTyfGlw+93UMy0Q7jkWIamJ306iVy8lYpVSBx
         7LwtEqpt05Wr9IV0J7uTWaMJtwt1DHU4OGNuK+5Ax+c4Ax1yz1PYZI7ZGppR54efPlwh
         oQlFsbjmJDkukJDz7XQJGOEo+8rNAFk+/ul8yc4JiBi0F/xjHLPi/5njMeSMtPdvik7t
         wyx7DsuJ7Yv0KR6b54Dh+Nc9SE11Nvh+LcDSTJEOc6n+GP/2rXMEMTzqIlMJGsP7c02g
         2TWvoVr9lFrfXibH4Wfd0dOVnKgfiAfLl4YpzQo7LcSrvcf8RTeVai5ieLWgIb0PV036
         IWKA==
X-Forwarded-Encrypted: i=1; AL+hErFopUk367YHCWzivuipkLCZnEjt9fDFpqd+Rb1EshFecuiskZ5H5YBaFpVoJCEnh0nlU2r9mwHelrUEF0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/KloF8LbXI2G6hTqIwF1IVxad4loymTS8q0B2FfJAiIijnaOH
	OYdqlD5OvyVXOdwNjPtNzC7OfdfG73WgTplIMJi3O+q9faoMB9GxoVftXx3qjfP4ySc=
X-Gm-Gg: AZFdTZeyWrdSyJhz6ePrThHjVW/yjCPMJt2YaYbzKXkBeuovu+6fGoYfwp//MAuH46F
	hNDjuNIxQeSU8M4gw4np3a7WVBM7ePcQDdRc4fBUDoP++yl8cTusAqgvPhy4PAcaa6T40DZxdQn
	F9NlKWF+ZvkEl6bp9SUTdYDQ5XLa3VDVmwE9UIwcXfitY2BdmPV5rSLPfmPAn8Z63Ju2ce9qm5v
	P4hlfS3xBQwAAgzlI5puvAwCV4tak55cPJS4pM56VA4YR7Ju8vf1ge+UYnyAF+qdXJQ34E+VBtr
	uCny8iRnnrsWtvnSKBVQRvCwfyc0U8uxk9116eJoUY4xk665tg8/BuSVzjVt1gryj7x9Ks25Hz9
	K7lQDQiXyB1ErkGEA83izVao/ldG7OmdDvZzIhv5axsixzj7jkww1AHSJ6X5pVAwB0bfoYoA1ib
	zqv0gTEndt0T/px751bWxObHM1HfmRbMdCzp1oWh0y02mF63sDil7WgF7A+Vba4G/lm9DRfCeRP
	max9xX9XfdEFuLl/7khkyNE1Sg1BEtqMMbNmGn3N5xsHfaY8BOs32P+TcP4zS9so5K1AuR8Xehn
	VDu+rLcLRLnEeoKBk9Rv1ELdF5LrsC4=
X-Received: by 2002:a05:7301:6408:b0:383:1bfc:f1c0 with SMTP id 5a478bee46e88-38570f27a56mr5280716eec.32.1795240523983;
        Fri, 20 Nov 2026 21:55:23 -0800 (PST)
Received: from [127.0.1.1] ([2405:201:201e:8863:a72d:7d80:d674:e22b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm14423662eec.21.2026.11.20.21.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 21:55:23 -0800 (PST)
From: Viral Patel <viral8854@gmail.com>
Date: Sat, 21 Nov 2026 11:25:10 +0530
Subject: [PATCH v2 1/2] dt-bindings: iio: magnetometer:
 infineon,tlv493d-a1b6: add TLE493D-W2B6
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-tle493d-v2-1-92d7e57cec89@gmail.com>
References: <20261121-tle493d-v2-0-92d7e57cec89@gmail.com>
In-Reply-To: <20261121-tle493d-v2-0-92d7e57cec89@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dixit Parmar <dixitparmar19@gmail.com>
Cc: Victor Chernyakin <chernyakin.victor.j@outlook.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Viral Patel <viral8854@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795240513; l=2626;
 i=viral8854@gmail.com; s=20261014; h=from:subject:message-id;
 bh=Pve1oOphWw1Q9mky6K/7lRz/7nV3rjbiYSeFFIY8C8Y=;
 b=J8EEItayLygRxFy9STgBbIyjsITUuMWIJso9ogNh4CKPbukNCbAccJU8+yftE3Vsfi+Y6hc4o
 hSYCLL1HvMxDTho2NS1PE4hwBu4nq4kctiybNI5ekR9sPV9xvVxzBk0
X-Developer-Key: i=viral8854@gmail.com; a=ed25519;
 pk=UC+UDB53t70pTK4wncXf3tfh0hsYMCqpxYnTaKX3MYA=

Add the Infineon TLE493D-W2B6, a 3D Hall effect magnetic sensor with
12-bit resolution per axis and an integrated temperature sensor,
accessed over I2C. It is a second-generation sibling of the
TLV493D-A1B6 with a different register interface, so it gets its own
compatible, but it has the same supply range and the same /INT output
sharing the SCL pin, so it fits the existing binding.

The A0 to A3 variants of the part only differ in their default I2C
address, so a single compatible covers all of them.

Signed-off-by: Viral Patel <viral8854@gmail.com>
---
 .../bindings/iio/magnetometer/infineon,tlv493d-a1b6.yaml   | 14 ++++++++++++--
 MAINTAINERS                                                |  6 ++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/infineon,tlv493d-a1b6.yaml b/Documentation/devicetree/bindings/iio/magnetometer/infineon,tlv493d-a1b6.yaml
index dd23a9370a71..3f0058cbf538 100644
--- a/Documentation/devicetree/bindings/iio/magnetometer/infineon,tlv493d-a1b6.yaml
+++ b/Documentation/devicetree/bindings/iio/magnetometer/infineon,tlv493d-a1b6.yaml
@@ -4,17 +4,27 @@
 $id: http://devicetree.org/schemas/iio/magnetometer/infineon,tlv493d-a1b6.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Infineon Technologies TLV493D Low-Power 3D Magnetic Sensor
+title: Infineon Technologies TLV493D and TLE493D 3D Magnetic Sensors
 
 maintainers:
   - Dixit Parmar <dixitparmar19@gmail.com>
+  - Viral Patel <viral8854@gmail.com>
+
+description: |
+  3D Hall effect magnetic sensors with an I2C interface. The /INT output
+  shares a pin with SCL.
+
+  The A0 to A3 variants of the TLE493D-W2B6 only differ in their default
+  I2C address (0x35, 0x22, 0x78 and 0x44).
 
 properties:
   $nodename:
     pattern: '^magnetometer@[0-9a-f]+$'
 
   compatible:
-    const: infineon,tlv493d-a1b6
+    enum:
+      - infineon,tle493d-w2b6
+      - infineon,tlv493d-a1b6
 
   reg:
     maxItems: 1
diff --git a/MAINTAINERS b/MAINTAINERS
index 02015eaec312..c3004f683e78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13117,6 +13117,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
 F:	sound/soc/codecs/peb2466.c
 
+INFINEON TLE493D-W2B6 DRIVER
+M:	Viral Patel <viral8854@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/magnetometer/infineon,tlv493d-a1b6.yaml
+
 INFINEON TLV493D Driver
 M:	Dixit Parmar <dixitparmar19@gmail.com>
 L:	linux-iio@vger.kernel.org

-- 
2.43.0

