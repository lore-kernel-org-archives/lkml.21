Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005531;
	b=o4zuem/Pi5t35jAFC5gXCbPpy8J9vmGlSjtx7oECnylu/JtJUFAY8Cve/oH4ntOmFiEf
	 POiz0xe60Duu3TcAHR14djJgvSlZu4RwxvOd89VLGd7ojjTQRRwzWfjjpuAzoMkuBvC90
	 9IUbK3FrYlHkx0D4lOemx4t6mOD+V0BXJbUMZGXr/CpXmM8r+fYx7a8xcn75aveJcxcm5
	 1mH39SuyZNIoI/VW36+U+Of2JzCd6YtQZiLiMVjR0Vgh9oQ5Cx3/u5uttEKtyF4u2v8Ic
	 57S+7hOtilZUtSv5bnr052wUzW9/aeBRptZSLTSpFtmZAZzsl9GgDw6hG3YCVn7MQew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=;
	b=MhgkiGgJ82XLhEuq1G5yCgQVrYxVW60M0tMz0Gb5XhoX0tPP+s9gGUZVx/ygL0JJLUmW
	 XAvGgLfETH8yHun/U/hJytvcQTaTCRUYuPs1L2uRqq8vnu4y4zJALXmpdG/O/UBdUAE50
	 7QoSNEdaoYCKRHeQmSqBOAL+kUBDDhoth1JkCmc2fPx79FvU+SCN4GbHY07KoyXepGFcW
	 uFKv4NOsFHP7MyH/iGgkyF3Riw32/vRsjuySb1iyZtaW/rzX7YQ8cE/ffVcghTX8W4Gsv
	 FWt53VJpGspotKiDmwuIHeT4TwRXM12xQP/EIyqiP1zG2ZopyLuecBBtn9UTgDHqPPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fm2N1TPH;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE74606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE74606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fm2N1TPH
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so582089f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795005529; x=1795610329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=;
        b=fm2N1TPHFZW+8XtvDSptbIQXDAxVVWA4ZgVH2l0fys2x53gBJrZ2xbdy+Sh6Ei1ZZb
         roVAMsT/7+i/OxJFYFcBBU2yyEahq4CfLwaE8aWTMaDIHyelF9kPErugI/+sB4exacI3
         nL/jwB9Zfp9iQYYs2VtNwSIfHt0zfC0so2iUEk72FUihWnJHEmyBk1Iw6tDCtiQsRJqc
         P5MZjm+lZfvJLFPQqIXqpKyTANdl3Uwxqu3Ik/UfyPWmClZWy4NxSJnr8s18cJersPa9
         IWujiz/S5uJ7jDgTsHfGpank1G3/Z2d8M/7qOR9xGyQtjY8vHydwnVO5hNaP8uTTpiaC
         R0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005529; x=1795610329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=;
        b=K9zBsZ7VKG1v0XJmS+gOSPdNBRNYdJxK/qtrvVlyDZlonXWPf8h1AjNJRrSNMROCr+
         i4D781toRUYpz12/yiJwTZBHAF3tOEr0dMdRI5HM9+o/5x30qji8g9FVsOaYgN/HX79M
         3zlcYgqIZnYSsQnN5HpTyM4vH0Wy6s7ZStkjnsodtuVhcsd6zfcMKSpXziuD+30IPv6P
         5BIYKWGf+xlat7sTUb66J+FW0qmCM5wtDlEuUIhpOEGWxIfXNmTo/w1evisCdz4Uysmh
         tRX+rUnsYmtqdvM8fY3nShkzwbJKrOb5pJn5JAITLL50EtHmNJ46Fom+1hfrKbRQukwm
         x8IA==
X-Forwarded-Encrypted: i=1; AL+hErETWwVkiEI+2TqzJM2Glr6KAY1VydYYpQacDXv0HV6AkX68q6UjAZdj0XtPpAzXR1ilbH54D6oSEbMo22Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iH7YJ8FaQagw17NUMzs4jLN7YcxowxIopFDVGw7FC/9vp2j8f
	UOuYyx6Gw2JnsUHoc2C12O4AmRL9NPgq+NfEKqYbwaTQfkR4tK/ja7QS
X-Gm-Gg: AZFdTZeEB27eWg80OJ+tP4oK1N3j5Bs9y+pk0l4s3TDzI0qsKf5Id7DLr6QKAEmxOF0
	iaWIkRdGeCUIy3KcY57bf7tlAPs9yzGAOK8oT6UGMRJhDfUd4upDWwCiwrkd1kpCr3Vq94AeznS
	toiigKmkx5yufcy1WnAKCNlttdydCZRaAX2nlhMiEXBxjuQk6u8wOlqf8ie0ZHV9pBlYFB4SiZu
	6YleohOmeOnaoQoA33MsCLzjsM1+4FOzBUTbRw11STqbtbXbVyLp7sAqjhiR8Psf0ffkx52AADf
	A909dmM5n/DtSXz/AISCuvMRzTUMxjHedDrpwS/oi5BkypNwTtX+Bzk398h3P5U7/RfUtCPRbr7
	f/LkE4Lhy5fY0NU/Xi2h5VvTMBxBjaV++lv8HvdjduX9tEOfxaQ+8IQX0+0/N1NEQkcpub0NCj9
	8prJ9JrFJwrMvKxQZ0dD8qwFFaZI0/lhltRfLjZNIejvVsOSx8jHZjZUrODrCbrCzFRwM9Z5jQg
	ArzZvywUG1MXYNDi8mBNhI15TV6raJaBS/LZjihl/OHMJPeo+LRkLSbMY1Yxj9dCeGzOqKwnSwe
	QPgYa2/EzUeAqeHYefjXMckIUWFpmx1MCQ==
X-Received: by 2002:a05:6000:1a85:b0:4a7:ed95:7c9f with SMTP id ffacd0b85a97d-4a7ed957d61mr1616041f8f.22.1795005529035;
        Wed, 18 Nov 2026 04:38:49 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:370f:e244:9816:c590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2efcdsm4539201f8f.5.2026.11.18.04.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:38:48 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH] arm64: dts: freescale: imx95-aquila: Add ath12k calibration variant
Date: Wed, 18 Nov 2026 12:38:37 +0000
Message-ID: <20261118123837.651915-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Vitor Soares <vitor.soares@toradex.com>

The Aquila iMX95 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The
module reports the same PCI and QMI IDs as other WCN7850 designs, and
its board data also comes in variants for different regulatory domains
(US/EU/JP, UK/CA low and high). The IDs alone therefore cannot identify
the right board data.

Describe the Wi-Fi device behind the PCIe1 root port and set
qcom,calibration-variant to the US/EU/JP board data.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Depends on the qcom,ath12k binding changes in ath-next:
- 75bc725cd92b ("dt-bindings: wireless: ath12k: allow calibration variant for WCN7850")
- "dt-bindings: wireless: ath12k: Make WCN7850 supplies optional"
  https://lore.kernel.org/all/20261117174154.549590-5-ivitro@gmail.com/

Until they are merged, dtbs_check reports the missing supplies and
qcom,calibration-variant for this node.
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index a1870f7b2eca..a73d137af2c4 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -621,6 +621,14 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		qcom,calibration-variant = "Silex_SX-PCEBE_US_EU_JP";
+	};
+};
+
 /* Aquila I2S_1 */
 &sai2 {
 	pinctrl-names = "default";

base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
-- 
2.53.0

