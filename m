Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016573;
	b=46zygnTwWF44iGPz+DYvisZT2qek+/YP0rO8J14VlbZNq0s2i9rIDKXX55Ddv2VpDI55
	 EG8Jchf5OzMokR6sxuPYtZUOHywkGUahmcekkB01uX8ma+fIB5Jvve3eAOo8kaGdp7FTk
	 qB5q7phr25pZ1Px5jhd3Ip4ml/yLbwOvYE2sgXaoj4rVq5PZPv96D0ocNPFWMGd0QjckX
	 u+egrZ1XjMTw4jphEd2J4Y4Lg26E+K+8oj1HKZVuumQ2isAWMOQuSg9MTlyQ7nF78ZmMf
	 jJu05OlZ4jAGwZ2jTXC25tacdhp992QSSXsbl6B0kdnyGjllxPIeoPm2V9lNUe3TSgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=AbKMYKWH3iewMgKAxFSkHDiwx9izCcaKX86SNu4jj0U=;
	b=j+jM9j3Lyc8jptATfQ3rAcGaM3rGmbaOUgiSnutkGen53iOVV1AdT0dmKwkgUWbbYjWh
	 XzrsnwBs0CA+FxvIBk4sLwibqmmeYCx0UVzt1vBxXw0dNfUX7gCKfGFBwiDIX96mSwwgn
	 lDs+jL9BYmcNX+CntwFjdCP00/8Ie0h87CmPFV70NOptwhJ3YGfPPMVRszEZ8BGIHXUM0
	 FOYvRYURc0EE191Mk5oEcsMwPtMEN42VfetV6O0HL5qumrWcRbAKjN0gEekBzB9vWBt3g
	 /aEPEkQDcEny6PojhKF2ebH5YVCErVyWjHsygVNbpX0CPn6mT1rVq6Awbn9cbiU5lBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FZgEXscd;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAA2606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BAA2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FZgEXscd
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a32576da88so601548f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795016570; x=1795621370; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AbKMYKWH3iewMgKAxFSkHDiwx9izCcaKX86SNu4jj0U=;
        b=FZgEXscdbxjNNf1VALJGcNhTT1gSdlqPDvyjoKXNhnb39wzulYXWgnpyk3wqdC3vLh
         uSgJfl5L0BWQkqwPxnnbVRHbNcOkQw4K6A7FyHKL/095TJ0yrb+I/aVqceF/qYMFXdL8
         9ny+CXM9zEVKMEuPyOlGeyJ1xujE3Vv5qT4KDaSX+Te0W1vgJYgweuSjTyYHIiuA9crL
         vsYYXhjH1Kc+XtKoSPuCMqti2K+a9gX7YO6fJla/TzNyAJIyTcQw8xYPR1HsGsCYC/CD
         DkTJLgaJ7DbOHwBUYNMS1Gls54hzPGRWOYVfOvyGhkqd6EdgZHxGZhU8j220h9RdM/30
         kQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016570; x=1795621370;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AbKMYKWH3iewMgKAxFSkHDiwx9izCcaKX86SNu4jj0U=;
        b=BZ7KU4tj+mHr3qOdahx09hNp5ffe/vXluSfoFOVKcORLZY0/Lq7sSU4PEavvYO/QVE
         HQmOetuV/RYara5m+FXF7uvcjbO5Y+64zPNmuQV2uW7H0t7luRWZrS7Nef8aGaHgBW31
         CNOO6Rkd8IDsVQOmHsvWCSo9ABP4+w92bUrh6ehYgltLaB0+4W7q6E3DwEXu1v12SXND
         +q98f2d0iBCgK1gYk2XcXDsV+w12tt/azDYMvfsvYIF/uhPvl8CtIBhYJ/PtXOMR4uIB
         lc8AFzXsOjx03nuTngjOE2SzV+6WOQJZh0HfE4LPpnEH9FZ+DI6Bd8MuZyFAZF5jlcNQ
         JLvQ==
X-Forwarded-Encrypted: i=1; AL+hErHzM1wqcpbzqb/8JGFSw0ORbsHwbKlYPrF4xmRITmnUlKpZxkcIFe++5zZJ4AoBeCg5QXuCL26JSgY/n3o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SFUFG/pqV8E8ueKu07tK3Xr1Vz9QUYa8GrFYrKMvmfmQFZuym
	hM9+ZFGPecEkv6BfEbegbh1a82UIXDulLMx9EOVt7jJxNHDL/cE51ph5h8GlJnk+njY=
