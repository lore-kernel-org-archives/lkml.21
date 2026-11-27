Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806596;
	b=OkjS0N91ShOnIZojw/tqGtoRCVnu5fNBCDNDISxKsszFdHJRXqN13ETeWbaCSkuviOCr
	 KWRKmFNWcirqMSKCdWxA/hTaOKjbR96AAu7J8ApAv5Zbk+kZ80FM+GaQozmOEI5NqABGe
	 m0PcN/IjtspdFdoq5nYtRuxKUdBEcOTnu9ohVXblYXlXgtlGmGCuBa9FEC51Camu8DegG
	 qloo4np9sMyiWbzuuzyy1C6oUZIyGnHEwF/Ny3id8eUE9fczQe1BkUcxC+R3ZFJvHOLQR
	 6HiO2XxfzwXkKOpHU+vkn7UDd2OmaCxDU5Vl1E7x9dAg0rCSwBCVQQ0PVoQYmZO/4ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=pPqjsPGv3eilo8FZQHSgEFw+4wPb6iLEdkbWG7h8j1k=;
	b=y7tO7chDbvtnMZf1TPpXpZQfw+aAIAhpfHF54U2YdPTVXRqNvABo2grGEnP8JDr3E+9m
	 cAZmeqgdyJXWTO1xWjY+uMbBC89sg2cDEbcytP6pRnFOhZ5TfzKbMDsswMng08nS1MvBu
	 a5vL9+kLPe4MJ28EPIgKJxS/vMqwrqd6vRP7qtJzWsF168L4b3raKSeATdmyI/GzmyFlY
	 x8/Otv4k8sPdbSTz6LrdVDoxWl0dy65A9yWAc3gThn+9NDE+AjTmqeJkGUygL4CFZOzlA
	 hsoqVCw7rrBK/MphWyjiMhEfuyOxDy+ejwhmT+UAyc1sTMmQryV0AoteiHTW8bP4XGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="V+Y3/Wxv";
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B59A606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B59A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V+Y3/Wxv
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d427836e9so1110781266b.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795806594; x=1796411394; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pPqjsPGv3eilo8FZQHSgEFw+4wPb6iLEdkbWG7h8j1k=;
        b=V+Y3/Wxv3EQIonXFUaq/JKFEBf3WK2UbJPcbI2b0SojJ2IyT7ZRCcxvgc9C47fHL69
         jPMIwElCu+zJDWyWYtYBqGdAsKsbw6zu9uKZ4ErBd1Z2aMCfu7Ntl7qGJKmEZzhS5zU4
         ti/HB8wdq/cRr0V0RiONp35u2XoVNIniGbgdyKLmJdfDKU1J3ItwhWBldl9lleseKGuP
         ILWPDk2tHHcDw0cckNX/7WYRVfrgNA/YFvB2Rz2F4A2u4kHvj0pYW3cWSKvcMd5bTEMj
         QMbNUhOnC4vvcLsNJFHUmrxCpTCXeEyJu5bQe41325rgrnCUVlRLmafhrQVR/zXEhjpO
         gTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795806594; x=1796411394;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pPqjsPGv3eilo8FZQHSgEFw+4wPb6iLEdkbWG7h8j1k=;
        b=ZgfUgfmMOhoKfcv3Klh/ArxmTTVPbiwQpugEZbLlTR3vHTXCrcDxDH0UVTA+DXdSOA
         jLXFhtBaycAxrGzXGVjUocmX+D3ivOE8m5xd/WpUl5boLEDg3NYHnvrPHaS01dDVe5G1
         DMGcub1PGCGV9I4PzASiv1viiYAlxsXoOBZOehBvTu23EA1QEK/1+xDUSsdut+g5Pk5T
         cQfSAsDtop/sdceJWpsWggNzstkZlun59YYo1GGl7l4Ab2Svt8IkzBMTbn8TZAghNxrX
         naXjKVGb8EVaT36pflYQuQ33YoqYLJKO0O4fqiEJzKjs7DTXE1cJvur5aqkE9wVJO2sJ
         N58Q==
X-Forwarded-Encrypted: i=1; AL+hErGEZajBqlVKEZRQcnJG/FH8ACUBkig76PX3+ATp86OFQ9ry6PT+tvs/QoOPcgPSsMXz8P9/fOs4f2o5dxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pu9QKPqT16xuld4RWw+oRvRvYScqpYtBikIJBe32hBS0ixVIu
	6pKCTEbuKKfaWJAKIPolX0gVXtesrAEzGugG2JXJVQkPLlEZW3FgzHTFQP7zt2e7HzI/CfHIIoh
	48HppUAo=
