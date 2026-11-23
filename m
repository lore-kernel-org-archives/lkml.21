Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445652;
	b=YuzEUxzy++wSyvLCrviCEIETqr+xyrlqU4ER2OoYAQx6kYzBYIMZQCh16EJRJku1BccC
	 ut7J1jRvVyVZfafx0UUkx9I4ka40KEVKLkIxqW37idho5WQIzA2A/vjY8QYjQzVWdaft7
	 YOQ4QXSKKDrwD3ihDsEfaC8TsDQaWcBZWf875gRhKJj5E62f338S7HvQ/b9gE2wv9OxHT
	 2PYbTzqQEcxCIcSjbzyDHUVWv7VvoqXc27G+drINvvmTpToa8iYzYmmIORI2HsEuuUAui
	 ZVgQKdf6EEytf4eD8ZSsMjj9VYVg/BEaJie2a9i6r/mf9hgT8+tDtfZLWf63XVzgbJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4LzrFFR+hhT71ELT3fY+ftWxMDxLj5bwX900H4igILI=;
	b=EMKNJeud6Asxx7HeEl7uui9D7t3C6WooMu/HVTU4iK4kA0WG3o6SUxwAi8uV7Gk9pQjq
	 hLRCsxDHogvH/HLwkTfr4sge5XjUlUGO+HApySkaVRlJQT8CtLsk7vqFHrUeMg1PUxfO/
	 tgOVCQskmPvB4bszKjycPwVRtMp13bviiGdSg3aVPT+/uBTM5hgHF4mV4mILclozdxXsy
	 j4EiY43L6kKeWVmQRdJnaLVjkKD22PB5t344phttpM2dZqquxyd+nmmJl9cLXw5OaYY3Z
	 XScOsIZ4j9QoPZXMoo2p7b2VFIjT9OItSUtArxsxWPBIyLK4Gv9pg+QKqgp8VsxqOqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DzYTfl6c;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA26606D15E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA26606D15E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DzYTfl6c
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4aa5833c263so3229484f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445650; x=1796050450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LzrFFR+hhT71ELT3fY+ftWxMDxLj5bwX900H4igILI=;
        b=DzYTfl6cD/WSjpjEKM0f8QXZw/9LFLq5s47ekiK01Yb5jiZqNHvITc49zeK2FSdF1J
         rVH3+eQsQwvlCYZ2dtdeKfeeZKpjDjPs2eXrzgF2J0UxoD1gg5TQQtGsnvtoIQ2rCpVO
         7VvVhInqYDtvDnlXFHkj4b94cB5JXane+2fX/FMXtbQQiVIaajFxeFoDbTF0KnK5pi/D
         hiunvss/Zi/G+8nGPGyosqf21CgmcPIctwjs1vqKcwdZuc1B4bxEFwc9UKJ4C7mhBJVX
         SMmwBg095gqDY09thmHMFZLgkJMI6eYhPTZZSKk6styZ32Ihicvo8zaIfuz3qSakP62b
         tQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445650; x=1796050450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LzrFFR+hhT71ELT3fY+ftWxMDxLj5bwX900H4igILI=;
        b=Gfh9sCuZzmA/Zz6I1FryPm+GzY4c/OmX3I7dEV9EAj+xp/Mof0kq2fQPTDDA0BZ5G4
         weWInO4sUjCqjhsmii6ecu9/wRGdhAQ5gjfP17NLie6LEbE0hV59UbGmgnypdFBC2fyy
         jX27sN9RohjaNfzeaZHP+cSf0MBwv1e0iG4RozIg42z2TeLfMxr26brA/pTi2yOcmd7I
         1lqT6emTl63+fgth2cb+TPvwAlGDmwSLvIKblSxvC33nIfwarzkVHgNnI4+RJiKQaNXx
         I4bWf0ZtjDq99BFkSOta5PS8EgjLvooieUVo/LnqmVw2pv5/yRM8EIWb4gHB+FiBb7Co
         rBuQ==
X-Forwarded-Encrypted: i=1; AL+hErGS3wrF2PNlTTbbwZzjbN3vXbvdXjA2fV3wcsFOvB9md/jOZZVEpDw6kI/Va4t5L8/5hQ2RZaqaHnRxFX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9No1CFd0Yy3mjcUwsROfiQV/urYXqg2NmfiAPVqVvoRjVUPele
	UbJdf86zOvkQQN9UYLUyQBCPyihOgujlNJoB3iZPm7jxFpJQGtppEuA946CF1vRVBMg=
X-Gm-Gg: AZFdTZcjCHk8Fv43rGZVZDOdd5wukUahvLDBY6CZ4vAG6b3ka20dzKAQ8Mkyd141ldm
	JT+8zSkCw/Zm6JDomc88CF+yjKmJLFh0//pZQ0rz/mfQNbPGMZXvHGvZGFOoh4gflrOu82psjdZ
	fP5I9xkwlbiol07LHi4bpeBfL0SyHBWEMANIdPPm+z5d+KeoBI/VukyroXKOjkcdPqT1TthQIpd
	DR/3h+z2LBeNr5lU9dX0uV9XtE+HHRcYl29F+oBJNdFfZyIGzJpOXI8GajCl/53sqNbgvAf3i1W
	3jkLWlmviXVM3GOJ1w3VpxSP6LAfvhjlPsY2fVFUf2fP4eWVxwtos795bjwR72cvNzU79rmk2EX
	l2rnKKD1z2i3eu68SKS+Z1j0+XIqfrijq5hRjoY2GkWZbUo0ldyLgLxb81zvbr+jEPPGTGt3zM9
	QI8wxdgdTfWSO2SiZy95hHzuEW+jTgXXXyhgfnAubMEcXmK7tVUXmqXXi1c56PYI4V01ZPqWLSb
	h95GOulIKsb/usmQyhDndeLaKXbrgikx+OywzpSOwmmzUZpKBnEWlejjpZ4pJGpKdpdbDXWG0Em
	VkhJjtmUP+a4P4cST4XVZU4V/jg=
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr16463654f8f.47.1795445650449;
        Mon, 23 Nov 2026 06:54:10 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm23615057f8f.31.2026.11.23.06.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:10 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 28/28] arm64: dts: broadcom: bcm2712: Enable HDMI audio
Date: Mon, 23 Nov 2026 15:57:06 +0100
Message-ID: <20261123145728.29082-29-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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

The HDMI controllers of BCM2712 feed their MAI FIFO through the 40-bit
DMA channels. Describe them, so that vc4 registers the HDMI audio
devices.

The DREQ lines of the HDMI audio changed between the C1 and D0 steppings
(10/17 and 12/13 respectively), while the flags request multi-beat
bursts, wide source reads and the AXI priorities used by the downstream
Raspberry Pi device trees, where these values come from.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 9 +++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index ae4b7c587dbc..97a4b819c01a 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -8,6 +8,15 @@ / {
 	model = "Raspberry Pi 5 d0 Stepping";
 };
 
+/* The HDMI audio DREQs changed on D0 */
+&hdmi0 {
+	dmas = <&dma40 (12 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+};
+
+&hdmi1 {
+	dmas = <&dma40 (13 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 7ba0fc540257..b7d7623ee9c8 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -483,6 +483,9 @@ hdmi0: hdmi@7c701400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
+			/* DREQ 10, burst, wide source reads, priority 10, panic 15 */
+			dmas = <&dma40 (10 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
@@ -513,6 +516,9 @@ hdmi1: hdmi@7c706400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc1>;
+			/* DREQ 17, burst, wide source reads, priority 10, panic 15 */
+			dmas = <&dma40 (17 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
-- 
2.51.0

