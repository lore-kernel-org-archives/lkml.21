Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447675;
	b=KoPPLxHf+aNQc3n6ADw8lPJTT2X0cBgh1ngm3fnm2bkDKnTBNaRHnrO0mKvQ09zJh0cj
	 YVTKSMeFQkoBmvymgXBy3j3iM47zLzwx4aDuxREo0dhHodAVWX3ITLFN0zZQr4p0/quxN
	 1kEjmwq6tgcr7Nl9fVldfXlIEK9Vbhe7Dd703znoduMVXC4ciOj7rS/RxS8aQa8FEf/lk
	 /U51ZIJo+w3wpPbw36FfHHIJwGoS1tD1vpexSAAizfFsPER3XimXfmF+7ssMigB1rIR/E
	 Gk8G1xnSx/CnI2xLl03Dj0GtQmqA5vgNb3l8HqS/P9xjZSLGp2A7jgI7o3wgmtCnZSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
	b=KoGPPUHH0Wza33jkfybyLCZDY1B19WS0gDXFzXLkaCyGRN6jteoGWOCJ1F75QxBhBYkG
	 v4MuyBSwn8CxJY/ohVFfvmJjz4dffpmfRfFJERSDJKNPUseewpAOLBxuZlgEf1dfBXFsK
	 fVyyAfnNQendpWhTzSYOgkk5LV4ykoc401yAPDmZUv8RhMwtnJwParGgKtnJgpJvmPSGy
	 dWV34hDSu2KWqLEz4LWUE21Mx67AIjGq6OnPz9Jo6JRgmH8BqDCf8nvZUOKaEFpdagKve
	 5jHS7YJ9o9wUqft7NjSV1plWwYyZTHbYONe1eSclwc5HMyog87REw32mldYAfqog2HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWUb1R2v;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133AC606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 133AC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWUb1R2v
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38587f3de36so4139072eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447674; x=1796052474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
        b=cWUb1R2vJjz6q1bHmoPN/LqInvTMfkVUHJM4/GfA2TcN29DOBUjjq8PtpXn5jaj5AL
         93lxc+XMTCtIQ+iYvqkvAWdBYKVc7/OGn8+41OgyJowmRjEGLTX8UIqIv1s8UCJfmqYk
         AzomVOu58i73iY/MROCpGxPoHo9igrRfdDeNzrI7OKLGSbfrXrSHUTMziEfZCM9z8r+B
         VBQ1n3AmEHl3IwSJ1PcxhZuO78OiBdcDPoAv+SjwCWtQ/gu8RB9cWNYT75p2l7guU70D
         nCeDlvuXjJyXpdv3FcZFxsnRu6O3lmeDvcfcQmCKaOw/FgBK1982jNY60Awlp/F1GNiH
         cwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447674; x=1796052474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
        b=OGkANFMYFxalsPCBGlBI9BKSOxIzpck7g/JELeu0RiCKabcGLsKCXNtX22KE/KMndN
         6r0BuiohMbWWeZ4HdIrUyfWFwwfj//Y7nHfnHOLfdh30vfYSGb0oKKwwx8gViM672sPp
         qnl/AHQkULkUKiOHfMMJlFPQWqcLkFV/9LXUlvoEQorsKJlnm73AFYCndMP2MSr5w0FT
         faiZnaUknLLH+dNPOvJxX0U670oVEzQHMj5NnD+2t5dF2XycZJ/z2UpTgqe8L8nlJ7TY
         tNWq0llSr1wH+70v05z+kdRRu2b/qFP4DkYVFTCKPxvq9M4802dR3auFOQj72jhJ9XaH
         ftsA==
X-Forwarded-Encrypted: i=1; AL+hErHPDSqcSxG5pm5kgX1Gzo9fZeRxEDNmeeVORf2KczyABqJ8x4MdTcmwljKp7tDRm1NzRAU6l8cTOGA/fN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uY4b1RNIK04YkC8LOIMEyAS+4pRLxKz5Q0G5lR5NecZUTB42I
	5Nsq+CuIGDPETiMTC0/GnEzpxFoNryf7Qoq554jn5vSFNwgg7G35NKvG
X-Gm-Gg: AZFdTZfGgHEIJZgX5C7al4TQEbIozc5ouKwOcGTwnX42pWeHC+dEE6L5WaGOGT+7vBj
	T2vzH3r4s83crT+Aq8ytjp29cLThMVEIqWEQyVSAwYZOW3eAhaMqXJqPBpDn+q73VrWmDvBEQlA
	2YJwhEVPbtibyue+GhFXJ5ySMqOVK/F0SAsQ30K4DCoDKJ6HlkZpOgQGU9Hfr5oUVmmD8LEPgUO
	fmQUe/Gp2hAjvpcP7wq1HJWEIVxv3m52XFsw4IqovB4NZIKIPWomn3eHFlKG8M8YE423mSjQO6Z
	cdKyzkzczI//HR1Jfi51xXAMSRxBvDCCu6EtqH2obDViBMs2SQ/Z2ZUwj+23irJ+VtP2UBO09PY
	qaHOmjpToj3QWhUcvhD965pETeCEVL3ZciCteGdnuWSKgjX/BdCnks49kI3gVODtWhq71hmvYKn
	2Lrqvu6WoAJtUVLHfPk/dvwmz7NaKVzj1aDmAFSFjKNAHhhEjWYnrJ9ijmXFc12wDHedSNyxfPE
	zwUic+aFFhtHxdciA1EVgOvPKNx6NmPZFU9MiWN8Gp0RcfgfC1r01L9swyxP4nuQ5vRFv0jriOA
	oBX/795cVOFxTdxOtMufy+CaiSV+NSWfK+HZtXdCH6S+qQ==
X-Received: by 2002:a05:7300:de08:b0:382:42a:d3ea with SMTP id 5a478bee46e88-38570258929mr12093640eec.29.1795447674020;
        Mon, 23 Nov 2026 07:27:54 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:27:53 -0800 (PST)
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
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 22:27:15 +0700
Message-ID: <20261123152722.168879-1-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

Changes in v3:
- Add Fixes trailer to clk: qcom: gcc-msm8953 commit.
- Fix $id and $schema URIs and switch MIPI CSI-2 data-lanes to 1-based.
- Replace deprecated pwdn-gpios with powerdown-gpios and model GPIO62 as
  a fixed regulator (vreg_cam_avdd) supplying avdd-supply.
- Drop unneeded <linux/mod_devicetable.h> includes from s5k5e8.c and
  ov12a10.c (suggested by Uwe Kleine-Koenig).
- Fix runtime PM ordering, pm_runtime_get_if_in_use() <= 0 checks, active
  state initialization (.init_state), v4l2_subdev_cleanup(), exposure range
  updates on VBLANK change, test pattern enable bit, and endpoint/clock checks.
- Drop undocumented interconnects from camss@1b00020 and sort nodes/pins.

Changes in v2:
- Rebased onto linux-media/media-committers.git next branch.
- Updated set_fmt and get_selection pad ops signatures for v7.4-rc.
- Added MSM8953 SoC CAMSS node and MCLK pinctrl states to msm8953.dtsi.

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
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 119 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 145 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  22 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 719 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 555 ++++++++++++++
 9 files changed, 1776 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

