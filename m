Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432100;
	b=u1UxhDvq8PZFTdx6Q7FxPZG0Iw9EnfcsCENMlz+WKJghbyh5wvPoqPETgr+cFsxwugUo
	 xHS0uMygDTcCELleWXKWSY1HFI18ULNTyAYzFLN+FuwqMpAwnCbL8Q12/X12NuOa3TISf
	 fNa4gAROVo1KXOBKfc5+SMX2jfuWPIbUzQgyqCPDpdkZHwF+Ay5nlgGR86+qLGAJgMjKO
	 7ApznlqSIhIUDdAH5V8KJ146Kh0UaG7IEmQJ0936V2HrAJDldDaA4aaZFDQoCUfFQKpTx
	 3dBVXeg5KU0l/X6OF3CGtyIN3NkP/P2YdJxYnwb0O3A1lpWUyPDxPb35tRqEs0FqKfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
	b=YyLkpZAeTjHJl2A4PNZPmYZtb4dZSBSFSV/eVJ1K4W29vT6TOBpKJ+Kkt9DABc8Xa/tB
	 Uv8igMUF3oEb6YfgPeSRwc33XsiX9TWfZDBmUxZlXDcsV+YVfo4SjVNdpmeVCMohwPN7D
	 qxhQGIlT8pnhhhhfqcCuCkcA9QuJc8VphLLZ2c8a5L18gdlzMdbWCRU0HMcuZcNMq9RxZ
	 yh2bDdpjb5J2m9Msi9P+0BS/TScFeQMa5AVRh07q353Roe8jkzXainUx3LcD/eELk+mT7
	 28fphNZjixfxSiAmX/Cgs62yprmlPDQIaA90ASGghuMQduEelDg1PEw57MbFAlhw4dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ec3UFjGz;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DE8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DE8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ec3UFjGz
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-385d8a00598so4295329eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432100; x=1796036900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
        b=ec3UFjGzf+Ax+mOyj+jbqDFmxv1s+/ilYTPPCkCGVgYuPO3q35DWB/+HRF/Oz2sLvL
         3aQyHI6tHe6HhGEfoUlt+RPLm8ZWtFcdQbDy9jO3MlFzg7xTHIVOcfPEQcIPxRIAVWzQ
         BZ5lRfv4aUhyVlfNm6x6F94Qj4rbgapEOVaNaU+0o+/9/9iRZAOfOBG6MpyGxIQUt3xO
         ALHIZuvHue22QtQ81fiHVBB+0KkjfYRpS44nsn1Fob4Ikd3/1INTRshst8/sQFb0hzRj
         MAVu9TNdZwo0izTaUC/5fX2acbHZrF7RzdRbrdJR8h5+MxGc+rwHlVjLyFEt2n4mkv6k
         t4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432100; x=1796036900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
        b=QxHnaSEVxLqC9HAwHaz3P11B4b8sHp+NPY6zz/oHEDweSoA13BEU8+dXqRHdpHSJpG
         mxNjabJC1NmXuGm3dEugM8nza7/wlRjpYfSlljraG5FwXFGm1eqWVirlTDcQPfAucGgF
         upjQd2LrvHOwivBehlFmAGFDAcI5Ob3Go1qKXAeEmKhxpWbtfB7dpp0qW/MNPk/RV90h
         A5O4EETsPmIuKWdaFC9n0SSXN9Xa34KBEQP8QGXi8qQe6zsJ6JxTKhlTJs2OFpcKqura
         Xi0lsMk3xyXeYiln5d70nFgdrHUqxZ6SpX3YNVVPhwKcpH4ahQ5VErToLF5DiuAfO8EC
         jC1Q==
X-Forwarded-Encrypted: i=1; AL+hErFqTp60FJ2ChCnaSvZr8SfnwBIIRiYn8UtgpXO430GeRTv8CNIf4M2MRnsGGsJlTDKjPHvjKhAeYAElzeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eVXKv/TeypB52OLla/qO5ucjwgjpv2ZoCE4kjZy//0GG0PU4K
	+Ap13g9rknU+1zs2BqsTBBU585I/CmuGKw7Noo/oz9KfxOBXaSbzUwx4
X-Gm-Gg: AZFdTZd/MaevD4+yHbDUOtbQAzDtPbWlSHa3f+QTxTYpMqLzYabW43vhrWd+b+UG4a4
	f5ghQQMhR06TR6n3fMjhhKUxXTqDPAQ04OFoGVyN7X2h9Rdt4fceyuh9ozrL3crN7P1BpEJ6qZC
	L6oFL+0xrNDFn4UuzcJfbcgLVfz8VXHJQDXCk5yUtM1C+CbjmBDb963rdvEgy04FCuJT9qHo8iM
	dtL6RwLlsVC20N6I1JPkFbAabRYdpf/zTIE1Fu2aekkdB1k+VvDgbsPlcZhbaggg5uEdx4NkSHO
	KKzrWlkD2M7Kf6gaxmGERU6Y4GsoUXjzsUVMEDX29Giun8hUPuh6/+qpxmNFhsWsGNRp/a25GPg
	bzcItdwlnXyE8PVPK2APkOWcc1Vca1BViVNxw5N7ov2fGALUpVWYdWoQb80JBBO9TQMZKPlB9dw
	eRY4nKLvQ+nLLoPVhkG59Pk6MNzF4gHpIc31m6fhwfJRwmQNsqzoc5rhOW+Cug4Ro9BZYRzM0z+
	95Ev65UEXMm6H5q7nsnLkBYfLZ9kd1cMeF4ayQJzqcHXpExq7ViCU0o4wDEBqVz66JNkkQE9+Sf
	Wgvu/a7Aev9TE7X+atDSdcCDfA7LdR/xmnlRj12KdF/sng==
X-Received: by 2002:a05:701b:4587:b0:1b5:1a7a:2ebc with SMTP id a92af1059eb24-1b56f87ab60mr3863029c88.16.1795432099526;
        Mon, 23 Nov 2026 03:08:19 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:19 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/6] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 18:07:59 +0700
Message-ID: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

This series enables both the front (Samsung S5K5E8) and rear (OmniVision
OV12A10) MIPI CSI-2 cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot):

- Fix the 100 MHz parent entry in ftbl_csi_phytimer_clk_src so
  gcc_camss_csi0phytimer_clk enables properly on MSM8953.
- Add Devicetree binding schemas and V4L2 subdev drivers for the Samsung
  S5K5E8 and OmniVision OV12A10 CMOS image sensors.
- Wire up CAMSS, CCI, CSIPHY0/CSIPHY2, and both camera sensors in
  msm8953-xiaomi-tissot.dts.

Tested on Xiaomi Mi A1 (tissot) using libcamera SimpleISP and GNOME Snapshot.

Hikmah Gumelar (6):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 +++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  26 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 720 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 500 ++++++++++++
 8 files changed, 1581 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

