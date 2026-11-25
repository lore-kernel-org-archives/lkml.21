Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606001;
	b=UVYKojC7ghkflZFkXo3H7PM4O0mm54ZduAi3brriap3qOUEHCk+CQ7HPFG3Sk7DZ7Mvy
	 hJlieyvRyyfgydp3uGpO0IqXt2/koFCbptKUZDNLLoWgGzgfJJgAhe4uExYX823aB0T14
	 feKHNxMknMBwu9bThsq07m59TzEK5MuotIqUIcvmcLzWtyPB7ouX52sujX57+PExSPQXP
	 0UK/0k1fhnNRSA7lMCqqDY8FKq24Vx1XrNUZsQp38F7Dx+mDyXVvDGMbtvVwBNGgQ8tSc
	 98WEYKLjCfmVgUM73kUB292dTj4XQHlvByEIOf/Sd+v+9sPmkM/U7eVR4nh0NeolfcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
	b=iKi1IsOrT2I+lwz86TrXshi/zFbX56KokeGgcP9L8oxucQik8ABRfRvZh+2ZTnc25xow
	 kk4EvL7V0tsThPzWhfw9T1R1PJZLvJpUm8r1yZZZJ2ppZ81Iav4mLbCDyXc2OEBPalHhp
	 V1cWf9zc6/2Qay2Y0duppA/ZnSrXG85ikzOfv1rJtptCs4qkRfoG+RG16tt1u4zAwzM+o
	 UA3cVLgKqhaho4IfCmDe9QMzmsp5P/rFHVMvfCtzbzazcfBNUc4SYPuBm8zSu706c3AXe
	 aDfnXjeo+llv17TrDO2q/4WdQdMKOiiiEwCIFq1Yi+ad19ru2Y36SzrM6qfrbrTz2kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlDfi6Fz;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A099360A5BC0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A099360A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlDfi6Fz
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so7237233a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605999; x=1796210799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=TlDfi6FzLVQEOp+ixHcB5vNlbsGUZwa4mcaeOkjd0jh97u/dAQPOd+fuIXap9g6xTE
         AwLzQC2AQVty73GXcw/9igtE6XHnnlMq9jJ4lgp+wwa99Tl5lQn/dXuLJ84uHaT/PFST
         Egd2SPXKhqhF7vOSWOPQ+XEVOyF7I9XoxILp+628qqpwvs1XkoL/LGvq+wQbbkVdtOVt
         38te5+rV7/JDiIkqpzLnigVcVLJsMttZn858RdW7lL2aBk9ZtNMwRkW3WNUdKbwaF1Lm
         +tOC+jz/q1dgHHIfaPAr4ZUYHn7ha59kQ3smCkNx7N0u1KROSCXcFhJ6IJsGV3QxTAlj
         CXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605999; x=1796210799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=qnQBecVddLQbmxjVO+W1C6+sn9YPns+gF+iAK5LQGEb/0NkDt/1HENH/4ASjko/Jtm
         nQXES1mRkNjMJafS1xCsdOYkEzaATl1l2sJUKJSJf0LDJXzVukCqgciWlw7Q4h8NeUJk
         qIr+vjLau7E6th7XrSIa21X61RYJCLjWvN1qt615veUVHtTtfO/F1LsGm6+DjdAK62dN
         d4ksRFZFON58YqMQm7+EtjrW0NwSqwdqG0Rt909uoGBD3/kCPpO7MeJqsmzLdCo7uKZU
         KXKufg3OciY6Q5CZFW+KwF+yHJyOz/O4hUMoAr6Q2yeT57wiqvj3RNCl71445vbcxlBa
         /3uQ==
X-Forwarded-Encrypted: i=1; AL+hErESYyuAfcqdV4g+cYI4vJ0zwVZeef14dX22Llr16gICksiZceLlhWWhrVitaKIGSMQ7Vha+PngOjKJYFxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z848S2CcjMZImr1crMEfWGSCxHfre/UPj5vMRA9g7QKdmU/mLq3
	XCJd6/PwSZsyTQoY2++vozv423jOYyXSJYOQO4YBQ/8z5G13kXMPxu1Agct1ZA==
X-Gm-Gg: AZFdTZfYKkJwM/DVh4AzEl7JZkWMrh1uDRNuchxCiN8f+ymzuzn9aKvEAywTU/gWg2q
	gJd3o07P1/l8fTwOz+tS3Zmvn8WaM/mDj1YcbPdh/ZNAQLDBaMyVfSRplncAopqBA1nqQvvjXTv
	PtBSfStUCxY3kZuhdQ5v/Oytkfdu3FWUQwt1KVGEUxPmiS8tQNK79elCbbXK7bPbYYjHSgkL5iv
	ap9aVk4d4UmPpfkY1sCjJVquNZXsr35gCoqzwdekGB6a6cxti+qjh3UQ5R1nVPoh5wtaAw/wRZa
	Fv3e/nHRckVgUA+mJ8IiA1kQTSXDkr5LDZtC7c4jLhsuaDHaPeb55PyRE/hPc1579S/bMis4OXA
	6WqqLq2pryGepVsK8IiW+tzM6MWPj+AZcUe20jBJyB2+lo+8neWgyfQkfDTHwddeMVmQzZvKe9U
	LX753orC6c/oe1BjrG/VIWpMQlPbEaSIheEd9KxT48pJkVMeKO/6rMVzwnR5c+PjmVjY0Wpkt/l
	lRIEITIIwSfm1+lZdjk891jtVrpGT7GWO/a33gb6NfKmAvtwaLndACf4aWT/uFSzYqJ/B850kup
	ozKTWDN/JsaGezBe4wW3p3vMnf0QzEkML3/0fVzQSecUzpb52D6dFKWvXNnJfaNx/jryysbRfIy
	QNG4PxDsnYA==
X-Received: by 2002:a05:6402:4009:b0:6b9:c43e:19df with SMTP id 4fb4d7f45d1cf-6ba37ed9a8bmr12269161a12.41.1795605998897;
        Wed, 25 Nov 2026 03:26:38 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:38 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 7/7] ARM: tegra: Add CSI node for Tegra114
Date: Wed, 25 Nov 2026 13:26:13 +0200
Message-ID: <20261125112613.237333-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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

Add CSI node to Tegra114 device tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 34 +++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index f2766c11ee6c3..61120658f0687 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -53,7 +53,7 @@ host1x@50000000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra114-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA114_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -64,6 +64,38 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi@800 {
+				compatible = "nvidia,tegra114-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA114_CLK_CSI>,
+					 <&tegra_car TEGRA114_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA114_CLK_CSIB_PAD>,
+					 <&tegra_car TEGRA114_CLK_CILAB>,
+					 <&tegra_car TEGRA114_CLK_CILCD>,
+					 <&tegra_car TEGRA114_CLK_CILE>;
+				clock-names = "csi", "csia-pad", "csib-pad",
+					      "cilab", "cilcd", "cile";
+				power-domains = <&pd_venc>;
+
+				assigned-clocks = <&tegra_car TEGRA114_CLK_CILAB>,
+						  <&tegra_car TEGRA114_CLK_CILCD>,
+						  <&tegra_car TEGRA114_CLK_CILE>;
+				assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>, <102000000>, <102000000>;
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
-- 
2.53.0

