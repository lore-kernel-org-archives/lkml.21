Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761445;
	b=UAUp8eT8HloG6t9O2tDMhdNUDrW83yITXPHu+quaItuBvd9D7T6XrtwYhJSanh/uC0d7
	 aXqXlhJxl9i09H2GocMQ8hXowUq2OjueORWoP/FqHcsryNokwG76LZFmnHFGBRIydWyzw
	 /zsAPM0hdfU7F+TgQ5Sjq2qagrvCN7RolL9No6f0Yaz3BozKOH7uBwwQUDJsi44I+YnRp
	 f/hxJAJkNiX8yiwVmTOAwC7bLOgveNXT3jhCqqi/gStKZvvJBnqzvs/tGTX35/+RwrMAh
	 V0eXvpgktFdCs6scygKXA222vzM5Kf4yJivycWHNzHCJhAN0F1/pCVZN4oqtWU126XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
	b=fjMSBrihs6j5BvWB49OXkIKJ/KZzV+afi5e2eSeGobFyMfpTnLm1xShoK78icj/KYb1+
	 B4+4yh5JgqoHYPY8GoSVs96LAY2arXUwZjxotbRECxUz05EXe94/croh05Ay00cc5h6VZ
	 gWgXZneCl0BLcaYrJXBck5ZwHMo2JAODpe9Oy2iicnD+mWVUpUPgMOMrWHSyNQnkCpxf4
	 73pZX7Fq+7Lq5089rbrqH0QiNG8tWzZfNKkERMbi6IiG4EGu7MtGsiklMIDyFY2RMPkFN
	 MdhT+AAUUh+yzY3kAoM2wBBf0yEdd7tD76ZvqYBc3UcR5MI8tPCp9JP1oz1lN+HfECw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JbstO9eA;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EB6606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07EB6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JbstO9eA
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c1c0c8d61aso5240458e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761443; x=1796366243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=JbstO9eA44E3bBWgMfke9c3iAS4NCqV8AdRs6I+r8195W90yk4G+cM0lHvrsM2RGLY
         fVLIjmdyKg8cJPUyg9F6r7Z2zSOE0Pcg4/4D4OyOl/TAGDAYBU0nptGlvgko9e9PUYdD
         PDG6qsaQul3sXhXdMxWkkIYNv+QqEU/32ylJ0uhoioJEWq03jUJqFbmG5weCg3toEe74
         JuaslaHwfnCi3IMEUh9Sh87FOEyiwSsLXJxj5svnEy/nXwzP20/k3NmD+C4JzTZbESwg
         BOf6+yVq7my7WLW8h3q519c0PbtFIramMTL7gF52B3R47qcoVGe32TI1fiO8fMONgSqf
         cYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761443; x=1796366243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=GuH6BGK/w38iOgpJzTZWLkxz5ZpCEFxXgeM6KdLyF30Q1tC/BZr1NsoMl0i8kUPWHy
         YkXLRaGigeEbaZ+XH8qpo3OY+cOrrxvyHM0ATqCyYvIidZ2lZG/94+nE990yhNNKlsxn
         HzwDa0HCO7zq3JyEvqQrnkpvr9FW4+3F/22VTt01QecWIRcmV3JNb5ncbIct1NoK1Q0D
         9rHFeRdb8CJGSLi31lTAZ+J+HKnK69pLN8GHYa5l6LKU6cmhSrzEDiFIxWZQ3KH6ox3G
         qRbsRPcTcT+F0KnA3eNpS6Z3DQ3qB45U8rLkhnt3AlMgacMlcR5L4NwuxLOQ/ScQAZBK
         PU6Q==
X-Forwarded-Encrypted: i=1; AL+hErGmQCpOk+PJH6yAxHrPeD1X57fg1OB3WPCNsbtIR5oUYEeoinWvTzPb8MlaSyTEQ7M6rZzAx1EjsJa1PK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z97bfZE9vim0yba4fLcmVlrDlat9y0InPZbI3pQJmE30YHLkPxR
	MS1bEucqaNey0BDFZFvLAIVcxq9A4YbOVE1H9ZEc39Z0hR/42gimwjaO
X-Gm-Gg: AZFdTZd5M8D2idJ0AfZwvF0Ltaa1t59wix6dmaTTj/dqw8i8eNYp/ctDBobhDqqXFfb
	PaBQTXxi8qoiOo8wIGOizrtt7gMggTaXJDSmTjds/mLuzGXt7x1zX18AzEhh2S4yfCcd3WmtMsV
	PSRT6XH6NUmGVW9iRF+twKk1jdssM95UJaq+HbPNi8XqFCLWFCQEdx3C/cWWSN6xttTFH79NIaG
	tn2ZpxfzXxOoM64s9deLWEx/JykSAC+m4t0FhyEvFk9yYKddT3qS6059G8+pQZhaF5BDCxTLB7o
	Mx+v2x0p9RpAp7aJVFgoHAJIEhR8oGqtlQ0zsKQ3LV+LjTWC2LGWCQ3LJK48uhUzxDGdjWYqA2i
	eLZmC/YFI6Al/ZaqItYa6TyUW90H+zKyLOicfxIO9AhPUBvo42d7fPoOwmq5fBFtjcVxhJ5WuQA
	dwGAJBPV0S3f2jnShbyM6/hQj1xa9gTdX4yeUOPorKrp1lvyNkx2057tdA7zvbSeFL0v3VD8Xj6
	zw96uxAhUvB/f4O2/VEq2mdUqSd8YD3ba2ZE+eI4OhY6oca86XmR7WNAwn01C6EAjJEeETyOVyq
	rxQiJoI2NJ/foS3Ae8P4jQNL6v/TMQ==
X-Received: by 2002:a05:6512:3c8e:b0:5c0:ea4c:faf1 with SMTP id 2adb3069b0e04-5c1bc6907e7mr6613134e87.7.1795761443064;
        Thu, 26 Nov 2026 22:37:23 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm5618994e87.39.2026.11.26.22.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:37:22 -0800 (PST)
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
Subject: [PATCH net-next v7 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Fri, 27 Nov 2026 09:37:04 +0300
Message-ID: <20261127063708.3074433-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
References: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
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

