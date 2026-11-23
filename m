Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465582;
	b=DMy8fbbWIBSNlzaO30y4hnTeeM+txtDNeioxq8IjYGFYPX4noh73vp+tL493OgN9AMvW
	 yq0xblscONDJ8MJWpvaQFzXqcKA4Mr+jqyZrcwGXPMQDaI1sKA2sVlV4CXPQBeZj1vhXH
	 jzhzt7OFqSptoJWo7H2EwfG3RCqDvqh838PKUPXzJie3oUx5Md4Uj2hwt242XV6mwgpY/
	 v/WO8JRoV5BfZVvu9PqYo1X3pOsmqyXiRFK+dEF1wcu0pkDGw8Dz3VLCNAtNce6w+0sVQ
	 ENoXjA5UH2AJ0Pm190v60GBjVYJCw7rHTlTdHmMllJ9OP02MCtgO0ywvNdWDUMsp0zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
	b=26WjvsHofrP7MIwwbttHMzBl536aT9dKzzdHG3inu0VsaD6/aoq8THSTodgayKQNB+Bg
	 IV9odijuKgXvFvILzJ021O/zUrJB3xtnoOjOEAe/D4Qi5HyRdujgYrrH24WEI54w2as7B
	 nFvr82JGVQsCTPM0iOkPoOg8KkuIYRL4BOjbdE3UvPlZcrhOfTSd0cD6075T3GgJAB1YB
	 STjg1FnIfuht+v+YOJgKgcvLW7bqbkTG5V6ePZ05r03LTz1qKfOFoCn0zwoFpZzvrVL8l
	 55dEYkFFSjAABDO968MU3G7mF1ZnLmYqRjKEl4VSbkCmBuXY/q1gjKxEjEJz2/hVIcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FysIJprS;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE758606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE758606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FysIJprS
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso42622405e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795465580; x=1796070380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=FysIJprSQoRhm65u/m4uJ97MQ37OW0ApCwYwDghZ70EpscxF+jbQw+BXTVpUXGRSsT
         KQuDWTxeUz8Gy4ES7fNVLKaCGCfqSGP5AFG8t1u1VxSEHlcR2EizPwR3i/Q795lpe/no
         gEoouCw2q+jXoIrf64kAcU09XXCwoSJY3snC2BB4eDNjcCUwUrHUOkkgR2geEBAHNGP+
         Gkd7a4Dr6EUN/nKedhRKsPS7+MlkudrNeAsU9WzJNJeHvFy09E8VL+v5ZEjxGFeBupjo
         kCcJVJWRl2d91lndlhRnXWvOKDEDWIEJq60dqe6W2Xqf1IhENq0qJ6aQKutA8760dwpr
         Vtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465580; x=1796070380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=SACTtLDRB60pP2Slo0TF+KjfBZVHk8VBh/l95ItUyDyJX4/VDlJIhn94STG89LVLws
         tfzJAyYZIULp+b/9TNCClnsFmpijz7XrIEmeY8qdloHuMwfV3m5123hVTmoI5JXbNWfD
         uzQS3XUtNBt3+5F+6u9BNuKHF0krz7VcZslIoYkPyKJDuWdxifWqPgkcJ5NX44wFgV1a
         DX7Y8hiamgvQZlVhfLEv7LFABiSHyaY609F7diFEM9v7vUUCT3+WR5+XAsvNShn6Bukk
         Qy+qZjXXZieBOg0qwakhIKOANrnqV94BdgPJQIsdP6RC/g3CPqJJ63nF6FEg3oAHNER8
         EABA==
X-Forwarded-Encrypted: i=1; AL+hErGvMsAOAYTYH7TBe/hgvfHfWegml0hyBfIoyYIBBtBb1+4bib6Sgnq4cKdkwi8Tt70KPStWRwaGbQqUM3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zlzlROKniizxa5ydyhmXSgFDYAlntr5X1TtggrdC+TA0FRM4d
	9w1exU7Tp4KKw5OFYLG7DwaKoRhik6RiiAx0Sx/oWKqQ12Rd9Glzxcv8WG1TwuVtXvQ=
X-Gm-Gg: AZFdTZcY2cKPzFXlX9pCqmI2USKoCowo+W4iwSD0mltwZqiuU8aHSlUH32ezQgIy67e
	Y4lLT2wBamzWOl59nQefJ9oT90lkaj10OzrvtY8URtL5sJyFKIq5ePJ/j71tXw0aYJcpVDFO9Rf
	xrn6XgfcopxalDpMmGCBaUw3ccIX/MpN0EcOTRYbUXw8QGscJF6Lkx6ncISU6VZ9PpKoKMz6LdC
	PTrFwADDxYI1lFuJq2uCD8uoIGvNPkR6I4lrJvNWf10ClbMVq25hd7oQ31doN8YR9bvUS1ZViZ4
	wsFojVwjm31X/OcIV7OucvVNU0uSpU/yYINPblPZwuNPO/FBnSaiF44E4nzCXini8iYuqMBhHow
	LiQOBXFZ1wHfIenPr+vqiTAafZ6dX80vejx0wXzPwEfrVqFwnJ3RAr+/ZdzpIf/U+oqN9SN0CaX
	zkUcZlPM8aNIz747eggve9WkwcwULufjs/NR70EP+rG+4iOyHEfxo7GMP/PAgSc+sfgeNRVZlqw
	hDU8WT5kol1Z9n350khTrl5z+kpUP6y3PruaXalRzaKryxTLZmQ/yfqjJNJtg6AGVjeUCnzZ6U/
	6du4zn8DR1wD/+HvuvKY9MLZYEOVuYFa9JyJ72OL+B+4WtesLlQB0xJbiBeWG/LJntvrNMplaAd
	4M6PvStwM0d4=
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb887fb678mr249466655e9.4.1795465580088;
        Mon, 23 Nov 2026 12:26:20 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm20108713f8f.46.2026.11.23.12.26.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 12:26:19 -0800 (PST)
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
Subject: [PATCH v4 1/4] dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
Date: Mon, 23 Nov 2026 21:26:12 +0100
Message-ID: <20261123202616.17334-2-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261123202616.17334-1-gerard@teslabs.com>
References: <20261123202616.17334-1-gerard@teslabs.com>
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

