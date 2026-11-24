Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557108;
	b=geRHySvr50nhgpggvIn4xr6CppnkmUot2ETH9cl8xZoyxo621po83fvYI54M64e8Hnvk
	 ocIpea5uwFELu90SBtxypWOPKDw8t3vWB1aKxsTs44IRWM2TmsK/HwEX2FesCK01jMP62
	 sBkpzvM2btlYkFNZZBHKkp1j3+shpTosmGtgy4KeyX/6u+f+JEb2u8hHjdJrwmVQWevR7
	 u1mWiNOouSOjejnbNOZPzuNGjrkfl8Oz7FZNY+5vCMOm98s9en3zGAGsEE18bOQm7vHzS
	 8EWJq7kuoZNMHagZlLaeGw3tDt2obd7nWHMwMb9HQKYG4DTZJE3pXnRCF4VcM/bCOMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=;
	b=U42MAJnKiJ3X/TwN9Vko9iygpj40A5GztvzQ6xijm+XU/NXO/IEwDoiIDBaGrJeYhsXc
	 xlkh4NT4ySdQr5v7egp6lCjpbDRmugapNepvM5dmlNCNV3JWRe6mk2/ujiyX681QMAq7+
	 NUH/shp1oEURUhE4QcQR4VzJ16ZbmpaaQ/wHLo+htRc0YRDU+SwPLrIxM/c0ISxLOtVg6
	 T1MVXor0KGJ2sGUO/Mo9iTVPoBnqX1ztm5FD5XRl/KVANyyJ3sYJLo88lvb74nVFP0aQd
	 fTOTeHAm2gWJbyL20il/1wWtB0lf3cDzUeGS0lslAbrhCHrPhUiEDI4i85BNpP8lzww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXnDnFGO;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABAB606A686
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CABAB606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXnDnFGO
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so4385977f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557106; x=1796161906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=;
        b=AXnDnFGOBfQJb/4LS7OK+fGiXnmCp4COMdessyhleS1PvjJAfCVdKnNXxPDj1onRsM
         U1TjzEtBSkDNIJNqX5h9xLOHa0M9B+aZqkzO3uGlP789vCwldkYGSYjSA8R6JVIcqtaH
         0bqr06MnbbqGOb8gW7cq4f4VdqRiQDnq3RfZSjAWVT3SiwSJDFYh/JyODpglJDLo/bH6
         8nOSJZtc6tgjdoPIqrdJrrtjcCuJmgVZ7RH0iDVQDvziKrANGoqYAZhf4Oe+fJKa5NwI
         p5hzcB7bJZEIO52kP4OgEnppdA8XZy/AExuMSx4trEax/68pxeufD6qJFXgVdzqHCQOP
         VKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557106; x=1796161906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=;
        b=zM4FY/C4KbTd8Bh+7XMIKxk078Yu4JK8cX6+RHR0GgcUm2w0ftM6cCxWIkBrElB6mt
         3wu8p+0hsDPOgk300tQk7g34YpnHB+qPvbS3ytLz6GuhDTw+3sVLt0bSuKPwT/3XEM5q
         FXSbXdHAxWKnQ9DDPLn9y9Qo3syS8jHb7yKaNv2RjeT8zfX43pia0tKEHc0ZAthtd5Xc
         0ia2WWBwn2dVLkMG0UAAQ/KSdnd9ECwe9g7dT8lE5nvcfPjzXAso3HMr6XooFz+mdEHZ
         g4g/0UrEqMgHDB7o73QzEqeAO0or6P3kM89bqbqzRBPgP6HCLg6BTCc0uBiiGDMQ/Hqu
         WpFA==
X-Forwarded-Encrypted: i=1; AL+hErGpSq7I0elmmWnhICkh3UvSeSpW0+RClApGdqR3aWIpOBkFkkFdkJMAAB4rFg5OrILG07C/IIgMGV/5bNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vBsxzFkeh2CTm1Lv8RtLOuaNXWnl9JpvZEketRATGyCiu77IC
	VVNo1x1CXZX1C+gQNU4IM0/x2WfqAlPaB6+zw07zbmLQZiI13T8PkoTX
X-Gm-Gg: AZFdTZeVMuafnp1C/aeOS1TgPBmdk2PUtLjbHJnGSkW2i0cByrtZIyNBgyd6QncgNhE
	ffPtBINavnRAcFUACXH5bt+k8j13BelP0t/YC+UboJm7yvagZ+nNbNdThfhWasPyXfXUcEBHdZP
	FW8wbYwenlOKfFsjgeuH+/b50EKxSNG1Skp/DYrlS7IXVrcAaWF6VD3hFX4b8YGHvj1l13lQMQ0
	qafAZ6WJl4z9YFxAHlETIxH6/p/+INxY3iKRy6z6CDdHQyuTzP7h/W0eVEK9QFEak9onP2oh15p
	x6LDF88nwq90+27uE5s5p+Rijhx+FlKuFj3mvP+U0p7WNjHmD4mT7o4DktBIXlgLz6ZIiff8V26
	1UcYYlhEPpryayk/tq5lzAs9wLG/ZOxdFzJVSp4wwxDMuoumXGyx9ER+bWuf6bROf48QyCErygk
	+YrxzoDlffRnYfmCJb3bYuw+oTWF50mdm/+dCj0T3AJR7317zl418o2CgBOBUJULiM5gYd8B9ei
	2btyG0xmvIJf6zoxRFR5BSAXnTHjDDP445wDpJWi/e+htsyFBACogr7TwW1P0RaR6A49oOBL5bV
	Ry0Xhuq/J/yL0JwBniMw
X-Received: by 2002:a05:6000:4a14:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4abb71cbc15mr29539105f8f.32.1795557106230;
        Tue, 24 Nov 2026 13:51:46 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:45 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Tue, 24 Nov 2026 21:50:47 +0000
Message-ID: <20261124215048.42074-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-1-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com>
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

The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
implemented, and the driver no longer counts it. Go back to one
interrupt, and one debounce period, per implemented bank: 10 for both.

This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
increase IRQ banks number").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..c04b04acf6e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -36,7 +36,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 11
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -63,7 +63,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 11
+    maxItems: 10
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -133,8 +133,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 11
-          maxItems: 11
+          minItems: 10
+          maxItems: 10
 
   - if:
       properties:
-- 
2.52.1

