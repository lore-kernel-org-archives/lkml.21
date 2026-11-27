Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800928;
	b=n+mXKuzwiPi2tV9FNWxPBhRiVZghJqgZYy20Bbw0xLeDRXppkd87orFprLqLvYt7ij6k
	 RiK4OTuBJhFckLDjYwNBEve0wr8D1zhhDbiLDgt6aMVFED7VLX/FUZtLn+WLxiAx0kuQH
	 X6YE81qDWcLyIKpcTk+0HRmRRdwZz+bZ084RnpBdSP31AgTdrgxYNdnsdL8vYhC00RBhZ
	 XntKX9+g2DNoiMEJHU0F/6nx3cTvnWpo7zN2V9F8lEiwQMpqM1x9wqT5JD/tfH3MnsIw8
	 XWFL9TpY0MzHzSN4e++tXUaUM3zUz8lEWy1+XZ4G7X7k9G+0yJQMFd3+8uSQimYXbRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=lyzGhuMOMHlziF4wP2PnDrjLAU20OQZJbENrKw1pfsE=;
	b=rcsmpXUSf//WQkQcpplNXwPCZbF2kNIGxTBLi7Ocg8OCaFmnTRglwwZ4OTWA+GglZ/9f
	 doiVIUyNdbJpbSTLHBaJbUfry6stOjp33R2476GPBvToHmix5HcJ4xSWspTW9FTxVMymq
	 f2NyUURMm4c2hpbqHbXB1kCiqbKmXd8Og/Rtf2l2yUGe9+hhMZ6oAmENEN7eJGPhR/Yw1
	 LSPLRHd3SLhtBx8qcmWz9XMOpEvsckWuv3KlDOdDhyBLPLxCyX51l2WnxUVK3E993ObPS
	 OHaqZvLLEdIkldHxsUPhoKqIF7VI3zdEx3LH/XqsK48Xz/RQ1osYZ8hsTyOzbSwkzKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S/SvVStQ";
	arc=none smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088D1606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 088D1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S/SvVStQ
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7a6e560f580so5062129137.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795800927; x=1796405727; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lyzGhuMOMHlziF4wP2PnDrjLAU20OQZJbENrKw1pfsE=;
        b=S/SvVStQ9BV/S2eTTDgJun4UmOgunU3vwvBrgNrWH9Dizpk97OCwK7FV25aNhv6kgX
         WND/5PjMvY1SHa6c8XIzM4l+rpUN4MqfnP7TIr6AFNjx5CYLysFffAqvGa6rAjel6y6g
         KwNuALiw6Dns3YgddLc8jij/3gd6+zzVaLsKtfDMZEW2M5ShwAt9fCU1DoBUhFld4wEE
         xrgKnmsZAUBW2PToiVR3Kc79b+jc+5LdAc8gXvIyM8vM1uAcjdKOFzt2GTdiR1zSwOmx
         EJyUlDjLTzRuJfo61I1LBCS1ssN392+7+cM7r8dp2vwVk2wva1aIS9/G0GrXC3gWuPrA
         wgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795800927; x=1796405727;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lyzGhuMOMHlziF4wP2PnDrjLAU20OQZJbENrKw1pfsE=;
        b=m3gRaXshd0Rn7+iCA04tv03rj17Wy7GBIhJ2paQYeh0pWQwnwcmxl8jd+7ewPX+QxV
         Y2eNPJPO+ZJ3o1VvlxUlM6WNFIIs+hMKRFef5TOMfJraQAuFrw7i6aSI3q/rUPwboILw
         xhdK5gldEyuDFavysOtLpiOMmIBog0D8b6K/aQbxkZfetayndnYLw5LDeWjRqcXRNc0U
         2affBk26NJs93cKa3/H6KmmkBBHRzKhQfbgxCH/LzlyAomLzCpSEVmhbUjUlnkGtlyla
         vyepFStHTXlkNkManb8YI65e56yM/duFo5jKi+M/th8+nuWK5mnpewFpKQ1MFof6VmSk
         PU8A==
X-Forwarded-Encrypted: i=1; AL+hErFHAOr4BpeJ21wcPf76yHhZcOo2/tT2rrI5UmOxAA1tE6+acBZDbTDcMT+kgfwrS7Z2YT9EYeup3jV0h8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U7WfUmrfHHv5JRTNnKjQ0EKro1seUIu8Kjvl4hK3o7GzARodk
	ayTeG2XBM4Gu/l4rcbw3SBTJM6R/Fd5PHMq/ShB1k7l9eN+H0rpJ5oP7
