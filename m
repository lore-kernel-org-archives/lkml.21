Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425828;
	b=4gWFaupD20cyhkooS0y+BTYd/ufSq4PD2Nq8m2OM5C1dJaOJwdIkkX9MdbsX68kVWL2d
	 TGzdWAmN8HM/EDeTH517c8NbyRPinRA+K6ETzJ2epTOiNxS8FnLQBEQm7tXS/Of0KnOqv
	 2+kbs8UCSYMYBOyzkCBcFPqVNHO39ubwKbS/Oi9ItgkbpY/nnMyot+pqQPibMXILl4eMs
	 XT+zooXP4fpt8TPtzwgMIx8FkuXhyBboTAPVSP8yxcUtB56hkUhoZnBv94bFmRsFZ1m8n
	 uaz8qp0qDZSqX8MllPr75NhoeFfq1Ecpt7romUFJ5Q8Q5+f8zMB1pEVOeXsSK5VUz4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M4dNFuYhEPr52SA+ny5yZ0o4zoKtkWjJLEaqwoQdUao=;
	b=3IPWaBx2dzjyvNWZ1CaFnOEMt90LFtu3Xhdy34ZYNBXF2DLs/o97yPe4+4sAfbM4Bw7d
	 0IDkYFET+OVAfuQbiJmr3vBriry++0gg1XO4YEk6whAXCQmDsKDbQJbJDehl+KqrsqV3x
	 LaLtYosNvcUfIgN/u+PLg9U9QLE+ZpQ9rLBKyf6aFuzK9/2g7vEY7fspT6jjtCurY3Lmt
	 +L337gRHW61K/SZBfVjLHEM0T9SKCO0TlrtxENoiTAHcHy6GBgN5rSYdjhI4uY9CepJ/c
	 vdIXHj0sC7LNYL1/cAVyiHYBT4/UMvmgw62eV2jvLnUGmggj2/LgcDw5uAQCWEO7aJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=saEingyx;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D66606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31D66606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=saEingyx
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so27508245e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425827; x=1796030627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4dNFuYhEPr52SA+ny5yZ0o4zoKtkWjJLEaqwoQdUao=;
        b=saEingyxlHsFZ5o44DoxnUMM9n6P8Z02JQKS571b/0hFjK0zfgAaZxz0zt463sWhEd
         1k3GDCQCgpe1MyGPSS5hPhmmTpNEr+C07yiVacKwjMkAx95qvhgooFUtp121l5Wffpnj
         JVcDFEkdVO/I5QbrNJylR2R8da4nP6OsvURGIp+bawQ9oad3rJzhSXkhDsHtAmFt3AOD
         24jp/Kizs7CthRW/DZYmt+1mXR7Fxg0Vf6R1vWv/YZwUF3ReuQqY4KeVAAvy4hdwZLPR
         CDHQpyioxY5juqypMwXNOHK7jG0iFvkktB+RE200QI7hqoZ+Ax030DjzgkzAqFedfDu0
         8m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425827; x=1796030627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M4dNFuYhEPr52SA+ny5yZ0o4zoKtkWjJLEaqwoQdUao=;
        b=Uz2ExtPAZUW9K7qYZTTVuGGaJZiQCUb2jOnHmk9h8+CxBe85JSRV56Ud7vyR/P2irk
         aHGgaBjQFlgwncH0wM5VLyt+IICcJNaaGI1zhqpx6vKsCH7rroJDDu4rz03TmHQXpW44
         wAcxNW38e0GutuxDakM+Yq/L62nHRqlTcFlz2txi+BmnVzGMegCkTmLZP1erxLLy0ymX
         DqYB/RboMp+FXJ8Y9plAtZUcAeMfD032UiXEL9k1I2FyfkEgH2EB6wcQm9Ldz+S902ht
         FLE6+RaiA/RamAtLhyXqXmFYg3FLmeM01uEZBR0ecPgtQ/R+JVsmJmdJet210bSgzX+Q
         xgng==
X-Gm-Message-State: APuU4Z+ze0eJcyK0Hjsi+JIqOd4cZPv0AUvTrM/TSDdRmSURYOYjYG/s
	HNLyv920Te3YzD+BHCDTbL7U4zLwq0wX9FcgBZ9OTXkF1VumoTv04B7N
X-Gm-Gg: AZFdTZe8wmT59V9UfjGsiXfugfZ/aj0Xt5nyfOYggCokHxt7nfAWgwzlfJqhyBDa5Hz
	QxeC616I4Q9lrcuFYk9gJZw9c58FBFmPmqKjMEz9QQOG0H3dJAwQ7PePUUoi9HTvA+PGnu6GBlj
	XEG8rF3X1GAXuYsRKYgAj3XdVRGRBoXvJ7xt7+7Q+zRlnU+uzwXuUdyIP5KJVlEitzt42J0zo+B
	oSlK15GUTOSmC5LIM2dhuhiKDDQcFcHeDFgE+5KR8QQgghlixCkeYgFK9lRZ0oClfaXDnf/wZj1
	PPV1wzg8o2iLvPBLvGY1wpDgT1m6Cd4fjIoqSGmnO1XPTtb83WOJ3Uf4A+ctUwilxuRONqL29I1
	H931X91SAk5eLCD0Askc9DfzK5akilA5LfYGlwM2HtV+tTE7zvWvhfZsEItBOo7/bo0y74JAiC/
	F1Rk2PvCQE61/U7JJFodhkExd52Rq4vuKggpWZgA2EbwNv56sZ0qRXHkj14kf9b8Ou1ZcRxBcG/
	0nYI7Y0NOPF17w5MwaE3rWs7OBVT78/nfVSrdCvKfNaID67WGDN7d5L3qDYxNb0hdhA/NsUfB5N
	HiKLBPOuKBaGK4/La9SuB2JQ3GNc6Z3lyS3B7vIzHt80Xdhsi9wi8GJgL5md7R8Y5B1voF29u/c
	4MuIt7WUzjVWFpnuqqrI1nRHYFEfTWnraFg==
X-Received: by 2002:a05:600c:b85:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4bb8892ca5amr224121685e9.24.1795425826605;
        Mon, 23 Nov 2026 01:23:46 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:46 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
Date: Mon, 23 Nov 2026 10:22:38 +0100
Message-ID: <20261123092244.1792040-2-virag.david003@gmail.com>
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

Document Exynos7885 compatible.
Exynos7885 USB PHY has two clocks (ref and phy) like Exynos850, which
are already described in bindings.

Signed-off-by: David Virag <virag.david003@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v2:
 - Add Reviewed-by: tag

 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index a1b3d9e6a094..f644a4aa1e95 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
+      - samsung,exynos7885-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
       - samsung,exynosautov920-usb31drd-combo-ssphy
@@ -234,6 +235,7 @@ allOf:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
+              - samsung,exynos7885-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
               - samsung,exynosautov920-usb31drd-combo-ssphy
-- 
2.56.1