X-Gm-Gg: AZFdTZduDgzjKklWnnRIi/7V0a6UaQIicoi/yfdRVC6Dj4Og+Oq4RBCs+jiZZaUTVVs
	QCtNrejE1qMnwp/tv5xZgBJCpipqGR4JsQN8MMdblrmmX5YZX6EIiWOtgga5EY5pL+hPbtnMr5C
	R01HO7vqPZyK6em44ZjJTHy4zAncHuD/HFunzxS00YDSVbHY5TIQZr5eoIKA7e0VRRwUjyXhdai
	dG+EMUvMa0J5c5ZM/6c1pdtuqXNFuaX8pGfOLhxWuEenQB6pNL5rINTKp3VZIiQH092yy6vej7k
	xODYEA9s3OLQNLRToXQoNfoTqNP15pLFQm475gVOxv1mC30oPIdO3WtOdIDUG5TYrQvzvp8b2+Y
	AXBmUi97aMudNHmWGj0Zr4Dext7F07FPbO8rS4V2Gs8lpikTK+2HuQ2yR6vRk8fT3UMUJvY0KPA
	vlyJXKE8qua6N8c1tGiciBGkRSLUwlk3R8sMC2YaKAl/1f8IyciEu22lG32ar0dplU1UE2ocbO9
	Y1X99ejHrHrsJpZ+taF5sJwWvhpq/DyFjf5uaOHJCosDxk+lCtLMDP1GcmXZP+k7bWvydkFaeLB
	7ZBXnPZLMnuF4Aiuhw6oHXMAYUsxHGnDx673Nt0yjhzuuiio734HSxYjxugjqnxq5VPdXDO5jYY
	Y8/YgHcwdrqFIf1Rvig==
X-Received: by 2002:a17:906:c10e:b0:c41:5e31:5184 with SMTP id a640c23a62f3a-c513a99abe6mr2111709066b.13.1795806593819;
        Fri, 27 Nov 2026 11:09:53 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm909175266b.69.2026.11.27.11.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:09:53 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/6] power: supply: max77759: UAF, charger ABI, input
 limit, and supplier fixes
Date: Fri, 27 Nov 2026 19:09:51 +0000
Message-Id: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH/VCWsC/x3LSwqAMAwA0atI1gZspQa9irioGjULP6QgQvHuB
 pfDYzIkVuEEXZFB+ZYk52HhygKmLR4ro8zW4CvfOOcD7vEhotCisa6suMjDCaObxkD1HKpIYPO
 l/IO9/fC+HzyzkaNoAAAA
X-Change-ID: 20261125-max77759-charger-fixes-a1cb573d50a7
To: Amit Sunil Dhamne <amitsd@google.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org, stable+noautosel@kernel.org
X-Mailer: b4 0.14.3

Hi,

Patches 1-5 are self-contained fixes for stable backporting with no
external dependencies. Patch 6 fixes supplier tracking to follow the
DT power-supplies relation instead of matching any "tcpm-source*"
supply by name; it carries Cc: stable+noautosel@kernel.org because it
requires v7.3+ power_supply_desc.init, the v7.4+ in-tree DTS
power-supplies property, and the core fixes listed below.

Summary:
- Fix a use-after-free of chg->tcpm_psy when the TCPM supplier unbinds.
- Report and program constant charge voltage in microvolts instead of
  millivolts.
- Disable AUTOIBUS alongside CHGIN_ILIM instead of relying on firmware
  state.
- Notify userspace and downstream consumers when supplier updates change
  the charger mode or input current limit.
- Sync existing supplier state at the end of probe so events emitted
  before probe or charger module reload are not missed.
- Follow the DT power-supplies relation via .external_power_changed
  instead of matching "tcpm-source" via the global notifier.

Prerequisites:
- power: supply: core: give each supply's epc_sem its own lockdep class
  https://lore.kernel.org/r/20261125-power-supply-epc-lockdep-key-v1-1-c8a41b8a4470@gmail.com
  Required for patch 6, which calls
  power_supply_get_property_from_supplier() from
  .external_power_changed and would otherwise trigger a PROVE_LOCKING
  false-positive recursive-lock warning on the first supplier event.
- power: supply: core: fix use-after-free of supplier names
  https://lore.kernel.org/r/20261126-psy-core-supplier-fixes-v1-1-33de6aa53cd8@linaro.org
  Fixes a pre-existing power_supply core UAF on supplier unbind/reload
  whenever DT power-supplies is populated (since the base driver already
  passes psy_cfg.fwnode), which is hit during supplier reload testing
  and by patch 6's supplier lookups.

Tested on Pixel 6 (Oriole) with USB-C charging, tcpci_maxim and
max77759_charger unload/reload cycles, and lockdep enabled.

Cheers
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (6):
      power: supply: max77759: fix use-after-free of tcpm_psy
      power: supply: max77759: report charge voltage in uV
      power: supply: max77759: disable AUTOIBUS for CHGIN_ILIM
      power: supply: max77759: notify on mode or input limit change
      power: supply: max77759: sync supplier state at probe
      power: supply: max77759: follow the supplier from DT

 drivers/power/supply/max77759_charger.c | 244 +++++++++++++-------------------
 include/linux/mfd/max77759.h            |   1 +
 2 files changed, 100 insertions(+), 145 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-max77759-charger-fixes-a1cb573d50a7

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

