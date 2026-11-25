Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649464;
	b=RYb3IbZmOeM+57kzi+hCRX2cv7RGoBHIYUm017zUdMB+nZZpkDBmeH/BPSZIKjNi1iox
	 oI+dRQtd7cjG7kdsOjghrnjZPcmAhqXWYkHrygQGzjL8tHK/43aoki+rplzom3fEF+DL4
	 XiIV//LtfCoPVz9qxfeJuoY8oTecSk+QcMFxwPEn7BYhNJaG1Bi5Dop8OHoF3RThC8wFo
	 2SpvRR3KUgJc3/mtrIuJSOKhygNksDBaRBrvjL+qK+br5nv9lTCJPpn7JS4nsAN2RsjPv
	 sQYSg9F9u+d6Dg7yecjaG0NctzRsSn+Ios1jclNArJ7O2ZDmUiAlSD8rTxHWi4Na0fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0dpmqiSeirQccMrAkW6J9/IyqROVHEoT3mm3CSsBnXQ=;
	b=Jz7gks00WNQ+7jg81ibEjnZiuBnJngBbq4kOARMHaZqwOuQMUVBf/GGNlrv46o5yrznX
	 0Zs/NdPYgUEzBocbHOcP0bTK8NMUOW8hm8kJ6yAFp6bWIZmbstjHxvrzjqHop/r6l71r+
	 WDowEZCkXNvAxf4xfl04vis/8DZEJm3tsCw4KFaKe/xV1NoDmL0qPwZd63nl80v2WUmAv
	 UWbE7+2No6IXY+BKn4xerAzBOn00CrgfQMBpbIjcF9I3PbpGrGoQuighAC/sSfVoNZkrm
	 SpI1gk+lOJvgu4ATRSWz98ImxNimtvnNXXAo+UhbcWSqmKbpS0HaBH4DwGJyAqv1Aow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wpiX0BzU;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61B9606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D61B9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wpiX0BzU
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e3b22e971so3362952f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649462; x=1796254262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0dpmqiSeirQccMrAkW6J9/IyqROVHEoT3mm3CSsBnXQ=;
        b=wpiX0BzUJXu/kaCWdaocWsdw9dSgG0bxBge8kQE7WVVGoMefDRIjwDEVewMoh1dcBx
         PHC3xtZDy3PVemrCU5byxIcTO3s9noXcA6SjFg1bTU8w3Yq8Dc7vEXb+Hg39Gtn05H/L
         71kAqKG7RkH/wC+0gxG+j/YSltqaQ1X/H3/DYW0J4AtN5F9DWz2uFkI48gLpJcvlqk6q
         v6IyDEjro3kpwn8ASJ+van1xCj1brtZQJlaEeprtajlWv4IvOT/ZvYYOapgzm/l3Jgxo
         92E7l7xArF0jtHe1NWURYQozt5S3noOCf8kLMmX73VmM3XZT6hVTJ78mCPfvsm3479bE
         cHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649462; x=1796254262;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dpmqiSeirQccMrAkW6J9/IyqROVHEoT3mm3CSsBnXQ=;
        b=TDtWcrmSvUDX1iYjdSMxDSK4EBVYbP63gqv84/OwMxTDjkGmUrwDImlIx6mbcisdu+
         KO7ZCB17WmkBvk1om+Ra0B2B9FLpAPGeV9UoUEN59KRBdsqsjsYcQ9bbKRWc9TxB5Cxj
         43nZGQVM1MMVOkFgh6PmyiKxCw5tRkpRRQDXTFsM/Re1JRyRIZm9TtEfYbYQQghMl0fW
         U4MJF80eKaFTYgcNsm8sPDpvjkrSjU3CoXzX8jdlPykn9nGOZLvWuh4wE1WICYTdZguu
         MuUs70zzckSfFj0AVDo0te1YavNaaufntbMlP1FlxcuLKo9DeMRQRPC8Nm4poCuFTe9P
         62uA==
