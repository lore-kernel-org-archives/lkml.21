Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003646;
	b=wmNmSR2NtVh/xoqAzLLq8x6tts2hXMcQ0MzVZgPk/CxIuzUgUH3/kkRlDM8bMx1kcL9x
	 XQHbdWPWgVbF2LGpwU8J3vPetO+iH757idI88nQnA8XsrDoCLF2CDVpUVQJlI53zSjXqx
	 AQB12cIC2r0IA2o4guxBJ1Pt2SbH8jHlJk8RpPSWsorfQolMqf5PNyYk+D8VatGsQ7Zge
	 hrgEy8CDvewJRKqIIA4SsG4JTmiqe9cn8jyQ8CDj5vxhWyB1cNeySc4X7SGWSBKsjMZb3
	 b4VaPYbn049M+HkhkRLe80vZ6zBxtxLs+LVa5K55nNaxIQUvdz5jXcE/L6TExpMPqlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vs9tJb/h6LJRO+aSwhkp7pdT6zxOETm4VTGXKNC7Dbs=;
	b=i/kCHIBJbSKZktv/kQ996rmEZihdM6bH4UafJRhRB/s+Km66oqBKeDpgJlai8s55oR0Z
	 5c2HNkvoQx6VVK0tzxR43U332i4v5Gtv1ds9iqU2szveM6QW/Dcs9qfhUUCYJUHpJi3+2
	 Z+rmRRNM0LjNEd9lSbTc/ioZgltrRvRJeMcqMTiW46gYkOSy2fQfIUKqx0qEmX7B7YjDp
	 XObs/VhjgB7WS9Q1detLqaqAzMtfa12ItyUm4vGNoHqZiL5pBz4aznypGdhLlx5ePIw6F
	 9BukQKjt38PTPpOyPbdh0v8Mt5Kh8Zn1v1FrsjuB8ApFmQ19KW6b98RKuxE71ywq9rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fjBWl/Oi";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A4260A5BD4
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A4260A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fjBWl/Oi
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so7491255e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003644; x=1795608444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vs9tJb/h6LJRO+aSwhkp7pdT6zxOETm4VTGXKNC7Dbs=;
        b=fjBWl/Oi0VKXCaXt0gJoCoC+8oLAfwByWw3J4b/IF0xfbjhWrRnVrP9YO7cQFxn6Zx
         /O9tL82nFc7U70oE0uGKHUk0JZKSwaBoGthVZp2RSXE/iNvC7I+9gZ6mp4Rn6bKtAJ2M
         LEp6AFxdYoxF7BYKrjrYj3pRmjemV+DeeLgAbTFuH/zymhi7LYt3zXc2AhS1ZNuz4kBM
         T8wQhx5EhhECRFJpshxJyI/oLbyGX4CK4kr2hjy9UrUGbjgF1KUTR7faAvbwLMcYdBQC
         I4Qvzoyy/jgnIjrFw9gI36mbD8ooCFPOIKJ+0J2CrCWDUEWXzJpLPe8bQKNu6piLEFF4
         bjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003644; x=1795608444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vs9tJb/h6LJRO+aSwhkp7pdT6zxOETm4VTGXKNC7Dbs=;
        b=h6JOG3EaVsV31Wt4UH1c1ODpXi8diPhJhp5WaDY2v2CwRGBir8Ii5DkLQJ+7EftQBC
         d6FIha4nNbBIMbh3lUeHVJCFBLt7PrYYBcPcSNuRWlaYLvLZmqo9HuOig/NNFDPHxtJX
         2/wC/w1e8FfqX6FVeUrL8sAPXpG5KWKOvX0hqGVwWs0uVvjmhLaLsbV8CvmDAa/mx76Y
         EXmWgXCwXu8D86fboyGPC1XVBimyHtc2SiA3OvmOy1jCjOQJUjcTSZX4GIjX51lXBdg7
         fJ34bmVUN1W6WkjmUA7vwDeBfPDUoM5iHH5PzNUz0k4F3JUV2bTmrYFr09drlQmkl6t2
         5JWg==
X-Forwarded-Encrypted: i=1; AL+hErGJ3IjYswXzPmKtHxOSGxS8ILyLOWtK60jQK7blmM8VulLwXw+h8RaRpXnydhwteVrXJNJo85YZp5Ldr6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VC/rLcSsG+pYLwQfmdZC0/fboGlTa5MKr3765kB2H15bSBfHg
	Fk4XIOoK44Mexv5M5E8xvhrqv943035S3KeXnzI39Vq63n8+cGFArnpz
X-Gm-Gg: AYBFou0Wv6OGKbgicy4r+n44bQcTr4nSKk0vewYZJpt6c6IKvW73l0lqXxUxD7gd5W0
	vdOrhqWqd+2u9FnsHh/g4TtWTWpO4SqnmBk+YKdmFtLYwb6+cGnsbIpu0pNLrWTPzGndjSdQFqe
	8+pjnPlt7cJUT0KgYIn+S4k2rwRi5Zz6PgpeBVikDoE3BhOJLWtK2mXUPEtiY2Zvabd7bUkp5jH
	oVTFiZyu+7QVZImDmMq5eCo2DzLsLbxtDmV7oX5yT2gIXi1K3seom3AKvKMeT83vkT1jUmG94mm
	eTwhn1oijY3dKavOU3xpVv5+QXnxTaVJCypH59KjgYosV4I6PHFUJwc+pM1p1At3MwNKMgRfpNp
	ef3aFtgMJSbN4iXDldy4zbXUDS71FzztyOZ/B86jDSeMZAbo5o/gCw/WEwXqN2J0apWaNCFS5QU
	bkIGWey93v9baLtRk+OfOGlIxKvt3f5nAQ/a5UcV2P9TGs4mnKomqfnlSdFPkYzYPyzD1Z8lz48
	zuA7WmywYh02A0TZoqaEQ+tUuUPdN3/cl/xFneZB3KJQkt+DesZVmolVaJIopbCBFqquMjPsOev
	paO3uYBwLQpIkyLFrGT7SGsv30+/CV8ZHpYo920Dpl34SAZeyBZlOEs9f1SJrL8mN7B+QInT5Ik
	=
X-Received: by 2002:a05:600c:1911:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb7d57bc33mr43616545e9.0.1795003644117;
        Wed, 18 Nov 2026 04:07:24 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:23 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Wed, 18 Nov 2026 13:07:11 +0100
Message-Id: <20261118120714.31505-8-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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

Enable MDSS, DSI0, and its PHY. Attach the SW43103 panel with its power
rails, enable and reset GPIOs, and four-lane DSI link.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 1b2b67486fee7..d307a52cd0e62 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
@@ -460,6 +461,42 @@ zap-shader {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "lg,sw43103";
+		reg = <0>;
+
+		vddi-supply = <&vreg_l14a_1p8>;
+		vpnl-supply = <&vreg_l11c_3p0>;
+
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a_0p88>;
+	status = "okay";
+};
+
 &pm8150_gpios {
 	google_assist_state: google-assist-state {
 		pins = "gpio1";
-- 
2.39.5

