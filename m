Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044619;
	b=sJALucvxftUl7W5VJCSh85Mvst+A/DZGkW06jgjLikrH2nk60YQaVKcQRrzqkl5/EGjk
	 /GnCM5LS6yVUp3jjMHsoDXe8540vxWA2WoKJSf6VI0/WubTq9iRHXRc4dPDOHNFZ/nomX
	 TeJwksvfbmZMjQaIfOMXmzI2/fEEUPyTfiOo469a85aYEHOjvp33ejs1IC+nKZfyvocik
	 KlLMSVP9r9w97GyTTo4uOg6fr4UYhRFPDx7mwvVwPs6lI4htlGkHUj0BqYyoZycQMOaP7
	 L2CeyhNIciPlFhlD5R0wIWglYAOf5/TK3/VAw+qoIJ+IMzN1VESgh2jVycaXk3/V82w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7C5jMvL4BZCrVCkE7uNmOmEvbc8VSHqIMhSM8aawM+4=;
	b=aM+C7QdCTsECuZ57V2tO9JUoEnPpa/Ga1QmniG3X49iGexdyEVU7/iZVja3itsRu6sRq
	 rhlPxKhfAlFZvLOy/01ZAnluxc/1mzeZAtznKndLBJMv7SxSrncEtVZIbH8Vp/PEGDApO
	 u+4kb4ODrV6h/DIB7ucyY0VUFlgu/CMlcUpP1VDKaPeOPZVUSPCdGT894eg2e3Cwn4xgG
	 ImGNsnecC9WITuOaZuSRoGpjZ931y8lVETLSIBNSClbE/ehPM3pGEexBtsUhuKEfRIrDJ
	 EcuwXP82dznKziT3MT2MzVc9Dkde14cIZrnLkUy7ujTlFG1rgbac/fCu2FJPQr/DnYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uhqyq0KB;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E4B606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10E4B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uhqyq0KB
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c511cdd5a82so141691066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795044617; x=1795649417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7C5jMvL4BZCrVCkE7uNmOmEvbc8VSHqIMhSM8aawM+4=;
        b=uhqyq0KBkoDtob9C8fzfI3Uew91Gj9DbM+1JuzoOTaWpm79PrRq5arv4pQjrrl3LZk
         owMl4WqSCCkKPxdTwlsc/2EJKTJyPA8Sz9ruikraYIzcVLfDuWGMUDLzVm5ye0mTOt+S
         A2ZdsORGqwIFfFuU7BrjAXGtpF8SM90oZNs60pgvantPQM8uUhueKL0uqe1jtbkutU0L
         J0Ld917N87IEOJLy5TOnzLBG6++lFCro82z8q/lCCalsCCAvoIvwM6v8XjbrQewhvUzs
         fxrv2M/J13xYNuCOpCP6M84xJoINHjOKce3e2IKjsLX5QDzVszPLcEvVjuEVVLz8K2oH
         obdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044617; x=1795649417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7C5jMvL4BZCrVCkE7uNmOmEvbc8VSHqIMhSM8aawM+4=;
        b=dE3cqC8KiFUp3UzScc/KrjCGGm/T2V7OdyJZirhwdo8Bl/+QJsifN0K3quwl9HcGDS
         ptTHXz+WDlPAqZtAnfXmviKYCd/wjVU9M6wHoTTJZ29129uZmSKzpaBJwuNjsl7d/Phn
         Nu993NQeZ5Tzz3vyuR9k27fjT008V6z2Gm/459XMpC8tnVZc25m73okuT2ObLtf5Nm6z
         a+PNBmebk0OmXI/HxerUCSwy8xajrYfWOQ4nm2IZXc8znLaqh8d1J1GMDszDuxqL/Ie6
         2q8IPnGtzyXk2AWH261BspM6uE4caSsfKcpI9ST78Dd56AbSo2QugB7qzRt/Iiq/odwt
         4o0Q==
