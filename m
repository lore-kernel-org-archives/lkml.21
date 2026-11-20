Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160049;
	b=CB1m4VFqYFogX7qsZvgWEzMGUyVY++LzX0c3RbHjYNeUYgNnuHy6K7yRpwK5r42i6Ap8
	 f8LN6RMp0ew/vXurNG7fLhZ7G1m89DFirZxmjRdlYLtgeJ2TXlxqPuYaJ9GBQUvZwpxZk
	 zyWHPF2Gj2Pm/aSH1Ko5RoWymPmq0fJ7XgWXBhsQ4kLNSsW+PK7iEWFOVkdIAtSFYGIJk
	 KfJvYZZaOd9TDav6vvjKmbRaRJz8V68zQHUdGZE1Do3CFm1KRYJ04o5STymMWoWH2y2wc
	 JATaQEEzho+KEVXicBUfji/Jo1hnizbGxewyEfvampv0dxFVjekT0Y/fK/0Hms2IrKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
	b=Bf5ANFSQHkwmFXSx8SXx6kWHdFxlIHFPeipoW9wWa/uY4KmK/bqdgyi8R8qSAcOL0R9x
	 tzQk6oqc58x/IcYe6fjVmgkb0iiLuw5K0e1GSiSlpV/aWfO21669bgEl0QX3pMHrXDz9z
	 hO3UQ50rMgonfc9F8t/TaCwZ9FzhsHWFXOiSG6ByjdGxLl9uYRw3aSw6H2X438iFA6adt
	 V7b4tuJ5FQYxER3seG3b4wLb/2wJHNDOmc+0uFCQdZN5TvxFGf3bJto1l8FYG5aIaVVPt
	 wH58/G80/IieZfjHNHXTq7CWXWp2KE576lat3/Ih44vQBiBFtV5LU5E8oJzblxec1xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sk3PdhS6;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB2D60A5BC7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB2D60A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sk3PdhS6
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso5692745e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160048; x=1795764848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=Sk3PdhS6u6GXkbXWDqXN4JbGbmCkBpKSZInRKLGFgBkhxX9mXxArpFf+rNaPZCwxU3
         3CGUvU9V68SAPRRct0FFpaEiOvp0VW5tPkqFGZ43AG+z/prjGacZajMS1sC4yXfIceeE
         hrWO2FrbS/V76SVw4FPSbKRpvuim+GphReaxGH/r8zDBT5Oonid7RGlEX4MWZ5+t0ZgK
         oZ5bq4BfqdAMXHwVrJfBOEzKNDUUUHf3rvuyMejdrknr1/79kCKrIWrW/GqOwQ2ZMz0W
         eSlgH3ZQGqwuba/uOXHZZemAE2ZhC/awGcVUrPBI7kiXZtNMa328GJ7IYVu8rq1KSraM
         loJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160048; x=1795764848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=TvdVLsLiyTB052IRYZq0DFjnGPm3Hah04tFQOZcDRrrBeXT/CjANdSQR26VMxceE67
         OhfiRvQhUXrN3N50t/wYbSuua4HBtazwaARWFvR2lTESrA3c3zgCbxzuJCNiMAobvP15
         GjAfVzvE7cxbdVxMBNotHjc+/4Vbhs6AazQO91/IRwZMayCNnty97gf3dc+Ou+T9tyan
         T74ZAdjFp12G0/W1BAxsfYF5AfxYe06qpPngpoa0FZ7U9BOeJHBIOAXmqkBGt2iDmHow
         4Y3OC2QJxWVBGYAqQ7iv8RF4EJQKOj03oKZ1sujxkGYY4H3rPW9mgvij4GlGMox3Cj/c
         hz7Q==
X-Forwarded-Encrypted: i=1; AL+hErF02XBGLqnrvLXP9f5cPHviMymaGC6nvUPoAUL8iHwnY0u+l27aHlJWE6BSf/nYzyV3DSqIhWAGGz4jxKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+31EWJJhPRHwcw8gkZLgjGFhyERNNNAdNkaS+UY4ZG8Vrjz50A
	VE6DGlV9aUuiJ4WihdAoK7Q5TvyZ3hLuspsB0/ASX4Ta5UMvF7pay8vr
X-Gm-Gg: AYBFou20pkM5E1SKbNlFawfkJkDHyvwS7gTitvcDM3L/UdyuyssmdrLUiWMA05djKiN
	Mv73PVWjoePP+LZhoC5FSa6BGl+ebIXTwXyYXLYjt78+GjpgkH9cxcwz/Dw8y2WuSxquXTkL5OP
	HhnXjkoJ5Kee1yg9ole94zmRc2EOEY69EeHDwE5Hd4oNCOYV0QSl4qid+YCuiWg/XpVANAn4CUx
	6u6YB4mlZFLZ3RjM8pXD+i8TJsu+N5aZ/MJbahqT2cng1Cu+FLeEgCk+8/Qvt+I9SYi+ioDQ3AX
	ZM2yuYkLypId3TVz99jE7qzuXtZhR88tRZ+BMi918IGb8QxPiU5sdkvtWLgrQv/c0M+8gqoq/tp
	mzaGyl2dLVFnecz6pzldEM/eDDvjZcsY70eVPtxUz5jX46SX8UyeP3EH15Uh0fs/jxBN8T32a1R
	ONlESUOFQyu2TB1g9X79Q+dUnn4oQ62MnmbcRfl/6e7tKXvCBiiZl5PWYYOPxG2nOCSo/bCu+xe
	bFBNGQ9WI7QJkmdq/eOrVUKbgoP8+qUcz0Soj0wk6vBOGRVO10sTtbmbYOg46uJVMMJAF8hOZME
	SjGQp0Ar5Wo+obX0WAVrv2JolXbKAve9ENSd2tF4Gx+mw2hXyg9GUJ5J1ZqeETgV9HSCLXWERuc
	=
X-Received: by 2002:a05:600c:3b99:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb8880b984mr52971675e9.14.1795160048060;
        Thu, 19 Nov 2026 23:34:08 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:07 -0800 (PST)
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
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Fri, 20 Nov 2026 08:33:55 +0100
Message-Id: <20261120073358.10267-8-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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
index 20aaf70355158..709cf9674e2d4 100644
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
 	assist_state: assist-state {
 		pins = "gpio1";
-- 
2.39.5

