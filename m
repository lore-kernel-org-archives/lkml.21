Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425830;
	b=ssVOmgdf8fdjE9tki1Y2bQR4vPbG/cHHZVTRIpx/p7xd6+LFhOXA/SycwatCom8ShWxY
	 G2AlMkEiofRkdIEbcENWr/tfUhpeWeMH6hMF1ddhyb/pZS9zZUroCYkwe1MVGp1mNGkj7
	 zcU7H8JicrdFglkUtRM+Hize84TwNiZXFSGbIEJyHLlTrcbjlZ2hY/HSIggKZNymij8Cn
	 Jz0GbmiGktpyn889XTwlTerPnFRCwlwRRiiULTNIrelS7Syp1NmegnnAO4maBrgNo45Zo
	 OTT990u7Pr7jqAQRZ71+NqEZR7SByREuW8msydJNHdbRToj2Np0Ob9+oicntRB+SUgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=;
	b=ig42/7Xz7jXQsq+qW1FH+Qtb5coL13zYwSyeKJkONs+XvovTgS1sdZ8etdhugjh0sklr
	 LsOjB5MazMP9jAavRDPVHD/rdO78ag4xffSyIBmLl9WGRBb/4QH+N7x/bYxxOM/J5kShC
	 pJC8bP9WyfwPWV90QhjHVp1g02datzxTKHftXOxSKHE5v5fJT5fZPpwnGLJw0JpmgwPKO
	 Ox2YE2T3jhPQUaTfypLZ/8P+86xo21rTzaXtLoodVy5qjtUcrkPiGuE7OAYACJbIugiQS
	 FZumgYgiR1qee5JQ6MkR+Zy/D4yalJ3+/YOayITX7oIpA0VFcoBmHYwWdmEumL9cNUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BXpTUxX2;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2AB606A337
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C2AB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BXpTUxX2
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-497614c95f0so1659733f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425828; x=1796030628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=;
        b=BXpTUxX2De0BQxbcL/ZbS9dBhDjsFhMj+8T9ThbS0Mzo42yWqmILbmSxz/iv29e9Hg
         GgpzECqIc7dFPXNyXmJYYPrpwNXyMwFpwgPY5GwqPKiYaSOR2ZHDdsZwNYX5/1syY1R5
         KKbv1nLdvakMAsNWbwhLQYFk3ykSuHhmNjhHY+cjm54NsUzUXZcgjNma/AlF4AE0lb8v
         DCTe3qnSM/jAYevI9JtGLW+tsJMEt63w4M6yLKUGCBjzjLbFggHop1bcd30kMCu9berl
         axxdrSE3dsEByZBJdplS52mRYVxBRbNSnXTi8lxPtPjFZChdPm1EwoydwWq519y+HdeQ
         9l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425828; x=1796030628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=;
        b=1ZX+rFcZt2/FH2SkH1bxVgl2mSRTBEKnApyeQ0hwgAs+HltXi+iz3A3a3cDxArzTKi
         k9rCv0Y0zjkgoYU02l7xTPIs1uPixGRvUvreEuuJXGdDVKdX9uUcrO5swFpj4vg7ny3p
         sHC9vAWn233e+eWgK8tNaIsK6Y6tKO/dnUuISNr+WMYuy3lIEocnXT7qRE6GbJhq5Dj0
         WDNLk3rHRTlikQKVQOhY/hHycmok1dp/OyKjqaPppE0PKfk3KNESfAztzI7FzPc1i4xM
         WHMvjAYzRQVe4P6yP3G3g7qhIyVCKQY4Nod9qGpZmfvT3KrMSippgZfzHndVsh10gbc1
         gsVQ==
X-Gm-Message-State: APuU4Z942Wk+r12wa7NAz+t5AmWXtoMwAA1thJEgzQSf4t30j3pDpf+4
	OxLJzsB2VzEf5KW9RCBHH2rLWwS8iOD1ocslxJWp4h1eQYzUpbqFpmsi
X-Gm-Gg: AZFdTZcI4zvRpEmiHsSku0RKNwdOojBLJJlaBal8v/IKZKuUO3TEEmPEAGJ5UC82kaw
	PBJ3V2CBeHImlmkIV79fLjZHteqRnk0Wz5xpQ9BiG5Emq5aUkNgk1xixkO2tq+pAHPu3gxYhyrF
	yuCDppXtuwJBwLHtYdEnWA7NsvZkYwVe+Eo3q7jXdp22Uk9yM0M3gALr64zNmMnrj8gOnxNyzsI
	FE9VU6xqKLbmqaoOUaJmBDaIbEk2Et32yIJF1NX2dtZtRTsu6La7kNQ8UA7t5h+sJ6FkoqsLAgD
	1ZzqgK9mlarCbPXS2Bq6oxsHQ5+j4pny0QguIhtwQjPyZy7urSj22HXV7wVSXvfl4Wv9edUzY4m
	4apbicrgGvZ/PdNQ8EnOSZKZhqZxS1+4ql7+uZLcI8FtrT+kSpPA7d6sXXwtL9tCxWf8tOkWgKz
	lho+gnkbMOwNpFZzVkHH9jM1xsAhFGbwVjWzLalmfcz3QGwaFOmZslk+43jhkv0WCNIhiU67Z//
	F0bOULdMJv8IoTZJ2cWTZW2rHsSlg4FOtXYoaZ2fyYeAl09p5sS6ie9ZgWA1kfU+LgrIeHynajx
	sy+y6MVZaIoctzaga/YeyK1umlu4QHCQ/jFry1pouEP3y3SAP2awLsUrORgjtgpcTH4Fz7HDHfI
	3s8MgCuuqX7HgI3OhWJb3zVu1HwFa//e7FQ==
X-Received: by 2002:a5d:5f41:0:b0:4b4:510c:519e with SMTP id ffacd0b85a97d-4b4510c5231mr2688118f8f.27.1795425827893;
        Mon, 23 Nov 2026 01:23:47 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:47 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
Date: Mon, 23 Nov 2026 10:22:39 +0100
Message-ID: <20261123092244.1792040-3-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
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

Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
existing Exynos glue layer. It is also compatible with the Exynos850
variant. Document Exynos7885 compatible.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Use samsung,exynos850-dwusb3 fallback compatible

 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 8af0143c3e47..f62e3ed82257 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: samsung,exynos8890-dwusb3
           - const: samsung,exynos7-dwusb3
+      - items:
+          - const: samsung,exynos7885-dwusb3
+          - const: samsung,exynos850-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
-- 
2.56.1

