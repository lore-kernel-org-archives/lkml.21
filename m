Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742794;
	b=gqIsqxRChtjHLD7m1AWz+63Wge4d9LvuX5x6ICPNQBgkkdmwTOUuMhPY1gGuTBNPMh77
	 Zt6jQVbONltg+mRHsvQGdfraO7/je2mo/lHWH9mJo2l/nDG947B4DNX9RIJIVpnuJ0YbS
	 aaX97pkZ2KzYRM8Sc91GkxxOZAnxwseDZdrRuy4S4Y0hrR1ZmcqqKj69ykQeY086AzzFh
	 2MyR830JZchhT1cLMn1k7fO5GBPX6rgxkVx17VNNSNpLLAQ8yJhfDd52cai5kKaVDP5vL
	 H3lTUkScRRrRs4tkeBkdT3DgxVuv5wBTQ+jSaTAIkKUHUP0IsNgbr6PKmjqXQhIl7pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4ZwWBrnn96TFtHdsd5bNIm5u9QIUQi8JSQL+RPU0pxg=;
	b=Pv89pJ6gventwAbj+eKLDxHFf6/gU8VtjnK4rPYl4PYzKyvmZm1LqEb1vBJ65vPex9JG
	 QE4pf5Y5DcqE3e3fYbv5Mdvkqnmyqh7MQ4XvilbMuxTY+Pktqu4MtPvQE3P37phTZjWNl
	 oWTS0cYjuR0o+hU83HzMjgkSuqYpci+lpUSaLXuyGWGfahp78WqjWDtKjjuUTPH7OoB28
	 FsXnyrua9DWnx0X4/20PRsQSbKzWw8qQh3d/5I351dMgqCnBsDYXVXWZ1qgcpnbvKRfzY
	 DWMOrgNuJuGuEQKCoSp+58VJlRuMLWiCkTXpPOBz8PDaRXtXihZxZ0mxBSEN0G+OY1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcPaCema;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BF2606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68BF2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcPaCema
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cddac941ed1so3376186a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742793; x=1796347593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZwWBrnn96TFtHdsd5bNIm5u9QIUQi8JSQL+RPU0pxg=;
        b=WcPaCema4u0dus+/y5eGcrErIOJSggLSuvW95VzkqNZDz8EyEfmHxof3ThrhY4OxIA
         pkWwfyT2CUrQ6S2SRfGCaCfe+yln8NAooerJurAwHkVk7cTZA8wkPKfBL7c1zR0A1tZR
         pZBsKoJyg2Kr8iXsQVbT1n8ZnplzBNnNUDavr9PJZ7d5b+DoTY75tF21VHr5poW0w+jT
         vEOOcVg2N6TE2KSNM87NItzwzWM1ohcAHtggS8IscFBhWlZ7z4vmQAEwrppMB1aOz+5x
         AV5ny2DCdBoyxNfGp2R0PeF37irRavhLeu9Khju7slPH7+Iqh//rUnp1UJMoi1tHTnxL
         +2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742793; x=1796347593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZwWBrnn96TFtHdsd5bNIm5u9QIUQi8JSQL+RPU0pxg=;
        b=MbTYtlhRpHkJqFOtKgRThmnGL37uIU01pFRot1yTbV35+aj8ICFyNUCgyhgcI2aKyD
         WLnP5ffRXbMXcjmCkEcA0/atOuvkomCOBWsOpA5Mw9e3XrO66rfE5HO6X1EiSLCOyck9
         UXQYV+/RrjJQmDoI7gmttQ8crrKvsq8SILHPgR3FHOM76roA+dTFV4pvuTdQldb0L80k
         xcfnrdjiwyOskXHgS4eQUf9v4wCP+eFO8MlFJlcd9Wh5zC+LNRF8P0lpA9YK+0oEEO8P
         qmO2NAXGgmMlzeTgiprlo23lfqMbaF6RIYOP2rOp3hWifB8fkKs2UqeJMZ6A6xRgBNdH
         GdAQ==
