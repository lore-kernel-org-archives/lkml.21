Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425827;
	b=zrlDRO1ZXKg35eqlTLQqhV7eypjG6ErAn79JNpsh2/c7MV5Xky1+q9XCrEBk4u1PtsOH
	 e3kL+gCOaDGCUqUPLvXP4URXWjGg6Q1LaX9E/Nv3k3qohNnhU61EO1RFR2VUM64/ziw0K
	 hh69S2obYyjD4UYzjpZs9Spsu1lDbDUwNN0WuarE0xLk6Ltw2/7I4ufw0qd0LyxwrU/KD
	 gNQGY45r3ZOi11MqmSIu9VGzqaLczFyNaREpmz4OkOaZVCtGfisNLlM+3kVUfwDgXfZig
	 2Kvd6vCemV8KPnPgplDXQ++sxdhP3vkcpoam/tdVtP6+HcqHiw0/CNli6ZvYwRtUTEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=;
	b=BCU4qYh4pnimfIDffWfNNs9s8tNzZoredSNlcamw3sbr0AgThlDU6eBpVZ85AuQxsUcR
	 alotPnxjQVxBgAUZQFutAoSGEmi3JohWOpM3/hjWcMFfvRMYmyVOrGC6NAknPbU31n68G
	 6f9NNAPJZodDxn3/insCutEfrakHR1YiTp/PKt/68BeWwzeDHooHV3bH6+XaEdi+0JvbY
	 5zxUKlM1jwt1JF9VrxUMmJG57iYszacwbjI2ARRyQ+uJ+19yKaOJL5KvQS2jpJxXYkJ2K
	 f5gSa7yTZN4Pt8vB6LBL8NnTE1B1RXvxQY+xtrTcQp9ujoyRxmoKLWnfEsiz1vSdleQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vT3U33Gm;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2562F606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2562F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vT3U33Gm
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1854083f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425825; x=1796030625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=;
        b=vT3U33Gm26/ZBgMRRlulxFYfcmGhlmydeqlDpIYjryTLrt+9HHB5QzPpvbD1JGiCKA
         G3t7XUa+ZBfUsfjF+OGv7+OZSpuia+iqVVIEpK4rk44oA2JeubiWqm7/XlnkGzH9qF7K
         Ib/6d95d/k2swjHCQnuJ0Ss1R9Wl2uGAqJ0mn2A3mVlWrT1XNk4EUDcRKEpbjPomOpCk
         03fZ/EdBRbTduuTsgO0g3lk47+jPVtLcFj8g1fv86fKaHHmOw5D7lvWrypXoyxbVTW+u
         3ZgSB0n7cmcclWhWJ+hR8Pc6IQFzJdhRw3czAOogo8CtbKEoJVoa0yzjbVZbgd0MYB0X
         0q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425825; x=1796030625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=;
        b=XnPEz3KD5vqWj8DdaKFq5ZaFDpof+G4UuH9qWFC5TQAMCBGVg4Es0vQ+lghYnAKbkR
         jj8cMkNH3U31IBD/4mGZQ7SvLw1fkN63AJeDDW7506JQzQfXiNOFHtUR9vo6KkB97Ant
         g6QjvTJyyH/+M7ZBtUW/XxRAQ0RgR3uMPnWK9sHxsGX1R24TY9ViwdhxEp8XtoKtJKzv
         Zm+F75AJslM9lgprdL+z9NhLwRFF8CSBYy/+jS8baV6J04L759PTVcaoodVHTtmamwmM
         JxIkcLiAwPIJ3GbrBJJMF7GdPqmtCtMG+HdKnIGeUHHPHgrX4X8xCnJODv32jTlFzVVq
         4nIQ==
X-Gm-Message-State: APuU4Z/kjYIaXZFDlZuSwo5eDH6fW8LyOSNBlbaXoTLDmcJjgYQAK2Sn
	iine+iQ6KqaGtn0U20w0I+V0MdQVvp6uSgEf2NY8P45GniiEwtDbvIku
X-Gm-Gg: AZFdTZcwXMiDzBbHldTAyc3SSzp3qGisJyBPbbRmMIX9TIM+RF69Y8XNwI1vPaywSDh
	OD8ceYb8nfxRXjJGHSWrex63PIDIr028BWaWx4c5KQhvB8hyCvoGb5FqcjU0Ze/5Zp0EbNZ4drp
	uFNnLKTEWVSZCew9xGwJjUCdIbdXhCkhNIrPILvAy2cBzFlsPjry0lhNSjgtg4Sh6PmE5PEsOX0
	JAn3q3nxU0PQJNy5w+86whAdeLUzgyIoSmmFVdViXv5hNgAJe1j37Sqw5M3VqasNLlsf7GpeVN/
	00A7/qSceBYA9qhQBPuv20ZmIJ9gyCPPi7EvDB2gKW0eS7Z2Ezb+hck3x2wNnYBwdbS20rxoNFM
	d5fv70iiO/9iOg5LQ6NtflpxEfL/PuV0kfsx4cvd4syS1um6vYTLc/agbvfh36a/8ZQjaXi0XNb
	GGVVWhgtqqk50gGBFWUIKSpm76xIX6C6h1P2WZtglIy2AU7ICIT7qQEqnt6+IFq0lgZAu0z7n3D
	cCSctR4RmCjDUy/yc+HDUmvsTDH/7JkLS45R5cdX2Kf17TcnU7W6iVjYBeHLHvXSxQqLPcXkBFr
	6/A6x+3V7Nszii/G2k7p2O9VjE+YBCifuVSFH8xeNk2pJBW98cV2HXxcOdmM85Uy1AJq9HqEq84
	GmtfSP15hbQ4rNgwxTO+D/iTMP7fUR0x90rY=
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr276942035e9.15.1795425825278;
        Mon, 23 Nov 2026 01:23:45 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:44 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>
Subject: [PATCH v2 0/5] Add USB support to Exynos7885
Date: Mon, 23 Nov 2026 10:22:37 +0100
Message-ID: <20261123092244.1792040-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This set of patches adds support for USB on the Exynos7885 SoC.
 
The Exynos7885 has a DWC3 compatible USB controller and an Exynos USB
PHY that theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we do not support it.

This is a v2 of a previous set [1], which was split into a clk patchset
I did submit back in 2024 and eventually it got applied, and this set,
which I never ended up submitting until now.

This version fixes some things noted by Krzysztof Kozlowski, and also
contains a change made by Umer Uddin, as he recently tried to resubmit
my old patches from github [2], fixing some things up, but missing the
previous remarks.

[1] https://lore.kernel.org/linux-samsung-soc/20240804215458.404085-1-virag.david003@gmail.com/
[2] https://lore.kernel.org/linux-samsung-soc/20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org/

Changes in v2:
- Clk changes not included as they are already applied
- Add Reviewed-by: tags where appropriate
- Use samsung,exynos850-dwusb3 fallback compatible for dwusb3
- Use unsigned long for set_ref_clk_rate
- (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
  error.
- Keep dt nodes ordered by unit address.

David Virag (5):
  dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
  dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
  phy: exynos5-usbdrd: support Exynos7885 USB PHY
  arm64: dts: exynos: Enable USB in Exynos7885
  arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 ++
 .../bindings/usb/samsung,exynos-dwc3.yaml     |  3 ++
 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 36 +++++++++++++++++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 26 ++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h   |  3 ++
 6 files changed, 90 insertions(+)


base-commit: 5d7b9f865597a74b323d512619c42f3e07ae043a
-- 
2.56.1

