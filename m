Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609953;
	b=CXuggbnRhqo5t5A1YMhPkXnUw4pjyGtisFG6oh1hcZUJTMbLWJnkj1cQHbYmv+ZkLcll
	 +cbL6Flny+TNoMOnqxQ3pTI0jFGyPPd1XJuWquYfe3CtQuNLTF0qzjdc2DaMZ0YH6pusZ
	 RlZ6y1LKfUkd2+PJ7REerXHJvk+1dTjaqNU/VUC6vgBaezcUHJlAJncs24sunW6Uja7Kk
	 1oU30saTiS8XqGVg2Pqmc3xtBAGBDKAFy3mjpEHEhUgL9SiudgaZGxyc/39BemjWZnbLa
	 TVy2MRnXWpQJHNb2iU3vk/seuV3Omyb5PS2UAYqbSahTK20SvcU0MgTNXtsobeNz9iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
	b=mofIeYn7s6ch8LoMf+FVjOCRWSgRYbwsFXSQBRhzcomGIyI9V9ntHkNCX5UHsp1O7IJg
	 CXDYXWVEXD1YiLUjPpRG2br1PR/r4hmdkgY5NSW9ziflHTSiv10+Trld6K+jp2MfiAhUW
	 siExSZAXaeW79oanQfMMiayJKo6ewV8D75NAQXEtJmDK0ts824zY+TQwGGJPjWiejgpH0
	 wurq6q4kZDsXQd/wHk1Qb/3mxGJClrlaVlW8z9sPABYC4gwRyswiLkvtgNOkHUKXrhgss
	 j56Yn2Z4GT1XvyMIm+zvZFw0KvE0b6mWGElKIdKQCPus6ss1O9DVkoyod2z9axJMwNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ppjk/PHX";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A964606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A964606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ppjk/PHX
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so2402256a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609952; x=1796214752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
        b=Ppjk/PHXaFf2xFYnTBi2dflKcU0hPvBRvusUu56u+X6FH3/D7MWrpc2TAdElIndzie
         r5b5IFSr/FZecCaM4clvxCwNoPcyYCygW4Koc8jqu16fbHdPP5dNj+f2swgSkZUuugCS
         s/SADxoPwCg0kTSvzM+rCUdOzdhHnBwOs2YfOqthL3g5i8/CoSyc6hLmvarCkZTahFTm
         s2Qr3l1l67VnUTiVAahMxc9jHO4cyRjmiWlR6Rq7ZUl6A9f1iACWbpvHxkVIw4jnEEpg
         oJHTRzVHAKJ302EvQMbmkA1aqM49jXXVkKaOxNi2ML0YYdIPxip7PQknR2CUZFawOUun
         6ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609952; x=1796214752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
        b=sePMr0PI1lvF90Oe0w68yjdSxNj6YNEICfmPymRLk20HRzuzDanBu8Lj9Hmef5pZJH
         kdLKlo+bm+mJd+D/yLPII4f8ncTTyHD1rAVM5tUGWHkeFvwask1R7vkd7uO/uPlyzTO2
         iiyR9nIcv/Qld+LfEtuSpK4K1c2CubovBFarGPESyS5ptLYtklDrtXcu3dwc1z0JZLx3
         fyqFXm1UcT3evPLM6T3uqhrJYSetHZC44URvaLwhwE2xYNX4AIE3uEidbFWBVJDAJ7rt
         Q7UAx9cdWW5+z5Cr4OVWSyOjnnGJTekqzdb7N6dT5sQI6T2kXQE+tZcfuFKPbP2Nojfd
         CzqQ==
X-Forwarded-Encrypted: i=1; AL+hErE4lBiXw/YtUlLPfyQiwVRPhfJ8ZdP03XfmgXF3kJdn+NrCnjbzGme2cH2RynrsTZUsQyUptzrX4G2mc98=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wr/MoQ4mfxtP2Vpxah0R845o4TMgnJIvGmmfPIojFtEBxGLSa
	UtBDMwZyQdwM+O6NemYwTy/OYAub3Sw2HWv6uXGOql4sqIkZa+UZE6So
X-Gm-Gg: AZFdTZfc4RqlkJSdM1+GbhgbBVJRDgo/qIq9G11JSnc1ocYoNEICyfsT2ruZ2bZYYVZ
	ispNN8TppWKGMPn2pTXCUIxnQa0VyZOxYTRzGRpAj2CwrOIk5KSjvOqfvyNqjQZ5mSgXaLGVBrK
	1t9O2zE1JCk50DTjDRPtI4MyeRKOJDk9KD83dqrP/K0L9W6mO+1sceWO9bfg8ByNGtoWohF0BEm
	GTtQWsaMJs+3QK2hyh9kgKM96zlo2q2TZdgGDCyoyDR72fR4cAjLbVk1SNFJ78pAFuF4dYrpJjd
	m7Ry3mlx7ZKV2hDANWIqxZEsyHJ1bf7kz09REm8zRglxP9CvKDC7Fw3Zat99yzh8+7lb/fWzbg7
	c9oG6BqyTMQUIa6vkvIIJEB/Z7foVbT/Ze+4VqeSohPDtHh5oWe9ysdoeRvAtvCOt3WQcDku1fd
	Fk5ookGMvwNzjJ5YyMUpeRQtUEphESskwJMStAvqonouBoFIQlR2JLvZjCJBVRIN359tILl/MEZ
	EgDVY2YxkyoFLU/8rMidNY4liibzdmjJmxW7qMNM6oAyP+ISxKDWhXq+84D9oG+rYA+AbnbuG38
	ONRNWYEMyZclW07AA3S6w5el0XoLJjbuBcayoqwZaFd/9/fT
X-Received: by 2002:a17:90b:3b86:b0:3b3:fe22:2739 with SMTP id 98e67ed59e1d1-3b41c9c34b5mr16172380a91.54.1795609952223;
        Wed, 25 Nov 2026 04:32:32 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:31 -0800 (PST)
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
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Wed, 25 Nov 2026 19:31:39 +0700
Message-ID: <20261125123146.379057-1-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Changes in v4:
- Wrap all commit descriptions at 72 characters (Konrad Dybcio) and fix
  all checkpatch style/alignment checks in s5k5e8 and ov12a10.
- Keep CAMSS CSIPHY0/CSIPHY2 data-lanes 0-based (<0 1 2 3> and <0 1>)
  to match legacy_phy lane_base = 0 in camss_parse_endpoint_node().
- Add vdd_l23-supply = <&pm8953_s3> under &rpm_requests for S5K5E8 DVDD,
  and specify assigned-clocks / assigned-clock-rates (<24000000>) on
  both sensor nodes.
- Request powerdown-gpios instead of pwdn-gpios in ov12a10_probe(), check
  IS_ERR() on powerdown_gpio, drop vana_gpio, implement .init_state,
  add v4l2_subdev_cleanup(), set BIT(7) on OV12A10 test pattern enable,
  report 12MP native/crop selection rectangles, and validate CSI-2 fwnode
  endpoint and xvclk rate.
- Use pm_runtime_get_if_active(), check __v4l2_ctrl_modify_range() return
  value, keep post-power-on delay unconditional on reset_gpio, populate
  full pad colorimetry, and reject active format changes while streaming.

Hikmah Gumelar (7):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 110 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 145 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  62 +-
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 760 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 567 +++++++++++++
 9 files changed, 1821 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

