Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416661;
	b=RnIebSe3sun9JHCIc2ljWPOWVvV1nMfy8ntj82FyLm74n5eNA16u23dLaAnHbUBwvMTn
	 nD425+wAyv/PtU4gC5GpGm1QezdarnbXoojgxdgwItCIKRTfC8vy7zBYUcX6yGQ0NFcJR
	 ct2XUvBDUARRdTyjiHwsyDML++Rgo7ZxhbGREV97mFrNQU7/8VpF6h7Hfe+MCzmomp4jy
	 b2YVsZ5WmAxS5xEMCltSHvrJ6icmZads91jN0RiNqXUSSPVHkw6I5cL8Mavkb4TjUhzbe
	 Iu73ra2kwisx4GKHUv3Egt2bma9OnMp+izNRaxCC41ryG5iP/uEL18dAEzWQJsw+GXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=;
	b=dAm0AAdW22kzL4hPAckoEU/KxWbZVXgflmwRSdmxeexc5Orqf9g1oZ739n5QhQV5Duwr
	 pPr9joOarc87AftfHge1nyHDSoONW9otgckENrb7uLSkquCwuPS+7GC3vjSVMyTt6dj87
	 viFlIVgF5mnltUyT2j7qYhyIF7VCI8cx7jkrjeK2auE61fSPiy4rMCFPuns4VCHZU5Ncn
	 lrYRfts2w2MVRDyEtYya3q4GyfXAv463VgJjlIgrWxh2+nsKULFIZRDYWjrknAKopP+uz
	 T6tf1w2gbj3MLDIMQMNet17eIN1UNmgvSiFq29/Ng6uY/t9S5/kV/WlWgEBAI6sQpzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=osGx5X4K;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8348F606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8348F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=osGx5X4K
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f0621eec70so15265515ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416660; x=1796021460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=;
        b=osGx5X4K+tP+brbe/Jq/ezSTXsZfwiId4NNXJrH0yADP23Nwe39iKVSJ3IkHvvzLme
         TQNQ1Xc4iwc0emV47AeRD6FP4QvRsBCMQGp70itnWisvAsmXACYqaG6etG2T4kLqqtlW
         fQS3vm8BS+m5fBYIC/rxNAyOeaQAwb/zsVfEd6XSXe3ANb2Cuoac1lQowb99dCTLmgeI
         2RSHWhc83UwWAhymEhfK9EerVVLUqnJ4duhY7akO8IK/AWiq+gCrciRbxOoCcidp//k3
         1SLxZq5kUR3GMKXa2nM1cAyYy4+/VS+ApvakJ28u6hDof96f+u4v1dfpzMWK1lDZ7vd1
         K9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416660; x=1796021460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=;
        b=KAY6iyIEIEjfgHuhv1GTmEnCukoqtlfRnu5C65hV5j7YK8B69l/UtL74vE2TxG0y0K
         2mvKaFgrIp0vtbqCWB3bE0VtDT6Jiy9VcAg7ZFZYxxERFpllBgv58h428msRzMEoAaIQ
         kxBdqypUadgRwRAdnKW17904yBx9uiSGBgm7m/hrKefUonxJEu/UmXjmCJ1t5AdeNcTv
         QY+2G59nJZwQ9bc4Z+6dGFLnNT5W0oCEo5slCzKBpMGt1XU7LacXREUwgpIBf6Li+P7e
         5Z2i8N8WR2nDlOvkPVU/gIi4oOrj8ODbfA0xWq4g2A8vMKGJ6cwq+9Qlk5f327FCVZ5R
         +ndw==
X-Forwarded-Encrypted: i=1; AL+hErHPlsgOMvSr8fBVpQbDzkcDNCp1LxeoQaAkH7rKqLNEVCH2dSKuBUlL+syaz/vDfziYdb4G+PwPx2vW4Zg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cgEY4myHVcyoHDByKdXMSD4KSrlb2o6gYAoc7D8SeBwj7QGy7
	fy4Cnw7keo8KzDCt1lhAb7oHDFBgZlQRsng2rvwWafyXHygrxKgNjL2s
X-Gm-Gg: AZFdTZcRzke01v6rZe9z5DGSDV4M8KwdR+GjDxcyyJrTKKVjixIa+y0g76hJ++ha0rk
	M1gy0lkCxnAdo771uRWt4eGB4ve+SqC7k15k6eemPUhgm5d6Dw9ung/GZepv3w8hdgSpqLZyOQv
	OF1LkuNhl5HtUprDlAMoWa3F8cqe6CKmlWsN1wRZaEsrl4zhgflJAiFmTHMfzPaz9HZr2btO2OS
	7vIYXsPojE0dphTLwx2XU8u/ckeTf79Z1qw7dmymxcuPusT8FNMjboC1JlKZGFz5yqryarYK4hP
	87f3Op+SjIgz3RNnc8qb13uaHtYwk0go0G//BkoLm/0pHQ3+KUxkfEb1Vlcp0uFkbPQ7SLsUknd
	fN72iQ4avMjSfrgKO7A/hhbHLYB32/hSS7eHfLFn+QA1hjmEg+8gzgRlh0RbWsKkDcGkbSHsmrr
	2skXMBVH6MaeahSUX4EX7HnuUIxX77DK9O6PScvrvlEzHU0jPLN+tVyb/H/aWnLJgsS0mWmLAwo
	tdWDGmmp1o2gvxJTi5LhQKZAPvZZAO0MNQT2fizIXUIVgdK0Qu1EgrmrrU2xLWFnvbFbdHvRbzL
	aHNIxbaQcMe38uHKw8scRHN5m4rpzHK3ZxapBzLqG0Ujb5e66fG4ljf+shGw3eLYgwGZqFTtcpY
	fg2bbd8bwOmkT/YE=
X-Received: by 2002:a17:90b:2ec4:b0:3b4:1934:721a with SMTP id 98e67ed59e1d1-3b41c9613b0mr10185031a91.60.1795416659799;
        Sun, 22 Nov 2026 22:50:59 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm5224811a91.9.2026.11.22.22.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:50:59 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/2] dt-bindings: pwm: Add Nuvoton MA35D1 PWM controller
Date: Mon, 23 Nov 2026 14:50:05 +0800
Message-Id: <20261123065006.28768-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123065006.28768-1-cwweng.linux@gmail.com>
References: <20261123065006.28768-1-cwweng.linux@gmail.com>
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add device tree binding for the Nuvoton MA35D1 PWM controller.

The MA35D1 PWM controller provides 6 PWM channels and uses one register
region and one functional clock. The binding uses the standard PWM binding
with three PWM cells.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml b/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
new file mode 100644
index 000000000000..47a59bdd14d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/nuvoton,ma35d1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PWM controller
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    pwm@40580000 {
+      compatible = "nuvoton,ma35d1-pwm";
+      reg = <0x40580000 0x400>;
+      clocks = <&clk EPWM0_GATE>;
+      #pwm-cells = <3>;
+    };
-- 
2.25.1

