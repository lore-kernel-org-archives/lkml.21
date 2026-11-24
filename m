Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513764;
	b=DZlnlZMjr0mWWMEznRwP0V/TKDBdJUek8JSbm1oOuXiwEDIgeSprfZk6rzSIyJZW972D
	 n1S8KIA+IlRZIe3wFjmsKeD1U4ERjuq1UqVoukYJW27eTJknr5oB1JgCdUzN2jofsjuys
	 dgktnXXvWNCjOQRUSpP3kAivoTEUYGThDauXS1H0s2zo+n2O/bNMKlW5vHCq2cYuN/MUf
	 e/oRyJ2MHhOQ8ve5BiBJwYT3qudq6UgB5CTbaRK82F9ffX3KMMx2iV4jnmIG+uVYbN+iF
	 IFE4ticlD0c0xVd1Ulf9QlkNcrVPO5dhZjCaucTkH+Dh8nD/a9lvelCeUBwFaJhBK1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
	b=kxd165DUA1m/QFKscEhwjy8ScKbTWEfPKqhOlr3yJqiKDkdbtaZuual7DrE92N9QMXPF
	 o6VqJaiuYxA5JIWnT7laaAjfEPcT9Puru+/sLTx5sAK55EbpEitqWm12vLGP1kBoGtADL
	 F/lh8FCA9hVIUb+B2nX1FT1sDlJFTG6/jf9xNszjEZRc0dLrw/Fqjj3xCfAqo6SXVzR/y
	 123elMgWDh5++chSp/AudqNheJivKhusDQEaMjIWC0g91KFe8j/oCRADj/SlOmdYMu2CJ
	 KiwsUFbAAWV2JkMHPc+s6jMP5Z8Fj29t6x+nZuvVtGvEzEcFiQEQQVzqstXgRkDrlXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tARb6/Kb";
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA5F606B730
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDA5F606B730
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tARb6/Kb
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae6f2b193fso21621131fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513762; x=1796118562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=tARb6/KbEc1oHqh665ucYNIdzhbedQsMYGAiZ2+yhTVzC1oarcfoj9mv17AoGmvK19
         gGHAXYikpEgSpq9sfxjOFLqgj0HbYSoYC+rc1+idN/tj7kj335oTRcuV1y6dngZ+xPia
         drT2iFui9YbiJNuZnJh/DFzi6OiLh6saRKBaqQlL5djLRgZuLI+vEziKXebZZkfVk4hz
         g/5w+iMiJt9aDWN5usdy5sGd2/iBXLMk7YswiorB1L05epFtEYq7YT0NwungI7tepLaV
         1cThsk230jxtEt0a6ikCSiDuasLrUN2tFRQiz4K8F+sjVG0MUoaeaobDv/D1UEOtUn4y
         8KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513762; x=1796118562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=H+Mz2EgeOKCbwPuBVS+eGCLepNbUyFnz/YHMQef55ZDjydgfwlH3f5rq7WW4ZMM8h6
         2W54yhbQFSZ060tew1IeO9mJD/OuKsccSwnx6VYiiXSENLBp4g65uCK0CO70tD1VUI1Y
         fWpBQCsSojzVNVZxmMaW7f/R+M6yL+MicHchrYbdytN9MvxvPg3JfUWD44GoKIKitjjn
         +gTIrkKXSH7jOYxDwvKKSJBOv96TV3DjgbGjm+91C/YNvEZrJrMafSfzKNk0rmttV8Os
         ldC/ME6vejPY+lAe51mfFnmud8aj4Kez/xh2Lpy9Wh8gn5RBFOycw6JfHEmm/A6j2Zvq
         UwIg==
X-Forwarded-Encrypted: i=1; AL+hErHswvP7viGP4GNHqwUygiCpP3ccIsrqUnWKOurZNoTg1A+1cAk2qgkKjpmBPsJi056v6fF/1jCHndIwX5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+8bbzeW5vNzPvRNcluQVvY2nHWU3asg4OweAAQznM1VE1tRVC
	b/9ZdqB8Ee4LrK0RI/nj4ca9TON1UvW7P0Fzvkoyj3VYxKb22/3JELRNI04rZg==
X-Gm-Gg: AZFdTZeP3IPsFG45W/BjbpdcBOwvxgCGlOU7OD2tgxvd1sVvA5c9dKLfCdeonlaE2y0
	XMoeEDq2EfKrlU3Nlsx04gLXzvNaVoa/OLIO4PtpFlvuMxLY0JaTtCCIrBdTKk7ohwMSH8MaFW5
	056EfJhvF5mHE4oB0gWljBTHmVXidDQMi2I1E7RHXcJbePnDHlhIrejdstU7IbXk16LCrFtLUez
	4zIkdJa+ZnVBCNYC433tRy7IfcfFuoa8TD6CxCq47w7U6puFSjGWq5DOZR3e2LwQao2dbyfArBg
	9DUKrV/O60NoUDU962nIW4W6EU4qDKw182Xbbhnift2aWQINVT3ISd1UnCA8EufTR0BpT9KHn/+
	X1XNNcJUh719Ec1T5ivfkpd7EO522lN//hfar5D9st73UrjER3gXrRzWq1OJPvMGbecMShdtRwa
	coQqiS7kK0DsJJMskCtQHoYNCBk3NXcskKphJ4eC8xR65IyBRYtF5Wur/jZAHSJ36wv3CFmgtul
	09KjI4H2s7fz4xr+dpibnwqr3hXRUdN2ZkKp48tcPd/U4vH0o9isevmk7g18+UEtBYx7bHQZKOt
	y6dvQUNTnKLGxbWDPtoqx3iV/j/Wy1d76H6fmqqXZUwW7hQ=
X-Received: by 2002:a2e:be26:0:b0:3ae:25c9:f5d1 with SMTP id 38308e7fff4ca-3ae7f9d255cmr38992341fa.11.1795513761797;
        Tue, 24 Nov 2026 01:49:21 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8051bfbfsm38756431fa.20.2026.11.24.01.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:49:21 -0800 (PST)
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
Subject: [PATCH net-next v5 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Tue, 24 Nov 2026 12:49:11 +0300
Message-ID: <20261124094914.2993988-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
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
 .../bindings/net/dptel,dap8211r.yaml          | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
index 4cd0f9730d95..84efee27400e 100644
--- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -20,6 +20,7 @@ description: |
     - IEEE 802.3az-2010 Energy Efficient Ethernet
     - IEEE 1588 SyncE support
     - Internal packet generator and checker for link diagnostics
+    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -45,10 +46,31 @@ properties:
     maximum: 2250
     default: 1950
 
+  leds:
+    type: object
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
@@ -58,5 +80,24 @@ examples:
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

