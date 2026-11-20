Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201190;
	b=A1k4E530CvGVxLU73lMxvx0ZNx7K43PpMjzmrov1IX0VY1dCvMjszaiBrn/CcN2CLF2A
	 IKwVxA7ZxuZUZ8hDoVHpRsp67F6wibFqwy+NnOskGmbvIDH+fcy02ibxd2T74OfhT4ysr
	 QOfEjqE7mJbqKDtXBds3DpG8Dv9l42iRlRQTQhchZG1qsUty+BpiAYrJ1pgrZhLPtgwsh
	 FxIU8/6UHzr8DBwK/kOxxIlDRi1D/2n4vlfl4G69ucGHBukYEZ/nKHBZypdoy5vvLLZzJ
	 ru9Gpf4a43IPzh5G6Iz0AAZ4HQWjlm0li0VxQ1oR3ath69TxZ7kbU6i9ZDMeAq9ubYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jeNmj5ZEc17RCrEqMZFDITOByu/mJAzOv4t4PwqFZds=;
	b=BpDhMf0f1368H0YA/3fmJBVVNMcBAtVF0X8x3CnrSESgPmkTs05kt3P99QoDM1PrqqHk
	 Yqj9L7x3BIQzO7F3f87H4DsTLSb5zAgToukb+NVgOax5Kju2E9PPwERuZ4/2r98gkKAe9
	 Eug60Et5Rf8288+Usm+JMhJVv3U1bQ18JL1QJpL4u2Nozqn0Dd/moobe0d1jVbsGh5C2O
	 jT787YiOw/yUwKaO9N2BJmgGPMSIBissyMMwpxQXH+jMlUzoTWgn2gyMNShxZBptVu8pb
	 7pNyA2YyCIy80XVD8U/Z4Htob3jOXkBrC7k0C5/Ug+8bRPyuAqewpzjcqvL/SZBkrQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxkcDXGO;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FDB60A263B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70FDB60A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxkcDXGO
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c511c0e2826so160510566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201188; x=1795805988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeNmj5ZEc17RCrEqMZFDITOByu/mJAzOv4t4PwqFZds=;
        b=yxkcDXGOasir3Qy6rymbwZ/6dJ/Um58rGBpB81H1qg5RNFLOoQ6GK2AsCGxDtL2CJo
         oJ/y2p/fqn3K01f0Y9rTNMQrS/undGrlx1eJJQaLIFC0tLdFy7wohnRbz+aPQ/fuZ4eh
         zMsVRxYMA67xJ99I6j43TSyT5zA0divNQF2ntlSUYeOqyUUyrC1gYRE5wBok9kkLan97
         Guui3O+gNwH2afkBdz1Qp6BXLpm4AVL+qwhTyQ0PTn0XyfFCN7QBQhO3t7wR5Fi671BE
         JZE+WjePQDzRUmsKlH3DVNkATh8GE1JYn2baRismgDLTBTYftBADchLio99oNKSHZGq7
         QDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201188; x=1795805988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jeNmj5ZEc17RCrEqMZFDITOByu/mJAzOv4t4PwqFZds=;
        b=ECC0jbZlcsFYyAlpXTR+H3chBGyIhz9xmgOecENwkuwkeQ8l0P+imATDxzZL5Nbx+j
         KjHAp9SbtBS7O98n1zScy6JEFEjpghC4p6Q+MRHCBZAV8sj7w8hfpK1lltNuk0vzhXSj
         nuy5aIjfImGA6c7GMT/wxfZQ6gURx5xZUYen7sobyUtA2a+Yf9jr6dEOH7Om5rB9bGXb
         LnBWZZxg01GOtEAj7s+a9Wx6dxMaFV/GwU7icam1LSOBU08F1ZUsdL9l+o+ZgBEK1z0a
         WRFB7xpLZV8wkcb003dhXnpfyYlajcQ/mzC2EFfCc5DRCKKefA1NExueelFv3LACAW+y
         ugYQ==
X-Forwarded-Encrypted: i=1; AL+hErEjuW7d2oShLbuemUSxIoLkFEsYVo5yTbYCb0NiFxc2h4vCB2kM2aMk1+GzbLUy5crymqRWRruQwucJ4SQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gRBrlbCe9Jc0RF5HDjvO2fQ2MzNU7DDWOU6+1z+XxYIIRGm2A
	DzSQ38/6Il9QnlVSylA+sOk/ACr+qP2broMulv90VRFpr7pRvlQCNhzz
X-Gm-Gg: AZFdTZc5cbgrpUxxFj1109b1atUvFBTLeE131L/oYHyWqBsbLHL4vtssjRBlK9SO3k9
	yqSjhSpfZXBCumUiViMeIqGwTYZXPxZNkSGZZmdudyDmndyTkBCwJ20LDKvM/c4tacbR6T80DJ8
	I3cqXio6SPVKZZlMQ3tQxOer5e5XTBnoq8jRdXQW0z3z1k10hlgf1Iq47Dj3RAolOv9dRPgUu38
	db22sPNzSOSjokcX9KDH0fLtqeNiPn3karM7qiJ32nq8vQEYTX8twKLYWtTACRUVLYdt55kGZci
	rjd3gKyXl4H6TNoTZKLnbzX2v5A0y8jklepZaht55AgYQevcWdfJzAFw6dBsDHYb6c5J5bh4nd7
	Orb0+3WwW5ODpac+ke9Y9oS2Dab3jtOq8zI6L83ns+oKseSyYUzDSesyx2VsefWD+C2mA9dfgTH
	hRByR/Qq1B6OPe5tmGJB72tjWEtMbHBidhmCUNBOFab3kOHoy0/ungeJpdRxsXF66E04ZrRfuP0
	hvaNK4BmyBDnO9vUEEFKaz8SzE/64Pc5VfwqqplbAAaZGbJ77JgKemJwTcL0UChrH81bpdgdlaR
	/dCaMuOs9pwUl9QToLJuILK6uSpCPcPFV1hjfuzrC0kP1CVbOv0YVBQO8jInJg==
X-Received: by 2002:a17:907:a890:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c513ab14a58mr450503366b.32.1795201187683;
        Fri, 20 Nov 2026 10:59:47 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm125205266b.85.2026.11.20.10.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:47 -0800 (PST)
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
Subject: [PATCH v3 1/3] dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
Date: Fri, 20 Nov 2026 19:59:11 +0100
Message-ID: <20261120185915.150228-2-apokusinski01@gmail.com>
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

Document the TX and RX DMA request channels featured
by the OMAP I2C controller.

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

