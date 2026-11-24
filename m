Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557110;
	b=H9+kA8s5vG3laxfSF4QJIIG583eBtySq9dHB0yESQ7shFAbpA99dB+jY+LZMXfvhd0hh
	 gXQFfIy5wz5lW25dIJwECVwoy95jT2bBVVYQYTKZjj1GgkrreNNh9E0wn5slHvDuHE63i
	 ZKCoDFwRaCKXvtoMn6CREqdkx0ehEadWq9YCAryzW0MdOPdW5dWEwdhta2oQsINkUu0zd
	 HGwdIezN50+JdGjsBfHn+TCOAIAk1VnJw5hbEvgF79J61/7QLQmZxP1jeEqgnk9qszuFx
	 AifBnM6RocfGtMSovvI/mVURWw1J8AAcb3qD53NTI8My+P9BgVmGdsnRPKaIldpKStg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rzUxS4DZKD6Oufxn59fxSi6iyKfyUkYi9vxneZjQx4E=;
	b=x9FyQ7XXKAQYCIyRgoaatkO8kInB2avZQUAlj5bUlFJzKhDOV6waXTzLB/OutLVmPlZA
	 kQK52IIJUYq6R6MM3UGAswRp6pZrXLQ2JlHWWNHRSq/KqX6lS6CR9JaKQZVNY8zflZytO
	 iFmlrLLziqP5ud5wA8TrNb9zXJLTpah+MrQppWJ9K8BPUgI2yj0AO9PX9in/T2qFln9Kd
	 jW+Un3pGtsEUCg6kd1XF67lW1RIdEidhm8dXlWvZBDF1w++P+ku9Ks/7wqnY5gjKBCfu6
	 uybADxlBrF1kvwIAJZq1G5qig3kqAupZ2tQ4Jo3eo1HvVlEYtcaSP+IiQ01/+PsKlng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsaQeZao;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB7A606A683
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BB7A606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsaQeZao
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so43415475e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557108; x=1796161908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzUxS4DZKD6Oufxn59fxSi6iyKfyUkYi9vxneZjQx4E=;
        b=LsaQeZaovUAXRW39vA/JGAdIQWl5I5WWNLqPMSwzxVuRzAzD/nuys9GKhvU55letBk
         /+gIAf9ukZwI98D4jzztbOoAqx/z3r2pU51BW08szNhy7F3Pbd6Gitfb4M/PAvh1jGDb
         4emED6wCxKus0E+UDVxnn3EDPyWuxmAYKsb6zJB4wPvLr76XSwTqSn8RvwBIWPa3DNjm
         VuAIxvW7Z6NQogcnIdaHYAdYHMtX2zmh3PCdNVaCbzkmjkXODM1Rmod/CgDW1FN06xQF
         KabgebSHl4VlAGq1DPNmDIqY9yUeY+Xu0we8w2jqX1gkLveGYSA5hdFCE5NEuvIEgz3H
         thDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557108; x=1796161908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzUxS4DZKD6Oufxn59fxSi6iyKfyUkYi9vxneZjQx4E=;
        b=0gdnHqpN8F7Pz83RDvoolCXXRWq8ivRsOK5FP2XDfLKfSWwLOwmFTsu0xcFA1ApspV
         woLlJarh7aggfSmtDq+OZZCRjklX0NzGJtQ4JSpmlrKI7EDvA7lHaCKlLZUzv+mhqfj3
         MSgQUg6ql4VgHMZsjOd2UGSY7DN7zrPdt/dbvw+M/6tNGH+Y8jTL3xXU80MBMKZ+tmiK
         crIgqc92GVPhYoqSU+C0jpOkxw+OCvR1khLPPVDHK0hKuXGtVmUSP/jCpeikJRlqcnBS
         W7sJj4FdvD3y6xqqJC2bDcgzYmLmkPhZAMCJHQpXEJKyAOTBj3nOeXgSKVX4JxMwJSCg
         r3Fw==
X-Forwarded-Encrypted: i=1; AL+hErFsuBN7PAzNMZ/E6eexlKVTG7POzuKtU5rBZvUn+sSDa7QUcDDiU29JVVpSetSlvXHePXhGTExtNG2q+UI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YfpGutAkQBaWuYVWqKLMpuo+jAHzhg2R8SnWYxoepsuccSGQR
	UBycAb3+CSvGXNWKsAUWBt9/VllOBVnpwt/cyVQhe6EnAR2hJajHWE5F
X-Gm-Gg: AZFdTZcrZDwVFlyO+C8RCIa/fotFURSzhsp3KU3zQI44WyluGqPq8emol5vGQ50++5O
	ZE++pJMzpkH/LNops1BEdEvRnJp1flpFzwU2nkgT8dtjg9vdvSbabKddhV2DgC/sbojd4/ago0q
	7xssuVQcfpbOfXojdqAnRmgmad0xVGfBzm9HH2pcrhi9UQhFWbLEpncFtHN4wCpqL4NUpi5WB0K
	5KaLVEUSV1mdLC4zKROrqgs6e7bOOLTT85IVN7F9XcS11dELdu1dNl+PoCtTh3TuWG42JulHBHQ
	uJYz5QskGvPD5tje+4YPT1b+Ry3ob5Ct3g7lRVVQU52/ea7KRrBlkbJ31XtVFbXvj6vb2ZfL36r
	9Fx9aF6TK89NtY/buVal8Zmrctq4pQrTRapjOhFhGbtmxSUIdeL6E7OVS4TWtzCXNs3bh3yLsAe
	KChCWcJBO6p/xCMcPMvKPVXyVt33TKI6pp/9YFZqvhx7+q+p0dQclp+pkgXaXT+8FAAcPry8ogF
	sTor80N/zPurTjKPVC1+OQEngbhwWIJUiP8ROzVGvq0VLr+6UbiRnF8KEoYXXhBRe6oO6LvjT0E
	CPGr/aM/j8bYxfoLS6Ih
X-Received: by 2002:a05:600c:1384:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4bb88816c44mr333032905e9.15.1795557108451;
        Tue, 24 Nov 2026 13:51:48 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:47 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
Date: Tue, 24 Nov 2026 21:50:48 +0000
Message-ID: <20261124215048.42074-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-1-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com>
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

The PA IRQ bank is not implemented, and the driver now numbers the IRQ
banks from PB. Drop its interrupt.

This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
missing GPIO interrupt").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..fc4d714a96ea 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -129,8 +129,7 @@ gpu: gpu@1800000 {
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.1

