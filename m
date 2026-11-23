Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425655;
	b=f0iWGSAEMj60V9U1bMf6v1yY6UU8D9WkVwFCrSJEgNTD/YSDv7+D/M815fvTxHsim4vV
	 UEhVB794Mb6NxxcOMBjSnbHv0UXMVxs7qAuevDI1ApPiGMedqHIk8VIgr0UG9jD3jkUIk
	 9fi99Pavzd8v4Jb0dkKG4V4b+MLm22PZHXv4MQlV9zXia1tmUIuBuswae79UNE70WZu4l
	 4QlJJBuqDbv4gWsh6iINcgbC5/7dk0yfFuup/ksyyjVwPdAjTHdFu9cPwsO65SEJvy6ql
	 2mzW1w6x7w6EU4E9ZZLvhsJm85YfTYJcczrATo2fDDGC4TpVZuq7sRrv0cxpEa+sGvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SlPceQ/NGCnBw4wRJ/5LfNtk5NdmNItuCsSpVWw73H8=;
	b=UTi08mPHjk8bVPoKIHwZUxa6vFEbFIRknRJJY9pWwBJU6Odq+y6hCX2Q59QILNOSnnVg
	 baEUWmxrzuH2WDA9Hzc3x1XmsvzSRRHqzg37Dev3jHCadvee3Q4dGu9qq/Xk/f6vvxtLB
	 FQB8ITvuo7GvOcpxajyMVB9ouEYqn2gN+w3Pf6QmI38BHFyF+kDrvPsR4ZDOcje+CryET
	 ygWIaZLxB/ubowwfUxpAc7UeTflNt9U6joIioWbv7u3aH8HG33UGwhGDud7y+qsp0/NOR
	 KnMqRNWjiizfM/9cmB/DAI09ozzEd79JvSKVrMzbFbehIdNaVLf+Ej96sdeysaVnm5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KM35NkGj;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCF6606A69D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADCF6606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KM35NkGj
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so16419145e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425653; x=1796030453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlPceQ/NGCnBw4wRJ/5LfNtk5NdmNItuCsSpVWw73H8=;
        b=KM35NkGjPE2KcVY0hNGgjkH2RPxKUAVgtQ9D08LXNg+4BhBtc2t3rAYy+MvAOlzyh9
         VLmi1FuJE9FZKFlkI3iq8KJ6LfKXPvQyXi0sAc5DUz2ktutL6FjQ9sGzJLpCsT6nj7ZC
         N4LmswOu/FjnzJ+a/ZzxDMmAfBbzbUkukzCl411FZgpEyRjVIyxTFGfVOUf3ujFc/XFw
         eG7oxEr83YErWwZZMpfpJJeAeIN3Hxefo2afQqEqdABCvsyufB+eRZE2uhfZJBt96m0g
         VrexfjEFeIHZKLzzOuGd1BsvOJ0M3HRq6i+kfMfgo+WE+/PCCo04U93AvKhoGteDAbYz
         YFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425653; x=1796030453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlPceQ/NGCnBw4wRJ/5LfNtk5NdmNItuCsSpVWw73H8=;
        b=kku2dQyJxEWU3r3tmjx/+EnLejaXckW/niWrWaYUeE9lw/Phz8JyUsG132eaMkw5XK
         RGcDDvta40v2qoWGb8EmA4PZhM3cI2PKTJRU0cF4ErehptdvUwvQy8McsjPq24mB15GL
         LP6vkUluLle8/qdxNmNT/ZuS8F49EMdJZZNJA02hVA40AJMG4FjK2/tP9vgY/ie2ka6y
         fYfoOl4dZcZLeatGoYymbHwYja01RphjjJ7pveCN9kovzPe7/F996mHE3cBT6jFuZ1mu
         EQAI0cHgXarHYATaeUNQFyDN2pbLI3daWk3QX0s3Xx/zYdCCz6XjVocqgzobRYbHa1Fp
         WPEQ==
X-Forwarded-Encrypted: i=1; AL+hErHFETLSVhLQLaDDf2jUyO0gBrpi7JAdiGePUgSuXJtixYbtGdp8Ius988EHOaVIS0wjXln4kCBU3jb7x8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xy6+LNwc+afTc8eSXJcx4IHw0imHc4zpp3mJCab2fJr8Mcc4l
	soRscR8pwL3/rCmJcf6ovrjjkuK9WyNDeQDE1OhVYLEM/XNui9MHV0N8lMekcovOgcU=
