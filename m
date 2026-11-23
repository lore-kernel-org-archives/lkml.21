Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437361;
	b=rt560YSiCqgHts2SUbW/65suF69m71Bcn5Pvh5aLd4WphfqcNiuYTBxdSUGdrcwjntQR
	 rKLDLTZpnDCiso8Q6GS5/5fa2HWQC5vriwnVHD/C8wOsX5oKgBWhAJ8oAm26T8GKRMtAD
	 6CfK01dG9X6/S/QsfOa2cuLCaR3LNP/Qky1AxCXtVIAQo/s/LRLxiznar/3dEQE7T3zG/
	 PD8jUCFBqQWhpNGkoxujWkFvLRpdAXRUAlhlRGGR0OimQfEY6Uxdrf0IIfFqYmqhW5Ek3
	 xHAzc6+lfF6fRgZSjw7L2L8DhcRDKETRgzL6suEKtJdcVazoVOwSaMCtQ1m+GdUg16g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
	b=Oahom7sh1IfFbLfFr4DCuCdXXqS2pUnGAInR5w95LwRLUjCdCMnQS4Id1Ra3AqpaC3Zv
	 XhMxVf/jsWj/k4LVJZE8vpewjsCLMiHFs8pcSf0VlJ87202GS5aAfg10nLsSWqrNEg8z+
	 UU0FTkSIYGn3oFOEVB+Nxikbc6NNjb3LoeReLF1FhnYiWEh0kdNJj6l1K62D7R4H/foMp
	 dnRBvQKvhNKViZK1H4fwrwjBOdaTb24CsPxk288li+qVdB6ILwlrdu97JZ7zb6TsKRYeV
	 PjepTq1rKmTEIP+pHwsn3ZzCLwDl8j8m6jburApFYvtDhXZLekxe0OYon2pKD1DlAjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTqnQskK;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF00606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AF00606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTqnQskK
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38431138772so4119351eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437360; x=1796042160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
        b=QTqnQskKRIE1cgebk3mNS42vnXeE3k4W3M13JDorM8JvXmThQ7ACiYCLcu4VK+bQ9V
         g9layI4Geer0IOQZSMpwe9SmleQDj3GdZ0xBTxfRnNCZcIoDxaN4eMTAAQcEORsQ0/80
         tii9DA5HDOBumdveehsPOCePuj/xeFzr+6lGzKrTexMPx6iaf2QQaouV9oVfECfX4GbR
         tktf5MzOOMFFJmCl5KCqs0BusxJIYl022a8IDjATdmIUAL2jKzvhtbHQmBqgFV+QyZlp
         5QUGCEimTBcZ/hVaYWkKucKZXfSp2wPr67biq8Y4qw8gmMngKzfe9Z6+Nfv+VVPoYlOQ
         cPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437360; x=1796042160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
        b=Bt6BoGJAOWgDly5eeWT8GxWX1kUxCyRM9s8EyH+dCObAYKCv9a+TahT/B6d4Sj485x
         XhV9BPYRGbY3RBusO4DCHrddu5bEgT71X88vr/YNXLpSU46omEkOI2d5gW20hZUZArO5
         RgG2Fu7xNG7HitE7CCDcvQN5FAuNtBZMUSa5f+XHxJa8gvLHX6RFrHDVv6mUWaW+jWvA
         4ARcl8I+754wArWQU2jjxQZimBL9hPphxB3/UMeNyyXAwaU20PE+zOtsfIGriafdFdBa
         /OzBQ834jyXoeekHhcrsPaoTXRh4d5r/2KYqhAQeIp/L0Ew6GQLH8++mA3/2wBbzNwTr
         kjZg==
X-Forwarded-Encrypted: i=1; AL+hErElXtxTUPqWGLHMjMF5AifXUW3c5Laow8OahKEla2aEuLemAROZ5iszEpvc3QpZNJOX3FLb0Ho+/ebr0RE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ei6lVfxq4tGx7fWq1KHy2Bzd1/Q+29JmJhaUdq2AP2Jr1YNOD
	zZDBVYREsocNAzNRmbnZd68kgOKz3QPYbileF/Ac432kVWm2XqkUhEZW
X-Gm-Gg: AZFdTZdABtGWafsE9fjvQ1B8S+T8Z1gVzlaezBrXDyd4rhPex01z4wT4lk474VFV4vO
	eA0IPALFzYpPmxwF6TqEg4IWft4qpw6KqNQnF+3CPA3sz/XeGEN4WVrJQ8QISlBoYeG4TTsHGP3
	jWwu7h47H+LdMDuGdiy5DrVA3XszG+X55rl+x5wCq3yGyLCjB47AE974NQCb0kBtOEGM1rb2Sqx
	ajcCgsO1mN+v+rim8vZZdz3CqvL1oGAUc3UU2qFQBeG2IK3DsnFbrqnXhtJ/WV6CKSwz18hqKjO
	HgClNelXG9WMgDi9yyWMtEMpzIskXOvCW03XA80BUgFLaSw1JO4oscVu4SwkhXG7mSM0faPaucj
	SviWEFzBFYyYtzoWbPBlhUy696RKnm4AXrndZTTi1XKttwR8SVsyOTOPVxVugBjsY3Kih/3sKSJ
	2mjWbGf/BehnJryUhYbpFfrezzZOHtbChikzBPkna8wWj/es/Ret0amhrkSkHFrvVTIrTrtYKIA
	bY/aAkdvr6cyifalYsU1J/5chcTyNTz5qivc1BJZ80WvVJDarEVQmWvzoWLvmavjV/mOA+DyZLT
	U+Zjh2xKNQTFNJ5VEAHAdtFmbZfmqI63jx5TeD4HIr+oFw==
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr6531336eec.24.1795437360084;
        Mon, 23 Nov 2026 04:36:00 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:35:59 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 19:35:39 +0700
Message-ID: <20261123123546.152162-1-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

Enable both the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
MIPI CSI-2 cameras on Xiaomi Mi A1 (msm8953-xiaomi-tissot).

Changes in v2:
- Rebased onto linux-media/media-committers.git next branch.
- Updated set_fmt and get_selection pad ops signatures for v7.4-rc.
- Added the missing MSM8953 SoC CAMSS node and MCLK pinctrl states to
  msm8953.dtsi so the board DTB builds cleanly on upstream.

Hikmah Gumelar (7):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 155 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  18 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 720 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 500 ++++++++++++
 9 files changed, 1728 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

