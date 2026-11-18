Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035182;
	b=aCKsc4ydMEWD0Bba3OldNezSawe7AA9ink9BTjki7lDOcto9rmgBy0kaHTdLxI+Vuc36
	 kpvG34XM5ZfcULTiS+2NfGZYpr4x5SrdV5WyvaNmj+8GUTdUJTsYDHwMBT0+8ABAeTPZa
	 6qn2uJXzuZTtLrjRhLdBWd84AW0Sf8BVbmiEWn2A56G7GraSl9HB3/Jz+VWtgw1YWURKt
	 bpTHvUAruBnWfXOIjkZ221QD0Z/W0J7PnvlhjCwKOC9GedswSb7iWB/WWJ3vzY1H+N8in
	 ETmgwQs6rF7lFXixJqeBl0cig4zV57c11PA3TQZ6gapEJBFu0IUVguti9jU4m/XBUyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
	b=X/jyhL9lcamIKq9cxpp6YtjtzXjsOD+/H/mnWqv6rl9m0qO73loy5Wl3DrfSdf/WJyqz
	 Zymc8+QEkbVGA/cubc5UL9LfwZgWpsSKwUHUmgL07PK2iG/teqJvxMoHwVGiLtMG/YNmI
	 5DxFu37Y+lUHkL4N4ePZNc37RiEgizekZFIJfNtM9tb/jbDpEv8WmST1ChBueIvT5WETw
	 nNsHPJiHkRaNNoLVrwgGEXmyMzbtQPOYUmxfREiCRL7ilwK9JAPJCkcovG35bf04JOjx0
	 Q/SUvVha2zf+2cT/MXTJFFx3yQRykZpqrl2WXbK5gUk8H0V0L86zxEniY/qORCnJH6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GbO3L50W;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31BF606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D31BF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GbO3L50W
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so223121066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035180; x=1795639980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
        b=GbO3L50W3zPBCKpX4nWT/H81Rr/VofVkYHAV/6mTN0RreJa/VLJiHzdAzzbm1YNJQu
         TUxDyX7UBLBNHjz4ODRXfQhQ+Y4AaBLmgj2SD0s84sMz5dCx+13G9Rv2kPKG6rg8MrBx
         xv/nBTKlaPQRWBTcov+z4vhnapuM/VkuMFHUb33WGBC2sMX4RNCwygHORTOnvuVmFOtH
         znrtOPCXOo59JqsgjVEX0uSt1XjDdI5KFuDauxeOGs+4EsHbplhM+k6+hFSilAR2Ms0l
         JHOX7VEhB8Uala5teN610QZfolr3YbrqrtpH5QZtSfi1G/zUVse3gawlNG+8H29SEeIM
         67gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035180; x=1795639980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
        b=1tC7vgiisntESIHUDKgV15mHqwPpxWdTbX9nPj7dfzDphV40IW/c3ZLIUmpGvKXV3S
         24zKDoW0jIi7+tWng/WFmeG5LgRQ/KJ0RJipGB+SddNKUMBa8P2vb5YHLyx8gOQRBhM/
         44fHTdcrJYWm1VIGRE74TndjiVW+boJ1w78yaCVomQ05IkowiYIuMZJwPhGQbWx1PqQB
         eMRLpN8IxzbvxoORV/PzVx8LhREoiHb4DmdE0jvHeISYZcoPPpBsrBuqoa+ATLROxF50
         9bCVlvTT/vVuqWM8+mVHTKDusU+badGaf6EuH/LzKXNfGp38gps9RsCpWfGzPJ34jrj9
         cpaA==
X-Forwarded-Encrypted: i=1; AL+hErEYleot+ATccrN1B7nWDEN81APUVQ0YM20HLTNyv2yb8jKLIKM3Jg/7rwMCM76DEBXGZswOCBwKjefPW7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HFETtaT5dhJMnuZA4Ak70CsCJNfhze3yDTbSA7hxyVdQXrAXv
	s1kmLqh+7KETyEtYgxdg8ZlNjyJMTSRhnnAytkLFGOz+fV4s/2PF7ZNVsSCzzDK3
X-Gm-Gg: AYBFou0lQGYqP+Yu+2h3ECHy7ueWa87+EB8YVnTdVfZSul7Fk9Ko26d6apeXF7iSrnn
	MzrkkeePytqMFoxTwQawz244YVGse7fYzJ59os41AnfOzg7uNCtwSDF5fz0ncZ+ZFcsE4NB6fDV
	iKDR2XNSEIch1gNxX9GE/lGt2xbIv3682fDnesKHZ1pWVvwRqxjh1OrPY7u5lcQsRvRBDIRAsko
	u9EAru/Th77AUQ92UadctNLqzt7V5CR/pvJWqTyWrrJpp8BEpNCwJlxVjLDm4gnoUKjMxCg3smf
	clHKRFaoqhMVGyuXBHOAouAwXNru+/N2l9qjc1m6ISYzejDQRa1AgObMVjWT3QpZnTl96FqauX3
	rZEstBEuggr+8i56IWuorLkhMzS+Rh2R/C7TvfPX6u+WciMNaslUDq5XU1g3HfIy2Ow0BKNZMjd
	1YqiRxlBVUtQmX/8mXsdHruSuI5uqtoLwPgPesSGC1g74cTxsGJnJa45CwrVJ1TNFq98LcJYglO
	2CKNU/Fh8IBys2rwCUBzXvjWO6y+kv8S1uv0Qy4EfdG2dw+TwA33Xq/gklrqufbZnQEqMVWncml
	gTZR1eBeKSaDt0nyDMVSlfVvBstK1o7ieW7VBprRl0mKwcjZr85p8l3hue+YoGaZzHSWMtbmy5a
	zvcoS6JU=
X-Received: by 2002:a17:907:6d1f:b0:c46:8b87:c1f4 with SMTP id a640c23a62f3a-c510e2d4ee1mr357637066b.20.1795035180171;
        Wed, 18 Nov 2026 12:53:00 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123421612sm35303166b.41.2026.11.18.12.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:52:59 -0800 (PST)
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
Subject: [PATCH v2 1/4] dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
Date: Wed, 18 Nov 2026 21:52:04 +0100
Message-ID: <20261118205213.88778-2-apokusinski01@gmail.com>
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

