Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374521;
	b=5HLHAFG+od1N9Zde8XO9VOeBeh1DpiFz4+tyQehm7yAVhd2XpumYt9gtVzkq8r9WWFdj
	 sykOBoRbWsqC8L6ZF5+Xg8d7FbXUK7X3Sc0P0Hy2gAdwI/ed5MyATLqPEoWv2uYk2F5rs
	 /yGHoOL+zeDEO3aM+lEL97ecfb6Z0gKwIop0FUDJSGFp22chOlKaTWIKsrKiBmL3qkEYa
	 VFB4u+yH1ijFbil+HTzVKtq+gJy9F5d/ZMhcVURVtc9jalETH3ZrXmf1oGFOSY3qCZkJ4
	 zT00HZrDHmenpLQnDDrviP6x2LTOYBtreqAQpzA0DcMpc5AfVHMoDFB2xD7/wtFUAlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
	b=dNvoH+/pgOj6DEFKfbDR5RWtKYFYwwPpk6Wgi3gfLGw9sJm4kY4vv4o9Rs72CMtaKUXf
	 5D2pGx+6te/98e3tpqpEOjbknRQZ6vMjvS90BJWAzbFzHhrI9tVI1/8ve5Obe44oBP5T3
	 PLoYmnfiqWrnkYdpjg+dHzioMNcSO7shkRYgvF5LeGYZFLZTj+aIKJVO/F/fZY6XO1tIC
	 ORALJk0uv4vKLtMWeFtk+xVf7+EQBCLg/F8XchVsw9KrLJNoVuOfZ1LTGgpd+7aQYrVlO
	 6dQt69QmoN1QmOgt7rSCE1K1Zc0TOIHkaFDqz7+Czueg6R+39I4jKjlmYmRbo9ZflaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MY60QOdv;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2E0606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B2E0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MY60QOdv
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso22652065e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795374520; x=1795979320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=MY60QOdvETfWFmzwHjAuZarP728XBww5sgW3Xpgzkc70uYm1GMEHAQ+OOFQyGz2K4I
         3UC73tciUBKM+zkMIQzkP7p2N5lWE6wMCMvL5KAbRLniLc5l2r+QuKs8OVwjZ0L2MXEz
         5HGucgog25eHDSnCv4SeLN5AgVDWYrJVcq3XHgEI5vx9a+0gJ4lis9sOU18uHwdcB2Ve
         xcuhSVCUFiyOnhouVZEEvcYwxCHzdPPPr65h4w72ShWmB8NJwpWvBv4G/cqikENHyup+
         nSSJUYV2wt4l7+XxQnezrF/ms1W06KZai0bFFGSdID8MbVX6w01z5aJWgstMFNsJulBe
         AuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374520; x=1795979320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=Xh4zl5U19RHv9slfGJLIEHZjZl3+W/5Jl8JxsnURFz0rLJ20nysivs3xsCwzprNiUE
         1chjJnqtfoeFqHj/YpebI0KKw6Rv7fP3voonirgJn98qBnfg9AFpltNHyFjjKZ5d5lr2
         aqjxtcoWWTgbDF/YyeNAS2MYSnSjAXbc/Qo/sVzN9J7ttBOQqG2BT3wkXx+WtyczyHC1
         q2CmdZEZXzeE6dUrEH3/ZtT+cWLpX/hz4fbNAtzLTursJPtfdJHUaVvbXAl+QtPPRnPR
         qpHJJ5ClYXpz/w7JVbto5huDgZlvJLZkJWWB91TThohGuUb+FBN4ZRSNxx/kxKrdpfAu
         pwjA==
X-Forwarded-Encrypted: i=1; AL+hErF91xBbRKVFj369anoMr+rsHWW6qq6DTkWn+8OIjav4EU5F4pTxnCK6+GAAcPbq7Ew227jbLxLXQius4QA=@vger.kernel.org
X-Gm-Message-State: APuU4Z879t3RmHdTjpKAj7wTpw/B5baTzV+Php3KHeeJmQcQMJTJwM9c
	I3azJvyit3ElJ4l8bMyqjGKtYHK/+yBR01R5bTek9Ne5RX8JFfem07waPbAdLvvquxE=
X-Gm-Gg: AZFdTZcpfF306Q+q7BciTMs3uVXAv7L1eaORfnKEwVaS7o0FtwgeIPTlEglmyy9pEh6
	HB/LAqFxpnULweyPoD+fZgRVpRXAbRwnmPB2LdtbIIc7pcgP0WSEZPTTqMccL2rZdIeTr33xOE9
	F5cmZjOMyW0yxocziu6Wg/uM0KdFDEUjzDZDgjPHbenKJYR/yUptEo2OQ4773IsLNueliBAE4lR
	Ans9CetPk1VH+k1KHz6NZLteTPV4yEpTaAvdaBRWLnOnkmUBofR3WrJ63k+9rvTHRBa7pXxHjDW
	AyaRT6O9iJWVYaUUmb9zxfW5iJT1zgRrfVIjPDCIff9bHxmRKA0qtSZF5CrJhPhkhT2wx/ks9Ui
	VPt9pmdrbyUpZnBei5fb0e017QwWhhOM50FnmYa9ZuHwoBcZxKpMTsvBHiP3141QTzuJvLn8KOY
	tH2D1HyViCDRkAe4z7BJyIEZnbUy7MDSdmWNx67srlnEuXJ89TXRa+uwNRIsyv2DYU/rg5rQu2A
	Jt7CE/GFkhDEERemIbNxM290+ElF1w0WSNj/qpBuUdnToyw9Ia+200m7vTkbJEqr2ygwbwUNP31
	rF+VcIjd+uH9+/6l56TIWqR3+Au/AZmdd4//ZaVBkZXqxz2DvhBRGgulbUXsiJ020gvx7qBEa/v
	2dS09ov7AoxI=
X-Received: by 2002:a05:600c:4515:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb888267f4mr200592785e9.29.1795374519093;
        Sun, 22 Nov 2026 11:08:39 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm103080395e9.3.2026.11.22.11.08.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 11:08:38 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
Date: Sun, 22 Nov 2026 20:08:34 +0100
Message-ID: <20261122190836.66111-2-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261122190836.66111-1-gerard@teslabs.com>
References: <20261122190836.66111-1-gerard@teslabs.com>
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

