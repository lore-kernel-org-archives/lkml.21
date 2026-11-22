Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353549;
	b=x3RD9Ux14PMdhzSvp4G42yY2pE14KZjKPdqGdsQrtJBrJqwRQR/Y1NSt6bV1Xm+zwf/m
	 tEA1exjSQB8u2+Fm8KROBvAOEn969oJCcTDTX5dQ8lxzw1GiZJSxbcZjjhS87x9ghYOKl
	 7kuq3m+u2VbZBkZwcp/VUAOjoA4c8IFUheO4juG8cboEAmmehqbtCzi81Ppbj8DzrZ4sr
	 /wSC38mJDwbDwyfeDPnEgKsl00MYDb9VMQGLRTY6Xpa+otwbYQCtyMVDBFznvnXi/5Zbz
	 w86/A4F87CxYF0gHjuk4ZIAojI5a+wVqCpSpwzfy3QS/F1umz+S5O+wmW2SBDpO3jmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
	b=sBWgOc+veEZHq02QA+17Masuo9r8ovd5rKdgiet8AMnWVB4b3R1PPwKtmcc0yEBnRR5m
	 Dp1D/baV8anyevMISYLaYeaOq8evm3uZ2DEojUtYUVCMrO/fruc618FwrCYQirEzXgQsE
	 yarISrxw9HNbOxNp0I0kewqmHHHv3cZaTWKK5E3vKA03npqJoIIkSd/TZtfiHuFWSL+dA
	 L+HPxFX4zhJHgktm7ISepv/p+YN9DhYQELclpfx3nc6upPINhBbahPPq1Pd9Qe+H3oTmS
	 ekyuQlMqAdAuRfjVEF8X1xngtqGRJZaWQyu3HNNyvAeG7ZD0ePDq6iqMLZ+azoTOMcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHbcg6i5;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABC0606A686
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ABC0606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHbcg6i5
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so1456896e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353547; x=1795958347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=xHbcg6i5DphML4jkCzhbweDh0VvOde0E98etF4ObufaDQjVTr5VMlRA/A3p7fH1jbW
         gw8KgP+5ZIXvPqFxNivlV46WUQmVfM451XW+6KncGJzHE2bK2CleBZxAgKiTb14NKgnj
         tiHH/UdgXZ9vBwACxSLj+P/kbYlcpTdsyBj4l0Xbn7PxletaQUiHbemw/k5lxltJqwLw
         DMWYwr7FCNyjsUc4edtceV5XRjyGzswlwy/X8QK5sgotFJQlQI6zdJxMCJ/4oCNz/LJt
         pWsNo+UXcx1x9VOOvV3oGc5HdnrGTP2fXhn4dGDZcx/aPg6W9F8Bshp2Zlp5qNHael2W
         Rk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353547; x=1795958347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=0ArZEa70fIPa66njUi3U7EngtpCu8nXV0Cat+a8TGJWS8pTPXBbHyLCoU5vmghmdyG
         JTGarklpTp4UNG4oPeGyURSUyYYnMj7vBT34uxzDdJyWBRhcjtjNRT86kPDnSi4obvnx
         uBsshjyqH1Afe4mRsKEDNAWA3XLOjqB+rBbNKReZ7RlOioY5rhGrXSYrQ+m9lPiqHR2q
         4OTV4ZfzrCErl+vXLMXYDRay7F0c9zkiljothBlVfsmE0VKeoc+Bg/Na5PAUfUcWgo86
         MbYrIqY5HDIauQnNEDChFG7gRyy207KG6tPeAW8xKZBXmTFeihJkfS/E0pOE45k1GlK9
         CJaQ==
X-Forwarded-Encrypted: i=1; AL+hErG53oubwS6u7XaNttaI8Kb+Lj5DJGB9D7TOsLdxYFNKhz38YTrgqNCE/ZAj1FgzZJx6cPvKdLb9c9SlD8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8usZ8MpBzbBJ71Fuyl2Z7G+WJ72g2f7FLsW5MbIvdPb4EqvOBL
	f7LacOh/rabHS8YxtO/tK9CBPVrK8bsHStlxXdt6Id+csN8NDSXyUUjA
X-Gm-Gg: AZFdTZeZ3VRvA3aeSoH77hgW6FpgQxxU4M0pUOIfWjUbtIFb6l8ob04TSS2BiTxi2m0
	YiaUTrhQu893OAIq6vQ6jE2tzQQfjtfQhCXUf78hJ1mzf0C4WgDCdnskHo9eFN6uNve0dvE6VE9
	AooFdXMKh1uL4U0j1PiAC54xmG9NDZydN4lJKq1f3ndulzCO1q87vSaSft5WW4cbnGW2YYocpXD
	CB1lsJcZGDsNAgd4JJPQNL8l1llLjjslzeMmtJU9Tv0Tot+wFTHazDoVcq9LVL+1SiLnMAydcbQ
	p1XzjwiOhK5lTbECzh7ICzvonVtl8SoVU/ZbJlDKx1k4K347MYlY3Zn+gZi2d74MYYAFfqLKpjj
	0MxlYaPcvp8eJtWGOzDRzT3QoKnN6vZRQmp+rwSnFvj9fD265iJ/u5WXrveycsHPMgrIPLK13t7
	HjOwtsqsHyMkxHFbfDGij7VFj64C4g5s42YBuf9v9glH1iDg+ay5MDC/WluSq1XYeOivOkrn0yP
	6zCqOv7GsjVcNpsMB53D7kyhj7IyOd3HMddxoct0EzHhmrfS4Skdg7CBwqXEA9ZBmem66IUwWx2
	FsvSYGjpkgPBWMJNfye/p2ucPI/CCA==
X-Received: by 2002:a05:6512:1042:b0:5c1:606b:ae8f with SMTP id 2adb3069b0e04-5c1bc660882mr2748867e87.7.1795353547092;
        Sun, 22 Nov 2026 05:19:07 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm26038141fa.12.2026.11.22.05.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:19:06 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch
Subject: [PATCH net-next v4 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Sun, 22 Nov 2026 16:18:55 +0300
Message-ID: <20261122131900.2951586-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
References: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
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

Document the optional "leds" node supported by the DAP8211R PHY.

The PHY exposes three configurable LED outputs, each of which can be
assigned a color, a function and a default trigger.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 .../bindings/net/dptel,dap8211r.yaml          | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
index 4cd0f9730d95..772329feda05 100644
--- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -20,6 +20,7 @@ description: |
     - IEEE 802.3az-2010 Energy Efficient Ethernet
     - IEEE 1588 SyncE support
     - Internal packet generator and checker for link diagnostics
+    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -45,10 +46,40 @@ properties:
     maximum: 2250
     default: 1950
 
+  leds:
+    type: object
+
+    description:
+      Optional node describing the three configurable LEDs of the PHY.
+      Each LED can be assigned a color, function and default trigger
+      (e.g. "netdev" for link/activity indication).
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^led@[0-2]$':
+        type: object
+
+        $ref: /schemas/leds/common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            items:
+              maximum: 2
+
+    additionalProperties: false
+
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/leds/common.h>
+
     mdio {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -58,5 +89,24 @@ examples:
             reg = <1>;
             rx-internal-delay-ps = <1950>;
             tx-internal-delay-ps = <1950>;
+
+            leds {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_LAN;
+                    linux,default-trigger = "netdev";
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_AMBER>;
+                    function = LED_FUNCTION_LAN;
+                    linux,default-trigger = "netdev";
+                };
+            };
         };
     };
-- 
2.43.0

