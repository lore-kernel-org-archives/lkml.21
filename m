Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378484;
	b=2mb49Rjm2dxwBncu99zV5Xi84rM+rzbobuji2Yfc+9N90kXxqNsKKWGO5Edkg0B4Bomx
	 N3IFk8mSWdDZ7mRjJZdT4ymdB4ZOzgcMdO5yF9PEZQVGcqaBYYKcpGm4zDbOn3JMaBFRQ
	 ziaD/v57a+s9yscdMpX2TIjQoUUeVcG7bhQqT7vqH0Em537f9fvVvGcV3c9fzX4HnNoRX
	 3q4u3xeIr5dU8v7KNJiqZUFMEdf4QEnV7sKmiOpWbI3/mFhVOY9RtqoPPwlSqgfE/i9BO
	 y90uQCk4/mThQ5P9UFaOoV02ds+CQavYm71cDQi63n3WWT0l3rZHWOoTQhWf2RBZwtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SFXSMcHcVJkmYFbJzBFz4HPTepM54SZHk3SlIxX3SZk=;
	b=01cCgusxZV7GHxzvITVATHDAAK0SjIxnjSfjfaKK23vPJBNoIXLcMvE9q0v79UoGl9P0
	 wHfG/+xZzArXMDZQIq2pOQ9oc2+tDTP/ZUngBbAi11b0VHwHFhKgOhPGjYdqdaV7ohHX8
	 5xObaGokMSv8O4SkBN7XRRlNQ+wttdzqL/K6L4f9AHQnGW+dKS60T4FUQ1oWQ89JLXfP6
	 o5siDUq4VcwBouISxXPJyH9A7HmfXYYkFEuE69pqo1SEmDy1thtn+Fl59iSTvKE9bPmUP
	 Om5j8YgjnaDCxuDolCYrTmUxt3oyD3kjFIMlq71XHnL2hEeouyAy3rLq+cZO4DO8KFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q5v0tZRI;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A1E606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A1E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q5v0tZRI
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso3645486a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378482; x=1795983282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFXSMcHcVJkmYFbJzBFz4HPTepM54SZHk3SlIxX3SZk=;
        b=Q5v0tZRIUKu5FfuMA0WHjv+4y7OME8e13al3F655WqumlxdAsuBho9J5fjY9oSETzn
         u61qF89lyEUxgkv+HMDUrf6fQto1lWNA63NNwHinVZq5upgD4tw7cAR5sVGrCPlDIKi+
         0zHOHOBnoXNBpBs5YGKDjZff/L6aQdsKI0YXrIZQlE+fbob2+hmXPCqjQvFHGYe6BLhy
         FF3iUj6VpVVxKhOtqmE5aap2FfW+FUT8AAEBdxBtERTlWrcM2nUA/XMDFEyH1QpnbMkK
         L8H9o5YsPcs6eJWgBDZ4J78O5w/M5DB9fXOEwClUCWUVmzxwZolWWl0Dk+JsnuS2rnP8
         GQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378482; x=1795983282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SFXSMcHcVJkmYFbJzBFz4HPTepM54SZHk3SlIxX3SZk=;
        b=1L5bSCrqTM7o1o1M+6wnAOhl9aPEu8lJmDZMbH0RksBes2S0arIKvpNXbq6U6c6bB4
         Ec2WF28sVeeG/Ta2fsH4YS5DNSiW+b/sTb/aoL3+i1OX+EwttfJuOiIbZMgT8bWeuGKj
         gyVl3nPI4Jc3yzCO0awGoEukKA1WR/o+Z+EYBp1xnoFoKhRzBJWD5rtjMvKuZza58ubc
         XJ/n4chxn/jkOnsuRXTeE6BbIx5CsogWNQ8QmxyY5dZmMeWpAVgF/oS7vux3KE1iShBd
         9GY+VXlqKa8jVJnHk2K0JKTpZLC/LwNm+OXeeNl1QLdZar4S3+dcMaowWKW+pITQeciS
         KGaA==
X-Forwarded-Encrypted: i=1; AL+hErHYYZ14gH8hZPlU2iInq0J7CgNqiWVLPCCCK6f9/UXEhHgPjC+uqG4GMqp5k/jHNLrGTOz1J5+YHuCnDtE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TC35QiDRSnBU7mDgq9QAH/aVnOjxURyTn3CuU0dzPMkWeoHIi
	4J6n9A727VT7x05QeqNIHseyrKPpUmTuazffqLmyuquP35pFtTeLojcg
