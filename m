Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775874;
	b=0XQQ17buO0t3mjXxTBX1vIQkiJWbQbvi0DQv14LJVK3Iwz5Td/i1NCvw8y8dhU15/+pf
	 6+p4kD+XwXYQUzPCVsl7Uh07+R7/5MAoVnKpH8S5RTOvBoqm2Qb+I6I52fvuS8+xA9FFm
	 Wys2ItblixZLsXjBFuVelNUmFrlaqQh+r9niylWS9SYp+bAJj6EOzRHazRyZOGJh18Qih
	 DZquLXt1FRw0uy5HomB8ZhD/UwHKoKGSrqf+RjUtCR+GBEKaOQb9iyO4AMWSek/zxV+SL
	 SS7uKNiZjteykJzHkIgpItkyiOUBr5hJWNdy+yc4BKULaWW8htgcsI87yLcNDNzc4Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dNdJC8F+FI98g8O8yjU0PBhO99fdyGD2hFZaDczCwSw=;
	b=dqRYYIxJlUuhp0n2uZwOmluj3hZIBw8QNNmYt/wGraSOK1RgfsCRmsEdOoD0Ph1Nvq0V
	 3zBfR8eXy3G04Z1/nDl77xcWMokrTNerkyJTd5PvNQH2cMwzDxDahwhpa8ywdieEAob4a
	 XzQNBrryjJGgwhxM52geJB57cac916xJPyVvCsS7yhbi8LirwCFYf7ZW9WYmmwVDaTrYW
	 Ojorng9QBWbUIzPUWoDzqgZcZkLZKCTgxfbMgOvARRBImGNUTv4RNRcoChGIWykMdfAeE
	 nd9KUCAAg9qvo2455ahoE78CWU4MvgOCBwlHhRjXUaTbxxXtpuCFEI5lvjvYNZnl7Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aHTEfb4Y;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F71A606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F71A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aHTEfb4Y
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso1446890266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795775872; x=1796380672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNdJC8F+FI98g8O8yjU0PBhO99fdyGD2hFZaDczCwSw=;
        b=aHTEfb4YhB9WEXhyAhI4pMoovwM+wPkcEwhfRz0N7Q0inmkoJHYqFFSrfahmXCbrTm
         jKA1aN/TvkN0kZf6D7xN0c8ZfTMd3lFDqYYJVgSJiOZN/osbyrJVETXNMZ6s5gAzL0xi
         wxZ9wSeDSL0TORHJ53N473h8h91m3ngiJfEXUIXb8k3L1vNX2jOcpiqU6WyOBR/qNcmd
         m+PdnyHpgOq9c5EAxUX2KW8CMkNWcEUct7L6+v6snz1rXfJwQ2NyzhUF+sdI6sx8Dbtd
         drmz9oKtZTrPgPYWQPOvexqaf/vkXLDLEhEreFRu2WvvIoTh1xKQtIs2I/zQiwI/2mtV
         xXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775872; x=1796380672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNdJC8F+FI98g8O8yjU0PBhO99fdyGD2hFZaDczCwSw=;
        b=EU0lflZ8kpXMbRsXUJGRh8aTVe/BcCorMkafRRmv+C1r8dqGf8CTc41fz0JdyLVKrC
         berEqU1nEWVSs7FLChL8EHO9uz7ArlkaLwnOXaGy+q3CwYz7/vVY1GNhe5hGF2VkE7nT
         /g/fr2ekEtl02nTbuLDjcjvhtgzGaPnGX3x7FhYb85Bl4uftN3LY00HXj+FYMbBizY2r
         oGn9ASwQvMzlDV79jtQ94aHuwAUAcRLIeSRqHPBPHJX28RT1uzoBNRi3r8j/ZS8/XE+k
         azZ7F/1fKwNwx8eWshHDJtpjdlep5npwaJcnGt5gCNiC9ha3nHv8OdfDF5WiBHvKmC/K
         p2mA==
X-Forwarded-Encrypted: i=1; AL+hErHEpUiMD2GAcGd5XBygSJESg9Y/UhoBtTbJhJFYjRnU6PkcVqSWXXjmhCIc42kCCv2pfxl3p+3Z8UK4NMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W/ghIRfjmoqBkzhkNzwwfbbQ18qhH31JehZa2/9y9dJLmeevp
	MpHZ+gnWbz9gIhu0QM3MMHnFOjeaelKrWNyQaT9c/R+Fidf57rKp/tjYtUaUZeCqLPk=
