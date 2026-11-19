Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081888;
	b=r0xlPm0DGXlg1i9mq6CaN1fycbTZ5RATD4pmt5xeVrfDZio/5DDwxvk5GOCyrECNMYbQ
	 TZcBr27Rg+4UcVbdygNz3/afnspjnqkyAPM5cz57kDNWkMzodF4IdlF9Rc+GaTI/3wS27
	 T0wbnxS+OzyBF8qdmOGWmizwDFoWoB4Ld5gy3+EyU3Ro3sSPRGVJAkEASSAR9I0y76W5X
	 wPwZ0IveakXskw2nUHQOqCnc6CnIKk35F+6yKxJzt20rDQGw2VwzKpVpUJC2QK3s5DJ9y
	 hEKYPRnat5qi0hPIoS3LAOkmS2aqTS+hvXjvuApzuwlp41Bx/fxJRmU5CUnb1RY7q6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QCtvpJJpK/tKPwcjLQpFBntT1fd2LvukVv7GFEkPKKk=;
	b=xQif5a5nMKGojO7YngOsDYqtGWqqLQyNUn5nQJKyHRvTQ9Jf6TDB2Eu7DRjSFvoKVCZb
	 B7fJ97D152GJ4oA8QmZLRA659ainu7JY3jevgmliKo/vXmMMEXj+C4hK05jav4BnoRp+T
	 y/JeDqeAhwf8iCul+C7y89Vr9sauUTcsE5LOVM0dFvfIjU+rkWuCPhaJb3x6o/Zlhxcjl
	 F0a9GvhKuBLbUCW0NoMXz5OlljxW9m19nxZrAFx9/9P170kG5W/k9jWdRePlykAdCaovu
	 tLUwxjQ51gPOZc4WPYiNai1tAshio7XJPyG9Y/AVaQ6zHWaYxJgiP1MFm/dv97vogDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=UjzmLULU;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16062606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16062606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=UjzmLULU
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4322d310e7so322108566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795081885; x=1795686685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCtvpJJpK/tKPwcjLQpFBntT1fd2LvukVv7GFEkPKKk=;
        b=UjzmLULUbPuX6Kv+v5NXSiVfqZ4enM39iH7s3fpgsoHsdvGqR6DqCDPTZ2Nk/BSSMs
         NrRUKiKOMKPN3Uo5TCQOpVmslWSouoldP79RLrlf8zrHLk3HTSzZxmYHYq5xyPIz0ARN
         rPlk+s5mhYW6hPr66VMoNsbqqi+5COb3G/Mk/qMS3xGutAMWrfMG84+yFWQZF1G2gBC6
         64NipMh6Uj2gRF/H5gOJNUdq+DIncBQFHb31m8XboR1BhOgxNAUD/ZG4O93VJI2ZD/5A
         YPOD3R59AsyJJckYJHzVb3YCnki9aQaMZ4px+K/iv6g1J29+L0CNgeNduum8NJitorBl
         IcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081885; x=1795686685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCtvpJJpK/tKPwcjLQpFBntT1fd2LvukVv7GFEkPKKk=;
        b=Kv83ioBcD5Z3sBpxJNI1MTfcvjIwMH0gLxrWTWUGc0sLRtcecaveOvwWCChwQLYlip
         /OzQ3E5aZ0AlKXwWJE9sd6WAYXVICgML8uYOV3GQL5VM+lnv7hfJO4U8iJvbi2p/y53e
         4UWHvlkA82gZguQ0YpssXFszEEPbq3U11RKv7WgRC0LXLXIu9TRg0qpl/x5HJZN0hOhP
         kzSjKD2tiCsML6mKHRNE+44KgX840NQgwDo0dAW+/pHJuVW3FscPzIR+LkuhnrE6Gpl+
         VhO/XlSX6NTc6sb5XzYOqaU2OPjeVnvzg3rd0KgnWozd6dPbuuEQ939m4ELEV6qY/6nl
         9BSg==
X-Forwarded-Encrypted: i=1; AL+hErHx+Cl6TkB4HcLcL+cTYG+3QkP/Nh3IES5Oby0GW5lGBx7rkuVvHlVM1vBgRQGAZhYeKcoYSyabzb4kvUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eSmY1fE3KvhzkbSSlJaolsIPZ7VGjlAIgaiQ8JpuSkc2s3Vfe
	HvMOATImvNk64CWbj7MmEuttCM3NthvTnz0NhZeesDVoh3hDeBLuAW1Nm4+EOQPUrSM=