X-Forwarded-Encrypted: i=1; AL+hErH5qSbHgUE2Ri2xbCOUhFjAkuZVVqKKs6MshbsmBygIAM1s0ob3SQrD/48XBiFgeoXF5d3KmG2ojNrVzjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tiJFFnEwldtEf2d6H0R2fT/Z/JBySFEOSnRTdPYfV8YJwZcdt
	Yo93NVXqBaabGfukpZZCExRJZZPcLd2WPMefv003C0h3s3D+YE8y63EeXbE8cQ==
X-Gm-Gg: AYBFou3kd62GkapkriqYR59TRWB4lRaRRrW5TRBRas8i1GKRlWQA4r/03A3WNQ6tOSt
	RE8Nx/ZKoG0qMiA1dV5h/lIXex73djav2xwOamfP8Y0H9L4Srbgnc/8bJn9NKPmh72Tvjcs3goD
	Qu+W6OJ1MKgFYjeBx26BvtXm2I/Cmh4xJrefbb2LESJH0y1y8r3WG7siBNmRq9b6GTabKtoVAik
	j5sRWWJpijO9URkGSBrjuotx1itN3Yklq2+bSnwM6acgzlsfktN76X4ahrCOfkWiv27PQ6u0lo8
	DxJojMX51+lZTlYybPuUFpnVwPXl4m9vZY1G+Mvu1JZ7w8dIjXP09z+TwbMLxBkk2kjSgW67hWE
	IFrZQ4pG/Jm1+1dzMfQHZRRQz1aCrNSVOmfZNwe+yJ2lFqbfUthBzYS4dq0spjdISwsMYppk3z0
	w/SntTpDv0y4heoro3jDW0BTcnjbPFvoBV3SiqzKF95uDvv1vFqCiwrYIeQaY/WEioop3Ae0sYD
	8w+lV/gh2+1RomvsYKb1bqM2+AKi93cr+WlWR8OxxNrRsoFI80pTHU+REL1/Rp0KCCKKvACsCKH
	mn+bSFqPH/dLxaBjNmtX1Tlsere4h4oYcYSAzWR1Y5E=
X-Received: by 2002:a17:907:1611:b0:c41:266:68a7 with SMTP id a640c23a62f3a-c510e22ac27mr381182866b.10.1795044617416;
        Wed, 18 Nov 2026 15:30:17 -0800 (PST)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234d2159sm47809166b.78.2026.11.18.15.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:30:17 -0800 (PST)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Thu, 19 Nov 2026 04:29:39 +0500
Subject: [PATCH v3 1/4] dt-bindings: arm: rockchip: add Forlinx FET3568-C
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
Message-Id: <20261119-ok3568-c-v3-1-071840643591@gmail.com>
References: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
In-Reply-To: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044612; l=1181;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=pPsEz//R/5mbHWtInqzwe95ndZ3s89rfdZjnVNEV7dE=;
 b=JqRsW3Up71ea4lmgiyptHVdI9zefUyJcZhSPDaVQD9V3n0RhfBpSIm3puK58UPdbQDyE6fu+c
 KGx8zjYmXDWCBUePjda/4weNDbAB1rAwqMACrAI4TImu77tHti9PyKo
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

FET3568-C is an System on Module made by Forlinx based on Rockchip RK3568.
This SoM used by OK3568-C Board.

FET3568-C features:
- Rockchip RK3568
- DDR4 1/2/4/8 GB
- eMMC 8/16/32/64 GB
- RK809 PMIC

Add devicetree binding for Forlinx FET3568-C SoM.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74..30a6794861cc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -324,6 +324,13 @@ properties:
           - const: firefly,rk3568-roc-pc
           - const: rockchip,rk3568
 
+      - description: Forlinx FET3568-C SoM
+        items:
+          - enum:
+              - forlinx,ok3568-c
+          - const: forlinx,fet3568-c
+          - const: rockchip,rk3568
+
       - description: Forlinx FET3588-C SoM
         items:
           - enum:

-- 
2.56.0

