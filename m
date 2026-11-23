Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463387;
	b=lg8KXVugmtgTuUILgp5tlGjenueq5VBsiGyDkavDDPFwTPMomtLOnrXJTVeHANDnX8At
	 IxlabTlBkA++k6lt8hlWEg81ZEmlfLsatTVZw00qiEuGBED/6/UDPTZbHtTnHMo5fjmJD
	 ZIlnIdkgTiW/TZZcEmehf24uf8taC87H3JiVHVhzy3KhVEM7dCLWp7QSuDyE/TMDW1IaA
	 aWP3YgSaZingowf2AzyiHxbSvNa9x0I0164BNMX6FOwy03tW9g6pBnarfk/2eN48EjtCv
	 1Pj1ALJDPBZm1M91YlpiySe25ImKbUy0r9BEN77jSVFXvDJUlDfMOArf1yTGjQRNQFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hsLJ3XQTap9R7Gjdm3eQnj+kLtAheZctWZoqset7KZs=;
	b=UWG1KiAkBJIllOdBIHf8ek+RJw3No8fYAxFbiE0lu468/a/3f2bTS501/wV/gnHPY4+Y
	 j+4tSt0Punm9tnfQUdw6Rng8OYTe6JO1L0ue/MRxZ+GZ2KI/05C7Gtkczq6X0GeqY621m
	 xv4RfeooqJK/IzRCV0Y2TIhpbcQ3BEW1PG/ozY3CW4S5egcyIs+Yr230PRpYq8HEN0P82
	 e4V8XkDTZXBI02+Ipjctu/EaTbj/zde5eBbKFLbJOO26Ag1oXUB9iZ1VO/1mF8PiRsLHA
	 2+w9YzgF4ITY3QAQIdW2QoXc4/ZM1Tm5OYz4S5j8OOYxzzf7fitS0RYe4OM2NmwC0hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l8xQeIIz;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C0C606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C0C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l8xQeIIz
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so31815835e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795463385; x=1796068185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hsLJ3XQTap9R7Gjdm3eQnj+kLtAheZctWZoqset7KZs=;
        b=l8xQeIIzFArZziZL+1bnVi2o7RS9MXn8eXCWEYC4mE8UL1BZ8z45IrMTvhXnCeq6nt
         16zDktO2aX01T3gIMZKzyCez7IqB/NQ00ssGkXIR3EWqR5XZjlcOFWQCzD/cZCcw3qMG
         Pynk8hoPH8X2eB5clmZcV8OIUmnpsXH+6QLgzYx5DnQpYEDIcBZIUCUBE2DWiGzzcypG
         xM5lqVzbxdtqoYQupqAM3cpTSXouyn/pA9FtBohKx5/CQmCOboICji422c8jpcH935RE
         PwUJ9W9S4Pg/NUwlJEkfYi1EAJ9XTLeSM5ZXXsLKfhXiiUVOeDUPC7FjYxFPxZCbJf/l
         bxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463385; x=1796068185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hsLJ3XQTap9R7Gjdm3eQnj+kLtAheZctWZoqset7KZs=;
        b=XkPXMfG7fXp0S3LpN2iRcMZp0rDLprm7pEgTvB640+hOUQJgZ44ip9X+ikeV+vKhX1
         cSo9kK3PWEMHDWJ2cdUfKkrK7G8rosF+5nMub/EyRMBPRd4+wvwlD8oDvJ5hQUgESF+a
         N37gL1azFebsGSXCoAA26c+LRx3ZDhT++hFB0ffWYA2U8vIM3EN5JEHOYonHwTKDUGLi
         Hnj9m5IcwruR7+nnEwPe6CgQy1cI48MSvHykEmMbHlV/6KBzyBntwVN9sI4MvTA/pJR7
         pSQd4+oKKq1BArarSqxvSHt6AQ86Jyu6yz+6j3ATbaJwUX0SvOG8yUVcQ1U6xrBO76uT
         +KmA==
