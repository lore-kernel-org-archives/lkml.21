Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096491;
	b=xJ7gU8go90XUrgd9Z2nw3wEZewOZ+/lYraYlP5jwS0vrPDhn29nNdIGYVxyvgvZauKxu
	 99P//VhDwoYG1NHZxR04WaOkn5h7xsTbH8jw6/gz49qh3p0vZn2s4kSEzvIPrVC8g5cRq
	 11csY0WZJnkc29pvh/8dzjShi5uykpph9sxtCVw9YS9zDl76fGzxpf6OR209REd5PbtJ9
	 OxXUuiezH5rzdM5dfJwGbakxKaxoUUtRqVS7PbLAY4vP4IRyi9CxYrSACNBWvVCwedaq6
	 mE562jpr7DGC+lhRs4aKcVSbStjLv8jzLma5Sc68ZtVW8vrEUVYkNDaPh6KbiLdILSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
	b=jcwBR9UWCjLj+FJJOr7eDeSfPmKz+6eO/FrGyKD7v3uLXScLgo5eqdM7iv6YFPYJ3zWV
	 CX35WLZcbVAj0JW/RDY2fG/TFLjSVs+qlrGu7ofdOHPAVs+FN7IJNIyXYEZuPQnXhmgrz
	 NtTMGpPBOUuVKqYtB7zfDK5mBs+DGZdL2+HjbvRcxrNqmn1Pe0QdLW0nfNyVVozH+vu0t
	 TxBBUV3s8Zp1Dkm4Rj+pItiA7u2QZCwv8UmBVHP0u2WfKU9k6ajDlT136jGFZ8hJaSouE
	 rvRfCsM8i4mWJy5pgYKXKh4tIvyzQ+Vl+IrUAFBClkLdBnmgvH/doI8HbF5/pODJ3Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=iStJuBRZ;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B41606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81B41606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=iStJuBRZ
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c511cdd5a82so226503866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795096490; x=1795701290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
        b=iStJuBRZyeko+ck0h2qcp8lblF7jAeJsgGPT171M9fozU1T1YQpeMqvm+yDjdYymjb
         zRRiwjQLu1Yf5ot541+CH0yGBFp+H4KYqVAjNRAF1mZxWSMCVuBN5v52XJ7SyVXH4DjU
         eS11FINq/kc3d9V/bqwxLViXts7mx4ytpoGlJRQPZpctVpWQ+64i0qQH9CpdgMWGnwBo
         HfS4ld5gt8/0FrkxPVRpoVmk6feXZz59G9/bqWNkcJorJ36huAWvC1Xv41G5SN8u9C7o
         ZQ4bX7cTIZHqTmjJeW3DzYIvpZr751R3qU2DgewhZ6Hx/dD3BykZAZhp8NXik+SD/2DA
         Vuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096490; x=1795701290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
        b=cOIdBnUB7XhVGuJgDVvbC2Un2ZAPLbOu1kzP5tRbkeHJErWW9J91wq7ZA8F+DQxUds
         gagGwhIUSmL06SruvC1OcgXJYGvEVsfxhC+eh7mf6QCHuv6FGqxqGRLNaZ9SnsroB99L
         g0w6zsPowzxI7ckLfMGSamttxlJR2Qbgsw8WAtiTJ8zXEy4X4A0oQ0bibbWjIUHNpTs3
         UXtncuNnS+358F6+FlfvK6W02C0Hy4CfockN/HzgOWywSIDCrP4QAvo2fAjBS6hPPYeP
         dUrosx0gJaKMDHi5C5CCGfiOOPPuKFJfgZT4b+ue0gbQ7PuwVho/IARHZmq+U+Pd2Ycb
         SUYw==
