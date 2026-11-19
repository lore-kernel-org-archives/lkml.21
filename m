Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096491;
	b=Pp7VeHDMbnQL4/dZtm9vUp69Q33yspgQDByXyq1auLWwBsFZu6cDrd+jgRTBxml9v2mC
	 6UZwHreOeAO1/NXC+yBMXzMUfEbAicNLdq+7IzDbQoPI6TTcenbE5x/SOHwZj8fONfQS7
	 Vn4BZbdMfuQ/vIUtFsPwfZa8pss5jiCoglRf5m48VW4r3pOUm733ln2xFFfEn5nCIAfPH
	 tv04UPk0lPJIIeeMBND795o7eIW2EC+vDQwBs6/YWcivS5jERyrfheENOB6j6Lh/J1ZY6
	 diDI8v2kBKS/adb56UCWQNmI3554GWbDGTLpOVq4sLM7mcikyCjYjR/FOZ2FDTkcL3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kcyC89VcgJaq9jLzeow2xIThvgwDvibG6R9ei49uqAE=;
	b=v9SL52ugyMaY0r9Fg41skLA/Xk6eerK4TYA0Fx+2LdXTcNfuVXqw9pb90uWlhTOS8bgc
	 3gabk/1kLDaU02cUPFZ7u8dxC9FgCBGKkp1gkgyY2n2c413sjThXZyV92Xg+V8JzmyNKa
	 XrdOM+475h55SJfOO0RtTkFJ9iCpZZeedv2nT41tZ6vNz7OHr+2HQeAeOJbY1VMgAksOo
	 ELpFMLrZcP4w0JwrTVnMpCbsf/ltu1/QV1QEZfm7e3Ak4LcusWOPfawnYII2QaFQ2P+Pc
	 Chwy0uf2xIZGptzVp8yVjrTskrm+mS0JQIj2oxd8nqxbEOVMOPq46sM/eESOClUSGqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=CzkbAfVf;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A011606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A011606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=CzkbAfVf
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4682977f9aso300568666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795096489; x=1795701289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcyC89VcgJaq9jLzeow2xIThvgwDvibG6R9ei49uqAE=;
        b=CzkbAfVfuTMH9DbWALI6+24aNSL410vewuZjg8g/iiflXbhSEOsVBZYEhDMPItk+cF
         m3qogGz44+uj4Xy3jSTD6cw8uBwULZd4ff/DR0Qq8erSuGAbphuU22CTgfppDb7poxMa
         kcZWvHoUCZwSeBoisZR8IiLmlrnlnaj22Q8uaLQl39qcOJS/DnsiqPlSUwG7O+g3MHTG
         jp5rmeHGevcqBDtP6/0teWStMtqH65EV4WAG8de2HgbHJfKYIwiOR3cLu+bF9byANmrm
         PbiZvMMBm9Z5DSfKlMCvzmKlN6DUZIUS0aJ3zrqKbe7G4NpPfW9cAVvuTmDZUwaT6GiW
         hGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096489; x=1795701289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcyC89VcgJaq9jLzeow2xIThvgwDvibG6R9ei49uqAE=;
        b=L5I8nIyr+HL6T0AIdMDcz48AY/LuXf5fYX6DfT3OttJH/5p31GD7JI6IxsK1MfGy3w
         ndCeaJt32SBqY/fN/TqWR71dGhhnvzZNkKM+4IGPNbyv9SKHeFU/I+dwWqmQZUX07MtG
         i254PUgQ/HLK6GVFzwTAKND20PqWAM0kKVb3CFbPoLba8AuaCjch8mjPynilVw8JDUiI
         cnAzGGz8BBNlzfo9GnwikIhGgEtDmzuVz0eSusjFc51L4g5qJBYTanKbnssfh4/41o3j
         Z1IdyjutHqEya0rzO6jgymO3LhcwAfAIrtsBaa8o1kOrg1WV3QrAOCJeRJ/jtWDx1ykZ
         iXgw==