X-Gm-Gg: AZFdTZclRzMpPS1aV3BkGPTkGR56QLCF9KAp+f8PQvb0vTMRIJhBh5K7UAbPh4Df4cP
	A2ZRpNG1jQssc66sqA80tabegRzB7hS54BL0tiTIr3gQ0lDVNynl173IDPGN8NPjwRA0EWe95k1
	KPfpiI6+FE+di23LAOz/Axij3niIBvHpueaZhzJQGVybqnhc5Z491X81zpH1u+5jlqD6pymef1o
	aj9CSZzh/fOHZBqy8SqC8S9VD/COnKkSvgcyfBWCDx27/m6kg/XlDRFM/Yl2P/M+kbsvE4mqRdJ
	gAmqioRplszLa4dFmwHvVtyAFhcumitOlXDYuDHPS9EzjiQr36Xx8IvR9YzPPgP+g+SeBukeNe1
	eV+pRpxsTrQLWd0K3GeLOhkcnbX03wdyuy3MJX9XMKGPUTVFG+1f+gEpfOU6YuGLF5e3L/zZ1AH
	HRyXtlKy6xJ67ymuFlMaeBNh2ONbcZCw0orSXnkq3tNuS6dAR7KXfvbRy/P4Rt+c8oa9SfH+6p1
	qTBZhrMwjjo3IP2PqaDSns8oCkInVxcuXBhd96WYHwYq/NizbIEP6TXojprUId4HSRcpY2nZ+2A
	BnsnNPJhGIZPYXQaEYH9S1cDNQPql+4rJUST2xx8rMgYv0/SmfSSEo05xcDfX8OHsOAwzz74aI0
	WmmWZ4OHgvTQ=
X-Received: by 2002:a05:6402:434c:b0:6ba:2a44:8ed0 with SMTP id 4fb4d7f45d1cf-6ba37e97bd6mr6781529a12.23.1795378482319;
        Sun, 22 Nov 2026 12:14:42 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/18] ARM: tegra: tegratab: Configure MMC devices
Date: Sun, 22 Nov 2026 22:13:56 +0200
Message-ID: <20261122201407.23742-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

The tegratab board uses three MMC controllers of four that Tegra SoC has
(the second one is unused).

The first is used for Wi-Fi SDIO, the third for microSD card support, and
the fourth for the internal eMMC device. Configure all controllers
accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 56 ++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 2ccee3b70aac9..b7a14e24df79b 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -13,6 +13,10 @@ chosen {
 	};
 
 	aliases {
+		mmc0 = &sdmmc4; /* eMMC */
+		mmc1 = &sdmmc3; /* uSD slot */
+		mmc2 = &sdmmc1; /* WiFi */
+
 		serial0 = &uartd;
 	};
 
@@ -1254,11 +1258,61 @@ i2c-thermtrip {
 		};
 	};
 
+	/* Wifi */
+	sdmmc1: mmc@78000000 {
+		status = "okay";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		assigned-clocks = <&tegra_car TEGRA114_CLK_SDMMC1>;
+		assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>;
+		assigned-clock-rates = <82000000>;
+
+		max-frequency = <82000000>;
+		keep-power-in-suspend;
+		cap-power-off-card;
+		bus-width = <4>;
+		non-removable;
+
+		sd-uhs-ddr50;
+		sd-uhs-sdr104;
+
+		nvidia,default-tap = <0x2>;
+		nvidia,default-trim = <0x2>;
+
+		vmmc-supply = <&vdd_3v3_com>;
+		vqmmc-supply = <&vdd_1v8_vio>;
+	};
+
+	/* MicroSD */
+	sdmmc3: mmc@78000400 {
+		status = "okay";
+		bus-width = <4>;
+
+		sd-uhs-ddr50;
+
+		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+		power-gpios = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+
+		nvidia,default-tap = <0x3>;
+		nvidia,default-trim = <0x3>;
+
+		vmmc-supply = <&vcore_emmc>;
+		vqmmc-supply = <&vddio_usd>;
+	};
+
 	/* eMMC */
-	mmc@78000600 {
+	sdmmc4: mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
+
+		mmc-ddr-1_8v;
+		mmc-hs200-1_8v;
 		non-removable;
+
+		vmmc-supply = <&vcore_emmc>;
+		vqmmc-supply = <&vdd_1v8_vio>;
 	};
 
 	/* Micro USB */
-- 
2.53.0

