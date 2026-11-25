Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649454;
	b=f9vGp++42a/BUeZGMfF2cryKZ0fcFkI/UglSv3Ss2TRIe8YiDkSiLqb36TKl7UOdP2jU
	 vbGWzHwhtAJJhF9FvlwJf8dA3fozfXvGWArMlB8FunoA2TrrCrAxD99pw00v7F98zj0nZ
	 ffM5PwoI4WPItZ815ce9w59wFvdMf2K7n9Ud7c9g95U2DnSAJS6RUEbP4Y24j9e82xvP5
	 7jC6sNRwTOCIrJRWE85XshlpjLvZkuwWu+VCT8Tzzm7h9ovJgatKYNkV0NOhAdfvshZ6q
	 50k+rtUW7jvYQ7AzYe7VkBGipePT5VyBT2DAASPmpPWssSB2KGC5KmQFan/7fB8sgjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=V5JhfCZN21w53Q+VXqNEMxIRzxDLInZAIKyThM70aLU=;
	b=wFYWZg3HCm3+hgkezIGaHSbp9teAfCEy0uuc9S8jEDpeUz51gjybYgY2hnxMxvT75TxR
	 8BIrn37IXxzegbEBrH0oZTif1uDuT1XZotcE4w9FVAYEW1Bc+Nig8KLCf36WTCNm8USAy
	 6EFUqUKdU8/9W3VhrGmRmboIUI6XWqBmIuiB3R3dwmXAVu2dBfieotaLLg+kkfBMkHdoz
	 GELvfrWM5s28RR0WjFvTYsOZAztRzFRUnJVxOG4zU4KpeL3WRdn4pXTaZ2ZvzTPwXi8n+
	 BIfN40N5PDKRa13t3eIrRBSJp45d7qhW24ib/2N7XqR88tdiT2eQnC5mAxnzuN0hU9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gy7qfxfe;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CDA606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76CDA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gy7qfxfe
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so56862305e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649452; x=1796254252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V5JhfCZN21w53Q+VXqNEMxIRzxDLInZAIKyThM70aLU=;
        b=Gy7qfxfeNjsYBuoW5vvOu6ERUxgbGo20MBPz8ckzDteAy3zz6XWRUnZs0M5lF5tZ1U
         TVod5Bv7bhPkTwF6lnpU5qrge0QV5RhsHAEJcUUXRpqnKBMAlZPFElrCtqsZoldfSSM9
         wn+MdYBT+GSf90P6Pb4w09NC0TZEL6Nm3tV79RlfqtJAMZVfi/DO85OyappPsYOHBh3Y
         kOPbO3K9lAA4MTTQQCCsUgp5dMhOph5RXqe2IV/X8TS58HlVI6wf6A0Q4Lk2yTMEU08N
         HdEQ6SU0d5jHynz58X4Qf3qHuI7AJqTirwrhGnSUw6xJYk1XI39KRHx1GWHl+m+LfCXe
         rhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649452; x=1796254252;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5JhfCZN21w53Q+VXqNEMxIRzxDLInZAIKyThM70aLU=;
        b=gudx1Y5zrAjFJUcOXIMOVSXZWR0z620D7HbPQtraBxZRzoB1jpG0WNCXD4F5kqQWhM
         Tm2Du+8C9nixp/IGiSHUHPN/cW3taD/hK2TiPgRE1XAMuSEcl5zWzCNqowkEXf75dAVx
         0I/ff+cD3rY5J4JE65n4B1p9U8QhbX3F/h3P8vL+3Vs8wTJfUBR9vb6C+B4JJEoWR768
         jHjnm+WAuhnMhY7HpuT5BTMyKVNUxb9RMI3OB7y6ZGGO/G73eQA1POV6Sna/nJTA88rb
         lU3H8WSmMUO4H9KJnTJe31oewO6fOrS21RPxFBIoO0KSeatc2HMNnOHjRlBk6vwab/MG
         eeAw==
X-Forwarded-Encrypted: i=1; AL+hErGxz7u9m+x3/q3fWZIfAKzkXR7smM3UCWccqH3pN1BYBFH/9vud7Bo1S0X0VFXBj1lbwcyb45rbfJXFl3o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v0mh7E/tin6Jx0ZPTC63hbzVbizz8mj927Fcf8yxB6Kl8WxLy
	25jphaZYXxKR8CYO0pQZZdn0cVrwUu8J0uo7fqP8f1ZUZOavPzMZlxgz
