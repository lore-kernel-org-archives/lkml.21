Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643103;
	b=OqawYb/qQfMNjnmznsdoqLAlXu5TvhEv0r5QvMn+LPdBFtOlzZIk73htttyt5NjNr9k8
	 2T3e3/RggauX3gibxals7eAdDg3kkrOMaAPhcJWsTcDLU6pZBBVE2qsVJvk3frfa77IJi
	 Cv312bvqF4HcnSoOKZyyILViAyieXdzDUjP7yvAoKVLmytASbJEEbHJ4d1nrI+OhtfrLS
	 iffpX6ldgwaPlr00zA7jrz8ymX+n1meFH9m0FL++S34SAI3m/3QSJQ7olcLd6jztVTeRZ
	 NJQIy3EB0qlL4OpwUB90JcIzejUK9mXOBmQY3X0qnKSEZw02ljRMAb5wz5CigxC11ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643103;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y5SCKUzhUGoAqeZEeFTmcGTW3YAUQPcSyJPK60KPAFY=;
	b=5MiXRmWVBoF02Jq9XsTjt+yFAtI5KckOXL+OZdwRusru0s3n3LT2i3Bm8D0mIIVZyfut
	 4lho43Ibmc8m18HNryImscJqNcXSZdTK3gEwLEyEUtTLf+VidxGkDqauvBiJGe+7y5jEe
	 ZLl9Nv6CxAEDi/LTj7zPCaYFoDN7gOGVDRQtXc0TqRo/tybOW5PWpSQt47ECzjfoVFf0f
	 BclfSKZ5uP1XNCEPj1+DSXMsUXIBAO9hVs2bgeqdeaOFT0q2Ito3D0bwlml0T4BUp4jaG
	 zsI908QzqulSqsg6KPZjjbdKyqNdLE9sRie1cLdKkAPkwfARV3Y91Mj6hEzBHiWtKlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=bLjcRxxr;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=W3p3opBI;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3636C606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3636C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=bLjcRxxr;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=W3p3opBI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795643101;
 bh=y5SCKUzhUGoAqeZEeFTmcGTW3YAUQPcSyJPK60KPAFY=;
 b=bLjcRxxrHYyEovjcqOidg1wvCVHUGbmb29oUbj5QynVPCuwrolrhxVIyijaYH1f+8TJbLXQVt
 0WzhkxC3oYRYvsHWB75Q++vIlq0PN4Ox3U004cx+2tIwFHxKuU/mSyeHcEb4uNWNJKnJEHCzQv4
 qoZd9fpPbWfEELLP8hCqerNCfmrYznMbchUHuCo+3UxsOTj/nhTtQxH2ZNutmZN2dnQ2QOrKkL8
 5SpF/810828yM1rrxOlus+jC6FiZPaemVnvSKqYD3t4uYnC9/8py9Q4mot3SHnk7wJ0ekBIQ3J9
 ebkRJ+0lXgMKnVjdG1skt2Mev6orCK+v3kg2V/iAZmtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795643101;
 bh=y5SCKUzhUGoAqeZEeFTmcGTW3YAUQPcSyJPK60KPAFY=;
 b=W3p3opBIZedknasqwoqT9pk0yXZ6ZbGVhwIjVTavY4jCA2bk92yMK8sTDjrvx+DhnngNvAAZv
 1l4KoJGbY1hMEcLgHX3uU/m/+hiZqzr+ta+bEbf8O94rVTpwe5lveHqR13roYivk8EWbVFDdEOW
 NQk7igIKZuIWywFyPQ74Kjk=
CFBL-Feedback-ID: 6b0756ccf930f38bf754f9e9:d9f3869de73d583c5b2ea30ceb86e4c7
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0756ccf930f38bf754f9e9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.39
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 6/6] ARM: dts: rockchip: Add Luckfox Lyra Zero W board
Date: Wed, 25 Nov 2026 21:44:18 +0000
Message-ID: <20261125214421.1580359-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125214421.1580359-1-jonas@kwiboo.se>
References: <20261125214421.1580359-1-jonas@kwiboo.se>
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

Luckfox Lyra Zero W is a compact wireless development board powered by
the Rockchip RK3506B SoC. It includes 512 MB of DDR3 memory, 256 MB of
SPI NAND flash, 2.4 GHz Wi-Fi 6, Bluetooth 5.2, and BLE connectivity.
MIPI DSI, USB OTG, USB Host, and RM_IO interfaces are available for
peripheral expansion.

Link: https://wiki.luckfox.com/Luckfox-Lyra/Luckfox-Lyra-Zero-W
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- Add spi_nand label to flash@0 node
Changes in v2:
- No change
---
 arch/arm/boot/dts/rockchip/Makefile           |  3 ++-
 .../rockchip/rk3506b-luckfox-lyra-zero-w.dts  | 23 +++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index 9a699bb8fc5a..faebeb20f467 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -48,4 +48,5 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3288-vyasa.dtb \
 	rk3506-luckfox-lyra-plus.dtb \
 	rk3506-luckfox-lyra.dtb \
-	rk3506b-luckfox-lyra-ultra.dtb
+	rk3506b-luckfox-lyra-ultra.dtb \
+	rk3506b-luckfox-lyra-zero-w.dtb
diff --git a/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
new file mode 100644
index 000000000000..1ca6a25382f5
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+#include "rk3506b-luckfox-lyra.dtsi"
+
+/ {
+	model = "Luckfox Lyra Zero W";
+	compatible = "luckfox,lyra-zero-w", "rockchip,rk3506";
+};
+
+&fspi {
+	status = "okay";
+
+	spi_nand: flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		bootph-pre-ram;
+		bootph-some-ram;
+		spi-max-frequency = <80000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+	};
+};
-- 
2.56.1