X-Gm-Gg: AZFdTZfGqxgi847arrLPKxB6Y5TAjmO7u1GoFeaWPk9Uo0vJqBZiTGxKyV6uvzFzMAP
	x5Y9faA6MOcWC2ed7yqhjLMcNMJ12V2/NZ1rSjg/hLsyNCcCjd444SLoPMfu1EzmyQE01gB55bQ
	PlVhnUsx+8WG8MncRuOEHf7E1wPS9ndnkdteuhq03JoT5xW47/iTR/v/t/DguTWe51moxqWrVdY
	DAEKFTmucnwTEB66tvTcBv2ln4edbrVWH2oZ4K5fIIo2VbrMacMenPvjuELUxXThcojUsVnjVeL
	zOm5vlLqeInTODIwo8iKQKH3oju2UXkeOQvqrq8Yzi+kXWGqFHi7jERzmlFeB2ZTOHHezc//6fX
	9pZz6Gc6QLGXMtuNKCmUyZ9Ew6Na8gFn8g9+oOrRBt5nMDzDke1iZtzPRAwDtMEbbT1GSA9HvFe
	dn+0AJnxXHCFQ/scf8WpSfYSNOBNMBmcJljs9FY/o+4hlHpi5QhO0aGxfuGzuSceTm9zp7Mck66
	Y3uXhdW2F6LlrEhBHnIhNKVZW39qEJMCwxX/QBunHB5ULztof+YpXpiU4BtqmfJTlSsPnb7d7vX
	K9qOnE7c7Rac2jRpdq3HsEo4zZSkwh7pzQ==
X-Received: by 2002:a05:6102:b03:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7d739450a75mr15786710137.24.1795800926783;
        Fri, 27 Nov 2026 09:35:26 -0800 (PST)
Received: from [127.0.1.1] ([2804:1b3:a700:1033:f688:69e1:e4d:ce91])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e0686b1sm26107747241.10.2026.11.27.09.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:35:26 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 27 Nov 2026 14:34:52 -0300
Subject: [PATCH] arm64: dts: imx95-aquila-lotus: Add internal voltage
 monitoring
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
Message-Id: <20261127-v1-aquila-imx95-lotus-add-missing-nodes-v1-1-162c7ad8c302@toradex.com>
X-B4-Tracking: v=1; b=H4sIADy/CWsC/x3NwQrCMAyA4VcZORtoiivoq4iHsGQzsLXauDEYe
 3eLx+/y/we4VlOHe3dA1c3cSm6gSwfDi/OkaNIMMcREFBNuhPxZbWa0Zb/1OJfv6sgiuJi75Ql
 zEXWUkJh7CqOGK7Tau+po+//0eJ7nD3Ngo5t5AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795800922; l=1592;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=ZxK2MgG5q/LBAnoBWmanwjQtuKQAwsd2KRSb3AQNx0U=;
 b=fZ3SskkRL+/kfEm2nx7HRYt46R1l2PAl/6TN9QxLtD4GvefiuN0cqUMqFN68SMXgstgNXiBP8
 sY8QNLeMM/vBzuFC3QyrLocz+cMYwskiJBnsKtSaP6+1StD2RJak0PX
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The Lotus Carrier board routes its 5V, 3.3V and 1.8V internal voltages
through resistor dividers to ADC_[123]. Add the voltage dividers so that
the internal voltages can be monitored.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 .../boot/dts/freescale/imx95-aquila-lotus.dts      | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
index 4ae600636106b..7c20df249eb20 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
@@ -34,6 +34,30 @@ dp_1_connector_in: endpoint {
 		};
 	};
 
+	lotus-1v8-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <39000>; /* 12k + 27k */
+		/* Aquila ADC_3 */
+		io-channels = <&adc1 2>;
+		output-ohms = <27000>;
+	};
+
+	lotus-3v3-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <54000>; /* 27k + 27k */
+		/* Aquila ADC_2 */
+		io-channels = <&adc1 1>;
+		output-ohms = <27000>;
+	};
+
+	lotus-5v-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <39000>; /* 27k + 12k */
+		/* Aquila ADC_1 */
+		io-channels = <&adc1 0>;
+		output-ohms = <12000>;
+	};
+
 	reg_dp_3p3v: regulator-dp-3p3v {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";

---
base-commit: ebe46fb6c3c40292eb647d0bfd5d1beb05b923c4
change-id: 20261126-v1-aquila-imx95-lotus-add-missing-nodes-d06aa510fe04

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

