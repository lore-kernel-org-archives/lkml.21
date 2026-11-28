Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850178;
	b=QcjZIeEcc7g8JsTAhajL5KWlUX8LbsVCtFowdwd13c74XqUYtDLCyiG31zjYYWge8OUX
	 oK9lxbP9KLRYuXxDRPDVJAOvfJtQzpQ9MMWyINSA94kSNweoPBGFDaG8Pm7zij/kKu8A+
	 u642ZL4I5dsB96Sz6BxQUWnTGynwbzRnjaHE8BPORm9vMYUFhgr49kAwluaVIPsVK4QF+
	 l/dytuXjcqIe3aRnZb5+91iJSzLZyYJDO84eRcf91ohK1S9ZONSKEvTz18yQkptG/je3T
	 8B8DXp0BfCLcSJHl0QPD9/Ej+DpG5efFJB/BVZnZhj27cwTc/DXssFMjLhaMBYp6urQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850178;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
	b=BFTDiBu3jzf+1wOs/WmBk8u6Q8+7qczda9IKWJNCAZXShyd2uAL423No/p1sSI0fgss5
	 d37WEG9TAMf4t/EGX0fDL15FfHz8W76L7QmmElrdRixfiDM2BjQWXUJ7z91o6Fr6mJg6o
	 KLXQRCtNlFObE2IbzcR/9TOxqFDJ+7tIWlkByLz+wsnL32tcraCifVy3Grrq7sVGXMrkQ
	 kTcmQJKkFr6qLixzGvFnSbU21yNJy+gjWMmsav2qjQoFHk2DuxndpON2KGs9EejqpiaRO
	 Xw0l+Oe98jmNWcNvQlLbDskn/Irn3q8Rn/l/KaIVQiQ2Kq2Wk26je60qF2qwGdtFAdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CE6606A6BB
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67CE6606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso62902765e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850177; x=1796454977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
        b=r4du1BOJ+XJAgQ6IRmCDaclriYW3VFcXq6WJTCtzpnswGOesSkg9UJAzjt/T4Stb/r
         AvqShzTaRgB52GZ5oKrKmNDuyRS2ev4UeBl/c28liQnvGtKrm5Arh8RWQuKwLeXXRmrL
         1dg6JJ1850gM1qSU+a+z8WRffBUM2KuJvvm7MpHSyGt971yxqcpKUzJm3J6ROd6Ij0JT
         Xbd1RiOcJ3GiAOjoRjJy2R011xaMv1OwIlOONe5hGE+HEb4RQOgNd+Ae0+IOnKIf7PnV
         H5yAZ/yalWTsmhRRoalm/AuF+52TGaqzo0TdV4x/mbiA5csfahJZG9ujHWqSrEzF1NtY
         V6pQ==
X-Forwarded-Encrypted: i=1; AL+hErHENUtsl9xXiarx5IgV6OasOuep94pfEI/TltRh190aYdmHF0J87pnCMlet26IPj9LBXaPUViX8wuR8aAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qdBaqeQ1WfrdjO+C1AwDM4hBCxU8Mt+7QWOdluS6KUu+4SRcn
	uA9V0LFp4yHY5IcPi9PPSFTfFucXmXTRJtYBjqnSMZhaZ+RZCRu4EhqF
X-Gm-Gg: AZFdTZdHVupto0ggVzhvs4o11ZWhxdlgoGysTasl9d7wbAJTngl9WKjPnrmeOz7ZxMZ
	fT66lXcOoW3E3eN3skhuX26/qonBU7Ab33kZEbNJoMVIhkd6P1p7oz7QFORedj3rckNwZWt3iUm
	ncHRVRqDZ+a2lFs87A6cIfX9rM8S8L1aq2yKNzsErx+R4rYC+n63NaoGtjOt7EvVHV9Z1q2p9TK
	bEs95fWYNc9WeANFauL9u1rAFKMJ31MSoy80Y6HQTP8vNvEyc8qiI6FV2Co8QoCvQGvx3wXkMaJ
	N9zGqZfJ/6lFZV+r1gkmB+wgZNDrcKyz2U5CFXdj/8jV/mOjhYLavgvCQo9l23sSrC9BumzaA8n
	kxIppc1V6YZrl7sqRyFmpyarq/7xtvjTJJF83I2BSTRv55dy1o0EWNtWOlHwYQuLGtj6nmmX2xK
	yOfcB+jY8aQF0t39Ya5MncBnMSdvlQCJpFx6nNh0Q9vqKETfBKe89x33FnRg5Vh2FSvzoDXgBk+
	vWNHfksIHuBP2SxAYDdEkkT5WzzYGSO+i+ksbmruZ1IOXmrBb+jNlW7OaIdJpOWfUkiKLWGJVan
	FGjUO6yv0qXnIM071/9bSvGnErh4duJi5WI9SNDFcmyh0cd25aFU6p4SYXlHTrlnGehuFlrOgp/
	uLUWOTFX70BlR2X9UkJEaenU=
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr615051875e9.29.1795850176695;
        Fri, 27 Nov 2026 23:16:16 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:15 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sat, 28 Nov 2026 07:16:10 +0000
Message-ID: <20261128071610.27855-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
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

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII. Its address pins
strap it to 1; it also answers on 0, the RTL8211F broadcast address,
so the vendor tree lists 0.

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY. RGMII needs a
delay on each of its two clocks. The board traces add none, so the PHY
adds both, which is what rgmii-id asks of it.

The PHY interrupt is on GPIOH_6, so link changes are reported, not
polled. The reset is an RC network on the board, not a SoC pin: no
reset line.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..7b86ab2579aa 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+};
+
+&eth_phy {
+	status = "okay";
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@1 {
+		/* Realtek RTL8211FD-CG */
+		reg = <1>;
+
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOH_6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.1

