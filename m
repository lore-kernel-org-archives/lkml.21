Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513597;
	b=PB/4IoO/YGa9tqzkFTnKVJLlH9l7G5X+RC+BTqUZXRGGO0D09/bLh/hP5J+Cj+840SKc
	 APUjY8H6NIqiJOAC3/0vw9W8PoOHTIOlJ8tzBixdfKkIEwBkqdUG5U8XBp77IZIP+ipHq
	 3ANlNX3kiJ857QF4yRegQ+1UK1jYhtdDrdoa2ZRWEJ7AJjzIIvT7302wN1NK0RAlnlaYp
	 KdcuC0Q9bXoLdB/3BdJGrH2qSN1fOmjEi47VxmFKVOURm1vmPgTtEGgxNYNA893ADstmB
	 /Z0WxB87baPPSTCmT/rbVm+X4vqByVuFwc79uekC3fhfLJcaQ7FnFrOyELd+egE6GQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
	b=ZlYc9Z4hLKlwjovtlUxSDxn/H7O6E/SvJ96ghyw0Y2cnc/sxSGnWEsX5QOC9Fgg247sQ
	 kPHU51hNrDgi4y75dqwIgJtvylZeHdBfXnOeV7hGVDSX4YE39/uBPH1jN4Pm2u07HLehD
	 cA2EcNlDkoiLteADEoaTLJZr+KwnBTNGU7SAX972dIG7mFkHFlmBEGBNYPPpuxaRR3eOE
	 MtA1a5IpYxb0uwrVCZyDRpNEZ9BKMtw4vk041JUpFNvvN7tP0fnPRpE5BgRLe2cHlFii0
	 q9n2AdK5XcjzYzH4AKHSqr8YovbkP61Ibxd7AbF2Tfow/19O7RdOlsuECdM7ejY+QbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F2DuapRP;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9295C606A853
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9295C606A853
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F2DuapRP
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso30311775e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795513595; x=1796118395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=F2DuapRPmyZprQaMWa13/95lcAo7egtMQxaK0A97dc36K/UbriXjpI4WRcY04/rH+h
         oQhbZmVPs2FSjZbGBvJ9uh0X7+yZ/+97EcWMSiN6KppPDEcBiONtkTrCS8POowkV7Cg2
         CfosKbONOI5Fk0Eo+pRsFWSgNZqA6ugDOfOmrOBUWKpOCLBWaC6ZQH67Lcejb4XbsSid
         MdQ3Ks/BDgtJHKmUIKfl595k9N7kw+dmBigAhMPu4YI/A6a3JMTFvcsoRbGf1S0CaHgu
         J4a/1uVx5Ru36M5vSSfHS5r2nZgqLkbUDvmPu3P9Cyfr9d4s/LhIyLyE68iUsS5wvQjD
         uMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513595; x=1796118395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=HFy4++ojblVluOb7aFivjoSAhfe3Jk67AW9+Sk8ZyRLvgPva5Y+MMtvvRamjwONhjC
         LbdTJdisE0qAb+gAJgBd64dSMXIiuHRSyBvQWidtQU9lOUgjVl1nhcBM8xuffF7dbJlR
         qPKnbr564ilqZk8/WuzidGH2sdUjvZxfJs7b52+Pd76FaSvebyB9uh0WeTLFSe6mBSkO
         HtV6GkO+ON5L+QK60lMDdr8e8rUB97zGv3ceY/6BjSvc6xvr2KtBu5YWrb0tHwlIq0//
         fwGakiXPh5iOmHOX8ZgdJ1kgdXC/v3105g5ddBcxY30v7A1gVrahRHfs4rC7ifYnV8qO
         GM2g==
X-Forwarded-Encrypted: i=1; AL+hErHQzAWbuZn5b7J7TrD3GGN3lJ5VVAxg2XWtfSVBqNVe8CaEp213ldBLSCzqR24JAofAEgtrEzjE7RcfJXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z97Nl5C2MYuS4LAzeDSN9FNqPYVxUcSe3aQsER+cJ2jdgi85AAs
	AgCcUxidKlLt7F2BiQUwmDR3gN+CF6xq9jrauVpxTXQ51d5RIXRKDMqTMXw76CFHr3Q=