X-Forwarded-Encrypted: i=1; AL+hErF5x+2U3oWrlt+7tu5CpsNODYLS540rcHsWyTzQ8h49LL8Pb0hgX7Yw1XkeWuXQ3507+QPkYKzH1wvaOYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QRYWmCNJmNHEU9C8Kksqh/BdPpscRKEmZD9Zevyc5rowDvaDh
	cn5I6goACIqFgPTQWZkiNMWqVww0mlS1lG1ohS+Rn1GPIxa2hgucl2mW
X-Gm-Gg: AZFdTZfpyDEInPF30KqyysVeg0eCdEGHDSUU0QzJzYzV87zaN54qeKBMNhio3u4VMFV
	rj3RHYc0sjhWVH4AMOdEczvjOo6qbL7nMb5MbevvwKvgrw4xQsBN5JfhLwta8M0NbV25cRNIvs3
	GIIuhgWd2t1HFQ5NsOzIRbaPPnF5fn6+6wF/3TWYwlSunO4GVGPJUKkzKzu6oZO2ZDiDqfTKCY6
	JmurIuyAcwmz+9XDLbGXk/HWTeEU13LhRYNX5j9tOvDNdmEIUb1dFCPdQVFiRwafr1XW0FhLUWl
	lHrCtpcs/SiXaZLxZ6dfv5tBWnLI5kbP7XOBPRcDmK2i44plL4PeI8hKEaMF/TWEgyJ7LSJey7e
	JjWNGbWRyv8pwPXiXZ3gb2gxhS7C4wCY0u+NsyJjfID2QzJQEdbCMo0DVjZqNwJS0Nd0RLYgrYX
	cma5DGXGBJTdACiSuDBUrRgnFcxPPtyjIk3cyw15/pdpN6KsJgKaaAJdDTLgC3Kt3nawTxbtv7e
	QWqX7h6PdJVPTREW8Q94RhgZmRgiJDvtiriSiXeKaQFY60vvNRQcsKMydgK4bq9wYSwcB0kZNek
	VAHpuBsK+sbqPe3A/AV34EdZAdz0g+si6q65q3SETCj28nSUxkcTXM6y3xMe9WQHkOplklji4XL
	1k7gE7dqJqw==
X-Received: by 2002:a5d:5d05:0:b0:491:6c24:65f5 with SMTP id ffacd0b85a97d-4abaf74024cmr40271517f8f.17.1795649462181;
        Wed, 25 Nov 2026 15:31:02 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm38280390f8f.1.2026.11.25.15.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:01 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH RFC 07/19] dt-bindings: timer: Add Espressif ESP32-P4 CLINT
Date: Wed, 25 Nov 2026 23:30:08 +0000
Message-ID: <20261125233020.1380594-8-vitorhg20080@gmail.com>
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

Document the ESP32-P4 CLINT compatible and its machine-mode software
and timer interrupts routed to the CLIC. Add an example showing both
interrupt specifiers.

AI assisted with drafting the binding.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 .../bindings/timer/sifive,clint.yaml          | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d53f52e80d88..e6d08a4ff702 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -27,6 +27,7 @@ description:
 properties:
   compatible:
     oneOf:
+      - const: esp,esp32p4-clint
       - items:
           - enum:
               - canaan,k210-clint       # Canaan Kendryte K210
@@ -74,6 +75,17 @@ properties:
     minItems: 1
     maxItems: 4095
 
+if:
+  properties:
+    compatible:
+      const: esp,esp32p4-clint
+then:
+  properties:
+    interrupts-extended:
+      items:
+        - description: Machine-mode software interrupt
+        - description: Machine-mode timer interrupt
+
 additionalProperties: false
 
 required:
@@ -91,4 +103,20 @@ examples:
                             <&cpu4intc 3>, <&cpu4intc 7>;
       reg = <0x2000000 0x10000>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    timer@20000000 {
+        compatible = "esp,esp32p4-clint";
+        reg = <0x20000000 0x10000>;
+        interrupts-extended = <&clic 3 IRQ_TYPE_LEVEL_HIGH>,
+                              <&clic 7 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+    clic: interrupt-controller@20800000 {
+        compatible = "esp,esp32p4-clic";
+        reg = <0x20800000 0x10000>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
 ...
-- 
2.56.1

