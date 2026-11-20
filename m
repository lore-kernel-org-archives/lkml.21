Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190101;
	b=D7IcCou3PQL/WPi07xjlovLOR3hhYHsWjsl+d4JgBsABuIP4AuSCMkGZxJAc+wU7LlQ5
	 mMQ7+9IHXpzJsCByk03iECy9TEfrzMoWwWMtdwURbaPxsPVA8DnjFYEfnWAo8YNof+Y9B
	 Cjy5cP5pyHhSRZ+eff3jjusk3VLALr73/YAxQVwNA/ewEa1ppYXy5ldR9cm/U9pR3JrCN
	 6eIgDEqxf7bmBbxP2OGoniLiHxxaPf34h/6YXzI+WpxEsg1GUlrL+LqB7weejKchqJ51k
	 kxjijDO/zGF8pwGdvkm++Fo9F9CIzhc9WhwlJfDP8pBuFRLgHxKq8aIsMyKBo/fytCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
	b=a4TIsiK+hk7rOYtWvGUhJ6Qx9b4R4EZZPoyyYhQ5UrtEpCVTR97ysfIDv1+GDwgRhBLi
	 iOXJgUmMGirlpAGZg12aFH+rEC7rd3AZ6aoN7tqlqCurzg9SVJrG3J9/6t+/XhxNn7WnE
	 /jNw1mvT6GZkF/8jT2yCJ0JBmyigew5fqNnhPcxU0nHYwCmbTjfp6FYHJLIE33Y4+8Zl4
	 u3U3YMarz96qG9fgz4Vin6d1HSdTXiM+6x0HAl6gzsl5dWaz/z2m0UzJ13GvmzaP10J+k
	 deskKvps/lFRNH/AsJwuaXTKTUN6E2JKnVdpMpjED+HZmDP6gXCKXB7dZQJaOBkPJsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LAyWppn+;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0F460A3836
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF0F460A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LAyWppn+
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so9333405e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190099; x=1795794899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=LAyWppn+jN42g5ue/7dWHD/Z8Rwq1gOzYhPpyTTLG+WF02MlqFwSGIxO0B+wQgN5ld
         hIz6rg73oHcqjK7Vag/IpGzqWwwnzY/a/cCaADa5Z0V90oK6ejnhzwJEENTZciKdwXoP
         Gt0WphRiPIhG+iIlFesuiTZ7Yc/Qzbu7EKR0vX3yAE4INm9y5QN1WgMyh2PsHUZaE/xU
         e9OHMF9JkVbKGROqvTn5JYcKeLjhqOTFPEgmKnN1uzVYgJTol12wujkvy1XkgiaY6LYS
         Uu+rFittCfRVMAEKrwKhOvXb3AKOuXRR72c+on0w2EsBbPbTHL4/WTrKT+K+ZJKGswEL
         Osng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190099; x=1795794899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=I/WizopwaGUa1srujQAI9NaxhusMVdFupH8flFgMzgAtCcg9a5SO/4XvYqALi6ryaG
         JkesxYBC9Pg42gt79usjS7OOxhYfgTJ66sy9fx50mlnXbz5i2N76AKSe3utqEMqNWQiZ
         0BKL3f03gG6iILYiWvwxEAleIfayp+GUxcyXh1iJEYQP7YPBRqlA1CXYUOhXlhQM6gBC
         3YrUwiN0/BLTbsA/nbNMv0dCoZ3xMP8FD3M02BMnC421shu/fZNGFPydryXSt3w1fgsH
         mfrOtz5QnCT+gZ2HdG8ZMRtUMrjhAHrwhzpwQZ+CVHV3x797LuRfomIhHP6iqZEetPsR
         UgDw==
X-Forwarded-Encrypted: i=1; AL+hErGzB6WWMM2mqkLhcHe3VdIjQ4yXZnVXfuPJhzHZuQ4nMi0PP/YdMbXrmWLIljC1xsYTjZBHlRz7nC0FqJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LymMCopkQ05+bj6e2wBZb+SOVq4MaZQWrcaUBeumii73E7Zeu
	Gg6zz+4BtKYwfeFI6EDI0ZSjxcjthPl+V+r7gUVOAGU3L2ffRNh8gpWd
X-Gm-Gg: AYBFou3uBX8gJQLTzgJ6YOKfjtxBcMg5N4EvyZo2ZcN7dpHMFH+yLchkssPnDDUVB99
	FgciF05B0rRr4kIBFY5v1c2HUGSGGEwQ4YavoNujmHcfDBQocUtqbPtBKL9c564po2vpHZQ3HhP
	5btc739O4+Yjc7Zgh8AbzI1s5oGXL0Y3CppgYVmTnHyO6vPr/g4OWspx4P6XyJG6bO1YzOkDy86
	7DBwZ78xxq7ii6UhMfjqZuI4Q/DsJhBHtgWlxaWKiA3ceKbN6/tRVlr0sxmHQ5Mfz4JcSUVBblT
	5O7fUVGmnTPnQ0/kqfGzIjZGQBzw4ystSrwrq2Cl9AwjTNP9pgpcR9giado69HQIi6/e1X/qgUv
	C1bv+egEvbTFcn2MzxHWg4Iwz6JwfEBYCe9l9UkjU3ETeLRGvYHCRpvBT0AeG370Fv323yPV5Jb
	fYBVBND8GMgzbdfLdu+CT7imtkZMm5YufE4OKfQClvgkBl7OxDWUEMAyzKofzt2LMXMs4uVi5uC
	zWJrLXUrHq0bgIn9jMC66n1xozXX5RouSH9ZxtZiMT+DOS9cNj4Og1Bd5cjpBWNgNoPGC9AVvsr
	ndntBMJFpDSjTYePHOA8HGz5ahdfqyQmGWpbfbawDxZP413I1I7LyDr/9bheLcWGnwTbkTtKg/o
	=
X-Received: by 2002:a05:600c:638f:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb8881a2bbmr71997325e9.17.1795190099296;
        Fri, 20 Nov 2026 07:54:59 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:59 -0800 (PST)
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
Subject: [PATCH v5 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Fri, 20 Nov 2026 16:54:46 +0100
Message-Id: <20261120155450.7719-8-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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

