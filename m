Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111760;
	b=WUl12wvIPnRUP+h/Z7gEFKNX9z4Gv0SsOXXGiDQuGLeRUI1fxYIUyTHku8njZOeDk3tT
	 qKzc5sii247nt8bT5PRM/XkM+oQA7Dtkn9xTekcTPa6FUUBrcRjtLUsqYOEBxdX3vn9tq
	 iqbGLxbfrj8geC+eqALhJmculslKmxkJo9vAO3W8PEWjWs3n6GSPGs+gXO0RL7J322Qek
	 s20c01482txfaL+S0Vr4dDMWFz941mBxDbD7JD4bLAglaHELtd6WJin94bv+/wYAGNa5X
	 PyQLIx3lecH1K1CKAOoUWY2+yFogdO5UDHsaQpT7VftcHBcHBPVDU7WfWdscnpXHJMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fOVBVa60ho+IN7XJrgnUZTlBuh8nHgelO4SekyzIQAk=;
	b=Er/+aRnCv1FIEwl45z9HfkdSyrJhRxYqN/J+wSQKKR+9K4NuCGyAIKsLsyzEozpzDlhi
	 nv1CJrhlJEqOPWw2kvwojg6kpe3fsOBe0a3zxFIOPY3GxrPQc67ITSi1sP71TbPbgp4Xp
	 r3jcRbc8Lv12Ula5FOejvsavM60FsLEr88zK6+IEQe7J8AqGLL7XZfMd5OWVF8PWWPat2
	 FOuKEBfrAHDEE7QEuNx4rMaSq6CaPfiayoucMJL/jksXVylx4UbO5AZR04IG9cy7UCXUX
	 uUh8bqeF+ifRLDl/JH74JMoFZfDnO6599VaDYOn5tlk1ymYnWZMZswKTnmyqLmkrjig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9+2QlkX;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AD4606A337
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52AD4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9+2QlkX
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4b8587b395aso74193fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111759; x=1795716559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOVBVa60ho+IN7XJrgnUZTlBuh8nHgelO4SekyzIQAk=;
        b=N9+2QlkXz0Y4+Nju3sEtPlaVMNleZ2KL9EpxcO8V7D3r+8Mxv0c11Sogp+2RiMdSo+
         kQaf1KsqGL5JWEi1p5KnruWlSCmTM7Yhc3KLJfwLQpFsODXNEEZpdZw73EtfHhrXPjAk
         qYgNgXHEfrMYlEl4Zx2jslzFdn0ulxkqCwliMpTwBEbeJXUIlBX4sU7YDOx8e/HYlorZ
         7Ul7IGPRIsrB+v/w35xSaPvQKIWmlpHxdBfLfHLj5tHfICGnOrQr8EMZlds23rVLbvTQ
         1xXsCyKHFk7+E5dtQXAOwNe3teq3M72hUMODpU86y8wlIZ0i/w2Qwu7md3jQcHPKRWBG
         lcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111759; x=1795716559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOVBVa60ho+IN7XJrgnUZTlBuh8nHgelO4SekyzIQAk=;
        b=rkdIvLzwSGWu7FbEEImmdZmDTMGKV5UH6G0+ahFRKF+b2A1suMYMl9t3br/q8mHARb
         4s9kJcaBuJXfcZHMSa2fJSKg5oDjkUktVsQZOcZXrMzucn5pwiHsIhL2jfQC085deAR2
         ol8M+c7kdXywJ+7yNmjuh68BFo9eDnJ9cmuh+/mFd1Rsx5NnyZW9/zcycA8ec23ngqO7
         x/9k5sYDl/BI1wEP1A9+vbxA9OyKnTeKLq4AYv/+4C8wRCwW2Kof8JAR+BH4zVPw0edo
         UxsOfrYmcAUAD8PD87gWrFfc14VmXxXopN7ApqKPijPX3d3sYvbSnZ/hAB1IET0a2+5B
         ih6g==
X-Forwarded-Encrypted: i=1; AL+hErG8lIPyDKbTKY06E9mKbDmdk0czAj64gADAaMilYbn+nJRWtBLDYB/ZWz9RDeJ3Kleu8+agDjdeF0+1QFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9O8zcmwvYMMgrYRhgfwNTn/m2SQC5+zvJoZbVxUoRjP+sRvlK5
	OMU3bsCqoekNP7i+Ssxt+otX5+r5pbYp2xU8S/WjVNX+SJk3bYVOaJr9
X-Gm-Gg: AYBFou3xTgl16NZcFiAkfbiWW2plmSG+3Y/KuU9zaCCCD4WwQn7ICpgnA9dDNK5CG9o
	PFzFPmkHAxlrNv8Wb7upeYO7WYQKQ1dj1rGQeKOf4pFVZ2GQfEeeKu+udwvjvS5/zDnf3afJN3g
	pWTbOErojXiaXigxLccLLWjVcTyZV5jx/rzRcQ8s5VUUKDc04vcLZGP0o5wjeaWpgDPfbXOxlLs
	qR9kCDigbmiFZuHJ9sZGCi1i3cCARKuPoXldgiQ9booE1M2hEmvJFh7YDJBjsAv3Lu+LiBBTaNB
	Sv/xflbSYzAW8hNw0lY+PH6yCYY1IInV0l/qULZci2QbyT6A1bUOMzjv5qf63n2zJEBerGEVSH4
	JkizEBkhOSJhkqdgaEFgkiX/lZij/4bbfelKn97WvTFdY0wAS8Ngz608zh2TrgfHtBDtNoOkYEV
	2xZ2qmfYkHJ/otWyD0Joz2oIKyFtvYQnFJWgqeuLtYIrgbW9cskZa+aMX6/JsGmdYDcaS3oBVOk
	wJRzAsfw6iIUpkzdqDPzzAHy9UIdUGL2rnakmlLQ0z7BhqfE/j6deS2gOBM9r2Q5G9ZRMgbsyk+
	aKXy2p2l3cRYnez3tlkdIPPO9mOv6itLP6lB09BwZddHaVX8ciUSBGMdyFwB2E6otgyknu62M38
	h
X-Received: by 2002:a05:6808:3193:b0:4dd:18c7:544d with SMTP id 5614622812f47-57a0ae276b6mr796447b6e.31.1795111759288;
        Thu, 19 Nov 2026 10:09:19 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a350548ffsm92701b6e.11.2026.11.19.10.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:09:18 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Thu, 19 Nov 2026 13:09:17 -0500
Message-ID: <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795034153.git.enzo.adriano.code@gmail.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
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

Document the Radxa Cubie A7S board and Allwinner A733 SoC compatibles
for the accompanying initial board device tree, so it can be identified
and validated.

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7da84e2de748..d32689b7113d 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,11 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
