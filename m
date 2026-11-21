Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279778;
	b=wchmq/3YV1U1i4Kt3T6AAZJCM3KAlMIZkAJN9nrepN6qU5Tj4Yr7GOxNU86+4jj8hZNG
	 ITPzRnH4yDsdChojHH+hEJ+bdf+nNotjKtvpvPp7aZ2dwEgm0CrNxlfoQtf8yVsgrrl6h
	 2MrvxZYR48Wa6eOs2EvrtpBW4ijN7V1ExLhkW7UzRAjLDo0DOuS/eAPMSvPV14lnQWU7A
	 mHQCuImHm3kS7u4SPNtFHngjO3uQ05hYCnalzuTiM2KSkPkVsSxWzge0Wb+ncAv2CQUAr
	 inLOuA+VGSexT295hm4cY0/oGlEeREmK9nx7GDgXKp8fX55QSWVj+B9Ox/0rWgwMWfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ugnNXXIsy9Uor/V8luuCj9VNvTB9GFq713zvZphiVc8=;
	b=tE5GpnG9cArFJWEJ+iITMPSW5vkFqEvKH/rghag5yrQORcF1rdMyt9HJ+7Rdc94QHPx4
	 5fn4mTzel0HtAaisv16bZqDwWwTvEKZo+NnV6TAmtDA9nYGoQDRkYcfg+/5unAjYTPZkx
	 Bv6kh4I2co6T9ts9RdIHt4wF/yie01YGy9LAGpcOYt16/9e9rOSLfwm7ZtoOEwMk7oMCO
	 CMucDQaykJcYD+YbyB3vJDsF7Q2Djo+DzO9WsNj+a0ApE+lOXlXZOuiufC8cRfYeZXEfg
	 y8YciZp4bEMBtxzCpxFjs2nFgcC3QUyM3KNonRhvuMvFarjgWhIwlgc8ZEkitDZCe2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1NccJw0;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F43606A68E
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F43606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1NccJw0
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso22097835e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279776; x=1795884576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugnNXXIsy9Uor/V8luuCj9VNvTB9GFq713zvZphiVc8=;
        b=S1NccJw0Ms+NHuzySD+H8dg4z2d7XLQp651/mphadfSwCAJxOZksz4J6/G7lFu4C83
         wgvpoYo8mezwD2HykkrtAatmVDpTlUPXyfM1Yk47PAkddq4KmODejoLVmjmCXBghfPcz
         G7pJ2/mggW/ix9QBknkTXUrLaGIYZLl/RPYuF+Y/e/rpjiiTKMMkAQRBWKKGcm9vw7of
         IGzhEjSSAM/t8gK86Bjv4faIaACHEsW9crqzr5bYd7Osv/lYXikDK0+kwJ1gZrJMCLWm
         4mkUzKSqchtA5U96FxEN+CPjRFoJOlv6McHzoNFHIx6SWGeuYuE0DygUOYEwmwMAKTwH
         LY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279776; x=1795884576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugnNXXIsy9Uor/V8luuCj9VNvTB9GFq713zvZphiVc8=;
        b=vJ5PmioFB/cjKuk9EWk9Ke11cZkV9OjrdK7iuodfmQ5opDz2wyefSyqA6FnmdP3UYG
         Y8RVyFLNKNUQWFkqhbChUr7DZ0HqnKChatFCuMlH7RL2bs8VP6rHGm1MJ3YAoxA4AJjQ
         cdv2YJJfIkdkQIce5XMuO5I8Jm9gYVzhn+ywniBQWYvsun1OmPJMr9uDIIK42fYcwLMb
         5HzCSnX3oKISj9TbpXIwbZkZxPMP/JNFQ5Alb8lHaIRuehlxpsFsFEonpdm912P0xtX2
         +CwcWdwO5RqhUwU6sBqKdGgR8yxqzIpUp6BpUyTTTVWwtk4HAY2JCCQh3jTpmsbnqt66
         TS6g==
X-Forwarded-Encrypted: i=1; AL+hErFi+qN3lM5U4RgFhmovNmiCjTVxlUTYIq2qU0A/a9WiOH8rGVwNhV0S/cjCD/YPhkkAEovZdkbhk1uNQO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DV7lDXXkhZEx41tqgrojM0jj8PQMqIIeljeSXEah4zdfFEfG7
	B56AnleHrE2ZJ0rwjw7Q3HGCZFC/CKZRJEoVv97TACDA2ozcUOAE7ROZ
