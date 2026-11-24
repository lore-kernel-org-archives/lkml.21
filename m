Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537884;
	b=NiOJql6zU9DheJEPOQ5tDNQyeQD6AM2gew4h7W1Vp1KRHM5PUrkaBOkCeOSHTG93amoS
	 RG1W79NQZtqxUWkRKHCDDuvfcQpuGyTJ/7EQcVAI2h3+J9nl42WSs3WyVyXbgNV5w1dHn
	 pkJ6LFRDfiENHQv8Q1FALvrc2YtrEscRZD6UBXb8c8bs5F4/PTXxQpto9nyCSIuSwIJSW
	 HCkiDsoNeuOGS0M6ueL8rRIAgGlIKVlwMQlrAPw2TT+exlZ3ysYj1pCkfkWK/elkLo8bm
	 qYd+yCL90F++FesZ7JnHy7TGBmvIYimthzqyHBhprD4h/k0oQ3Q5ZfajHHyZK8McXeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=oRL5aTXHyHFRAfz4KwgNvuAkNPsd3FsBbrJQRIQaKIs=;
	b=U9rS9RUsmCNSsC6LXSPiSyqYKUWBDw7kTg3Hyn2jEGjD7hFCiubV2Abi/PcDY6ppkKnV
	 E8JFqAG6zz74WAXCdG/f11hkHYVXSaDiy9bwFZcuoq1216bFqbQiGC9VZCKQP3hZTqZrP
	 U9zG+F/8+H2QFxR7UiyTTrmdGx2sT1PioJAx9ZGh/8NRg+WLY/qYt4kX+bdpr5mpDYOpv
	 K5HVeqDbrGOK+Xh+S7Sl/IoKGux5v0FozFaoIGIu8zm62FbiFyRouFGAJL4Tt83495XCr
	 gXSE9p9rmKA7fyRxZbzXeyiwIW+/JtvAkosNuIDVSJFTn9zrFfsbwMbgx1M6ZkJKGjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvxPLgQw;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D556606A329
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D556606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvxPLgQw
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b86fcbd647so7456527a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795537881; x=1796142681; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oRL5aTXHyHFRAfz4KwgNvuAkNPsd3FsBbrJQRIQaKIs=;
        b=XvxPLgQw+Hr6BptL+nZXEjfpUUmPl0SWRZAM+FEY270TDBYwbiqVsmfRXFWQGp2Fot
         sqcc1ywRiYO4zCeZQoAAKQXCJwN6OkKBz6YNbQySt7BZNt46MxlNfS/E9YGgsB1Fv8lg
         /xJ0DLjzinQahc2ruQzHDlpxtPSDIekxKtg7/3jOkkr0KDILxrFzTeMDOezHMZ4qA6LY
         JbD1Z+9ptIiNKJAEy0A+m2rRM2rp4L9Yy34H2v21MDbrB7QgWCoJIDj+jmfMlcuSTVwB
         jjP66WA0OOldGwC9eVtkK0+fodFUa8cVpMw2M4bSDSZb1uTXW9bY/biijl/Es1VjhnvC
         vLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537881; x=1796142681;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oRL5aTXHyHFRAfz4KwgNvuAkNPsd3FsBbrJQRIQaKIs=;
        b=12w0Q7CLorcxynQpv4a8lRjROahTW7h+oN3b/nGC+VdMgWKiRipjrHd6fN/w61ieRp
         vQDdY7f6bL3KThQHiYiviyUVdE1+hgEBHtMpu3QbcxO8LrLPYxzISbTe9shc3mT1gh1c
         v840aG1YG+n/Rey93wKsfL0PYGxROyAonyT8t8iolitKKjr4B1I1zhyDJtaTDsblTyvV
         i6xCZB5qTEkanZbo8kGSoVmtCxZEkBK/085LaQB2lhpudr2X6ziLES8lIB/aTSTghGge
         E92JC0j6UQT3Gjx5uftBVYrBeqJBns/SUabbyWA3mauAgLm0fTCMRp9MieWjbWIM9NXl
         IK7Q==
X-Forwarded-Encrypted: i=1; AL+hErFaSV1FJSVkAaogYQ9UwMQLbaIxsuvHMpnP3DVvZe/nM3H4Z2L2zLGjRusq26ITcIc/WQmFfhEHbrohAH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/go+srqLr+kYOi5dGwL4qwK9hXyHyVXji31IwXR+c3K6AGZbWz
	j2rsS4NRSLxJdHKTsJNiQjLdSSF6ST/f/DMA8uPqwm+Fx5fen1t+A1j1
