Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539474;
	b=Oe0OiYTmyaCwyVWmPLREiWLe4QsYwnD8ePi5QaYLK3h6MRRNo67UyrDsznWIvgZoY62x
	 WMKqM5U541Dzo5yslU+h7KX9j2x27IIYLhI7toGZjUReOAbwszpUokUFkvM9Zj6IpHcng
	 uooLTVGZBRyZlXbfqsE956bNFlZS0HvmxE+KnPRimHTex34NV+0lktmv0TRUpngoymm4N
	 epDeIbv9aO/17YvW97DRMQ3XqwSxhpf6LIE/+sA39woScbewQTKLb3O+PQkBg1OkM8qAC
	 nc/pCbpuFVr7abE7Cnf8Oj55GdRzqL/O4+1DpbJsYuvbdAKUAyQJ/4FcJ/rm3pvwjuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6PdfVkJsthvasH7nPprFqYVw7CJ+aqmYwJG5DCNuqRU=;
	b=ThC6MtNm3GIqUpNZhLVKVACtg6rbGC9cstRQ3uwp2xEh3ZsuzwhhUq64kvGtTK2S5k+M
	 YJKGHA6ufFZOKuP9wSi9/eBeVc8bohxcc7e0K4bQhEgxRtJZcOPPodVzEMwmQNW20BQq6
	 sgDeUPnJiCj8OdEDBGNBmVkrFntaLDAkrOI3TnsXN9L7SuEPUvB1gOEV5v7W+BZbg8V4O
	 s5SPbrLj6iIFSrcthCWE9KeAJQjZ2XCLfMHYkfOzgbbrqXgLkTvX/BTbh21c1WihSwcPp
	 IuNL8P6H+TOhENayGXG8U0rx5+iakrSufkp28lwrqCq06LvCKX19oKZJ229hqjjik+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SsaHbPqt;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00C7606A699
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E00C7606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SsaHbPqt
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so49299255e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539472; x=1796144272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6PdfVkJsthvasH7nPprFqYVw7CJ+aqmYwJG5DCNuqRU=;
        b=SsaHbPqt2wiuZ3wFAb0oXe+C/9aNi3Mm9DyTRzhnZWcHa6c0/ZpSUvR2yMzbDhMdvP
         7hZ1NwNTD2xL4ga1mTU9NMTx1wSGWoUx3mL26v4XgOvTu+GlRk9x/YpcNcZdz6sz3vC7
         7Fwpgz5FfzyGaZhoFIjLBQT9XB8LhrnMJm+WUK9D7KCeqKx92ezp6VT9MkLEx8zkmbUF
         MRKLO4C+tx2YGl6SQPif3yRzt/5ALj/rix1TJ/E04ggcioYPT6SZbuZkblikiScs6dNo
         cpqVU6pHW+7kwLq6Eg1E44pARvoMP49DZXX2l9msZkuQyANQBJJb0QKCHd08NJjO2eLc
         krAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539472; x=1796144272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PdfVkJsthvasH7nPprFqYVw7CJ+aqmYwJG5DCNuqRU=;
        b=N895JDl1xLpbZ9pQOmrZJC1P/6Na7sOr6x0wE0yr2fzJ8H7qjA2QYddQkQ8aJkZ7Ps
         PfqdKtpTQX9bpHhehERT9wlkLgjWDDBPV4uWYEldPvJBH6h7l670dpQF2DOGT6JDg4B3
         v9iFWgfIYe+HrXi7uoN+VSE1V+KJw19A/wVk/0tod1BWR5hIICOBdRFc7ZLFmwKn9Wkt
         Ohk7fPkR/kfi2WRXsJcY4nzV/Q30Pqj7TVQi0hv0fdk0KfL2KZx1KyKeT12ngjFoxpRy
         2Ts4GYt8ry/srsgGzRj1sNBcQopcXP956zigkpVjQflf7okC96avBQhNL9TzcXnVIOF7
         Uxhw==
X-Forwarded-Encrypted: i=1; AL+hErFDbl/rv/3OG7iZ9PtoiK/GB7xG0bpX6P+MkH5zCwW84VtSqttLPTYRu1q4A5HbuheR4tQB1kicW9q2TWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fa5wY02Z4BwCwwI4IOqcCLceWugXPTTm8RpXy+n0x48KuMYDv
	8JOl8rG87zfsKsBDzVCCkKMsGY+M23qUU19WSK4ybDeUFXJoLpkgZaxf
X-Gm-Gg: AZFdTZc5O4GxjiuPUwm31OZO0/dIMGJZsRdIx1z0zL/FyAlwNfczBmY6mT4AcnzTPT/
	qsavXgI/YgAyatxPEoX/0dCraezofSaeL8254ZNJtItVswQ1G8vxSoUtedXc0hMjtr3lvHCEGXs
	IqlY9nnbpkHwAE/XVwnxd7qBngRkRO5BkH2UPgXU7ZGBB+10NuCFY/DmT9xsSZKLqdQdi0xcS4M
	7dVObI+hHlbf9CvYaX1F6jbxKhGr0QtkcyeoFjd3FrG8AxHS1cAdyH719pNsGL6Ntrpl/J+VJl2
	7m37fZK7/ymOsDjOiITxMfXkW1NbOOt5qXx4FbFeofP+CAWKsRN6IIdr8JScLlAvSE6GfBBIU9l
	3Mh50HXWuxbSCMijhEZ8lxo0BIPK4e6VPHFYgbuB7PJDEc4itQQcVaDMeTX88Nx1lPE4xVLsyVv
	vhzaTxok+hhST5zIE4QHxp3/inGHm/P0RZ8S2uJDDy7JnqFVSCBLhnQ3hO4vqVIIWi/a9VXOzP5
	RWAM623hs9hgWx9Xg0in3Pwn9jKqwvTKHiEDHKhab00AgelZpqp3nHk9LkRebZ0+jbIWBUnv/rd
	ggiMUvoXpUiLVai7RXgaEAlh5OhKOqX6j93g+y3rlW+VeXpkwMfaAZlw23X02Sx+EA==