X-Forwarded-Encrypted: i=1; AL+hErGg4ixXujqgVOQuMjg3dXtFvBUPyg91JLoXFbpNWwvYoMPBqqyU2wBE12CRqHidi5xbX0aUcIWqdGBly/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1tbPyfD2orreu252lyu9VhbBWdMIK/VpIeJ8ngvPczux62Beb
	EDbkopwNVSZnGqS7eZf8N1EigKjw+BdKKhUooWgku/sHHdyjJ+Jz1Ns9
X-Gm-Gg: AZFdTZdYkpnJ1Okl7Y1nprJkdrvsxuhx5Pca1+9Bpp2u2NBjr/c9whJR2COisHWiuDn
	ntRlg2a3qYnKcJXNRwojIx0uVw0BDlDz++PfTbkTofoUwG07rpZCbvvLgZ5tTvAKxXFWySqxbco
	UNmRnYO45SxRNiTRg1dClMLTAG0207f9rNNqR9sua7xbKzV2TTIDye/Fekw6R65+o3MhA8T7lq5
	txHu/h+nQnS8MgxDI1MIP19kFOVxO+LCf+tllJog5L6nBPy89erobeLZbAO35zTbfasu3hQCrLc
	BmTBYJ/8AFXeCVb1nW9n9/McUNvpQdRu7XGL7NYFi32IhrkMNg3liOXgcCq64seKIRWfvE3lkkH
	bdqyXAf1WrID092U+tHjWeU8rQ05uhR3j3YiPa56rCGZPu7H2bptmO5TU8uaUr2h6OvV04Jrssm
	ebfRSzzxSnERKg9r0VWhPvPZBr578Yg6LEwZp5T1rT1EP4Saq3ePHTE5xiCZTt+wTrO0aJTeiKd
	S2/4whLZj9QcyIMVBZKA2XEu9qY1szY+8X7V7i6YCsbdU2RArJT+ggNobghoxpHBjpvCXhCIVxp
	n9U9Q8ZmchEQnM4Ftxe0KcEyC/C3YD5jUxm0ZO5AkebEFfgewgR1mefT6vIJuNuXQ9wy5wp/i++
	dddEZSxjBNIB5Svc3xHkcCxAMOoxleh9UYa60dMizfOL06w==
X-Received: by 2002:a17:90b:2f8f:b0:3b0:ad59:7199 with SMTP id 98e67ed59e1d1-3b41c942629mr20023312a91.32.1795742792547;
        Thu, 26 Nov 2026 17:26:32 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35042866a91.4.2026.11.26.17.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:26:32 -0800 (PST)
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
Subject: [PATCH 1/4] dt-bindings: iio: adc: Add the Miyoo A30 analog stick MCU
Date: Fri, 27 Nov 2026 02:26:09 +0100
Message-ID: <20261127012612.1589039-2-romain.tisserand@gmail.com>
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

The Miyoo A30 handheld (Allwinner A33) reads its analog stick through a
microcontroller that samples the two stick potentiometers and streams
the raw 8-bit readings on a UART. Describe it as a serial device with two
IIO channels, X and Y, for adc-joystick.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../bindings/iio/adc/miyoo,a30-stick.yaml     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml b/Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml
new file mode 100644
index 000000000000..6c0e997d4ff0
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/miyoo,a30-stick.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Miyoo A30 analog stick MCU
+
+maintainers:
+  - Romain TISSERAND <romain.tisserand@gmail.com>
+
+description:
+  The Miyoo A30 handheld reads its analog stick through a microcontroller
+  that samples the stick potentiometers and streams the raw readings on a
+  UART at 9600 baud. It provides two channels, X (0) and Y (1).
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: miyoo,a30-stick
+
+  "#io-channel-cells":
+    const: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - "#io-channel-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+        adc {
+            compatible = "miyoo,a30-stick";
+            #io-channel-cells = <1>;
+        };
+    };
-- 
2.43.0

