Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425653;
	b=XTC7AhHm9XDpFDtALbpskxWxIcVBU8Pit0SY8tnrU2H/C+OZTM6vY36EZtjEqwcPsEAJ
	 ruzNHoWlz6vHztaQG++jjSoLXYkq9DjJ1ZIwek3BowkFfDbuECECiBDz7+SEVhxYd10B0
	 pfaw7XQu95kkk2Jkorq9Lz9JPGU+OvbHUlkJp+3zrcihe9EMlrS9x+AN+I46mmyeOfZVz
	 vSZegx8WxTMIT23CGXBMpulel6OouwgELpyLgYaqo2tNIRx7NVnokXftnH26k4Cv0GDs3
	 N8z3lGffbssXyP0sC5JrDV/l3QuevUYFeVFsGN/TrfMjDf7vXTB6zw+vF5fFgaopKdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=IOJDYtfScd2t0QcK7PUKDNPXJ/Q/smzuGFyvSLeCO3Q=;
	b=Q9wRRDB4msQmTjVD5E/atQmlneQSLkyYIQO3GUIb3L6cRaEldOfpNNb5vFyaEJFaQwXm
	 ExqyXVx0loT1MLsbplvTE7Vg4wyzZvXMMjH51QOdv5ZxWzw40VRK2Nfx7orkWmRpsog4f
	 /rYjkV/hwRMHESI+0JgX/4e9Pl5yblCPiuoWriSrXPw3zeJJAkbGuuU2t+dM8t3JMYP7N
	 s6eOsIzHegigQ9nbxCk6LhDm/c5uz8exNSoKAYpTbcJod453OQzf07N9eZXGwgNxoNcG5
	 +FHDG6wqOI7k+5ajV8eerIZ9b2aHf7AzhMzoT91AHaBEyIh98X9xkRExngmAaGbHLdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lEpqdFaE;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9595C606A687
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9595C606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lEpqdFaE
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28530935e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425652; x=1796030452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOJDYtfScd2t0QcK7PUKDNPXJ/Q/smzuGFyvSLeCO3Q=;
        b=lEpqdFaE07TsAr7exCVtdRhv3oKb7jtKTc85YgVZ9z981Ij4+AdpasPg58CZGQ+SD/
         O71sNYyXeAGg6irMdR6pgsARnNvNFcrKZGf3dnVABVTSGXJHHHWk/sLsB03B/3NePgHq
         vlzF5iBjPOwGh96MXYke8PuIMKao/xllN4opX5AHZIzwDx3NUJDZV8xyAFC8YIzHj7if
         5QpZ4DS4mihJJkpcVRURhAm+2zF1Ubsm8f5oKtrHus5siSUwKBz8s0tvrBux3PGuaumC
         aAlj7SVtNAz7A+5OyBGPCnXRMUI/enuknfRCVd5jGYaL9UyM0tuxhEcAdbWUi+3wjRC9
         T+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425652; x=1796030452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOJDYtfScd2t0QcK7PUKDNPXJ/Q/smzuGFyvSLeCO3Q=;
        b=oM+rxz6+O19THG97hw12U5D5cHjzfKrn3NkORXHw1cLr/Jll5H0JQ5nNykRtGpZtik
         xaRZhh6NAr82FZzn3oTdzqjKHoAoELyYW68VT4k2kaqN5Oj5+GQ2hYdBbiQ1vhzYJpC0
         56ivQVPMvaUmgY2eFRACUsMBg2mN+e+z6LSBh7t70m9nqx0ZZ6jRHci2raf4G6dn214A
         vkfhUEiD+aKjyoGcF2nTjPbaXAIRcMUwN5jAPomDNg+bsK6aaS9QvjF2RiKWmQlj9eq9
         2/YrV763bh9hUZcajstyfUaWDz5ihj0eGVeE+g7iYEaa6TYUxZgfwHZp48c+u5xkN6Mf
         Zu6g==
X-Forwarded-Encrypted: i=1; AL+hErHsBzGU2rbBnJMrMDL3cxISytfl5+R7ESPQ0nMSntXE3MO8p/aQEI03SkGr1263i1Sucipq+TdzVn4L+Qg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aan8Gyfeu6jk+9WbY0n+t8F1/MZWUHBiiHT++ukPJupyc6f/z
	COI6NVUEw5lfdmOZJ1IorGF7OBJ5Cnt+gXOCGx7Uh8rmUW52gyeI3tPsdoR+uT9hDhI=
X-Gm-Gg: AZFdTZcnENXVknREmHlGoEBLDQn2goApA8axJlID8lqvxd7mUtfznMzHH+fR1CZjy39
	hHRQz64kgZ7AqAd33Zp/XAi3r9q+E6J9DTnxIC9E8z54TP9qbmhj5b5hNegkqbZBF23k3QQWCrO
	RApF9nkJOTMHXZA4EwZ/K9qJJgiW3XijDI1ldTU2YLQPf8QGeABP5Z2BJ15YOT0C2qo5PGY4WcT
	R/EzBK+LuJVX7+N5NW57G7wpj6QfiTkvyuA3v6Nn4edEktJ1iN2qKQeDFlQAOsief8MVwvOim1I
	Abn5D5EceFiBwe6OcbGPQQbRpVyxfi5mOxRprHmcxQ7si7qTS1LZutSHvNutkSdQR8IWsEkEqwO
	d2wWwzYGBNYJBHtln01WqemVCW7IspCRLG2pqDmE3NbzLCbPvhRDJI2xT9e2rYQruNhp+zjPzGl
	RkFzZFgss3MP3tZT9v+PvMDQ6ZQ5yj9VLjPGJObeCBasw5qD1bT6p3mzJD38y/cfi7aBnbU9RQl
	0a2aQ4/5hY6fPFOESPXMxckueLRLdd+lMFgAPGXSG+H3rJuhI0JFTzpvcBz3ix5HkylQKDWp/9z
	Bk+Psm4RtQ/bwak/ZwpI4Ve6MI7Rp+nyND4yWRDx8uYeVXaVPEfD0lYbJOh5GB83W2USdWpWF+t
	gHh+3OogwWBxG+T/QU7RVpmWbsIPxu+MwCZlF4A4Hf6mfFg==
X-Received: by 2002:a05:600c:154f:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb8893a963mr216221585e9.30.1795425651936;
        Mon, 23 Nov 2026 01:20:51 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm296458505e9.12.2026.11.23.01.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:20:51 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 23 Nov 2026 10:20:46 +0100
Subject: [PATCH 2/3] arm64: dts: amlogic: s7: add the PLL clock controller
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
Message-Id: <20261123-upstream-s7-clk-dt-v1-2-95f46d67d8b4@baylibre.com>
References: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
In-Reply-To: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

Add the PLL clock controller of the Amlogic S7 SoC family. The fixed,
GP0, HIFI0 and HIFI1 PLLs share one SCMI reference clock; the HDMI PLL
has its own.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 69dec312e7d6..eb123d022bce 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+#include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>
 #include "amlogic-s7-scmi-clk.h"
 
@@ -161,6 +162,22 @@ apb: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			clkc_pll: clock-controller@8000 {
+				compatible = "amlogic,s7-pll-clkc";
+				reg = <0x0 0x8000 0x0 0x1e8>;
+				#clock-cells = <1>;
+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_HDMI_PLL_OSC>;
+				clock-names = "fix",
+					      "gp0",
+					      "hifi0",
+					      "hifi1",
+					      "hdmi";
+			};
+
 			uart_b: serial@7a000 {
 				compatible = "amlogic,s7-uart",
 					     "amlogic,meson-s4-uart";

-- 
2.56.1

