Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483721;
	b=Fz7yA4jUCTw/mtFPlMLRvDxCEhrT7SVKfWVodMSGR9Jl+6mT0O1qxQUvu2hAO7G27VEn
	 ZZ1yK+9AxaQQLL0U0P2ZfUcIK+EYmd+SyPaG1aE6gZEJpWCNgDfGT2tV79F2XxhzdNLCu
	 8gDHFBrC6oYJW4hYfrwR9wBTxXj1yP9CbGRtNj2MX2jBHNoohfwUXxiKlycmrD8F9oYFd
	 GPNWEt1HNA66i7mdNhNYPhv2VHJO+hFuokL6vvLIhccHnArcidToF83NTcbaxTH8FPLpg
	 SwiFgPFbP3LtLDmNszOAHuq16Xpn8qI5imCGreyCQlPtwgRKvJTJXkwxpZqluCRNVkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
	b=3I/50QmdW3inMCHmbYgjRJ72bzi0U5QNU+kRhsCUfMmsSxw3b0fw8OfQydfBB18mqT+d
	 HSEMHftdkcpY2pdKUwWyfYFWkZb+9/yLQtA8NHEcqewcro9XlmD0YOTkUJLKamFdWZavi
	 5zfAfTdwl1AOffSfZM9xE7MFuDAqomBTX5diRibs/82ihdr7mYVidCWX+Nz9JQ+606lI6
	 s9r+zltTnnYgRxJ6IrUz4wLCgqTG/nXBE8ccT5di31ir60oTyjqiN+vtehAhHBXd1at7Z
	 CGXssh5+sEWPta6A1yRnsbjvuyCZhKhHgmEsCdrTUVudLnlPSfaZuw7C9WiJJQfUW5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Tg/baRzb";
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D2F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D2F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tg/baRzb
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1840167b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483721; x=1796088521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
        b=Tg/baRzbsZ4MOxkIjrZ/B5lU6Fg/bjyV/logqMV1Ui1y31rDJSBd9tR660cSMf2F++
         C12+iqoEf/yPkP9JuTucDcpS1R0J6l9bUYC27oXB4I72759oIrBEBlx2Dn2Eoa2pOC9Q
         Nj/x/6fCVuoUrS3+FYMUcxMX7jGfl8E0Fo8GBLQxh/yrgJX3SxEsZhsWxCxdjKp8ti4b
         QWg7SWwnG4Xr/JLzzZymTqF8Iul2/6Mb2ecmHBRH9d+Ya4iWf5LkSGdCUzM7ZUdcZur5
         3TA0usdlayEF04ePUUIlLrCZFy1fGrabGj+Ae9XiHvZPm8H91gmpmH8MHsmCoJz019k/
         6tLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483721; x=1796088521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
        b=erU70JPa2EBL4GltjNEemDZYaogkpisRj6YDUvphzsvMxaNyiuRn7991dEFjRc0elN
         OAS4K8uNvcQ72/ReYNJPQ2MX0+ll6jpY6olIs+rxCW3dX7NXqaFFAQhRiJWltjk5tdy2
         r3HM3sCGRJwIYCzJLpKPeNpYshPrKHfQXuQ5gIb76AAs1yhkGZT70tEogjRXVWf1WdqY
         u0W4C7FQON4dd+EE/8t5gCfZXYNZDLR4R0dMHEVZ1T1TAIRXy50Huju4+334ZExepbVz
         yODtNExdfhyx7rxdqqkgcNvZ2JZHetWdTpyiThQsaPBQ51H//+dOCn8JbpiWZILMNz16
         xlKg==
X-Forwarded-Encrypted: i=1; AL+hErEwBd1snKuswbgCEhRXJTXi5myV9DGa1Z6fTAW4Wh6thBKwOzvbGxUSWKImFHhgqf+tY3APTrWwrc2ArpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WmQtSdAWvEFmK5YK4hOp9N7nQxnZ4AuMnooukZjpoBpi7QvLp
	95EtnMYN8INeroEn+2buP4Pk2raQzQlGR75Zb3IrrIR7j7Wy23XskRoq
X-Gm-Gg: AZFdTZeOO5IMjA/sGi6JHGHUx92oJrxjsqkOxTG/BjDplWblv3WT52D8Xp690j+WAOO
	dX497B43phBs1MeEmC+UBecBzRQCvX51Nn+43SCzDgVKss4zH5fWhWEJtXwreNl/tEO1G9ZYlOy
	vDUHC8PmDFz2vfItHL2c8+ln6SMd+im1GxN9xKLvL+FeOPgXmRFfg5n9IgXjYrR+WShgB5QXtay
	3Rv6VRAk+HtQDFGz27WncmKro9PWZJ/RcMGLkiub+qvM/nIDTd9PJYNbQDWEo8KzCzPZyH19RCH
	DZq4rkeSleYhstG/cS7TNw1DUdNTspQ6QV8LAXWiD7zHX338sdKnE9w/zEd43x7QFP++VkMh9he
	iUVRho2dzML4FRQ4kujZLcz3RLGWM3xZg7MwZkr1hEOVwdQ6TH6GdWDfSr76mrmjNElQLQXZzoK
	UNDET+W9Holaf8aOvRA0vLM/ZtV2ns1qoLsmILjohfEZ/PoqQ8pmMFjcqfEQa6xarXVdbxyIvif
	MiSG4yTQyBtJl4lfRYzxuWCi/9WFpPkQ26hrBpth1lZ7irfjAup1Ai2SlKdSyVpn3wAso1PtT3H
	cnzE6MZpQtPjJKbQi8JO/Hx/SFgjU53RIKNFHlGQB92HetPu3QeWdfs=
X-Received: by 2002:a05:6a20:3d1a:b0:3eb:37a7:12a2 with SMTP id adf61e73a8af0-4014cf57a08mr12321296637.33.1795483720826;
        Mon, 23 Nov 2026 17:28:40 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e457d1sm6115243b3a.30.2026.11.23.17.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:40 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] arm64: dts: hisilicon: hi3798cv200: Add watchdog node
Date: Tue, 24 Nov 2026 09:27:37 +0800
Message-ID: <20261124012755.328774-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124012755.328774-1-mmyangfl@gmail.com>
References: <20261124012755.328774-1-mmyangfl@gmail.com>
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

Add the on-chip watchdog controller node to hi3798cv200.dtsi,
backed by the new hisilicon,histb-wdt platform driver.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index e5010c9d4c39..169a919bb282 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -254,6 +254,14 @@ range: gpio-range {
 			};
 		};
 
+		watchdog0: watchdog@8a2c000 {
+			compatible = "hisilicon,hi3798cv200-wdt", "hisilicon,histb-wdt";
+			reg = <0x8a2c000 0x1000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&crg HISTB_OSC_CLK>;
+			status = "disabled";
+		};
+
 		uart0: serial@8b00000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x8b00000 0x1000>;
-- 
2.53.0

