Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649522;
	b=oJv3lDwlSulcsJohKfLuH3GdSY29V+lMlOpqqiys83YBmvj/J6VGf9YkI0CVi0KTcZEL
	 5KkZCUStqzTp7mrHSPO0gkyx/JhnvVkivQ8fk1W7I+3w7lBJ/xLUICsfz+q+AuoKK811V
	 XYUsPj6MJt9UhjLwCJjR9MsjpphJ13AfEclfJDlbOlwr+J7qfB1QPylmQm9Wm1041R7lT
	 fSivAayK5zLHI1OHytEeL9ZNVBoZyngQ1UNTxi6pUGw3wY6yu9fcJOUFpKRGBzZ9mhMoK
	 XGKOVoHkL/+knOufJlu++Aq1cyEufS286bZ7ZF+qwMNLXjm0jG1yhJrsX6nk/YMH9Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Gv33X/GQQiaxvlqfntYXWiFthGTmVov+9S67EUxnpPc=;
	b=Zbm2odKsHxbjumC8qo8+KOdZ54AwyXtCDUiBUsAVaGAZXcmDZ8VYk8hK+fVOb0S4sygm
	 7ftWJLcuAPdcCHp/6Ul/idITxGcZjtlDR0qnBg3Fc1Jjo2XyE4FchsDjyRFvW0iJMPoDv
	 nHCtoLOgcUv4t1lHrvYhHr1SwYQfGeiJ3vGehYqL6V5Of8XRcEP235elvHq0SoNDqOOoA
	 N2zqx09uOEZNu+yMVvq9K/s7MHechGFnutvrLJ5/UfOwM6X1a+SgOzuEdNbEL/woPsVoP
	 nsgcjkmd+0aEyNsx81vPqsCT64/iYIg9J8CIq9QKgweI0ljTQsQcFxKZ2vWJvV2WUOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJpDOTpg;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E99606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72E99606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJpDOTpg
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso5631318f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649521; x=1796254321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gv33X/GQQiaxvlqfntYXWiFthGTmVov+9S67EUxnpPc=;
        b=EJpDOTpg6Ba40JeiYt1NMv/2u1fweVsOcZJXt0/CUm7jpnOrrlMPG6acC30+UHtg5p
         /LZjCvhXfXbFfsza58/dUVwkPBEtVR8mGrErAO+xHmp3gDaw4r7Bpl28uOZfwPnLvV6K
         w06hkkhssrVCXsdv6D3GvpwWH61PqPii4fDrBQTKXRcbao2LlUaP2sFfA+oR/WTgDH35
         gc0aQt/fxSS6TNEP0BKxOyFsj376FmqKKCh6XXYs8QbUP3ZP90Izouha6IQpHNj4JiQF
         lp77EkjSt+8fbDsOoYiCaFoznJKV/ZADU3F84iPN3he0HBQVaSpHMecwnA2z4BKiv95F
         BO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649521; x=1796254321;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gv33X/GQQiaxvlqfntYXWiFthGTmVov+9S67EUxnpPc=;
        b=cr2euGRXfLfwL5TppHIVmGpRv+GHAcbSDX+EyDQhkSYt2V4Rs8kdAICXD7nR7lnHZT
         PZHNUuvudEufTiTaXBhXcdhmhDqgYNUAaNJR/+wTxL9SFBoscal4aLTOYGqzfarK6Bdc
         3JOx/5V2tS63Jo7pYzJFc/utSH39jO3sdyuUNYra4Ba5/sCcAJQ0NmJTFTuWh+5EjjeP
         mHYrmZ8ml/cdb4yF4q0DYtpKzWZbJJvE6uALkcEz5bsHzD8OGyHYdHqu2CwDBBY4wh7j
         TDY1DMwduH0Alhb1rxXW/o7N5hpL5wr7swOLZqsbT2K5g8/afL54PMD/fBKhq9B34YU3
         4KPg==