X-Forwarded-Encrypted: i=1; AL+hErEm7ti5PO1wqeLdzj6Z56Ee9v/WBOcLD33IxUhmfCdka2WXHq+vua3TAl2Plqy5sr9Ics5q/iy7pZRQsm8=@vger.kernel.org
X-Gm-Message-State: APuU4Z83+5qIvAw4fP6EkU1MLCqgfjhd+cw+q89WCq0CktylZk55rEa3
	cvKJtu3H1l9yFc7CYRx91jkBqJYGgbtfQyqRvHq5h70UNPjosrKw9XMo8dYaeSNQRNY=
X-Gm-Gg: AYBFou3NGysKBlkdSB6sXRL3bDY7DGZrfXIHJAcyjRTn1gJpO0Ybovh0wnzjv4c6Ixf
	nBYI8Q/XHngPfJ9y6QfnJsLz8YeeoQk4wMtZuReirnGNsYzm80hy3OVIlHPR1gLGsf126I6fnwC
	iPocdMxHzTUj8nUm8ErSLw9lbj46rqxHEj/fYbIn6snZxpfK5Q83Z/Y3KaACDnJx78UgDOJ8hcm
	cAhdRzb7eW7KfvK1PvOEHE6yvTLuwqg8Rp21+l57EWfGfbGOkKL0/lyPqU+jMGfQcyQdieGSxZ2
	Q1wCaCTk7+20WO7AL/QUh+NcyA0EPy/P9lCL+yTqqEugr0yHzXaA/TInnONMO7HXNhl8j5bQ30s
	65dH0c7Mz/0A4+PJ5pwsYZoQK1s/rg5KyjDM1B1REBHc0I74dHmoXQZzw878yyqwaMTf+iQeTRQ
	tYYBVcTRx+npxji5498cRnCqKkgcLwezGvCgodw7xkU3MUkhliCOatEWH3zPp7KFia2aH8teYBW
	hXQJOR2iUwxCGi34onVYz+mDIH7ruA2SIu1jf8oBx4fj6sLKRvS1u041EoH9yYg9U/tYVt/98hF
	hx4jpn5xKGmewXN1ScUI1AZFRU4wIm7Sr1eUBKGP5snyjvZwRwOBK5K/Ig/Ed08j405Kj5F0JjP
	vEnN4y+NF65lU
X-Received: by 2002:a17:906:ee85:b0:c50:ea07:80ed with SMTP id a640c23a62f3a-c510e547d86mr560202566b.39.1795096490106;
        Thu, 19 Nov 2026 05:54:50 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4d02sm106820266b.21.2026.11.19.05.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:54:49 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 14:54:47 +0100
Subject: [PATCH v4 3/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
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
Message-Id: <20261119-aw8695_haptic_fp4_driver-v4-3-9d107334bdb2@fairphone.com>
References: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
In-Reply-To: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795096488; l=1650;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=aA+iGNmAXb9ktbwAU0KbUX7yr+F4w/IPZJ4vFwuykl4=;
 b=r1uAQNYUas2/uOCdwJ/uUDtwQzglg/TNjUIZyy7Tlkl1iSfbdZ6m8DH7MxwWkifuJuXBxpIwr
 HacaBfJyVDmDZ4v5kDX5zKr9vuattUfT8WkjmHynS2j3pd+xDJp3rp8
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

From: Luca Weiss <luca.weiss@fairphone.com>

Add a node for the haptics driver found on the phone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 23f950067a08b5ac4f7f9f61cbe060fa00b9f485..76184027221402e57a569d74749350c1482f5afa 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -707,7 +707,17 @@ vreg_l7p: ldo7 {
 
 	/* PX8618 @ 26 */
 	/* SMB1395 PMIC @ 34 */
-	/* awinic,aw8695 @ 5a */
+
+	haptics@5a {
+		compatible = "awinic,aw8695";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw8695_int_default>, <&aw8695_reset_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &ipa {
@@ -1178,6 +1188,20 @@ reset-n-pins {
 			bias-disable;
 		};
 	};
+
+	aw8695_int_default: aw8695-int-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	aw8695_reset_default: aw8695-reset-default-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart1 {

-- 
2.43.0

