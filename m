Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631873;
	b=eu/CxxbjNJtQ8biJJrUdtV7nhnIYQsZ3Sy0TP0rDX/a0q9gdVwnnmTZTfFxQ+LTdu6PP
	 4I78OMade4pBIB2qU+iX/r3TkQrQo1/O3vG76qmU0QLVpyX8AHvgovOhVIJwBjNRpvk2l
	 nVnZTSQLvevNbrqBHMGjhxhOSUiV5bJn9soBA3EglGeWUzY8SaYo5ADbrozWRj3n6UTJ0
	 w19tTHOQsinUXWsuX0GuiQz1S6XIy+yScNgLnAQUM1A1A/xMnc0Gtd18IqLrKhwYl/beZ
	 s4OnlUNGAnRNLDg+/3ivoMiw020Ieydv8z3rWB9nn1jPt6pOpUXnSH1PzMBa313bLcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
	b=I4MnfLqTrCUzRqdsQ9AnX5km3Vwfq1qCKGNnHQfTluTkn6QNS/wYVq/8pEagLmiDAOhS
	 991DEVP634Rw3nAAKA8drZPyCdGuDwF0rLRtHB7FbUKG3KoXsOSkVG/wJhxtTw0C31FF2
	 xETdWdZNeEE/Sy9iJlSZ79HX5R4Cbw+f7dDUM1du+UMOGz18ULUomi7szmeQHJhQSFLL6
	 oPbNI6Nvx3CrsNLH2Sjf8yK4tYiKsA0eBoBIrBRaCcDkz90NbxdbHY+L8ZR6IyVP1r3lf
	 dYUxUjB45nYf0MqI6P75xWsWWFMd+UDxyqC7JJSvqxfnIzN7MNzY5vv19lX2wxrXlEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4wfCvfS;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C41B606A68F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C41B606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4wfCvfS
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so49549421fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631871; x=1796236671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=B4wfCvfSF4jdXEA6kj/yuB2UxAv4pDDqE3JiwSoT/R0UrRzx8nIBRNFumcOkLeNfcc
         7ODJ9+MXj6Zn3KDW8YTaFITvTt0REXoNcKYEOpXZR+jGv+yLHsF8rdlJ4uqLr3zMBdXi
         qNZBQNGJ1LRQ0Gx/Nltz+w0nBvGTnNHCfLKlda723KPJvwW9uJe4O5yjUZ8OdxjIAB+0
         +FFL7sk3+IuXJBagc0IBqo+q1tT/ZJjv5+Yt09fxgl0fH0ov/wY9EoFzldAkqypbq5ms
         ONLrZwLX142EZcRWCcwY+B8KX7AZeRiBzWRQ1+ShyU4jotJhoU6x4ZKYYwJXxGbv7kAW
         ZYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631871; x=1796236671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=kvXKhNZSROZlnRY1BjedgkjjXBTc+P4Kou0Ow9IScZ+x0W36usfTDQmGvWLHCUMAsW
         44YIiRBssKi/gldUrWCjj3C/iwn2f58JXPvF7rDgMxN/Mwn9dmdJHwLeV+dTf5DHCT9I
         q15kI2CldtZXagYE4pr4DBCJfSghT/FyW2Gbv0Eud4+JEZg+uFEGoZhDo6tUkw+RcYB4
         hjK6bxzej1IMkp6Fa+w8Gp3qnw/uR4vQ9T9te01iSs5L1aJcJjxxLZu6RGWbUEpDdDkp
         AhT020dxxbL6+Vhjho0/xPvjboaLvvp7og7htGzdmTdQ5HMEjPKhmZA3XZv/GSdKebGS
         K6oQ==
X-Forwarded-Encrypted: i=1; AL+hErEkQWwW9g5McbVo6srtUgpP40G1bn9hOEvbK+yFRjneQuDz+9ybhYH8iotLW6z0RTcH1WhoRfaXqwnZC5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2KpTCewUESQUT532Gwha0vbpWjwNgk0RhaTV0Kun2ewCd4yHV
	AFJTpPtJgQGXP0RqO4pv7zOxyvoCvaBuqYIgl755ZMdxBoKcnWt7juQh
X-Gm-Gg: AZFdTZd78XDYImwzX9ft3x06UX/g6gLZdNe7lt6z+folq6LFMSgPOyfELCGbGEQZAqs
	82Zcv40ZfwP9TTAmiUy1yMVfnQDjjNCD7UBHkxOtSZ71ETvTjp6gmEjkmY9ZBri+S1sBiyDmnMX
	k905ipbF5z7ZNnmMAl4nBc9QUJ7xPskItjiRtzNGLWhePIB6AmF5x6I7OwidtDSO+BvlyueofM/
	oIIyLWxVAsZI5X6JadO5iVwNnuls/PbOiEjRrmW4oitNTNph64cZT3mI5Lfkyf89V8TsdsG+40z
	RIot0yr0WBKnfpIJFrd34qkuQ/1T4UmWahLh3RBXkMPCEk+b5sWwEfCOzelmLv8Nb3XFAtAp1uv
	YoHOGpJzMrmAVGx6w5lbcrDeDioG9OgStDxbTf13VLaBZ1R6Ew5ZllhbZ7TqCix8/wOFdFVTguF
	bPIkhvt6eXOICdWkeRu4lBcfSSfMQuZhvWBxSLEBFq/SNRkueNUNugHkbHJmtzkfjGXtLOT/L8V
	em2NxNuCYX7NxuhWIAZHqX2uBQZlmWJLv2DI1OjANMB5GvmoKyDxxPsB+pS21Cf9mtS8QEzjMm8
	5B9kMlQmvgmP7x79onjznR03NAMQsEelaN1bP8fCjXWFA1V4+O5U7VqnYFXBjs6m4N2K
X-Received: by 2002:a05:6512:3a92:b0:5c1:4c4a:f018 with SMTP id 2adb3069b0e04-5c1bc6d25dfmr5683691e87.4.1795631871079;
        Wed, 25 Nov 2026 10:37:51 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05051bsm4650755e87.62.2026.11.25.10.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:37:50 -0800 (PST)
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
Subject: [PATCH net-next v6 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Wed, 25 Nov 2026 21:37:37 +0300
Message-ID: <20261125183742.3039752-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
References: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
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