X-Forwarded-Encrypted: i=1; AL+hErHpdax3mKes7xSTu3I1eHUSA+Z6csezkOyFTaz7nZgkcW/Y5ARM/PMdfZPLE5c7ssjTJPDE6+Gnz8GnybY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3F1KUTRMd+lRteka8t+1JEwphYpinQId6ASjCvYKJH09jT1wJ
	yKyPh7zamwwO9bKpz4vB228laaFdn5flU3xOn2eIeR4mzWNm8aSxP2Ap
X-Gm-Gg: AZFdTZd4bRLcMq9pBYy2n8/gbsEnkLqCa8AhTbQ5C/jeuR1o+LcyXySpMRlYrbKT8St
	EW8NctRghrI4ZLOaHMVj+jQcAV5wq+7w8Gig7iVtf6qRTsONqCEOEIV35niwn6ahvxqPzaAAowJ
	SkO4XzDj6o/6kTC/gSOOQQb9sazHi+go7Tb2NFUq02sPXINYoAu/mFI9+xhqR4QaVSF5zK1HAWK
	bMM9D+HHc0mTpsw9snVwZOm97WMBGs1CDmqE5pRmXJobA+9aN760+FB8Lzqy3MqNC8Gsg4yoPe9
	7OkrFkLfARSGtYkt4vqT3q6XZPOHXslrEVhB1ypmTh4by8FLIfRnZ+AFbMN1Ayc2P6KnsAhb8q/
	1fDl3qVOv6Vnvv1v+kATpf0gFwROuEtldaFxfWJ+HRQIEbG8jT1Te62tq7AIQX4/Fj1pX77DKL9
	8v4/R3628KbHpJzlqR/aBmZLHBjZyefGV/fl195pC6azL+VgLm/PpIUydpdttYitPcMl4mAI7tY
	P5XrgcCe0Mdln1RAZa2yOpMwsMz3JqAaQ0KtEfCFh35VXn7IFej8id/tQn7MI2Y0WEgiyZ7Si3/
	Fe9MrdObLyI6uV7vfDaXNqzAKH8BDjnWYbc//v8kjRhaAjHtOdx4bk1t0XHcagkiIH5Q5T0pORa
	o0f7pkYmNDZsox4+PxCymt9duoSzkZes=
X-Received: by 2002:a05:6000:184b:b0:48e:5cd4:aa60 with SMTP id ffacd0b85a97d-4abb42e9099mr37347042f8f.42.1795649520809;
        Wed, 25 Nov 2026 15:32:00 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm36903059f8f.5.2026.11.25.15.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:32:00 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 17/19] dt-bindings: riscv: cpus: Document Espressif ESP32-P4 HP harts
Date: Wed, 25 Nov 2026 23:30:18 +0000
Message-ID: <20261125233020.1380594-18-vitorhg20080@gmail.com>
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

Add esp,esp32p4-hp as a compatible for the ESP32-P4 high-performance
harts, with riscv as the fallback.

These harts receive interrupts through the memory-mapped CLIC, which
has its own binding and node. Disallow the CSR-based interrupt
controller child for ESP32-P4 HP harts and keep requiring it for
other RISC-V CPUs.

AI assisted with writing and validating the schema change.

Link: https://documentation.espressif.com/esp32-p4_technical_reference_manual_en.pdf
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 .../devicetree/bindings/riscv/cpus.yaml         | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..17fef52aede1 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -38,6 +38,19 @@ allOf:
     then:
       properties:
         thead,vlenb: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: esp,esp32p4-hp
+      required:
+        - compatible
+    then:
+      properties:
+        interrupt-controller: false
+    else:
+      required:
+        - interrupt-controller
 
 properties:
   compatible:
@@ -48,6 +61,7 @@ properties:
               - amd,mbv64
               - andestech,ax45mp
               - canaan,k210
+              - esp,esp32p4-hp
               - nuclei,ux900
               - sifive,bullet0
               - sifive,e5
@@ -154,9 +168,6 @@ dependencies:
   riscv,isa-base: ["riscv,isa-extensions"]
   riscv,isa-extensions: ["riscv,isa-base"]
 
-required:
-  - interrupt-controller
-
 unevaluatedProperties: false
 
 examples:
-- 
2.56.1

