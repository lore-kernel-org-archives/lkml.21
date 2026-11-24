Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521901;
	b=jIX0yEljgqHtpw9T7crQXA6t+An0tz9AbemHYPGoAYaUB0VLPXMwkSDy+6DkHOB2K13f
	 so/krxEl3vWVqiH9IUcDJWipiOKQEtRPvlJp9D+Hjbd2TocwV7AFvG/hBvnoDTbEIQSMH
	 yG/PsgQLFfrmjLX2GCjgH5yTA1xXoDS39C8ckDj56x9f9+ea+kyQxk3ZKYLgRlCNk5c+x
	 P+zW0p0x7xWXpwOvdzpioj+MKJCEANctveze1t8Go8kkyFnUwr5u4yOvqRa6KnT4BYHLY
	 qdrj7Ynh4cC/WOEaTox8zokINjrYUxjuXvX3g8qfNuIus7sNmiYjyEjYOADUgmFDLjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Wr5AGl2n5OMdlwfzUx+Xnt2cvomNzozcQctK34Lni/M=;
	b=hVtW+LfLtVcorgmHRA1pIhOg63AWDPH+c0ljx2SytQYs0AfMK9qadM9XJATciLq0cT6z
	 8s4E5+MiEbMpFOqjVjzeYvspzEtQDWy6k84WEH6zRFVFs6hjyv5euYeGXYmIWm6C3qps3
	 L77mHoMQBHmSO7h/k1LhfYLohW/Uq5ofUyrsaVuUMWGNCNs4o1SmNJFqDhGij+sOaynsK
	 4+KRSdYOxFOoneYive2a6ufHcGcPVuW3biYPBYAEW1rerqfC6q3pc/JSXsHj+BGX8EadH
	 72MpLkN7miGrjQUE08wcw0EwnUy3GuTSABoPoFtdBwjutdw3KPCDkgdTE9TrgCCb+4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=t0YVZisw;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F344606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F344606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=t0YVZisw
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so40269815e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521900; x=1796126700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wr5AGl2n5OMdlwfzUx+Xnt2cvomNzozcQctK34Lni/M=;
        b=t0YVZisw8jYMamkrDRhisuwZx8FBZypCiZF0GeNqqepf9G4hoWxl10N+1bcOYXOtES
         WcYzoHrDcNUo89UjDmYY7o/5Ml+/D3vYSSeP9VWkjA+YJNafyIjq80esKSK87EDIfHFs
         EkGCDyV3KOjQhB0DY5FxKeoK9NffoCMbWVbFCQKigSeIpnZ0Yoc+/z4LDTkA1kg7bnQK
         ODtR5P4ZmIiiEWGLusk//Vkrh2FvwzwPPp5HVT28ISBg9+PeQkxdI1oBtKuoNtY02eFr
         yjvScfbNhVmhJupHaRa71rWC9V8cjw/CiKmBDCf8MGuYeoaD2D0EKFIACXEcLlzY3CKP
         kWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521900; x=1796126700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wr5AGl2n5OMdlwfzUx+Xnt2cvomNzozcQctK34Lni/M=;
        b=eEuVs+w8Jnvpk7LlOfH4WkEc1ijNkocIIdYYvqAPzKVDlzFBuX4lR6bUUE42QniZjl
         PrMiiJnf+eqHUCA0Vp+ShYGuTHHxzv66dbFJ6jQuiaEhU2Go79LVF7sDokFPangO2GuV
         IAiSLYnHHkGg7pF3TEaoddk18aRre90G5vI0y18Hfq6ct50KTSPBKj4MK9NZcmcjS/Mz
         syjMnpJXJYYE/jS0SokhGmNHvbiLqr2cAGqgQuN2NJmk+AXyn8t6YLEmFa70siNEUxVP
         GXX7yT798krr6eH43pzln+M59HfGUKRPR5Ju4QeEucDLCx9Q3XjSg4SaZBxHQV5Gg7A7
         4heQ==