X-Forwarded-Encrypted: i=1; AL+hErEUcBa3wJtzi2G84oysfJ9v7sDkc0TP+b8CjAH2PmTCyw1a6Rh6CzmYunU2e5KKRvHbutbWMhdBYeliWH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JMmiX+9Kn6acXLXUNEA7P5d7j+l44l9TNYp85gedMNSOsxoUr
	FGi7hJXYh9HWKiR0VgthVk/XnuYFeqCXJWR/wXwxGPv4cyf7Rsvu9Sdo1ejWzSplaPE=
X-Gm-Gg: AZFdTZdrLoH4BWJBjE8WjgN31iEHCZFb+izFZ5DSx9E5WER2boMS2QkH6CY6+D62TuR
	Nx2AZ23XHSA8VrSHuscwWl+q8bgzak0a24ihacd745xZzlHziqv3XFjgVuvV0aUpTjtuczAAyTI
	HMBYPhB3e0Mok84PAqBmkRZKkjmpVU3dizBDqgDu+OyX6YkNLSQHqF3usRtEX3mA4cDG3ojYlxW
	YnoupWeerpChkre7ZKc41rSa/+qU6CBYHU8cRY965/BFIvmz8CaZMONuUVzrkFxMocbJfr+lDVI
	4YRnhK1ccQy/nijUlluPqo9slyTxSe7zq+saAD6+ddoz9IRK8a5Fqla/YIZvLAOEyAmu+O6Dmsx
	fpc1GLagd38OmNjAzYpZJeqY4NMrMScw/3JSuFAOee5PojR6SB2X75pdDfr1yGFoSKGgi8buQBD
	SGg7R6SUHNYHEVYGY/yin52gJQfuELQ5OkmqhoelTKd34K+2SkgAfI3Vsur7JfBWv4zCwWozE88
	eLSqWCWfOwbSSvaLYh1j+LAbCiYA2MbfciE/Uy0sgtMw8a7AbtlEwA+7gqiRRysZcmPSMdhHSHr
	/6SjmsI7qTX0l/xbmdmAcHUjdQT8A3Q8huCsV0QVJsaLOFXqMZMqPji1XvvzaPFPMrtnI4AaIJH
	qNHt9WBNAY7e4
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr263589535e9.34.1795463385304;
        Mon, 23 Nov 2026 11:49:45 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm300924125e9.2.2026.11.23.11.49.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 11:49:45 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] iio: magnetometer: mmc5633: Binding, supply and mount matrix
Date: Mon, 23 Nov 2026 20:49:39 +0100
Message-ID: <20261123194943.57601-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The MMC5603 and MMC5633 are listed in trivial-devices.yaml, but boards
need to describe their supply and orientation. Patch 1 gives them a
binding of their own. These bindings are also used by PebbleOS, which
is where the need came from.

Patches 2 to 4 add the matching support to the driver. I have no board
running Linux with these sensors, so they are only compile tested (W=1);
feel free to take only patch 1 if you prefer.

Changes in v3:
- Reference the datasheet timings tOp and tSR in comments, with the
  tSR one in a new patch 2 (Jonathan)

Changes in v2:
- Cover the MMC5633 too, including its I3C connection (Jonathan)
- Add supply and mount matrix support to the driver (Jonathan)
- Drop the mention of the missing I/O supply (Jonathan)

v2: https://lore.kernel.org/all/20261122190836.66111-1-gerard@teslabs.com/
v1: https://lore.kernel.org/all/20261122093412.71604-1-gerard@teslabs.com/

Gerard Marull-Paretas (4):
  dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
  iio: magnetometer: mmc5633: Reference the datasheet for the SET/RESET
    wait
  iio: magnetometer: mmc5633: Enable the VDD supply
  iio: magnetometer: mmc5633: Add mount matrix support

 .../iio/magnetometer/memsic,mmc5633.yaml      | 61 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  4 --
 drivers/iio/magnetometer/mmc5633.c            | 30 +++++++++
 3 files changed, 91 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml


base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

