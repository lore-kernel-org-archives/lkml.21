Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618570;
	b=1iPPvhcqO08iaCySF3GV0X5EYa/5LlmX0PQ/Vx8TWUuGjvzlY88Y3FYoiVCp1KSC9zb+
	 9KX8L/TeJqQ/8NM4//IhvXn7kyR7bgOYZpsjh2JoOFL1ZmHjgBtfouNQX4QFrWDPE6sse
	 6XDWf+15pRZsMonAAQQI9xYSf2RFfkju8VO5TnLUaJK97vFMDCMq2h26y0BJVmPabLpRU
	 fnCkMmEa+fxu+NgVTICOBTYwANdjaBi2XEkV7nye6zJpXXrxqGvP17xa/awtlIrpufa9P
	 h223mVbtE6o3qSfOtvoWHJlEiUQCwoAyAacJtZUyT07J8c438DDi+icbXYoB3lrMPGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z9CHeC/4bOqmyR3r1N2caZAZe+JipBH+Y+dP5eqPLe8=;
	b=EQDc3F8JU9erKhAwcNmjneqBC3othVMLVgb8brSEUNsfXCuuKivxBbnVFK2fb7UAQmha
	 9JTc6cajg/wyWz/K6RQVox/B/dOmgROdCDYXfleBRdO9BLWbgWEZgBZFpOpbCdTVmCQ6A
	 gmrWrz/srq8zQNPv0+HF0OJDa8NBXpMBI+46Gwqlq3n72FSmQ46GSKNHB8+HVcjmJEEb6
	 l/RVXI+cJZaca4UcB4FwXW9WKQT8lyTYkH9tTCT6o9djXLr3aF9gIrGnmTEgb3XKjp7YJ
	 Q/1S3QuCLV/c464zw5rFpMkfI6ERq9EpbclqPUWRLfHQavsQ/J0qDC+5nrqF5BvF8GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyBp6Zzy;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C8E606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C8E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyBp6Zzy
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so47419445e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618569; x=1796223369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9CHeC/4bOqmyR3r1N2caZAZe+JipBH+Y+dP5eqPLe8=;
        b=NyBp6ZzybTgL5anA7PEentaRAANmzFTfxfpbAfB09gjk5clY6CenD3BlfincLQEiOf
         3+7Udtjkd1LcHafzRTG0PPSuUmZqH92mByg2bepvLe/4Qhsz+DMX83b2Y9NVGOG0g7ts
         t1qCFom9nM2irCvkukudEu9KaU8s7Jd8uuBwQwLpIh9bY8DN/dFXqxNF6XzA3ja7Usb3
         6hFg3N9Tog1NWZAb+iQ8ZpOY1qe/Y7BB8tFgc0jmswKSAefPw8gOFTl8cqVmIY853W3X
         rtt4ArDelubu9wxmlmA8q5jyBeP2wI/FFUgKM0aZ77nnifctX9fU/K0ZLZQ4YmoBmehm
         0xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618569; x=1796223369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9CHeC/4bOqmyR3r1N2caZAZe+JipBH+Y+dP5eqPLe8=;
        b=iemXb4LerRgvuyYhNIA2myRakgBrEFBQGHulsdR4nuOmIntGL4iuMVUehxOb5xR+2U
         fX6oL/r2iiLDmg9kwy1B6HOUnRHruAQZ4OaM0NT2fpGI3cZjyYWFCUcdYrr+7NPlGEEH
         vDqEgPdDV4n0KOyo9qZRzGPoIB6hbjPTz4CtBZws54MaPNsLISv6YsaIL8uHnhOjhk9t
         Px/gtgu1LI83CwDAw/zF8HNMTm+Hqfgw8nln5ARp59NSt+56elzQuvz25C03NAIHp403
         C1NDDkaf1bgwF6ZirmPaBe/5esxsmPvYV+vNcWqcZSCoHp0uuAKND63eSJzNQ2PqyNKi
         cofA==
X-Gm-Message-State: APuU4Z+Kfbr7VMSaU1TBDliipbufVTd/806LjJ3BelXuybXjFuRV6Naf
	MO+qTHqHQAV/o3z/4Uoqj3/eC32DuNd9tA9haVsqpK8QrQ0tMpPKQ8jZ
X-Gm-Gg: AZFdTZeFnPF6wl/QkcV+M8ubQuHtmfGwosv2FEhaRejU5+qP8/TTVMU4JBPamc1K2HX
	0eRyC9LFsjQTecTutgg88aGYezJcc70XP+/QIe4SzYWZjMF8gRSoiNinyqifrOxbcG6Gifr/mh5
	iYPdAqB+Np+eR0j9bJOmDcqQa+8Q+w/xZndNk9aWBoNGRUxXDmZZ8qTeoaGRUVLROa0nf96KIRM
	qtGyjGvXkBIBJv8V+8Q2K98XHSaVeRw9C93Z39C2YKgniOwt44/j5MblJdIB7Gk6BJkr20SGF43
	njg49yRwbXAmwy2dTLz8J50bfWZWq3yVEsgK8A4DNuBwIMxSTNqKFiQGA1D/kou8MUOf7iXqYxq
	Hxf7KYsXys04Q6PLIh+yCAPDgM/TR21b04T2hZNgD9BS1cdUSR28uzaGns30XVd4r7Fp8wbzSDe
	32E8J1D5iNrmzvHLLx07fbGAEvWCzdQ2Z1YsUoqxJNVQlGAKFZwrSzBbY6fFDZ6e6p0o9w4TwsA
	n9WjIreS0adpcKen3Y+XBe4aZEZcrDcEqIZrf5p4036EEEu0/1KRHilacCWYGS4R9Mj7g2oSAJ7
	IkTnJ+ITb552r7agyVypHaUjNqnzRtpXFzHcx8feIutAj0rgP6b7k0QvTca7GjPLoZ/F4HJKchc
	DVxMsk+j93rvcMGgXG9Io7DrMj9867GDyTwQ=
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr362757815e9.26.1795618568725;
        Wed, 25 Nov 2026 06:56:08 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:08 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/5] arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support
Date: Wed, 25 Nov 2026 15:54:56 +0100
Message-ID: <20261125145458.2594179-6-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
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

The Samsung Galaxy A8 (2018) has an USB-C port capable of USB 2.0
speeds, used both as host and device, and is used for charging the
phone.

The physical port is directly connected to an S2MU004 IC, but until we
have support for it, we can still use the USB device funtionality.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
  - None

Changes in v3:
 - Move status = "okay"; to the bottom of the usbdrd node to statisfy
   dt-check-style checks.
 - Move maximum-speed property to device dts.

 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
index 4b1961ca365b..f93996e7321c 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
@@ -59,6 +59,12 @@ power-key {
 			wakeup-source;
 		};
 	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
 };
 
 &mmc_0 {
@@ -112,3 +118,25 @@ key_power: key-power-pins {
 &serial_2 {
 	status = "okay";
 };
+
+&usbdrd {
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+
+	status = "okay";
+};
+
+&usbdrd_dwc3 {
+	/*
+	 * SoC in theory supports SS but no known device (including this one)
+	 * has it wired up.
+	 */
+	maximum-speed = "high-speed";
+
+	/* Force to peripheral until we have Type-C working */
+	dr_mode = "peripheral";
+};
+
+&usbdrd_phy {
+	status = "okay";
+};
-- 
2.56.1