X-Gm-Gg: AYBFou0ASqjEyRuA0JIcflAQWQiysMPUpuUgPpWbx60KPMmKzNhvJ5F6L3dJ2cbN2XD
	H8+7csu+KcnVKUxM8hILbjmKRI/sKKpDDzQZhZco8PA3Rb6FY2TRQROtIc/MZ+81fyydfqOKDbY
	dDfl3pDSTlFSGk89XOFBtGJ1bYe8vW7ykRJT/rQWKFwENR9OFlqaW05z6+svvp8wW81g+f0w+SC
	Ep7UmS0oT2CKC04qZQuJtBJR+EL7+KZBOYgNcXc6zJXBxDVL5IoVJchkk0ARujpGoavdmAbiygM
	CDMofqqLQl9qRI6JyP6ZCzS/7HqjN7ryoY1QDJDAdPCgBXYneG7IY2AKshv+EYTXGpIbYY3PokB
	qwuHKtnt24tii1HcdpfkeApLw8vfKrEzQB8Oe3y+/HqA1bIzvdt2gO0P8roFxZrqs+EytVSFmnZ
	WOGS3yrdq2H2S/insrOKNkvLvBC/DUE9kOmKPjb3+cXJ+I/GuBZ+Oh0xTHV0PVozbr2eL0ME0Ra
	mZ1pkZdidsjCRP0ldTG/pOI0f0Tdbmd6ewWNWxoGt0Eke6W/JpzyT+0il4B37aGOClbFzRITDQG
	CB2KYLubN2eAflsqMNuaqEM3l78ckJGGeITRGJMEq/cX3uL35pORpULpm6sfBYsTNkoQVCMVjto
	MkX3ZYW+8LbKB
X-Received: by 2002:a17:907:d7c9:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c510e58731cmr485530666b.48.1795081885550;
        Thu, 19 Nov 2026 01:51:25 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc213sm95057166b.12.2026.11.19.01.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:51:25 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 10:51:23 +0100
Subject: [PATCH v4 1/3] dt-bindings: media: i2c: dw9800: Redocument DW9800K
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
Message-Id: <20261119-b4-dw9800k_cleanup-v4-1-df26c431595e@fairphone.com>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
In-Reply-To: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795081884; l=4477;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=g/OiRwFsFfdmnWKD7IddFC6HC4DRBlfOM96+ymjJkqc=;
 b=+9IaxyEdEXtMhI8Q3RfHlupMQA+Qy0T5cjXDl1x0aooiVjh1QhbWPkDRwu49Vw30ieXUb25Nl
 SfvolKTIkzsCOUMlU/9CFGhBywusMmHFMFgObvIcA5prfDof5CtDFpS
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

The DW9800K's properties are too different to justify sharing the same
bindings file as the dw9719, Create a separate bindings documentation
for the Dongwoon Anatech DW9800K with its updated properties.

More specifically:

The DW9800K did not share the SAC1 and SAC6 modes
that the DW9719 used.

Description of vcm-prescale does not match the calculations labeled in
the DW9800K datasheet for how clock diving rate is computed.

New property timing-control introduced to offer more fine-tuned dividing
options available to the DW9800K.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  1 -
 .../bindings/media/i2c/dongwoon,dw9800k.yaml       | 91 ++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
index 8e8d62436e0d0c4f9af9e52262b23881abd37cec..38db0764c0f70ad49295dcddc182b7e100a68b29 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -21,7 +21,6 @@ properties:
       - dongwoon,dw9718s
       - dongwoon,dw9719
       - dongwoon,dw9761
-      - dongwoon,dw9800k
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..99f3b506cf12c63ddef1e3d18fd59179a5e7800c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9800k.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dongwoon Anatech DW9800K Bi-Direction Voice Coil Motor (Bi-VCM) Controller
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+  - Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+
+description:
+  The Dongwoon DW9800K is a single 10-bit digital-to-analog converter with
+  +-130 mA output current sink capability, designed for linear control of
+  bi-directional voice coil motors (Bi-VCM) in camera lenses. This chip
+  provides a Smart Actuator Control (SAC) mode intended for minimizing
+  mechanical vibration.
+
+properties:
+  compatible:
+    enum:
+      - dongwoon,dw9800k
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: VDD power supply, can range from 2.3V to 4.8V
+
+  dongwoon,sac-mode:
+    description: >
+      Slew Rate Control mode to use: direct, LSC (Linear Slope Control) or
+      SAC2-SAC5 (Smart Actuator Control).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # Direct mode
+      - 1 # LSC mode
+      - 2 # SAC2 mode (operation time# 0.48 x Tvib)
+      - 3 # SAC3 mode (operation time# 0.72 x Tvib)
+      - 4 # SAC4 mode (operation time# 1.20 x Tvib)
+      - 5 # SAC5 mode (operation time# 1.64 x Tvib)
+    default: 3
+
+  dongwoon,vcm-prescale:
+    description:
+      Indication of VCM internal clock dividing rate select, as one multiple
+      factor to calculate VCM ring periodic time Tvib.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 #  Dividing Rate -  2
+      - 1 #  Dividing Rate -  1
+      - 2 #  Dividing Rate -  1/2
+      - 3 #  Dividing Rate -  1/4
+      - 4 #  Dividing Rate -  8
+      - 5 #  Dividing Rate -  4
+    default: 1
+
+  dongwoon,timing-control:
+    description:
+      In LSC mode (252 + value * 4) * divider value in microseconds
+      In SAC mode (6.3 + value * 0.1) * divider value in milliseconds
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x00
+    maximum: 0x3f
+    default: 0x20
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        actuator@c {
+            compatible = "dongwoon,dw9800k";
+            reg = <0x0c>;
+
+            vdd-supply = <&pm8937_l17>;
+
+            dongwoon,sac-mode = <4>;
+            dongwoon,vcm-prescale = <0>;
+            dongwoon,timing-control = <16>;
+        };
+    };

-- 
2.43.0

