Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201204;
	b=Rv5Rb4cyMqrEIldC7roYXnBdZxm5Rzu9Int17f3qmu7MSShV3KEBQvjRSOrART3Lcd49
	 7CLGHmWe6VqglsROJFs/h95cIDDsHe1rxJKOisO2UdyLRI6LL2beYrnM6zIAr/WZYFAgE
	 AuxxVeKKDgOal32vlPfVgG6fbNrGmLCMkWCp6O0b05c8iK/wuXetAvrRZR5jsw+kKn1EQ
	 Z24EJ5vl58hAMlAZZHmNH+cGGjeFbucn8I9HxTLdaablHGI+01nfTX6+As44f9vYU9R3D
	 sCT6Md/lKS7I0cAb5qucDLGFkn39mx/ddz4tCvVi8SP03RT4qs46IaPB4vTHrBuYX4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
	b=KUJfTTFPTwOAQzw8QgL+aJXQbwwvf5SMMX/4Y4QGmURbq5eHC8Rc8qabccumcJzmbxdu
	 eSH/IEqDy5IdACPLNAz9zQUTBwZAn+sFtvr34hIFXaGTKFrb0Ap6GFI6S5Coil5d1iDDD
	 2XRv8/X29neKQ778NXnzmrqucfV/XuKr8VVu+/CNnYR72ZX4RUmvhGMxQJ+36RTF+bmp5
	 OV4LSJDbVH8qa/Y5dBjnsIz3mHch95nUyJHVv4i1WAhQG486LQ4XAEM7Q1RBhfkI8SAXV
	 SaUmUbawpYnxXFockvgtrSX5Z+IH71PQPJ94jOjTmNYAB6dwexRLyxostgLCxSEioxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IzVVT4y/";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068AA60A380D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 068AA60A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzVVT4y/
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso220892666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201189; x=1795805989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=IzVVT4y/3rbXHh6TAeSjFM3cC/AXHTbk+EhYy6zelufBVD4aPc/hWkjoxi1Rmb0jVk
         s8JQtdeHZNZNToyzuRKfrDqtxBtvkSgIcKgvDajPuk9h3TBzAJFbNAbDi2xvVdbfPNjt
         vlhP387H/b2+Jl7MMMbGvXvpSU6EK1dgwwo6qLb32LTYeFMGZkmpvM/PneQqIL8ZLlOu
         w38ix/s2fEZxKMfzh11UOfkdk2e63A3zZV5mnnWLwOmMLdh1YoetQvFl9H8lPkUpKtlq
         ZQUFx3enbC0FIlisEq+y4S8VXTVhJvqt1f86dPpdDm+/xHoNrFTkiN9cJgXlbapmrHdz
         xY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201189; x=1795805989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=yS/F3DSOlFik2jilAbCYKSJmsAhAlZWZU2ZDzPmVmoM8aC3ZNIrxRrIO4bqxD3Mz68
         HEIpz5zpAWByH+xoLSAbWDZHug9HpN5XHchLo8HEgoPBRX22WzXG5UKDrmIfHle9ipIc
         MgqDKVNsmgWM4Dg143ZWUwaEdLWjPft2rIL8W1PylqkhNJRw1GPWGDedIKXu2p8n6kDY
         p+VKslznhw8m5yW10jOJ0byZwgNeHdRiEYLPkMTO/SJ7ng4pDbHvmTaEqwca4F49sLCV
         UotIIlXv45BkTFcK1VnAUu5RgYZTf5YUDF7ID+GMRr6DAMHbS91nEChLSDxD5NfL21wx
         6SDg==
X-Forwarded-Encrypted: i=1; AL+hErEdZh7P3a9U6ggMDFRXIVosX03ad4KMedFmerEjMX1w5a5uoGktXPrA6saUGeYrs3TiEhuHC1grw+y4awo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KZqye76rzvgIPuoOYdhf1/hQ42kGhlZ0QWkXZxENHKt/QZts5
	lCaFHcMnR+G48C+OMOLDeWf+iOH/EiFBJq4t+lzYHUmZkaXkAtd/WCLe
X-Gm-Gg: AZFdTZdSd6RzVq88y0zF7i9ow1CCe8/9HB58YaspYejgYjUg2HERKVK2WNrm+ztEKW6
	CscTn4obVpBd+YzhwZcA9mfhMZYChdJ5pAhk76iLleMFJYM/7IkGx2bhWQPWN33WkVJ6p1HKvyF
	CNvOvAKCE7SbsjBvPMgNQt3nOLayoZJm27uCbrkLLxhrfBEnJhwFxL7XfAEp1FHlgWAzQHLJ9dA
	0cTy2i8cLjyyRojUimE4BTzrCRNQG8nw4LiV4tWkvZxO7TcjKTiQegJjy5/HHgxC5NyEpZsSRrG
	s+xOejffKxtLhHZNRi07wQMrJoqpJoFMXxS69n8N4NWk2FBgJ2nEJLL4WZIQRKr3pvKgoQYueER
	RH0ht+RCmiHKbcd5FZfhrpgwNwGnrgRWNOSMEcpNxIKOPby2+dCbw/SW1X1z50MmB1+6X4tVHw3
	azPxq7qsvxkEf8zcC5CdEYtl69mSYdewuXRHCcDEucjSTJAY2IRlo+g0OQE+q1We0KCOzKKOUbv
	tfblv+LcSx8IOMbQ0X+ALcIhN8ABPgwUPR53qg9WD/O2CWD4PqD4h6xaLmjB8afmoMzRL/GbqB+
	uZ7l4OoxzONQHagW7i00FevjOVm9ZAOJqx1zOks6Hm3S4Ak/D8bVWOQD9WZO/sRuEswrvn/KaYT
	6RJZ9iXw=
X-Received: by 2002:a17:906:f583:b0:c51:3c8f:55e8 with SMTP id a640c23a62f3a-c513c8f658dmr365847966b.46.1795201189284;
        Fri, 20 Nov 2026 10:59:49 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm125205266b.85.2026.11.20.10.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:48 -0800 (PST)
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
Subject: [PATCH v3 2/3] ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
Date: Fri, 20 Nov 2026 19:59:12 +0100
Message-ID: <20261120185915.150228-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120185915.150228-1-apokusinski01@gmail.com>
References: <20261120185915.150228-1-apokusinski01@gmail.com>
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

