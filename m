Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632501;
	b=jt8GuY2PH/lDDFPJJeyLgpuvHjVJm8qorQqoDoSmq0D0TTY4EEc/rLOEoEQ2ZCUCkQxM
	 h+6XB/Yr7e9l3Vm2JvmfsCYIbzwuUWUYFLo2LUlwW0Msy0T925hJjFkSWeh3gxJ6cgtcP
	 LL32suNoYMhsaX/keoS2VEe6QxQdUl7rLXgWy+z0393JTscqoqTNjDSarPl1NRhxf01nZ
	 reyBOH1wYCmMLR9+/lFN5lHFgVwxYhY2UC2FJBUepTxHHTVAWkIad+/jptZxrgb/TNDvx
	 EeN/c7sMjHi/7YV3Y0s37guAa5nwST6Rm6ljJNeJ9SRU/w+heAQEwkcjQdpDM33MZKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
	b=b1399iptbCEPy3E/H+WC5e29Zo8N8hTZqJu3XZZCMO2R2bKgLrw/nxflS/9As1WIX52H
	 CbZ72G9V9vTVkd6BxhB76JkzkMErDDToLz/5cuKupuYV/aRxJEONVxpmlY2FdMh+iPQmd
	 FyGvjjd4R0X8183EWyOE0kbPPwAZaPogrhGtqjPu/yMwYibsbndQHZK67CEb93FlKhXI3
	 M9KQ3iIX4C4EnR0ucl2PnWwcOxmYEE88g6pfzoLy7ua2EuM/dSdhb6fFqItvkArIWTmKf
	 bIQ005mCAxuQAXSWr6LjkQDe3WX2c/PTzo3CUsoEWXQ10NO5+kMmv5xjpXDROnMYXVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jxwh8KOh;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764D8606A69C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 764D8606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jxwh8KOh
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1294628466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795632500; x=1796237300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=Jxwh8KOhQ3Dae/jpvU9vqBu1U4h7oCjt+9cRvOeg/9BA1/3ExI9swTZ/M0sYHqBBDj
         c2i4gWGAZ5RkbYoOU06qw3aQ7kan1huizoyKOfyhlPhyRswyCamHMI0WY7oTqtsoRsKe
         whb1zatqu7xCt7ksj4q4PPV5rutttpu5mlCJp2yyfSug3Ow5NWLyvQsshoMYAUqQK6ck
         OCby9sx0XRkeMEaZnUmqFeXuUl8e8QJ+tTASqBkSwbS4mCsoVUSJRDNEaMbh7STS2xwB
         Kebhf+L3FNSfhw4nebvnDhJmkqBLv+brIqP09suqGkbqM3oTjFyEpDzocjE13qUa1mKQ
         hJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632500; x=1796237300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=OI+DXLSVkUiux8ANt0Si5IROheOpYEg1nLZPh/4KCZzbGE6zySn78qtgQd357scQRG
         ZA0ZaPrSDzjQob4cV5+hOskGKsNdR2IcxLbB9nNx0/Dlx1zjW2EAEhl4tqNdjRLspdW4
         bOsA2I/RUlWnp+XIOTe+lXqfl4d+cSHeF7PBuxxhNt7yGbFGi9n/igAPpfOYEUdcpEbm
         UaUIWbYDsKQFoaKplIH/qb1KHJmzCx2e2HpuRyCVInt5iqy892WoU7XzS6iBO91745dr
         mYsLaWgin2w6Ej004eVaPM273XFLZAhxPZhbCRiu9U+rDcnwZzFuhbsdEeDg9fYbfnRU
         wG8w==
X-Forwarded-Encrypted: i=1; AL+hErGcs3hVXa5/vvu3VuURzmbUowxidfk6ktSjPWfqVWekHylQMUvBZIxMWsaQvY80p0nPioLeGQwGsq1554E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pF1EMiBHKiAY7HrE5XC0ca6+fpIV0IFNNX4rRuv3xdjKRDvbg
	+Nn0bbfogJaA4huU2Ewki3+qxiwt17Md8uH0ceJa1oj98hJ8hWiK530v
X-Gm-Gg: AZFdTZeFU20H8RMoywQHYO1BOnCDs8zB2QWo/TFXeJnI1bOTxpyIngvS36hb0TNWZD2
	ghNDh4WinlaN87jtryRdeH3iPG6brLhJXTGJjRKQ0WteiinmkryyTZ5WSvK3R12Z+xxzRN9nTUo
	EJtvrvTFZLvNKKQdfGzOh0Rixpq6sDhVnJ1cclRmfquOHBpiksG/7F69HTRkbST0qYbPuHA4cc4
	7nGRqZHf58KuY5nsNBPDCqZEpNreyHF7iAVHBFJRlsxdC2g0REg6IQDQ+JZuxZG1kGrpIySqwad
	40dPfQPPmA0w47kniExRC72uHuCM5iWn6njxzEQkxlFSQGRoDUJJHP6busk9hOVnT5ylgm3aoJE
	4pnAkkP0+MB3QbmgxldXLW3l7r5+Ha0nFDY3q2JLPU/6+ekyLdjfMyZ0PG0J4DDSC3K+yCxYTfm
	g/Qzy0+7OvXSJCqhAqisNqCB4G6QBN/nIqB+gP0hwLh+kyqaxlSd+uRCzDoyWJ7rzJi41nMRpJ7
	rW4MvMCHTYHhZOl9d66jbFpnvR+vxqQCA/DV9ARwbaJZ0LS4Ex9Tx2E5K/2Dz8uO6exuNzq5TDc
	eCHm8rjJv1fca69ZG+arp1luxMBzHnR17VeQ3KykB0Wdgek5sCoZj1vvee4=
X-Received: by 2002:a17:907:6d0b:b0:c41:1781:a2af with SMTP id a640c23a62f3a-c51317e3353mr1702989166b.9.1795632499856;
        Wed, 25 Nov 2026 10:48:19 -0800 (PST)
Received: from antoniarch (84-40-239-22.cgnat.inetia.pl. [84.40.239.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm677226666b.64.2026.11.25.10.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:48:19 -0800 (PST)
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
Subject: [PATCH v4 2/3] ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
Date: Wed, 25 Nov 2026 19:47:47 +0100
Message-ID: <20261125184750.57866-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125184750.57866-1-apokusinski01@gmail.com>
References: <20261125184750.57866-1-apokusinski01@gmail.com>
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