X-Gm-Gg: AZFdTZcDmndeBzxQ4oi7Deecmq7LE283xhSJ6wERYxw5RfrcQPPudhVwp2AKmjjon7O
	8rZH1QNdqs63GMjOq2T8Z+e/uZxVrCK7cxevYu+C7px14CrPI5ylXIV3Fj59iyusNVLJJSzX+Pg
	tvx1AX7pnUk0Y4n6FuYkkUzU930vH9peOSUuj91yeM3aSxXlrb0mkgFNC7IiSfFnkWoyRKnofuN
	yJ3h23KtdNPLyQuKeLNTAC5YwzsNgs6Opmrp8zxeQGxgch3Wm4isEpHF+Pg2gOAo+927mwe9/SR
	2wRAWYebUdQKqffZ7IovS9VlyKqUBZIOberXquQq6JQNYkA1M6fEYELZfKJqvHPVQYsQXDuJJDP
	e3DvK1xFPcj2SBFjxIky1XVXmNC0YsAOMxkUdxkRhqIVPJtTCUhPyjdI3UivSW+j5SvSRoQqobF
	TDtD3n893z+0DqCSIHWShL+jvw7jLmDFHsfHVuHzKKluHqtRJfsmn8PAsmrR6SPNxvfdc0ViLZY
	V8OlMlZ59xLXzzppJGd2UZyAHy9hVxyfooijhWV4Y4M+AAqpKLWUFejaw8iN184r0yvGeOlEExf
	kwSrjyaQWEvpxDFAwfRBh8q12zluYIc=
X-Received: by 2002:a05:600c:820c:b0:4bb:6f6a:1976 with SMTP id 5b1f17b1804b1-4bb887c2923mr139557955e9.2.1795279775875;
        Sat, 21 Nov 2026 08:49:35 -0800 (PST)
Received: from unknown.local ([2a02:b027:11:696f:25b0:e663:79f5:e891])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm9761749f8f.35.2026.11.21.08.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:49:35 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Sat, 21 Nov 2026 17:49:05 +0100
Subject: [PATCH] dt-bindings: media: i2c: dongwoon,dw9768: add DW9763
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
Message-Id: <20261121-dw9763-v1-1-f215290602f0@gmail.com>
References: <20261121-dw9763-v1-0-f215290602f0@gmail.com>
In-Reply-To: <20261121-dw9763-v1-0-f215290602f0@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795279770; l=1908;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=qLwwZ3rP/fjc2JAHuzzvcKw4S3Ep+DNYoDcVGI1KFc8=;
 b=FXcyCoVTdSrnvMx/FpFgdpHcR6SnrRAqBrBe9xrqyPsXhxCW27B742B0YYg0QtpySDp8a7kv9
 f7/o4C3koqzC44B2qlmfzILBcVcnnUlw6PFbYxtNUCsJZL6+gjJSXlJ
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

The Dongwoon DW9763 is a 10-bit VCM driver with 8 KiB of embedded
eFlash. No public register map exists, but the Rockchip and MediaTek
vendor drivers program it exactly like the DW9768: control at 0x02,
10-bit DAC at 0x03/0x04, status at 0x05, mode/prescaler at 0x06 and
resonance timing at 0x07. The chip ID reads 0xf9 and DAC writes read
back as expected.

The only register-level difference is the naming of the 0x06[7:5]
mode field: the DW9763 calls the values SAC1/2/2.5/3/4 (0/1/2/3/5),
the DW9768 AAC2/3/4/8 (1/2/3/5). The encodings match, so the existing
dongwoon,aac-mode and dongwoon,aac-timing properties apply unchanged.
The dw9768 driver's settle-delay estimate assumes the AAC4 multiplier
for mode 3, which may be slightly off for SAC3; this only affects the
wait after a move, not the lens position. The eFlash is not covered by
this binding.

Document dongwoon,dw9763 with dongwoon,dw9768 as fallback. No driver
change is needed.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 .../devicetree/bindings/media/i2c/dongwoon,dw9768.yaml         | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
index a0855d3b7..386352f62 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
@@ -20,9 +20,13 @@ description: |-
 
 properties:
   compatible:
-    enum:
-      - dongwoon,dw9768 # for DW9768 VCM
-      - giantec,gt9769  # for GT9769 VCM
+    oneOf:
+      - enum:
+          - dongwoon,dw9768 # for DW9768 VCM
+          - giantec,gt9769  # for GT9769 VCM
+      - items:
+          - const: dongwoon,dw9763
+          - const: dongwoon,dw9768
 
   reg:
     maxItems: 1

-- 
2.56.1

