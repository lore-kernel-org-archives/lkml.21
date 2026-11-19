Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107272;
	b=dIG34UHFMJx+cPCX9q8yEy5g02ZRzpbU6QcOyZ15/57sfvn5YNb/4W5byIgN9vgYLSAB
	 tImmmIyM3ZbDVGV5COmr4MGtcFv4zjwAtMwDfcjI52+6H05gkfuYId1EI6G4A4jVeZKyv
	 DspTjGihC7rc0w/Xzfrvl5iTWnYVBwYtBv4sVVAaZPLFhq+JPIHU5RFA0e6+787JfMGbr
	 WLmV1B9FMDdJSM2rDYNVcgRJ1f2IuxIj8sxVp2ZuPrNktgzVtKiYdB+XvZFqvBaqdxp0K
	 SsHYuy6scZ3JCnN44BQoWucbekdnYpoyxw9NKf240Ee/BMtkKQWzCravMmaEIji78UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tqAZ8i8YHyd8H+59b7YVQzKbswaS0aGE8O0OFJI4g/c=;
	b=aF7NOPT5ZRSrgICyozcRYRdB7VuHDPGmXhTlzwUH8JDGKMpcnTEnfduegRlEIZm3qgQd
	 hTEe/1isrm86wUhvZMeyPiE98H8yL8q8y3dlJ6SrMKLEZWn6xjZH8dEVJTenBQBHOT1MZ
	 LgYbqEdNZl12+LbtHKnHf6hwe3cDbZ9nBrrryd5mGAWCH8VH7jbwowQEokVqLi7Irkmn5
	 ANM/oj3k87jcEVkbwTx6Ugp6nTvhtlCKgJlY863uMOrX7QYJ4A6K3/XKjKONdNCNugLVB
	 xxpQ3su6aske1gOrMa6IX8ilHiRlZM9K8e2HxzEf6pfbI+pUKJgrDFrXbOGzOkAYa2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XjvZK7Pu;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758EC60A260B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 758EC60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XjvZK7Pu
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso28042805e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107271; x=1795712071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqAZ8i8YHyd8H+59b7YVQzKbswaS0aGE8O0OFJI4g/c=;
        b=XjvZK7PuZi8XTLMQa9L1sxjKmZ99wpMJwrPePbpWH07379UZUNok+6QSl9OC3Kggox
         FeCAOTpSGChqgFOVuCTcHjorrGpGYc5CohQoABPLaPZBcDDw17Q0VZW2GZshTqjA5iKQ
         Wi4a0lcEzN40ZbpCD02r7Q0jjIVCCJNzYofqFcHcPD/AaAYTQ5IHBDJPGOygekgGzhdN
         dIjMZvJgXgHZW/k+CljgLPFPTkvnB5OG5SMpeR+WlZVaF/cNyo0UeXmqPX8BP/GRobN8
         epQmPJeLpAp12sX9EPiUxmh3SrM2MY9gu8A5HVpKexGoiKKNmeGTZraqbvC4Qz+fjM9e
         7yzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107271; x=1795712071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqAZ8i8YHyd8H+59b7YVQzKbswaS0aGE8O0OFJI4g/c=;
        b=eCFMjscece+8ynmAF08Dqr1b7NKuqSkyanN0oSwHCQZkPGsyqTlWrNzsgZk7aQ7qpA
         qhLQSkXBtE+UIiEztMVyYePtF3BOXvocej2PaG/MpWRusNxzK5f4ColdHoW5FTyhEE+c
         lNc79ZePlCuVf0MOQK+XqJ5JODVZQgBwyZTbWssaOkKdTry79EoZ+EnWZkctOlkOLHYY
         vCuIm/jFN+SYg3scrGuKRJou/PXaBlzao8GqRz1gvhfwrtWALFPcElciUIPujCbhGY+y
         XprEgUF9RxmVV6eCaHe/cS8lYbrdrQzDJRWVMLptxcrkwk+ytEQsZV1FBqvl0/OnXe5j
         Is2Q==
X-Forwarded-Encrypted: i=1; AL+hErFXN5TwmR2pHlI6TIS0HCoO++N5mfOWcuo6jEks4nJhQMbShV0GKUUjeU6Q6pOPKpadr43aTLwS92jaAiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QyVihH0cWPkyg3AmY3xKRfisWRqEaYo9ZWV9qxay0mwif9JtM
	+UmI9u3aNvdmNgEEcKv3Ijw1Aj2nU2LLmBsQIRtnzIaTkjDmpiZ+7nLa
X-Gm-Gg: AYBFou3f4SIFa7hOgHwgkr2ws9qMQKI9ZFjhnUBsyg5eZQbIaUqvn+QwAzgmxPxNApL
	6T9K+JHqwxFSiI88Fxx4tE6yrdw0/f0vijHTMXRuDb9ivR0PZyuyOPnItMGtV2BWl77jceakIN5
	FUnr1X08RzOLGPjxR3uP5u30OsKMGBhdEoBgQZEgRONYchWZJgGBp4jAPqAzOhQLTlVZihWGaq6
	R3ZkSmZS1wJbO3uRHzGGQypTp/S6sVECrJtD4CmeMLJ6WMvuAknpX93c6xm33MnsRUJWYzSmqlz
	EMKuWnvJrUfHC0dXS0iXGJCaXSKN8zE+7YRLyPCKbWEJmy3ls4RdEKMeAKlVXKHrcARzdz0fwJU
	jcHNNEIXteVUjGewPXyIBRtKgKCEENn6iuqgOcnkErTO7or0T1bgNZUKQG2DAvRFCwt1BEyXtcr
	CwHtTtY4mLgNMqlLokyTDNZIyhm4iB/1IiSQEzcx+X2PY6DcHpygL1dfnqmZkom340GkPVTlr9j
	+MPnS+FomScBnVyf1TrzA4kQGj/BOLC7woGW7sgQ6XbBSou2xKW8ElOpDGwUxBGSA1Dm2vJPv0Y
	XnSDqhtbORgzaUiVdDxVSS3owY3vUyoqwJQxuzVQ88J+lFkpzqZeb0w9RqMhq9Hhk1vpGRUZ94k
	=
X-Received: by 2002:a05:600c:8184:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4bb8881e969mr1657545e9.28.1795107270775;
        Thu, 19 Nov 2026 08:54:30 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:30 -0800 (PST)
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
Subject: [PATCH v3 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Thu, 19 Nov 2026 17:54:17 +0100
Message-Id: <20261119165420.24466-8-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 00e3fa560e95e..59d6c1518a469 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -461,6 +461,42 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/LG/timelm/a650_zap.mbn";
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