X-Gm-Gg: AZFdTZfO0XxMQVLYYgolSS9PX/2lcDQZCyzKQ+HRQzuwmf7/12Juf5JyrgzUYtsSkct
	HDcVY7z5qEs6JRzh5+ssnHz8LAa0HchBqgXQ9BUh7rGAMiGMKDcp007KXBk+AhkBCDO2RXMSg7k
	J0dBEzYpudjI6ukjcJYnXMjm4wvRWGaddeVCkd8GMd7PKCp1MlcMD8bEz/6zPUUkTEatL4ovg/g
	1eoQwZiYE8qhphZ91W6J9Osju2F42qGwLid10GaAtrX0SEfezB5JN9Y+G+7rk1PAbO3im18iTCn
	HU09EpjqFBcz439PLHr6m1hdPcBgkUPhdFXMN44VMrVepQjvMHOGYAuIV/zU2Lek6BFgIRxolWc
	hez59QWFtRzr7wJGJTRvzmpzZdbtNd2UJn7/xC8ZQjOz/R/QxEA3VFMbawtpFsLkk4IRqss+E2A
	T+VtNEGm7oZBP7qTMDT0GLKNnX6J7SZMf9J9w78TjjB4zR1C2DNq0+/VCSEqRsSJlmWK8C2BIe/
	vF09QZG6II4AbvUB3KKehlpnwJ+jkz9Prq4TD8f0HkRkMHCFK3jXV2GD2yNyXXHRYH/3lQA2Y/g
	+jIjjp5Uc0B8wwL/haww/YbjMW3tx4RF88VcpcU++74RoCYjErKp8MSLAkC5d8LzYmc=
X-Received: by 2002:aa7:c0d8:0:b0:6b5:6b89:e3b0 with SMTP id 4fb4d7f45d1cf-6ba1fc3dcfamr9661275a12.19.1795537881297;
        Tue, 24 Nov 2026 08:31:21 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d107:658c:9ded:696c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm33058741f8f.24.2026.11.24.08.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:31:21 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/3] Add RZ/G3L HS400 support
Date: Tue, 24 Nov 2026 16:31:18 +0000
Message-Id: <20261124-sdhi_hs400-v4-0-df452ccd9bca@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIANa7BWsC/3XM0QqCMBTG8VeJXTfZ2abTrnqPiHDu2HaRyk5II
 b57UwiM6vL74PefGGEMSOywm1jEMVDouzT0fscaX3dX5MGlzaSQBQAoTs6HiyctBM9bUWIulZE
 VsASGiG14rLHTOW0f6N7H59oeYXnfmWKbGYEL3uQWnVMgtSiPdsgidkg1ZU1/Y0trlP+9TN6hh
 tbUplVK/PRq682HV8lbXeQVlJWzRfXl53l+AeqSIGwpAQAA
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795537880; l=2391;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=lQGEntqH4CiR1u9MFrLMu9kE6DSxkRjbYdv0Tpbk2l0=;
 b=vj0BH0pIONB915GtElwlKlW7sOZ/HzbofWz6k8QNZHuBjYEePyw4hDHLEGQUlf2MFh/w3a/O6
 IPE3tKir9gLA4h7fPRC/UH8pHJp6Io2v2CSUEpmlV7+Kjb0UsUnL2h9
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

RZ/G3L SDHI IP support HS400 and HS400 ES mode. This patch
series aims to add support for HS400 mode. HS400 ES mode
support will be added later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v4:
- Fixed ios.timing check in renesas_sdhi_set_clock() halves clock.
- Fixed premature SCLKEN enable in renesas_sdhi_hs400_complete().
- Fixed overclock in renesas_sdhi_clk_update() for HS400MODE2.
- Link to v3: https://lore.kernel.org/r/20261117-sdhi_hs400-v3-0-b4659189db69@bp.renesas.com

Changes in v3:
- Clear hs400_active/hs400_clk in renesas_sdhi_reset() after a HW reset.
- Disable SCLKEN before leaving HS400 in renesas_sdhi_set_clock() to
  avoid transiently enabling the clock with stale divider settings.
- Drop the ios.timing check, which bypassed the divider before HS400
  was enabled in hardware and halved the clock; hs400_clk now follows
  hs400_active and the clock is reprogrammed in hs400_complete().
- Link to v2: https://lore.kernel.org/r/20261116-sdhi_hs400-v2-0-de41f7a7f330@bp.renesas.com

Changes in v2:
- Added fixes tag for patch 1
- Using ios.timing to decide whether the HS400 divider restriction applies
  is wrong: mmc_hs400_to_hs200() lowers the clock while ios.timing is still
  HS400 and then walks through DDR52/HS/HS200 before prepare_hs400_tuning()
  clears the HS400 bits, so the divider could stay at 200 MHz or prohibited
  non-zero dividers could be programmed while HS400 is still enabled. So
  tracking HS400 hardware state for RZ/G3L clock programming using 2
  variables hs400_active and hs400_clk in struct renesas_sdhi.
- Link to v1: https://lore.kernel.org/r/20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com

---
Biju Das (3):
      mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
      mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
      mmc: renesas_sdhi: Add RZ/G3L HS400 support

 drivers/mmc/host/renesas_sdhi.h               |   5 +
 drivers/mmc/host/renesas_sdhi_core.c          | 129 +++++++++++++++++++++++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |   5 +-
 include/linux/platform_data/tmio.h            |   4 +
 4 files changed, 127 insertions(+), 16 deletions(-)
---
base-commit: 522b5bdb42c730db0269a384bf5a2501ecb21e8d
change-id: 20261113-sdhi_hs400-5f08e5237291

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

