Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632501;
	b=oAsxqjgHMNYgS6z74GlCvIaF2B5+wTJO5rneen7YOeSuTekx2rY/u+YIdmBTWxNAgF0g
	 wYp1lYWxUowCniQOWP+z9Z/mgcgflS98SnG3bpd6W94PgwyFz/33enKUxRqePySRgdOfL
	 OCmGmdtdNa+kvL2hDm3GAR6HLHIjabwMaB8E6692LWbme5n1AOHkfyX0v4zzxT1AD5IuD
	 6l8rtY1mB66Otp+QDbvraJLJyrtAui0Cmd4hdQxodgsWn75o7ab4blt+YG2EYW/1Djchg
	 Mw9BYDzXRMvUOR8X98dbQy8RvXJ6DjXARs1PHZYVU+jwqHHFmGt3zJUmItLegBTLhWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
	b=S8oUiOqJmo0+9JrUuApXVYt4H07EEGywLxUYNQeBjKMi6jz2GbrJzQ16SMmhCBllSygY
	 1oEJW9curs7QiSS7UCL9Yc4t6I9ucyIrP/QdI+OExa7D5ZhwKiSXMhGT778r0EexbC3O6
	 v4vjkEN87zHNylgaHke8IbKmkVmCXKsVqyvtd30A2b7VbccPon4A8dOLti9BSjJAgOIge
	 9SIhGWGC45A92ozTFtDKi4fh2oJwDOlArgSitxBnrwiOMBSZflyxt3jk6neC63YdojedW
	 GBvSvwec+0Ye6dgKn1eIL6uog0snKW3J6p5WJ/GIizVx28+heJ/NHWJEjAY0L9JKSMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lM6jPvTR;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5A2606A682
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A5A2606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lM6jPvTR
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d28f75d62so1020311766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795632498; x=1796237298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
        b=lM6jPvTRh8qC2tVEZxJ68Vw2DXnOsWAPa/Hxyo3vQhA2zAFe/MejY0hAD0zdt/076P
         FRh1bvwBu2AMN0W9nu0BQy3ySoAq7UjjWTuteT5cGjB5LQfTcDnDidmoBlJBCbWVQi0H
         U8RkDKgN1kbmwcXHqPweWxaMcn9IErDkmuE8kCSBog3R+w77Ml3s8pXsI8RTvXeATNNK
         foTTKZwypSgexu8jk9H1TcGqgQq/kEUeYS2i6OO6Zsn4SjEECE1JypvAdZbuI8Tj2v0i
         YShrmZYhrR53MZHuohEChrnpTslc2OFjcXWzQ7BwquGlMo94uuGZ1iiNFsAj7u++Y57q
         VXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632498; x=1796237298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
        b=ZjqefeH0MSyWqRWKY+b0fdYTTZXD16VJWz8QsNC30qw/eSlyKiVIhqgppj9H9cCka0
         KDlzFiPxTkhUJpYCHUhmxyPdxU16bOgv9AJDgFpdaqxbTVaOY+k48tfXXO0iltwHqy/o
         HxeOLLoD2DcfqGhBDQeoNnoGAKc4JuB3WxfIkdAwZbnP3QuEXsELEzkNKbkjJCe4cp10
         +/oZX0Sx5zm+jF3kWR5z3Brl6NXkayzu3uoMmHcB6VyK+yiOXSdzNe3vS50jXSFFs7S8
         FTETfiw6iAaXcCwsfKW+Gbxrqh2lIQG9Bcv5qN3CjP9QNCTiDM/+keaBQln63Lt0flAh
         kRIA==
X-Forwarded-Encrypted: i=1; AL+hErG++s6Cj64kXhj3q9iAsqh0pv6Yggsei3sqTG2xlaG2492PvFDE4CZXS7pHmfPo8KioZ59L923NwAk3QV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qkizzouM5ATrp24M76PWA0/5DFAj2pqLCKd58rpPGx0EjUraC
	DVrb3168+/rsCKxzxTfzySfW1aH/fa5jmvnvBbk9T78sJDqw9uc7fQ0W
X-Gm-Gg: AZFdTZcah7Ib8wuYosn5swsmv/gpQY91Ji3Pxrux6pMWBrPgUW1hqMCArR/vMPvG6qV
	iiWwq1s2zQ+JA/eYbUIX02pFP9OD97YfCHlDbuhan6njHmxn9aXnfr0QcybXjxC7GohlMXRmZbH
	UhyvOPWcm8hbbi7byOp76+5VobdlQ1YXHeGEjAqnxK/ymxU/JBPN6I8eVmlt00MIpRsrNsBrluO
	B+8Ua3fPIDPPmrJPJHZaQuXG590dQA0CFN8GwjisdrlWzAWFB9/y97BNxpukSLymIYwpiqHT121
	crWkm3USNzeFRQ86Z9yCMPI8EMnKVzovZzBpQHf2bFu8fLS/pO9z7SybAujojjnsdkbr+ftqM+o
	F13sBDSTmIAo+HpnobQKmbCiFA+D6O2zHpESbGIy9jhV07HKqeFKbjkV9RXzen3TkYnaVyChNFO
	HzZEi7ZuuUIYeQrnFpEfPGyfCDu/yoa4dFCogWsrTEImiKByF+gVNBNGcohfY7skfZWXsSphDn+
	0TLcys9ts3f4mic5Ck5jBvk1JmWB5s4RaNLLLyR6E9UwzvcCi2ZO3rSUJ92B+xHjFusvQr8TJOk
	WZEAFWr5pbh7FV+UvHwi5Y3uBCnuLedbaICD/f5GsmZXypj7+7ncw084geAFZZ5OBqfbXXa5YI0
	LWzC6
X-Received: by 2002:a17:906:5492:b0:c51:caa:607 with SMTP id a640c23a62f3a-c513ab0c394mr1129231566b.19.1795632498494;
        Wed, 25 Nov 2026 10:48:18 -0800 (PST)
Received: from antoniarch (84-40-239-22.cgnat.inetia.pl. [84.40.239.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm677226666b.64.2026.11.25.10.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:48:18 -0800 (PST)
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
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
Date: Wed, 25 Nov 2026 19:47:46 +0100
Message-ID: <20261125184750.57866-2-apokusinski01@gmail.com>
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

Document the TX and RX DMA request channels featured
by the OMAP I2C controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
index 58d32ceeacfc..ff946fdfaad3 100644
--- a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
@@ -37,6 +37,16 @@ properties:
   clock-names:
     const: fck
 
+  dmas:
+    items:
+      - description: TX DMA channel phandle
+      - description: RX DMA channel phandle
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
   power-domains: true
 
   ti,hwmods:
@@ -93,4 +103,6 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         mux-states = <&i2c_mux 1>;
+        dmas = <&edma 58 0>, <&edma 59 0>;
+        dma-names = "tx", "rx";
     };
-- 
2.56.1