X-Gm-Gg: AZFdTZd8mFuRrIK+0xzYEpmzmSAJtPdJ1xkhxnudPIj70CRWEFfDx+4J+pLBRd4Ue0t
	aB5e9jFj9Ui18F854QWmH8zCgO15nv456VuXQnJa95VhQyBnCzxc1KnwgYXwCYabw34Ig25rrIM
	uIC/B/ycL/kNj+9s8LvEhou9/H1VnGV1e5ls/dp7GUU7Znedif7ZNORo3sq11RkKLsyxSv2De1n
	qgo9xirM6N5qTHNtXiekyefrR9IyrVrujzNsCgKP+8hqmaY0Wi+jyf4b+xu4K1KbtZk0YvmV6CE
	DZxLQUEpp6bF9bifa5A0IfvgJOG0p1HFpoFqfd+xY9dO6SRg4n8MZdBrG14BoSST5BcJim+bJFo
	G+Eq7opjOmPe8PjlrkypAsDBIGZadpbUQBUnkAe7y7pqbOLNYxkE3cQMN11W30tSusqRUlQq419
	6Qa2vay3XIEYrR22nEm69xFPA7Gv80kCn88MqbuU51byUIFm5Th7zAP9odrPaGwlzNEWh12uNBb
	Dw+6qnEYyfmp/bd9POlC6GaXW05LLjSmtOq/8NFS5nr5SJCHbXgzNCMsBDAawzdy174z0IBnmao
	7evYt9sFy9VtKz3YlnoBVPc/febwO8hU7VL5//HVpZcfptMC8EhGXWixhnDzKFqiOdX3w6o9tML
	m9eztj5ZUwf0qGmwihm6dteOrP5CMBWpK
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr277657935e9.32.1795513595111;
        Tue, 24 Nov 2026 01:46:35 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm431782555e9.15.2026.11.24.01.46.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 01:46:34 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
Date: Tue, 24 Nov 2026 10:46:29 +0100
Message-ID: <20261124094632.8879-2-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261124094632.8879-1-gerard@teslabs.com>
References: <20261124094632.8879-1-gerard@teslabs.com>
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

The MMC5603NJ and MMC5633NJL are listed in trivial-devices.yaml, which
allows no properties besides the register address and interrupts.
Boards need to describe how the sensor is oriented, and the supply it
runs from, which is often switched on wearables.

Give them a binding of their own, covering both the I2C and I3C
connections of the MMC5633NJL.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 .../iio/magnetometer/memsic,mmc5633.yaml      | 61 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  4 --
 2 files changed, 61 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml b/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml
new file mode 100644
index 000000000000..423b8ecbb9e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/magnetometer/memsic,mmc5633.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MEMSIC MMC5603 and MMC5633 3-axis magnetic sensors
+
+maintainers:
+  - Gerard Marull-Paretas <gerard@teslabs.com>
+
+description:
+  The MMC5603NJ is connected over I2C, the MMC5633NJL over I2C or I3C.
+
+properties:
+  compatible:
+    enum:
+      - memsic,mmc5603
+      - memsic,mmc5633
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  mount-matrix:
+    description: An optional 3x3 mounting rotation matrix.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        magnetometer@30 {
+            compatible = "memsic,mmc5603";
+            reg = <0x30>;
+            vdd-supply = <&vdd_1v8>;
+            mount-matrix = "-1", "0", "0",
+                           "0", "1", "0",
+                           "0", "0", "-1";
+        };
+    };
+
+  - |
+    i3c {
+        #address-cells = <3>;
+        #size-cells = <0>;
+
+        magnetometer@30,4a20000f000 {
+            compatible = "memsic,mmc5633";
+            reg = <0x30 0x4a2 0xf000>;
+            vdd-supply = <&vdd_1v8>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a8b2b9deade4..523c205c0880 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -261,10 +261,6 @@ properties:
           - meas,tsys01
             # MEMSIC magnetometer
           - memsic,mmc35240
-            # MEMSIC 3-axis magnetometer
-          - memsic,mmc5603
-            # MEMSIC 3-axis magnetometer (Support I3C HDR)
-          - memsic,mmc5633
             # MEMSIC 3-axis accelerometer
           - memsic,mxc4005
             # MEMSIC 2-axis 8-bit digital accelerometer
-- 
2.45.2

