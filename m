Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009913;
	b=Xcvt8d72GLQF0Xk+lhTOhLUYqAd1S6UJW5hE2vC6ta3CGpFrpfMeSQzh9G7O/hIDeboj
	 6WuDhF3OmaeTCPaDUsr6dH7rKOTFiZSYCdAT3n6XPpqAtFFisPKm9UuGbahC/fLI3C5JK
	 KMcL8QnbBUQ253eh1kFR7NcHA0rf/aSLWKYuHrwJDxOBlXa5O6xXKVfUO6yencXofay1z
	 E9MiVcakFWpgASf8X1eseEtJr8uyqZFhbA9sMTR/11xK/RoWzWA9715eFCJh/BGeIZaK0
	 S3D/cv8RhqKbjG/F79AHQic5NLwMIMr04+FRMLt1jU8cx/epAsutAYjySjAOmcv9ZRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GdYjun+ir64EdXqcZidFlUVCp8VDFd3V0EbMViH7Z2M=;
	b=2sXnbDrJbuelINwCdPM5E5IdRdA7M1w2Pa0Ltkm+VupzoGfcco1kZ4JV7ro9+5tIZ2gh
	 XA6SSsPu+O4dTqP3UAwmwj7lj8FwgpfuIlknzF5jSKAb6pWplhszjK3X8OjyBQMJdI/9o
	 ninuDaGhcin3yLccskl9iGmoz65ur0MvyoK3+2Lq1ZmGzFfHOViWK/s+zV+X2rJ4UPjy8
	 idGKLhWvEjm13dgRCMK/WC3UWfWgIlDpH3MzNogAhnN6Bp39pUchSll7FarNkpWd9r/M7
	 G1azFFEx5wVi9jkgjDN6EA0s86QeAFbfRUd4XefybMi9hOZlPUXC8yBMqujWIAdmGSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FhSimmKQ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506FC606A339
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 506FC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FhSimmKQ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso16475875e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795009911; x=1795614711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdYjun+ir64EdXqcZidFlUVCp8VDFd3V0EbMViH7Z2M=;
        b=FhSimmKQk+9xaAJLsGe6wweNZgJKEn20mxhnNmEZ2n1WzVfq6fxpNehYKmyXCMIQP+
         ISIXYUSMtttMUZhi16+tqYXiViPcMYK7L8UfPfbikWkPPiOvMC0BiMjCJPMmyxChAtQ4
         Zb9qbyVHeAaPiD1PjpPTB0J1sSuOzjg027w+KsIC2QPh6duB/VEBUxegSTPJXV0YFpBM
         jlK/RqpCt8h60BFHaaRtTmH3i54NNhPeBK39u4EJ9thKoAuRl//AYCm/JPGrD7F9b2/3
         t5Ne66aeFMDetOwiHzJzK8CBQIc14bj9fs7TWdOXrVvw90n+KY+SDA368Bv6lrahVQ2F
         /xDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009911; x=1795614711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdYjun+ir64EdXqcZidFlUVCp8VDFd3V0EbMViH7Z2M=;
        b=t59CL4ii5BV2kWjOHiAK8POpiYMnWCliDFdBcCQyfHs9r7RXiHTAHWrSb4gRKDfROX
         y2//05GJnsJxyURQ2WhMwCiij4aLAj8oMu1pzcoqf+RJUpUO6nRJ/Yv/RATT7C7fk3+h
         IkY7e81gPTYBbKGvyPepGBz3wg5U7CBaOQpFOx+pm5vtIeN2bgbVV7JRzKzmXIJ1UqYZ
         t7VS/iJKfvHjERpW6M3oU5/xhwZbZtx2NAW0Zgi0V2kv9OHCHnwxRFVaVfyYi4lc5z1q
         KyoONHYk5kQODDMjYe/pisE/Bmryk5W159ha/PfTRNXCKSt4MuwUGs74orsufdfIRaro
         CLlQ==
X-Forwarded-Encrypted: i=1; AL+hErFQMwbjvhN0LTxVBfR+MrWhH/o+7TxfZLkrosSWp3WkYoODhiC5N75O1Ik8qMtjlwE4LfQhrI+kBpzLrAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+btuCsioA6VGXVovva2N6bz3fviQlgBsYZQPhN1j4qsWfZ9oX9
	7G276X9qlTttQOPF7/KjDONaQvUAW8N+/GD86ez6zfHHiyD7OsNPOumUr7LC8cJuTNM=
