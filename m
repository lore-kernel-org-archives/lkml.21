Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296668;
	b=w1oTAcvaXVF2llUym7lcYXsGCBZ3f/9x4Yi0bwZNfQXumzVPvxhRvaKpAFXxvobHbcCu
	 PvCOMfbJx7Eam5G/iiMQ1SpmRxmDky0/788dBhPFw+B6HPMDs7jf0E07YQ55MplLve9Fx
	 2WcmHVLAHspBoKncjoulIAoWUrtsazA2ZSyKS2zgvX3cHMUHCtR1FQMSKfq/BZq+QTKFn
	 szRhSPOK9dcSF3pn9tv/LLcqI/9v3j9VvNdo/CuvK+seYysIDEGFFgbQkQMrcF/ZJR8Ge
	 Tftn3D3trC9F41qkhkgvRm0GRa/XdXl8l9ysciART/dPUzDItu+e0s5T20gBOjaZ7OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296668;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=trAC4qto0VZq/PZpAdFLASz8SKgjV3D5l88kUo4+5Bk=;
	b=beo6BPSJ8CnJvF3VBh/68SYs+IxnOqt0QN5wqotCyP9NxF0FJDFkhr7f9zyRlkrf8yP6
	 RA4qFTCG8+84ab/g+24ZNH6UnuQHdQonYCLbsmj2+8l20dtds34g4rjRFo8ABxjSg/+X1
	 BNk4ZozL2ttlGtM1Bp74dOptnH3eK/q5pthTiY0reqyziqWZ47yxhv4Nnu380+8yD4S/6
	 iiDDUDQ7Yp/oF2OcDtgeZhsS++1dBcvS7MIPKFJWTzoA9sAiQViy+r2xqOEJ9SWnmY+8q
	 kJ/butTlRMu5OZbzbIKUtraZjC/1k1YCxFsOIdavCPnt1zVFee04qwMhnoMcQdjT+Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB1C606A685
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB1C606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so1908649f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296667; x=1795901467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=trAC4qto0VZq/PZpAdFLASz8SKgjV3D5l88kUo4+5Bk=;
        b=OABQe7MGOB73IrZqF8Rf90iU1QjaWPRuvNGBq5TocSuUbb2DYtBpap9r9Bctf2Ults
         Y8C4QPTn9eSmE6Bwa+ckq9Zym7nnGHIA5i8zOlWVSoJJKr9dV2IUAD1GcI7L/4dA+RmQ
         rKNpdMDVBdKAn/CLCRcx/FwkBYggBQ5P2Nubrg1T2QRuQeMOW2ePJluKBQ7e2v3W8s15
         YlbselfDmP7L4+4It1Rt6UbHMjEA97/b72tULEmFuf0+FDFy5xMtXKb2IQv5hg0EB16l
         2q4h0r/d+cWE+sXewd7G+WskvlDUfl6D7a/zoOB6ujK+NSRdE2EyS8Se8ldUEeDBMcJQ
         1rvQ==
X-Forwarded-Encrypted: i=1; AL+hErHWjiOCTbjcZafWof/xKJfcCaxHA5pbkj3idU+rCL3an1HCOoVJRvdGURIZo399ILe/CQN4iEmYDOL6aT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HFSS6P7ej6sRv1h1JP7S/ER4zXlEzTmBSGQRm5edquLUJOUQG
	zfJWdJY8dnAaEXpovYbdDGbf/X2sDhI5oRRjSuRzbvT9KyjC/dbhfgcBojeVDfed
X-Gm-Gg: AZFdTZfMqeYqxJAVuCQsckz8/PvAwERWYPatakdYpOPOu7dPSSHlfgdutXvwtP/RXmK
	8bTEUfajorCyUyzytDabOxULVA+CG7/Ntn2Cd3cdcL8roQkpeocK0fWwh0yjatobaBJOgCp0UU8
	sq6a1LFTMtWe2tiBKE6OBfJ4QeL83v/jBcV1s9GbxkPNS657lCZXOJzqudAT7fA9qo5ONjx/tDz
	yyfOCEq10hSelvIkFWIDOl+zX0VQ0JPaUfNPeDFGPeuchcgo8yDXRpJX87lYvvscE/k5OCHevX3
	YvNXnWMEYSXKON0BX2sE1nRx7nyfYZGMjG5BrBnLMRKPC1UbTAWOITH5hEa7+lZEBBk7wd2A5L8
	CUyNQE2uyxLYjAnAkKyhGyOw5+tG2RzTowO10Kw7baFFhFsmCkanQhXelKv54yirhwZXXZ1b+IB
	sWZzuGqRb9b6mTt4hwAhieYT2LzPuWpbYKrx7pVK3n1UnDdr9bOf4r7XYcz1wXNMFHCq6kT6hGp
	i0kbWhmVIzxBMcg0qbv/tATqWKh9ISmAe1CJMtvKdfXz689gW/coPZh7nH28OBUpGLoEVP4Pfir
	pRY/BBr+u3y0QTUJwqcTzZhj1wdDdVg4OGyw8aMX/aOexz+cSj8ipnwfdk6cuPtCwBYULvudoFo
	knSw2AJuxfyA5VYcFrAyp2L4=
X-Received: by 2002:a05:6000:1847:b0:4ad:d65:ab13 with SMTP id ffacd0b85a97d-4ad0d65aed2mr11591573f8f.51.1795296666841;
        Sat, 21 Nov 2026 13:31:06 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:05 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the T7 compatible
Date: Sat, 21 Nov 2026 21:30:59 +0000
Message-ID: <20261121213102.143130-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
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

The T7 has the same management bus multiplexer as the G12A, in front
of the same on-chip 100M PHY, and the G12A driver runs it unchanged.
But a device tree that names only the G12A string leaves no way to
tell the two apart later: if a difference between the two blocks
turns up, every T7 board would have to change its compatible to get
the fix.

Give the T7 a compatible of its own with the G12A one as fallback, so
the existing driver keeps binding and a T7-specific match can be added
without touching the boards.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
index ec5c038ce6a0..ad95562d1f3b 100644
--- a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
@@ -19,7 +19,11 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,g12a-mdio-mux
+    oneOf:
+      - const: amlogic,g12a-mdio-mux
+      - items:
+          - const: amlogic,t7-mdio-mux
+          - const: amlogic,g12a-mdio-mux
 
   reg:
     maxItems: 1
-- 
2.56.1

