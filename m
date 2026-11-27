Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742808;
	b=kNEVLfkkHRQsElkYEoaFkVR2uDDgrOJez5fJTtLN5x7+UTvVYFKXKqf3/zHpMgtw9IO4
	 NKaD5gs9eHeFLsOynlRy7A9ipqTWtdEKv7CJ+3JQW5+NM4Z/vN1X/TLSO5EJlze6v3548
	 vPctmnE7UaS2y76O5UiRvyHbbbd3PNc9nED9KHbhsyUW+uQBu/oIc03KKOTI4Euu+YIdK
	 a9f79EMx7SIbKvrjYnVTm+cN5sA6OuZlouUNrcIgI6FZrTSw/gJddpivppqFwUIxMKILG
	 QRiNx6rxuTm6mb8q7JJkq9cMTBnE8eYhFig22IxiabyT2IIoJCH2orVY2AwGoOn0qAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aG/KagoNLB3jHRjeL3wtY+SAB/EDT6a7qyc/UcmRA5Y=;
	b=dVFw5ZifB0ET5bee65WVjefciiYeWhnJmIzAL3r5kM1BPVkclsFsGIAt9VJ+NwhXV7yw
	 KSGrm+lMMX1jzU24Xx8bvcJ9cs99lpjKm55koHkqbaVt6LtXqG6dk7FR/qKARKHyxCUNM
	 65uOBgL/xUa1dEsKn0Ly/JxKuofSU/rJb6wk/nZVvkKPiNwVuAIvKSML/gPW6ceXrlH2m
	 PSV+S6yqwfWAyn2/yn51lPIs6cU+hH0Y5uACIb/nBE5LN/qHI6Ykch6UG02R5sX/vefQH
	 LtrcYM9heb0YYviDCv/0WfDzOEeBguwiG2q8mRvbGJgFcqluuNIgdJ5vQVS8odADKbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktp6R8QK;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81206606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81206606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktp6R8QK
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b41e627cadso4684744a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742808; x=1796347608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aG/KagoNLB3jHRjeL3wtY+SAB/EDT6a7qyc/UcmRA5Y=;
        b=ktp6R8QKl/2709eOOrraqJz+yX/kr1J3oxhpSeFZnRitQEwCaDgbxtWoVDkyRnfzMi
         vPg9X7wUo5x/TPg8Y9c91IMP8bovEEefBMVEXwN2EBXFJPGuCB3xSCZFDWe6+/3Tuls0
         hfkRrWmfmk9f79CVyuLF0fxxmyDSwJ6J0J3NJyNYZ+t3dNuGQVzqYnT4bI7CFd1V1+WU
         5NAlqUsT12cGI4cfxBjLNceBSyMLtekLfkOQujudOJzryoUMSVjpzIuGNcpj/dF1IYEN
         jhhycfIHCYcPoN9v9GyW4OM+9+xg9/cY+tBUjmO1CkaYv8OMl2uXvRcqqvHJ6lDusSXe
         ArfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742808; x=1796347608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aG/KagoNLB3jHRjeL3wtY+SAB/EDT6a7qyc/UcmRA5Y=;
        b=fNPDUT7faxVHRV+czKHaWFgPfUiKWvdtqpmSwijsyP75atTq8dAl+Rctc594BK3F+x
         HKJBkdQNSmDqUBgc30ux7P36F2t9gR/dbTOSqmW8knVev6UhLr/+a21TXM3WjO5R1/+B
         DEJugkXfRX2CDQBY5fPTMk88B5Iud8EMLOeGqNyeLiNvXC35AgjI/68TI7GzQsU94RRg
         wdk8ImdyZH143t3H03s2HpjlYnz7wWa3gpYPx+scYIzg8Pn/OxXoOEjq8nkitXct7BW4
         LX9GtwiC5cSWXyGlKP3bpmJvvHzntdbfR3yAbzcu4T2pnwSpP/htF8Rvt9D9X4CjJqs3
         vkzg==