X-Gm-Gg: AZFdTZfy/4jE1CGZqCU8I8q6qHg+pSPwrTUWRFNJpl+1KxK8zFwpZpOI1BqoEYRI8vo
	ypeFZbRaVXutQLqbqPKixEoKh5bAXu0mGqsD46z9KbZGihNe/yvYHHzeoEevLbH8ZZVVeQrOrFE
	QaBupPfx4Er0v1bJVEYxTzoVhX99DZC+wH09lWwtBJXzYNHjzv1sSMfwFoQiWbDIZXnfjZG/0wi
	wYRDoKJeu5ccyxqRtMxxWxf8IFNfjgQ7DqsgyBUyjwEar41qfd3Tn08RqJkzu0u3GZO+bGCY4ad
	/Bb4XD2OczMBD2E6okl+JNGkqpLDtp2OD8esXaxnYY8wofBKJlLSJiX5zGDYEwsbO7J4QWdJszH
	CkAY70ojXlqzbyD1LOnE9dmrR5vCmVPuhL/rXgO/CzQdnPcmidjbEv0tueGhqsuuSZlcrlkEh8Z
	xyEuwaN9QYhPh5AkUM7KzOVFeKdVVeRRFN0ZsreYhig9ZX6or7ORx9IqaGAfYzJBX1GhnvSBnB5
	wR6TGjZNU71ZFpoBD9Y/yZZujpOWFbMF4WjOH47GCyfppvZkF1WJRxtokBqmM23nBtsc5RSw2I4
	kRxbE0Vu7sSLrIi7L6XQgqoyxg4p3AwDXdxdY/UZIJUUIXhVFcxXDqMG2ZBYJCVHaNtLIznBPbn
	DqUQUDt1gMw==
X-Received: by 2002:a05:600c:3b88:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4bb888078a8mr440446035e9.11.1795649451797;
        Wed, 25 Nov 2026 15:30:51 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm525188055e9.8.2026.11.25.15.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:51 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>
Subject: [PATCH RFC 05/19] dt-bindings: interrupt-controller: Add Espressif ESP32-P4 interrupt matrix
Date: Wed, 25 Nov 2026 23:30:06 +0000
Message-ID: <20261125233020.1380594-6-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Describe the interrupt matrix that routes peripheral interrupt sources
to the CLIC. Define the interrupt parent and the two-cell specifier
for the peripheral source number and trigger type.

Tested on a Waveshare ESP32-P4-Module-DEV-KIT.

AI assisted with drafting and validating the binding.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 .../esp,esp32p4-intmtx.yaml                   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-intmtx.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-intmtx.yaml b/Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-intmtx.yaml
new file mode 100644
index 000000000000..20f36c4f45da
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-intmtx.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/esp,esp32p4-intmtx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Espressif ESP32-P4 High-Performance Interrupt Matrix
+
+maintainers:
+  - Vítor Hugo Silva <vitorhg20080@gmail.com>
+
+description:
+  The high-performance interrupt matrix routes peripheral interrupt sources
+  to the external inputs of a high-performance core's CLIC. The matrix can
+  independently select the destination input for each peripheral source.
+  ESP32-P4 revision 3.x adds three interrupt routing registers.
+
+properties:
+  compatible:
+    enum:
+      - esp,esp32p4-intmtx
+      - esp,esp32p4-v3-intmtx
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      The first cell is the peripheral interrupt source number in the matrix.
+      The second cell is the trigger type as defined in
+      dt-bindings/interrupt-controller/irq.h.
+
+  '#address-cells':
+    const: 0
+
+  interrupt-parent:
+    description: Phandle to the CLIC that receives interrupts from this matrix.
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupt-parent
+
+additionalProperties: false
+
+examples:
+  - |
+    clic: interrupt-controller@20800000 {
+        compatible = "esp,esp32p4-clic";
+        reg = <0x20800000 0x10000>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
+
+    interrupt-controller@500d6000 {
+        compatible = "esp,esp32p4-intmtx";
+        reg = <0x500d6000 0x400>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        #address-cells = <0>;
+        interrupt-parent = <&clic>;
+    };
-- 
2.56.1