X-Forwarded-Encrypted: i=1; AL+hErEqEjEMibe1EuN2qWKr8kRgUZIhGPzgORXv0zyDl02vAsGPkvY/XH5RgFZTUzJpeK+mxkquPEQ7oxR458g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8uFKDYBAKjb0qUYkPU1/Zdm2BNumDQ2Kck5pJGVoyGXwZnCaa
	C3DFWGR78hENugcxtZvY6p+8z7dUCp+7Yo41vOa1yd2EKH3hyPvfRk/DN3X+BT8Gd68=
X-Gm-Gg: AYBFou2Ff2eJCWL3W67zrc4FB9UAIFkGoS6/6Nmy/nC4oFIgTRaKmt4Um0hNHSSeiQ1
	BSPipz8mKd3e4cTtY6Dcwlcpg+tXKANeYt4/md4YhtdQRwDcZzfqgRUwInkw6EecsgHODwEsHsP
	bpplpEXq4b9ZxCuN9HyDlVuRcgJMxvLfUCvFVZojl7+rHBH9dMqmYSdsvYlNSF3422hH65qIh3G
	9H2oPE+v2kclNWLK6WbKdL0kXMpn1n5snBcPeLRlX+CgACroU7dAves9zeOXWTTHQxWuqtc1gU/
	WJpI/3t3chZWErLQf+U3yWim0cGNe0ZTpFYt+KbpUABV5cH6QKZT6BdwpO3vsYb8s+/tw5d//+N
	a2nwOm0NDiRzoe7pu1F8kufyelvanwAbovzSMWL15CFFWqStaVQJLPK3N8vp3VeqOiPC/NaxZJF
	zSufMfQmhMnkON2nTr7sP/iusKyoDnjojhruFvNOmtv/f2cqKmMtIQA0DFIDhbFZk0Rj+GAEYnq
	tQWgbuvW3RfMVnRaWzAjAZHCCQZkjl6FnCO8NG+owchMgjBFXtzrDMj1dCe/s4qJ8OespW7jpPt
	tK9LolpXw5CHKwcDJt1Emii5we0pZQBENGWl/Qw3NXl6wrVKilgkYlImm13Of0T38s3vjKeQEU4
	/zUzIx0qtKPI=
X-Received: by 2002:a17:907:7ba8:b0:c51:638:7838 with SMTP id a640c23a62f3a-c510e4c7dd1mr563619266b.33.1795096489051;
        Thu, 19 Nov 2026 05:54:49 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4d02sm106820266b.21.2026.11.19.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:54:48 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 14:54:45 +0100
Subject: [PATCH v4 1/4] dt-bindings: input: Add compatibility for Awinic
 AW8695
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
Message-Id: <20261119-aw8695_haptic_fp4_driver-v4-1-9d107334bdb2@fairphone.com>
References: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
In-Reply-To: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795096488; l=1122;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=GrcvT5TdUs1hjWk2qQFIg31PeZXjjwY6F+gMZ6FifVI=;
 b=9iEGoh/iygzIfheMi0lAKt+cW6CY3GzwX02Jl0W5iSz4VROo5+c+FVG8va0LjQyfCO9k2Un/w
 1U9q7pnUdn2Ba8uA+xMr5SfcxXZ/wZoV0chaBuxb1PqjQEMKMTECuml
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the AW8695 haptic driver to the binding documentation for the
AW86927 and AW86938, as this binding needs the same properties.

They are not compatible though, because the chip identification works
differently compared to the 86927/86938

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/awinic,aw86927.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
index bd74b81488f61d72b675b5701b321b30b3430be0..58908ac4ca7964f63e392050aff5e15e836983f5 100644
--- a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -12,7 +12,9 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - const: awinic,aw86927
+      - enum:
+          - awinic,aw8695
+          - awinic,aw86927
       - items:
           - enum:
               - awinic,aw86938

-- 
2.43.0