X-Gm-Gg: AYBFou0FRhKkznPS5orZx6+HaGmhFbXh7uCG9sHtWRsXsmmo1rjrfkesM1OYMm5gRSQ
	QqKo94a+dD6AfUPPhXU5Jx5I0AKt3S6Ozvw8YsFvV9BvsgoQNsqsTWh/dxfBYXX13SV+KOj3wc4
	J1idjjDAK3DYzo62SGQ3ikBckLCOlB+fadng+LU3937cwBK0MeJhXHeBsr67AjUknud0fTHXkIR
	6UkTr8YYNlnxNRbLdsvQ+/e0ZX0hn0JV4hoj/b3izFQmAUiPVtZiD4B/Qd2EDXMJF8SeDqKhcoj
	xTrA6rE+7IiiOdfm3iFkG1NwiIXbA9sJ5oKfWQOA5UTuaYT6+N66ddK8pHP4veTd1D2cMOCXLxL
	RddZ69DV/9DEWDG+qamOFaRNatOk8VRWX+wBd/qpZEAy8Z46YNQ72XScvMEFey4pS+Di0y1nq2A
	IEv8JX0CtSlUAuqOA2R17AS96k123y3GtWXsXCo79Mu+ofgThTvm2Aka9sCTuWJEZh1ONhuQAlZ
	PYdHjJXyGCB1nDwvHLLlpsgaqNzeDMjWTRtBiwhd49LDkduTVfc27HdBoLrzrwXv+itbJH88zwR
	FnJszL+c6Jyp0NWlv2qVWtKNrE+m2SBGRv/NJENmm/v7Qv5b8XfXr1lknJOB1pUY15WQu0jyao9
	wHWEmVeTCmsMjTi3K3Z3+D/k=
X-Received: by 2002:a05:600d:82e8:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb7da18d83mr47018785e9.9.1795009910482;
        Wed, 18 Nov 2026 05:51:50 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:80a3:e955:3785:90b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm208544775e9.10.2026.11.18.05.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:51:50 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 18 Nov 2026 13:51:45 +0000
Subject: [PATCH v2 1/3] dt-bindings: thermal: gs101-tmu: add Exynos850
 compatible
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-acpm-tmu-e850-support-v2-1-19848c0d97e5@linaro.org>
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mateusz Majewski <m.majewski2@samsung.com>, 
 Thomas Turner <tturner@lineageos.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Document the `samsung,exynos850-tmu-top` compatible string for the
Exynos850 SoC.

Unlike the GS101, where the ACPM firmware handles most of the TMU
initialization and threshold configuration, the Exynos850 firmware
implements a significantly smaller subset of TMU IPC commands.
Consequently, the Application Processor requires broader direct
MMIO access to initialize the thermal unit, configure thresholds,
clear interrupts and collect calibration data.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/thermal/google,gs101-tmu-top.yaml     | 26 +++++++++++++++-------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
index 75560ebca48d..bea208cd4619 100644
--- a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
@@ -15,17 +15,27 @@ description:
   both direct register-level access and firmware-mediated management
   via the ACPM (Alive Clock and Power Manager) firmware.
 
-  On these platforms, the hardware is managed in a hybrid fashion. The
-  Application Processor (AP) maintains direct memory-mapped access
-  exclusively to the interrupt pending registers to identify thermal
-  events. All other functional aspects - including sensor
-  initialization, threshold configuration, and temperature acquisition
-  - are handled by the ACPM firmware. The AP coordinates these
-  operations through the ACPM IPC protocol.
+  On these platforms, the hardware is managed in a hybrid fashion, though
+  the distribution of responsibilities between the Application Processor
+  (AP) and the ACPM firmware varies by SoC.
+
+  On the GS101, the AP maintains direct memory-mapped access exclusively
+  to the interrupt pending registers to identify thermal events. All other
+  functional aspects - including sensor initialization, threshold
+  configuration, and temperature acquisition - are handled by the ACPM
+  firmware. The AP coordinates these operations through the ACPM IPC protocol.
+
+  On the Exynos850, the ACPM firmware implements a smaller subset of TMU IPC
+  commands (mainly temperature querying, basic TMU initialization, and power
+  state management). Consequently, the AP is responsible for register-level
+  access to initialize the thermal unit, configure thresholds and handle
+  interrupts via MMIO.
 
 properties:
   compatible:
-    const: google,gs101-tmu-top
+    enum:
+      - google,gs101-tmu-top
+      - samsung,exynos850-tmu-top
 
   reg:
     maxItems: 1

-- 
2.53.0