X-Forwarded-Encrypted: i=1; AL+hErHUJ70Kwtjk6wqAOsG3wqmRkjYygd/il8eZo42uAk0GFyHttSa5YofbvAGbtsQjeam9E5ZK2kOMs3jFC2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yLP7l1HHmM+d4zE2m49CPRi1ESBJmRrkdhQPJHx+feSRjNUQg
	43lrE1JWpbe1Oy88ixonv6Ve9LVW6qjTVKZv+AfpFuZ8oGe37+24XzW3BHQBv3MXaxXras2p9eT
	GFO9W3k0=
X-Gm-Gg: AZFdTZcIHmUqAH2GUafSNwotiCAxj7pcTkKRng1vxfqHbiwklne8lnY9cct6eGmadWS
	CFG6LhwjTdepyQ83BHd/Yva8QPfkqPBDMEKAjgCxrY4q2Z4jvxMiykClPdRGDaLub7pyNrwEbiW
	gWzGjdcyDBksuGiVju1bueV90WUxFEHC8Wpv7johXildXIpts2Km1ynf7dARgPNsJOqXN82jdOO
	yo7b3yQRkHbPHRMfdcttrxitAGScVGunqVdmdQqFvYy+1U5IR2rg0LuGUXWPUtAr0W9+IJ95oV6
	FXix3w9enXmpYzOX+wX0BMZZFtMLbLF+jknxPZw6zeZ7iOc+pHMUzuT+tFKbCrfqDRpuDHlMH+6
	/0j1jEYHrT4RPoN86di1q394bI1mkrPFP/YX+TTKtQJ9EKWOU/crs/kwHgZcPzvjt303zq9LtQ7
	vwD7YG+sAgxIqik4AuqhxENQkBQ/gQdYIHQBSy4p8qDP2HqG228CiqGGzIGLt2Irgu1BUns+Y60
	jdjrU+wwnd776uAgbOOaxy0HVuZbA2DO6yTb1Dndu4JkTIt8tk34YDXkZWmkE1CxIYnhYYjsYAE
	IR/wLj6+FQh82S+0Fd04dmaHzn/N/EjOuDpjjXAjAc2ehVEUus6E98+iumExOjxB5RyTx+lTam3
	7T9wnIZii
X-Received: by 2002:a05:600c:45d4:b0:4bb:5df4:685b with SMTP id 5b1f17b1804b1-4bb88926da4mr301154315e9.23.1795521899974;
        Tue, 24 Nov 2026 04:04:59 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:04:59 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Nov 2026 16:04:34 +0400
Subject: [PATCH v4 4/5] arm64: dts: rockchip: Move RK3576 OTP cells into a
 fixed layout
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
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-4-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3709; i=alchark@flipper.net;
 h=from:subject:message-id; bh=oXkReYjuRBJJEs/g0N/aMbEdzVAIdJ9dL3E3A7d18o4=;
 b=kA0DAAoWsqLYjxBZ1KUByyZiAGsFfVOivOfscoMHqoi9KdDtun95SdREb82PVCcEFUOY64Zhf
 4iRBAAWCgA5FiEEnfakPZUyDpq6SEj1sqLYjxBZ1KUFAmsFfVMbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJELKi2I8QWdSlQGYBANJXAsoV80XhmY0ABFCPYE+3R+pLNdhp9kiVyFXxZkK
 kAQD78SkyhCxzire0aGFcntiaEg674+eFEuXsC9xIsic2Cw==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The RK3576 OTP describes its cells as direct children of the OTP node,
which is the deprecated syntax predating NVMEM layouts. It does not
allow a compatible on a cell, which describing the CPU ID cell needs.