X-Forwarded-Encrypted: i=1; AL+hErFpTJDwzSoDw+to+nZ9hZDXBWg5N3Ujyb6qbgtsEOjC3bNY102mcFNR7u4dYTYJk7HJI1Y8eIb+t39aXoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RIEEZxG/1vs4honHKDsqbawJfIoVJ0UlNh8VTOb2MH+Wy3IKX
	hoxQg7h+8IqOB3f1sGlVSmQHzcVJYI9lgWUpYs76LKBZ1CawYndK1JRb
X-Gm-Gg: AZFdTZdW9xld+JLDaJ7wp7lN0r21cTTZMTDlMy4pC++WrdsxQw7nlF9q4yoGj5aGvv8
	d4/GjbQPuzoFfq3mVnpJxI/+99Pj+bpEpebwLiitkU884kk9wEZT/FXxPE8NCgGh7U+amXSpP6W
	f40lOcGgZkNl7xFTUJUnPvB7sj/Usmmtyuwjx8L8ZM1aiSuZZZhwt0yGZvrHHz0fhZ5Id0GjW6g
	QiUi2lafCmoXqaBE2HjCV9CtQRfs1NESdBtQmYo1TVcOFaaneddWmrluRNJnlBV/UBk3dkztkDI
	KngNrmPUTtCvoYpyt9JKMdrstuPj5ISADRuJ0/Om82yal8E/fWawHCmoe2atCfg0qKHadl067/v
	xDv90PTunm5HYUHHI5uigqWQjPQDNMWaIEcaP3LiUkOVMqNe3m4DvK9uJgTSlICK4diaRQ7ggb1
	KQcGkVKKM3w8kABZAFF5ONrklhupi+QB3Oza2jd7lDh+Q8qLvDkiXf3kLIFiAwlcZdNlp+q4Hj5
	qFbBSsGMzPLYKPw01mh2e0o18xlMaojAIS77pkB+UGLzDN0rNwDI+trAJ6dPL9wNwCceCpW/Q2L
	clDw6O2Lh9UTThQuIZ6BdI9fDZDbRJhVF9YktX7GOZpCcYTmXpNOvUgFalu7VAFy/8Ejz+5wGn4
	lGfpRiiRRhk5XEoir/Z6qO8HzXnqLuKNJM1eKijAqzfrc1g==
X-Received: by 2002:a17:90b:1e4f:b0:3b5:35eb:5ea7 with SMTP id 98e67ed59e1d1-3b535eb6056mr549399a91.33.1795742807761;
        Thu, 26 Nov 2026 17:26:47 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35042866a91.4.2026.11.26.17.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:26:47 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 3/4] dt-bindings: iio: adc: Add the PocketGo S30 analog stick MCU
Date: Fri, 27 Nov 2026 02:26:11 +0100
Message-ID: <20261127012612.1589039-4-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127012612.1589039-1-romain.tisserand@gmail.com>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com>
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

The PocketGo S30 handheld (Allwinner A33) reads its analog stick through
a microcontroller on I2C that samples the two stick potentiometers and
returns the raw 8-bit readings. Describe it as an I2C device with two
IIO channels, for adc-joystick.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../iio/adc/miyoo,pocketgo-s30-stick.yaml     | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml b/Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml
new file mode 100644
index 000000000000..103a11c96fbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/miyoo,pocketgo-s30-stick.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PocketGo S30 analog stick MCU
+
+maintainers:
+  - Romain TISSERAND <romain.tisserand@gmail.com>
+
+description:
+  The PocketGo S30 handheld reads its analog stick through a microcontroller
+  on I2C that samples the stick potentiometers and returns the raw readings.
+  It provides two channels, one per potentiometer. As the stick is mounted,
+  channel 0 follows the vertical axis and channel 1 the horizontal one.
+
+properties:
+  compatible:
+    const: miyoo,pocketgo-s30-stick
+
+  reg:
+    maxItems: 1
+
+  "#io-channel-cells":
+    const: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - "#io-channel-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@60 {
+            compatible = "miyoo,pocketgo-s30-stick";
+            reg = <0x60>;
+            #io-channel-cells = <1>;
+        };
+    };
-- 
2.43.0

