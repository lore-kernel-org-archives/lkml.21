Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795837347;
	b=hcyGFAwRlcKlELUdF5I/sGjEY0zvS8LjyUUf6jFRUhq64IRYAt2G92+MBudIZF3X8qDr
	 UN7oQN+fg0dxMFbzLXvhPLh/MqNUXLxtLWn4KHi39Os8t6tFMQ2crfyW/Eo4W2fU/hUbL
	 f4Wj3ZI+V3eAhXkPpTH/ekYIWvkuBa+eSQFbA8bnzbRvdyksE72VwJamjL0q+AV8/ZDaT
	 aniaoswzhnDCRPMNnOrHGYosm0QTc59osbHyhHfngF+jeWTRXueMRcOGg53UUu9KRJgMA
	 Fgr0JsXEP+UluJmKlDUEK4El1ixScKEtH3AXi4bFuMwHc+tO3w4V2VlsXdrXyemwjow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=izulAhXaz6dK/9l1wG0GpUrapqlxdbrdUeXDR45NNrQ=;
	b=UYNeBZWsluHL9I01q7U96KeVN/iyY71odO38KG4+iX/RmysQ4P65kTqU+sNm5/xcQyoF
	 pJb2jTooKxwa508qjiGLeJsWkBIzZPwIBvFdKp8yjna3VFO/I8KwjmH463K3ErZtx/eg+
	 hFcVxSXvFj1072uSfXXz/vk9xO9zZDRrML+1Zao/vM5t9MxgVYaPpGqm4yaxrSy7d6xNS
	 auI3WheJl1L/otA+EyiHTbPPjbnu79yFEyQNtCiby0+ys0Vyi8pjjhbYq3eKudYxIf9LM
	 8Q+U843zajudBEhScEOL/u+0TONcW1Yoxb9l3rppsQN52GQAk2nsx5bBLCF7MQ+mm9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJHiKG40;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4937606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4937606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJHiKG40
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so3932986b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795837346; x=1796442146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=izulAhXaz6dK/9l1wG0GpUrapqlxdbrdUeXDR45NNrQ=;
        b=UJHiKG40c2QFQmdXwj/soAVJm2bznwjHvg+7+xNL51lUnjoKJWEGoDD4JgIVxb9g1f
         lf5DXoRPNr9GY8zV3EkTkY4KqWR6iCgpP4GUrlMg9iDrfYVm5wPw+DgBiJj39t9+82OT
         fraC9ZBlwBIx4rbQKkQgEwHFhH3o5ICGzoXbqP9GN7fYJtZ8ZbA3m1zEq9n4JR0fYboA
         ORHjNjNj+erfStXrrmtYWHLZYAuOsFXFJEP3NdJTeQmthKo7XyZ3Pvy4OcehtcpqsQXZ
         2HT7WzHWDXxE+1OQCR5p/ULSHb/KmTbN/fsU/GqimbbaR4hz5eamTuH/SC5ANSvEWrNk
         n8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795837346; x=1796442146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izulAhXaz6dK/9l1wG0GpUrapqlxdbrdUeXDR45NNrQ=;
        b=kWOH/ITGA2NBeBWgvL1SpyDoAeCvRPlP1/ukZGp7a7mIDsG+dHiw87J1nG4CnimBXw
         fvEUnOZB/xiPLgr0biPzQDxU2/91fWPDrOqHpaQCDB8h7ZMyxiTpA/8rGAy2mauHHXbl
         frr9AROIfRKiAkA1NjNq3OMlSylrK8LLUfMCYxLAz55j8RQQRJW97/44+xEyB9FJVh4g
         PDAYgNe4sWtuY7YsIMAqyd/aL7CIRTEyL5bDXVg2mmt9pBsOQVi2mragrZQNd9ey83Cc
         nIbdzlohGpB3ksIMk4ukuoL1kkdXqiJmKv19gePSwUdpFMwvhwpffkpE/6zK2Ie006o6
         Pxcg==
X-Forwarded-Encrypted: i=1; AL+hErGWcVvp7MUcHx6+bLNu2ASeOSN6RMmGu/HU0JYvCPAolARRePYRkGOxi4c6//VHW98UsOyj3ks47SB7Bpg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mILSIuqQL4DyGBEBDMW/CtT7d3wdLXtIvrNcpcKZh+VXP0SBf
	Pcl48Sf8HsYEbWv6BIpfNImTsN11q0DsmKAWg3C7YoacclGBre1V0nTY
X-Gm-Gg: AZFdTZfTfSHj94jI0zY35T6i/ygjPZiuTmkuz2glWS62DL7USP1dow6FOa9KBhvza7c
	N85QA8dBkprE+n0NZp+ZmaGHWNL5XLrTRyXvHJdJo9Qj9yI7BT1/YeH6cKldKN4zc6mmORGc4rL
	rSXD/bdAePKV2+xu0Ru6vLEN2Z0Ilb9lq0nMXsmCPzDgCoA+OOVO1DVw/B9rL5a9xEcA/U66hRy
	/yP8hikpKsECSzmgyiyw4hHiBEnNVPlpJQ9xBChdoy5GlWUUore33cABtisYyfAFcXNEgk44NR+
	o3Cr4mAl6PWHAajGqF2ThQi9UaZDGxNUBpAAr0LxmIBvmD+UuxlYm95V3cdyMMw2hy9RA2SigWW
	W6Qcl7VYe7O0at+kSU4HiomDPPNFUkvzaaMfL4YKfi9wxP5FcRh/IfvDXrbf/aSD2jvab5HtjjD
	CGwKv1BqnBE9dc4GMjhWeYzvzQcLHkLt+zqqv0e7IV6/t+b9hfD0rlfRCcWpjQw9Uw52AjhRE87
	T2hb2zc/EwaZHHUkVhkUEnwOa802P2FgzEvjNdOHLqbdOYjueMNPtr4mJVBfFO48Fm7XZGVfJbA
	LPDxt8xbys4SCDqvRycpXx6uIGY=
X-Received: by 2002:a05:6a00:b86:b0:874:705d:f63d with SMTP id d2e1a72fcca58-8c87c38b5ccmr22393784b3a.31.1795837345926;
        Fri, 27 Nov 2026 19:42:25 -0800 (PST)
Received: from debian.. ([192.227.246.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm14130965b3a.36.2026.11.27.19.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:42:25 -0800 (PST)
From: Harry Bit <idleassetsd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harry Bit <idleassetsd@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: everest,es8316: add everest,es8336 compatible
Date: Sat, 28 Nov 2026 11:42:19 +0800
Message-ID: <20261128034219.746038-1-idleassetsd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Document the everest,es8336 compatible string (with everest,es8316 as
fallback) in the Everest ES8316 audio codec binding to match the
existing ESSX8336 support in the es8316 driver.

Signed-off-by: Harry Bit <idleassetsd@gmail.com>
---
 .../devicetree/bindings/sound/everest,es8316.yaml    | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
index 9060358a90..d0179476e9 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -45,10 +45,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - everest,es8311
-      - everest,es8316
-      - everest,es8323
+    oneOf:
+      - enum:
+          - everest,es8311
+          - everest,es8316
+          - everest,es8323
+      - items:
+          - const: everest,es8336
+          - const: everest,es8316
 
   reg:
     maxItems: 1
-- 
2.47.3