Move the cells into a fixed layout, as already done for RK3528, RK3562
and RK356x. Labels and node names stay the same, so the cells keep their
names and existing references keep working.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 105 ++++++++++++++++---------------
 1 file changed, 54 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 6f5780af4192..2e83a73ddbb2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2298,63 +2298,66 @@ rng: rng@2a410000 {
 		otp: otp@2a580000 {
 			compatible = "rockchip,rk3576-otp";
 			reg = <0x0 0x2a580000 0x0 0x400>;
-			#address-cells = <1>;
-			#size-cells = <1>;
 			clocks = <&cru CLK_OTPC_NS>, <&cru PCLK_OTPC_NS>,
 				 <&cru CLK_OTP_PHY_G>;
 			clock-names = "otp", "apb_pclk", "phy";
 			resets = <&cru SRST_OTPC_NS>, <&cru SRST_P_OTPC_NS>;
 			reset-names = "otp", "apb";
 
-			/* Data cells */
-			cpu_code: cpu-code@2 {
-				reg = <0x02 0x2>;
-			};
-			otp_cpu_version: cpu-version@5 {
-				reg = <0x05 0x1>;
-				bits = <3 3>;
-			};
-			otp_id: id@a {
-				reg = <0x0a 0x10>;
-			};
-			cpub_leakage: cpub-leakage@1e {
-				reg = <0x1e 0x1>;
-			};
-			cpul_leakage: cpul-leakage@1f {
-				reg = <0x1f 0x1>;
-			};
-			npu_leakage: npu-leakage@20 {
-				reg = <0x20 0x1>;
-			};
-			gpu_leakage: gpu-leakage@21 {
-				reg = <0x21 0x1>;
-			};
-			log_leakage: log-leakage@22 {
-				reg = <0x22 0x1>;
-			};
-			bigcore_tsadc_trim: bigcore-tsadc-trim@24 {
-				reg = <0x24 0x2>;
-				bits = <0 10>;
-			};
-			litcore_tsadc_trim: litcore-tsadc-trim@26 {
-				reg = <0x26 0x2>;
-				bits = <0 10>;
-			};
-			ddr_tsadc_trim: ddr-tsadc-trim@28 {
-				reg = <0x28 0x2>;
-				bits = <0 10>;
-			};
-			npu_tsadc_trim: npu-tsadc-trim@2a {
-				reg = <0x2a 0x2>;
-				bits = <0 10>;
-			};
-			gpu_tsadc_trim: gpu-tsadc-trim@2c {
-				reg = <0x2c 0x2>;
-				bits = <0 10>;
-			};
-			soc_tsadc_trim: soc-tsadc-trim@64 {
-				reg = <0x64 0x2>;
-				bits = <0 10>;
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				cpu_code: cpu-code@2 {
+					reg = <0x02 0x2>;
+				};
+				otp_cpu_version: cpu-version@5 {
+					reg = <0x05 0x1>;
+					bits = <3 3>;
+				};
+				otp_id: id@a {
+					reg = <0x0a 0x10>;
+				};
+				cpub_leakage: cpub-leakage@1e {
+					reg = <0x1e 0x1>;
+				};
+				cpul_leakage: cpul-leakage@1f {
+					reg = <0x1f 0x1>;
+				};
+				npu_leakage: npu-leakage@20 {
+					reg = <0x20 0x1>;
+				};
+				gpu_leakage: gpu-leakage@21 {
+					reg = <0x21 0x1>;
+				};
+				log_leakage: log-leakage@22 {
+					reg = <0x22 0x1>;
+				};
+				bigcore_tsadc_trim: bigcore-tsadc-trim@24 {
+					reg = <0x24 0x2>;
+					bits = <0 10>;
+				};
+				litcore_tsadc_trim: litcore-tsadc-trim@26 {
+					reg = <0x26 0x2>;
+					bits = <0 10>;
+				};
+				ddr_tsadc_trim: ddr-tsadc-trim@28 {
+					reg = <0x28 0x2>;
+					bits = <0 10>;
+				};
+				npu_tsadc_trim: npu-tsadc-trim@2a {
+					reg = <0x2a 0x2>;
+					bits = <0 10>;
+				};
+				gpu_tsadc_trim: gpu-tsadc-trim@2c {
+					reg = <0x2c 0x2>;
+					bits = <0 10>;
+				};
+				soc_tsadc_trim: soc-tsadc-trim@64 {
+					reg = <0x64 0x2>;
+					bits = <0 10>;
+				};
 			};
 		};
 

-- 
2.56.0