X-Gm-Gg: AZFdTZe31VOxyNrcEO6bJXU00e7V2JOQEeW3TvHUcmbg6jPnVZxe9hAeBEbMFEm0hUQ
	aBEHAyQFpkwDWHUahU9GV/YB37Keo634hNY3bEGGJFkuk4xbigsqEVnVxO6+C6IlmfCAEJvLlvN
	9eRtNTE4Ftc/7lZZqp/32qkTtDfeYds3eSuiW4+WjtIIeQVaryukKFMUqtT8L7JkUbjrlSMAmWP
	zw93ceJZC3gcrGf8Fcnip/cJTf1qpg3nLgZukqNfdsc642VvDkfgZj2lPS6TeE4GWzeDbTQOOlS
	p63kZZKjGeLXV5YThpSmLYqDTohrxhxzeMSXin9ZIQXV4sre8n5ZTFcN7vZM6jLG7kejkdx/qrY
	j7mm+g+vEylbe0RwQGgbehu74CK+OcKyibofooC77CNVxHYeFZ3rP/QGoS0OlTE6F3dVX0C8+Ip
	L6CJQ+UyTgipbj5jXGEMikUkfzWi1GtEhzwVOECbXO8iqOjOnR+6A1ryo+kheMavQ1yfdB1beU6
	Zq1E30zQxNLqhhluNYZi17q5amLEGCMJbZxIgoq57T+HxZQV0NB1hw4OOSUz5DDDNf0uajNAEqW
	x76TffRvkUVDxvXhfh02yLWIKBxzV9Lhkd1liYHIAw7hRJTWKELCDwRK0xK67YlhtM58OA==
X-Received: by 2002:a17:907:6d0b:b0:c41:1781:a2af with SMTP id a640c23a62f3a-c51317e3353mr2141842866b.9.1795775871729;
        Fri, 27 Nov 2026 02:37:51 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm37268558f8f.15.2026.11.27.02.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:37:51 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 27 Nov 2026 11:37:37 +0100
Subject: [PATCH v9 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
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
Message-Id: <20261127-axp318-regulator-v9-3-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3988; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=LBdBMXYah5b+O3yxBs9VZHzS2W2px3jjTuPIQfDgazg=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcsVWHGj+0rDxbI6v66P+Cg7NkLsvJ37oV+CC1v6Xxz
 pOrc7Z+6ShlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEvDcxMnz72vG9/WJDlE2+
 XXHWnIgJ0vtyy0x1Ip5aW/yJYuBTiGf4xcTLljotyK+GTYeL121OwduZa7Mkyo8mLm9Zu0vVW/8
 zNwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Andre Przywara <andre.przywara@arm.com>

The X-Powers AXP318W is a PMIC used on some newer Allwinner devices.
Among a large number of both DCDC and LDO regulators it features the usual
ADC/IRQ/power key parts.
Like other recent PMICs, it lacks the DC/DC converter PWM frequency control
register, that rate is fixed here (1.5MHz on DCDC1, 3 MHz on the others).

Add the new compatible string, and add that to the list of PMICs without
the PWM frequency property.
Also add more input supply properties, for the split DCDC and ALDO
supplies.
The PMIC features *two* switched outputs, hanging of DCDC1, and the
manual calls them swout1 and swout2, so follow suit here and add those
names to the pattern for matching the node names.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/mfd/x-powers,axp152.yaml   | 29 +++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 45f015d63df1..edca6b1e9f70 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -70,6 +70,7 @@ allOf:
               enum:
                 - x-powers,axp15060
                 - x-powers,axp305
+                - x-powers,axp318w
                 - x-powers,axp313a
                 - x-powers,axp323
 
@@ -83,6 +84,7 @@ allOf:
           contains:
             enum:
               - x-powers,axp313a
+              - x-powers,axp318w
               - x-powers,axp323
               - x-powers,axp15060
               - x-powers,axp717
@@ -102,6 +104,7 @@ properties:
           - x-powers,axp221
           - x-powers,axp223
           - x-powers,axp313a
+          - x-powers,axp318w
           - x-powers,axp323
           - x-powers,axp717
           - x-powers,axp803
@@ -156,10 +159,18 @@ properties:
     description: >
       DCDC1 power supply node, if present.
 
+  vin19-supply:
+    description: >
+      Combined DCDC1/DCDC9 power supply node, if present.
+
   vin2-supply:
     description: >
       DCDC2 power supply node, if present.
 
+  vin23-supply:
+    description: >
+      Combined DCDC2/DCDC3 power supply node, if present.
+
   vin3-supply:
     description: >
       DCDC3 power supply node, if present.
@@ -168,6 +179,10 @@ properties:
     description: >
       DCDC4 power supply node, if present.
 
+  vin45-supply:
+    description: >
+      Combined DCDC4/DCDC5 power supply node, if present.
+
   vin5-supply:
     description: >
       DCDC5 power supply node, if present.
@@ -176,6 +191,10 @@ properties:
     description: >
       DCDC6 power supply node, if present.
 
+  vin678-supply:
+    description: >
+      Combined DCDC6/DCDC7/DCDC8 power supply node, if present.
+
   vin7-supply:
     description: >
       DCDC7 power supply node, if present.
@@ -220,6 +239,14 @@ properties:
     description: >
       ALDO* power supply node, if present.
 
+  aldo156in-supply:
+    description: >
+      ALDO* power supply node, if present.
+
+  aldo234in-supply:
+    description: >
+      ALDO* power supply node, if present.
+
   bldoin-supply:
     description: >
       BLDO* power supply node, if present.
@@ -277,7 +304,7 @@ properties:
           Defines the work frequency of DC-DC in kHz.
 
     patternProperties:
-      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
+      "^(([a-f])?ldo[0-9]|dcdc[0-9a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-2]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
         $ref: /schemas/regulator/regulator.yaml#
         type: object
         unevaluatedProperties: false

-- 
2.53.0

