Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787125;
	b=3QMzYiIegWVbZf5h/AeIZZjRMfYqaZHb920cI27JKfnb+UisodvftfFvV6WRcIeNQPxF
	 nB63v+StC49X/iYkig94uqEm4nh50jCLlsc3/ckbIj2c1GRDpMShSxlm352ZA/l8oP3So
	 B+1dNa8Mv3fkXb13WenbTEK5NcJbSxe+SETqUilyY/jXltIbqGvwBC/r6rvMaXmmjtDM+
	 REkMB3tWd2j3GoafQs7B55p1MBE6C8UAe6lV5ymYxUJ2YKH5QdnnkrWGDERxEcBTQ6XWx
	 TO4+JmNnPXobIn6htVZd7yu/GBtaAsd2Q2ubV63oWTEkAH/C851tYMuk8fy6gL9HmXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=soBllhnRsKIz6tjmTzgFLG5DRqhYbElDc5QHHZS0VwA=;
	b=2GlxYiy56WalXI6hEjw6lkN61mSE3yE9vuMq6/FfZbZ22/OPHrp41CAUMXE0Yg4PpOyg
	 p+1O0oNjfMQN+5OUR0BQDUGax+On4PPUDAM6ME/WAxUredRwMTA8MFN9yXt5YtRmQ8rFZ
	 CihlG0wJQ/XrhcdpQcsQPX4AIYv8DNBMcHF9mJQoX/Tv055uYRNbcR669O995y3+mW8L4
	 wFpLhdCsxBzeophkT3HeYNYo9PYEptC0X1KjvWf/2DnHHJe1ePUumOPFcgEDvj5EqXP3D
	 dUXn7XtYNDa0MO2iSTtJjX6P+VZuY7rbWvp5ObuozeOFZUBpXF8dycWKwGUpqLOKYAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRfcINcX;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF4E606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF4E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRfcINcX
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f07a960666so57501295ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787124; x=1796391924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=soBllhnRsKIz6tjmTzgFLG5DRqhYbElDc5QHHZS0VwA=;
        b=VRfcINcXZkGKJlamNcG7ibHTmkHDvq6tYYNhQjY8ADYHJWVBhMYpYMWxlRm2qkwme9
         lgTfSZBRZSLaG312p4Ohbr76U+E2prGbnT3tnj+y3hln2bc4Tgmktck+bQqd6qpQXR7O
         tOr3JiU5A4+HmQ28gVgxTLEnuDIjFyohxW7UNtSCDqueBxW5v+FxvDr5XEeH8NNks8j+
         eADDdfx9BNuutaS7srnsPUxi2rmFhSeD3tYDJMEhuZ8V/WVNs8+2dKZ8LuIOC1kFyAAB
         bPRwEn8AWHHS0vwm9zq8MrCkxzNPbmF6QFSZLGQDdcFsQMc0/v+H+D58OIk1vutYWRQA
         4dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787124; x=1796391924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soBllhnRsKIz6tjmTzgFLG5DRqhYbElDc5QHHZS0VwA=;
        b=0zKdHXy44xOmaFEtU+qIJHw9h9z/F4saMUIWJqLFPxD+h2uMuXecPYVsQ66FAyG1Xc
         PGak5o05no39CK7e42P4ccQQwY3BexlFmW3XZLtn708aYGUrWxX5oBrRZwdvuAMYy+X2
         PBxDIzP30kgNt7lxEWIRgB8mtYSoPTTQm7iuA+N43HMenqO8Q4Wrl58qx7dZDKpcZn0g
         CPWkkGH0eG7G9g1ww6Z6+CopIJj+wxbNlpuWafY597UErurDZVNNZ/jDsA80iXPaST7X
         lx19z1rysTwrAer86MWLM2ITkUxIOSzEWo52ZUrhHhC9gbzn/s88JRMeIl5fxq8HBWtK
         Qy0w==
X-Forwarded-Encrypted: i=1; AL+hErEdqX8OZ9iJAS06Y3CyykA684p7UjL+9lhyKxzppyGGqf/AgX0v0Wm+mkfKDdu6WEdWkN1CKS9KpShh5dw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FnM63B7RKf8bixHfOwJ7zqe9WTXNrY8A1anz+lKuIiIkjE6Uj
	qjk5HZUL9c5nEO0UWHlNQhq0z9Ftm/TVFbHE4heC0qqOBbPZeeOmg3xN
X-Gm-Gg: AZFdTZdb42aeqvuXiVwhjJ8NqCnbjl6bPUbNtKt0E4crXiAnZcISu4Vwr35fuL4yRV1
	wLT7Eq79dSx5bRAyrvajdRMTX9GJ8rwJNU2zIBnA9Kcej0S31W+Qcep4pbPz/YyFEftyBoD8kJk
	72T8rwuaO3927ZFSdVBY3lv2l4lB0dC3NAu690gfTC2bNpU5bxB7V6fgdxT7p08HSq97Hceda+A
	UT/DCqBbuL1bRhNS1UgHdA9TQTUH2XUIGOjxyXwDln2SU6fvzKq3/vqeT1/ihRhaiRZA2Bs+i8h
	nt9N8loIy6YnVL4QWTTnQeeOfxC7CJEBr+NlbaAosGfNQVszYS7SukATa2koU/43sY8ft2RAVDA
	Fehg5v7DVlaoTACE9xmMAbNligrPnFvPwWr/7pWAYYGneFX4wDxc4CEULPYc7eKw+KfJpmU1nEr
	7A3ovHWe/vDkxQqDZ7I0nVXsWh+GgvGrjo/qG3kWuV6r2fc8qxYwroO1ZvVbTMatVuKA2hHSeOj
	oG3ARyKkb1vOTZ8t33UlEbeYTMhXg/2BCZy67YbUaScKMkjSnB4XIU1TPUrXMcEB18R8L3VyskM
	7YLDgu9m4qfeE62EAO1rSD4IiCtX6E/QbiDmpHX4GbgC1g==
X-Received: by 2002:a17:903:b4f:b0:2f0:3b8b:9145 with SMTP id d9443c01a7336-2f03f1851e2mr258565905ad.55.1795787123904;
        Fri, 27 Nov 2026 05:45:23 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:23 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 0/7] Enable front and rear cameras on Xiaomi Mi A1 (tissot)
Date: Fri, 27 Nov 2026 20:45:00 +0700
Message-ID: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

This series enables the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot), along with the required
MSM8953 CAMSS clock fix, sensor DT bindings, V4L2 subdev drivers, and SoC/board
devicetree updates.

Changes in v5:
- Restore missing `select V4L2_CCI_I2C` lines across existing camera sensor
  entries in drivers/media/i2c/Kconfig.
- Move ov12a10 Kconfig/Makefile entries from the s5k5e8 driver patch into the
  ov12a10 driver patch to preserve per-commit bisectability, and add
  MAINTAINERS entries for both bindings and drivers.
- ov12a10: Call pm_runtime_enable() before registering the async subdev, add
  v4l2_subdev_cleanup() in the probe error unwind path, update the active
  subdev state and return -EBUSY when streaming in set_fmt, add the 35 ms
  post-powerdown delay when reset_gpio is absent, and match the initial
  V4L2_CID_EXPOSURE maximum (3372) to the default mode.
- msm8953-xiaomi-tissot.dts: Move `vdd_l23-supply` inside the `regulators`
  child node under `&rpm_requests`.
- Include base-commit metadata via git format-patch --base.

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
 MAINTAINERS                                   |  14 +
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 145 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  20 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 770 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 567 +++++++++++++
 10 files changed, 1856 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c


base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
-- 
2.47.3