X-Received: by 2002:a05:600c:1d09:b0:4bb:73d5:ab33 with SMTP id 5b1f17b1804b1-4bb88816acemr336845335e9.22.1795539472196;
        Tue, 24 Nov 2026 08:57:52 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d107:658c:9ded:696c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm28794104f8f.20.2026.11.24.08.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:57:51 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 24 Nov 2026 16:57:49 +0000
Subject: [PATCH v3 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
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
Message-Id: <20261124-sdhi_rzg3l-v3-3-67cdc83b7e48@bp.renesas.com>
References: <20261124-sdhi_rzg3l-v3-0-67cdc83b7e48@bp.renesas.com>
In-Reply-To: <20261124-sdhi_rzg3l-v3-0-67cdc83b7e48@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795539468; l=4256;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=qbKI0AeyhYw63CPq24tjTlE28iA7J27+4y3ucU2nH1U=;
 b=k1yn0HdNerdQolOR4qFz0o5FQH74pwwLvbfb/m0s1h7x/2E5UYetKERmh85xK3Hb4HcHcct0j
 8gMF5HB1klQAgUJajviE7TsPKWQRGQ0rqM8qfee3tt0lbB9mrlIEtrd
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable SDHI2 on the RZ/G3L SMARC EVK platform using the internal
voltage regulator for voltage switching. SDHI2 signals are muxed
with I2S0; the selection is controlled by the SW_SD2_EN macro in
the board DTS, which must match the position of switch SYS.4 on
the SoM. By default, I2S0 is enabled.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3
- No change.
v2
- Added a comment about the SD power signal.
- Collected tag.
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 11 +++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 88 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 2429f09f4949..abe0ae7cbc44 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -34,6 +34,17 @@
 #include "rzg3l-smarc-som.dtsi"
 #include "renesas-smarc2.dtsi"
 
+/*
+ * The SDHI power signal can be controlled either by a GPIO hog or an internal
+ * regulator, so a customer design can use whichever matches its hardware:
+ *  - SD0 does not have an internal regulator, but SD1 and SD2 do.
+ *  - SD0 and SD1 use GPIO hogs to control the power signal on the board.
+ *  - SD2 uses the SoC's internal voltage regulator.
+ *
+ * The mixed usage is only meant to demonstrate both options. It is not a
+ * hardware requirement of this board.
+ */
+
 / {
 	model = "Renesas SMARC EVK version 2 based on r9a08g046l48";
 	compatible = "renesas,smarc2-evk", "renesas,rzg3l-smarcm",
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 5e67bb5752fd..7d4d32cd9d33 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -42,6 +42,7 @@ aliases {
 		ethernet1 = &eth1;
 		i2c0 = &i2c0;
 		mmc0 = &sdhi0;
+		mmc2 = &sdhi2;
 	};
 
 	memory@48000000 {
@@ -355,6 +356,74 @@ sd0-data {
 			power-source = <1800>;
 		};
 	};
+
+	sdhi2_pins: sd2 {
+		sd2-cd {
+			pinmux = <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_CD */
+		};
+
+		sd2-clk {
+			pinmux = <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_CLK */
+			power-source = <3300>;
+		};
+
+		sd2-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_CMD */
+			input-enable;
+			power-source = <3300>;
+		};
+
+		sd2-data {
+			pinmux = <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_DAT0 */
+				 <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT1 */
+				 <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT2 */
+				 <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT3 */
+			input-enable;
+			power-source = <3300>;
+		};
+
+		sd2-iovs {
+			pinmux = <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_IOVS */
+		};
+
+		sd2-pwen {
+			pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
+		};
+	};
+
+	sdhi2_pins_uhs: sd2-uhs {
+		sd2-cd {
+			pinmux = <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_CD */
+		};
+
+		sd2-clk {
+			pinmux = <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_CLK */
+			power-source = <1800>;
+		};
+
+		sd2-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_CMD */
+			input-enable;
+			power-source = <1800>;
+		};
+
+		sd2-data {
+			pinmux = <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_DAT0 */
+				 <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT1 */
+				 <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT2 */
+				 <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT3 */
+			input-enable;
+			power-source = <1800>;
+		};
+
+		sd2-iovs {
+			pinmux = <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_IOVS */
+		};
+
+		sd2-pwen {
+			pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
+		};
+	};
 };
 
 #if (SW_SD0_DEV_SEL)
@@ -386,6 +455,25 @@ &sdhi0 {
 };
 #endif
 
+#if SW_SD2_EN
+&sdhi2 {
+	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&sdhi2_vqmmc>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&sdhi2_vqmmc {
+	status = "okay";
+};
+#endif
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";

-- 
2.43.0

