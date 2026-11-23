Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463389;
	b=vr5Yvb4aLB+uTqBGqBl4DsKOV7IZQyzaVo/CepFAiHlq+gH79m9W60rPquxzMCHuKaAG
	 i0NSHF5EM+p0Eu5efELwSi7jGhblpJh3nrqLNMTLM1DP3iINk1KhrrZ6vLjv86gWDX/+h
	 zglET1JzrJAsx64Lau5oRZdqVsNBz+/3uQHkqa9sAXJdDuMhOXp53wJkF+U/TB570G+Su
	 3EQeDQJl4Xw2hZwgEuz/COU56PCn9NXjeTnH9GJJzupgNcios54S/mtfOt80TVgDm79wp
	 gF754uySNRmPjPqZju7ScSYJN4Z1GGbC87+s7RZ7YCP9AcnCpeZb0excFhjPfOnJgAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
	b=ZzmIjtdI9/qNYSnLAGNrEL6FJMynbL3rzxHWxYBQyhrGRJdHesCch0ZU8+TX0j7FvQNQ
	 fS1sgXZbu6/ncZWfK2AILMUvE1d6lzf6o6XzzckrjN4C55E647vkHupCdtKVneA/x2p1F
	 J3ef9J00We1CjmAAuobz2wch0baf61RNdN7cJhtiuzLcYs1uIHYRU3JdZbgr5Y4mS0btc
	 f1Fm/YbfH2xxagvDE8Qtus0Gh05ivJwq9vmzjuOX0JsLpOHpA9hDIb7KGVAi9oaMKxfiO
	 JynKn49kPnIujtMAI7tW3gBs4epO+vbSc2grqmiitW+a1f4kDtWfjMcS0/EFbfE2X3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Qaq3PXtD;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B63606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B63606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Qaq3PXtD
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so31815945e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795463386; x=1796068186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=Qaq3PXtDYHyqoyMov8LwW7piMp5iLht+BnmiGSoPfj3M5yjv1DrYnD12Kze2+dkBzH
         Y+dWv9wBLUCpbFJhBRd7k5Yb72AhZrbaZSiO/KKhp/apSosa3cmFAyzfw+Ud4tqfUAUt
         UiXCexOyoidQjRJga3S2YLrhh5//y8Dze1gfcgPObp2+MhW62zzniloiHqvHDbN8qEbV
         rrx4A8QGYD0vlO2vq1n2HhW7mSDHPRpCBIKY/7dD0NU8MO+GriTygNcY7jf54h1tQIow
         ti7xvN067tpOOrSIcA3Iga+1oTPEb1zRHjLZXmujqMyoUeeP6+VJnOaDRdNqNUaB2KY4
         20vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463386; x=1796068186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=jGbmHn8hWyFxK52b3ifXZfPhBX/+59ihqWLWOrxw7D4+vDdah1Bv0ZKpDpPgHGbwXF
         jQycPcHsQg+BF2cY/UGy56zowy+vwvqZm7GMCwAnrq/NtBho25eocg1o16foHGqeo4sc
         ZW0dnqbCkKTye5KiJ8o9EgFu9UsuVGduiyLIazH0CAMcYI6wtMQhu9Ee3U1iX2XBqhhU
         YyQRBi6uOT3M7rqrieBa80bWbSJf/mMp90ohHdXNad2XcpUUA8jX34n2kqiuit54RTjo
         dR3NuMid9KNb4rEvGAH+TfSD1Sw6GuvspCsLY1RI3bMtQn90WQcxps3l8mEWXxxzDzY9
         wuag==
X-Forwarded-Encrypted: i=1; AL+hErEDKId53yOSNOZTpJzWIei80yeZyYWkSOm2K45pzojkta/BdHeFXaXvgoRLfACUN0BphO4CX7+3q1dzwEc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WtzhSMM07ASJTG5WeEALpgVbMRktG8AjtywWMk1p5xLNI/fuO
	sVvM6vsLQh208reyeS/n7jEj3ooqB90xkKbS6U3ulH8lHhGTmC70v1EOuHCWct+IDls=
X-Gm-Gg: AZFdTZcIt2h4OK/kfjWvYp9lP7X36h4ueVqTHhISTHUWuNnsijwzgP/TM28AZUd94ry
	2WAW3HQmv5lwvT9ckNb3woRs5/lgntPqgVMTiFzwqHBkrVfz6DJmHG7Mciv21pIl9LBn8fLyHTn
	wNidItSKH6dRRLuoS4eobCs/EScXwsCIPSZM43hik6Pa7dy8UOhOph6Vr8nEnK+OtR88egmdrJ4
	YcR8nnmHnDEHp55AMJ0Rdj/KnvJRWowmTEi6Ki+s1nMd8fZ8oAax8RShtcqqBOVmfa8jaqtfah+
	QPGkgVOaX6PzNkNhx+j+0OUCRXpzDOJFLbAkjfpcEgi23dE0Et3eAz7Ag+0YEsPDB6f7J57Jntg
	3EgdVrAvjIzse/aMINvoSX4mdw2k/vchQ9NooP9xaNBalZx3B/wnttjJd0JcyK1t+OTGYrUCjDm
	vnd7zpZuBNFRMMam4TiRTkQwm8ZwWurgMdheb4AhufObXp3jowBgMJkLCJgUZ4M8yR1dEHJWaJv
	VItWLsaPgUi5Ep6gCUbKSDa+iu+8/Ue5KXZeZGulkOAUG9Jtc/tkSfEUrAYYDopJX8ughyRiAqa
	kh+41IWrF778lTRZT3KX6VrjLMdKreFpjjC0rNFlGb+LlOefUC5yGscNyH6i4PfoKaKGV/76vPa
	uPncEJKZUKYo=
X-Received: by 2002:a05:600c:a086:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4bb887c34bcmr263324385e9.2.1795463386327;
        Mon, 23 Nov 2026 11:49:46 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm300924125e9.2.2026.11.23.11.49.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 11:49:46 -0800 (PST)
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
Subject: [PATCH v3 1/4] dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
Date: Mon, 23 Nov 2026 20:49:40 +0100
Message-ID: <20261123194943.57601-2-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261123194943.57601-1-gerard@teslabs.com>
References: <20261123194943.57601-1-gerard@teslabs.com>
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