X-Gm-Gg: AZFdTZf4R0I7HOg1R0LMYj1Hc5/WhP8ywn5gjhSjXwdYNTaOIk0d2KX2kMESgR/P4FW
	QQE6L8SWGZ4mw1oV5bgXrgMBcaaW34xBdw0hYDjC58EWilQSPX8WyxxJEV9y8NFjtfDeuwuJnNc
	Qwdq+jey7FUO2Fb6zfgwiFb6lVR2tRa5wf0XFyBSkgKwdIchwOzwupOp32db/Cr5QfSF8IneFaM
	a8KYx6Erunxk+3QdFR0CnqqF5CkmmVsoSkRfETlQ5mM3HdoAr8jjSIVGfvpHsLXhfLBCHhAHKtq
	RI6g/BbuiOrvIXyBG+boFW0J+y+9WLqYVpO/gzTN85rB2sM/5VdfVBu5qSbHsBKvEOcIFAP5GAo
	Zvhd6vDRhFd3iEC33id5Xr2Rm2OoJe4rYuX6ZuFeRyM+hzVtotbpZMVAFpQxr8Fjc/5/Lh49Y4o
	YY0G2YfSSGAsOTT6wfxKaHyLrjb49boSQGs9aZpkq7lbXo5HuQOvQXXumeP0s5spJ/AjJNNOLtX
	4w9hNtKktV7QnLMSwzX0senUhiON57KpD42bgeJ7r2x2i8URZE5I2ZBUdyyYL5DAuaVJ8Tf2XQR
	0JP6nea7Xak94W4BAUTC+6Sw0Qo9Lpn+
X-Received: by 2002:a05:6000:220f:b0:4a7:8406:1e91 with SMTP id ffacd0b85a97d-4a7840621e8mr4063009f8f.30.1795016570528;
        Wed, 18 Nov 2026 07:42:50 -0800 (PST)
Received: from [10.42.0.1] ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm5555261f8f.36.2026.11.18.07.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:42:50 -0800 (PST)
From: Daniel Drake <ddrake@baylibre.com>
Date: Wed, 18 Nov 2026 15:42:39 +0000
Subject: [PATCH] arm64: dts: allwinner: t527: orangepi-4a: Add PHY enable
 delay
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
Message-Id: <20261118-opi4a-cldo4-ramp-delay-v1-1-9e3368973379@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQrCMAwG4KuE/3mBZXQqvYr4ENpsBuZaWhBl7
 O6C3wG+A92aW0ekA83e3r3siCQDIT11X409IxKmcbqIyI1L9aCctlwCN31Vzrbpl8OsSZOYXMc
 ZA6E2W/zzj++P8/wBbu4jhWgAAAA=
X-Change-ID: 20261118-opi4a-cldo4-ramp-delay-45acac1e1705
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Daniel Drake <ddrake@baylibre.com>
X-Mailer: b4 0.14.3

The Motorcomm YT8531 Ethernet PHY on the Orange Pi 4A was not being
detected: its ID was reading back as zero and preventing ethernet from
working:

  dwmac-sun55i 4510000.ethernet eth0: cannot attach to PHY (error: -EINVAL)

Add an enable delay to the PHY supply regulator, as was done for the
same reason on the Radxa Cubie A5E in commit 7076938d20d2 ("arm64: dts:
allwinner: a527: cubie-a5e: Enable second Ethernet port").

This is also similar to the original vendor DTS which has this regulator
as always-on.

Fixes: a3606e8a7819 ("arm64: dts: allwinner: t527: orangepi-4a: Enable Ethernet port")
Signed-off-by: Daniel Drake <ddrake@baylibre.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 26ce579b42bf..e1cd43ea7e03 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -319,6 +319,8 @@ reg_cldo4: cldo4 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-name = "vcc-3v3-phy1-lcd";
+				/* enough time for the PHY to fully power on */
+				regulator-enable-ramp-delay = <150000>;
 			};
 
 			reg_cpusldo: cpusldo {

---
base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
change-id: 20261118-opi4a-cldo4-ramp-delay-45acac1e1705

Best regards,
-- 
Daniel Drake <ddrake@baylibre.com>