X-Gm-Gg: AZFdTZcZS10geCLnn8vIirfWu+OV+5qqx+qAXfECPZj+VtzKuOAIU5z4+M3KmEJk3vu
	TVdEyVdRBt7v7mHWK5KjBerh3C6YrprKVuuyo6sn2RJyllCd23WqxJhtrmoCegCf+uvTo/FHjuk
	DIVeZKA4XgjElxJ90gclrxzVmIn8AjuAPOE2xqoJzXmcBDMB35ny7k4eEOS8ynZv3zq6N4h8QvZ
	+18C3rPmoqvjn7227H5mAi/LteNXA2PmeopSZtVofMK5WgWj5sj59SycllEW04/h7KDwct+WdaA
	Ykcqpc56jnhERYiS12D80CX7Snlws8Ex5xcR2jsiXomUsOSqG9y6g5Hy5rbaoT+7o3dz9nHOV6I
	pGlqd/3Wi8Sboq7JabdY74ELCBoLv9dFQMl4SFTzOHG44+G6uxbf65SjCO83ABktVccGWAL+g0s
	07+V2siL45luUMKJrEMwojU00bmmu/QoaDCllS+xWPgO/mKdQxV5dDdKOm9mCCx1Lx3QNgtItBs
	ImB07PV4KglQqEr4Y/osRab7wDGaNuvsl75XeMwiFPfDidWNeDcjt5RmexXWzQbuZoUT6xlZ5Ee
	Mnh5d5dOZj1/yJC2madXKsgP3twQ2s+TWyGMloZHa9djkH5NS0uMEGv4V/POv6y68H2zbmgIJr6
	9Ccttj0fVnCxEkejthZbEy0QqPLOQIQEPP74bK9TGkGvXUA==
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr218707705e9.10.1795425652884;
        Mon, 23 Nov 2026 01:20:52 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm296458505e9.12.2026.11.23.01.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:20:52 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 23 Nov 2026 10:20:47 +0100
Subject: [PATCH 3/3] arm64: dts: amlogic: s7: add the peripherals clock
 controller
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
Message-Id: <20261123-upstream-s7-clk-dt-v1-3-95f46d67d8b4@baylibre.com>
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

Add the peripherals clock controller of the Amlogic S7 SoC family.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index eb123d022bce..5e0cce9149ff 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -162,6 +162,40 @@ apb: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			clkc_periphs: clock-controller@0 {
+				compatible = "amlogic,s7-peripherals-clkc";
+				reg = <0x0 0x0 0x0 0x49c>;
+				#clock-cells = <1>;
+				clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+					 <&clkc_pll CLKID_FCLK_DIV2P5>,
+					 <&clkc_pll CLKID_FCLK_DIV3>,
+					 <&clkc_pll CLKID_FCLK_DIV4>,
+					 <&clkc_pll CLKID_FCLK_DIV5>,
+					 <&clkc_pll CLKID_FCLK_DIV7>,
+					 <&clkc_pll CLKID_HIFI0_PLL>,
+					 <&clkc_pll CLKID_GP0_PLL>,
+					 <&clkc_pll CLKID_HIFI1_PLL>,
+					 <&scmi_clk CLKID_GP1_PLL>,
+					 <&clkc_pll CLKID_HDMI_PLL>,
+					 <&clkc_pll CLKID_HDMI_PLL_PIX>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_ACLKM>;
+				clock-names = "fclk_div2",
+					      "fclk_div2p5",
+					      "fclk_div3",
+					      "fclk_div4",
+					      "fclk_div5",
+					      "fclk_div7",
+					      "hifi0_pll",
+					      "gp0_pll",
+					      "hifi1_pll",
+					      "gp1_pll",
+					      "hdmi_pll",
+					      "vid_pix",
+					      "xtal",
+					      "axi_frcpu";
+			};
+
 			clkc_pll: clock-controller@8000 {
 				compatible = "amlogic,s7-pll-clkc";
 				reg = <0x0 0x8000 0x0 0x1e8>;

-- 
2.56.1

