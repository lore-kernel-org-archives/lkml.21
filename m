Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605989;
	b=PRgb8D8QIDftqal0w6AmM7foOXqFKhGkTA9yO7Pf/8vpYmo6+J39cfPbnetAjU580qkE
	 sZsdC7jVwc6BbpBJmIt8nBaXo68wyDoOIWIx9EDh+DWvwBSL3rhd+6IaqDoM5ExG6e0uZ
	 XJW5c2LyMmH9cFGq8YO/Ip5bW4uj1FkPixFJNe2S6PPZ8AxfODzmYyCRwGbgQ/Pywju0x
	 qwwp7L6FGNKkPFoF8ZSdQ+CzSUymkQRkcjPnm3XLZCFuMhe9z2XdBE4sEDiH6iEj51tqX
	 JXxGTS4PL+1hcyuTw5mxulloIak1wE5z6PtoLJwSC6Jqkj6WC1SPaiGexW7NtnBpO4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
	b=42mNRt8yEVGmqBXRSi8Yo2ia0XyaaxdrCs0vzJ1yK9Ksk5X9Ck1u7BcSnP0HPm4neGXH
	 JXxftm6/KubwUe6hYYgcmrLrqRASHNQfTdz1Tld8dThI9tIkkSxoGH12nxFQVAtSWoIQe
	 RrLfUsZhZQqyvOI1zqMNRsuNNa7t9vCTMEpIAagiXfqnBxEsjeiNsixZpRPMD7FSBbbbt
	 MpV2e5r0ij6xOBdjeg+vt2lcFEf5lgrB7Btk9lRpHg5iAVowEZSPM4qO+j779RrLbLKLw
	 BJ5U1+7zgZ9ZNi/k74sdR0WJmTMSLJhADNEdd6qzEwzQePXDsDF83HcaKEnkiA6Vh2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsnXNr0E;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64789606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64789606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsnXNr0E
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso7290490a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605988; x=1796210788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
        b=PsnXNr0E2nPRNc4NVDs6TRBylDALo4zK45DsyV3iimGtstnIcQuO8A88WZxWfyNMvM
         1wpHTVu/CmvWrgr6pMq9jC0o/XSBuuI+x5WJQxt8lvrw0lrHXife2yBvjqKBi+kGr9jY
         LZ37tRvEOXexYmzSH2CC9nDToQMGS6m1gz0nU7ZahT+aPOvw+1igrWuo9UHUb9ZXxTV8
         0rjTeyw9ekGMBDqeTLt0HooTDDdHND2K7L97YVExmeJiVez/60JKhT8iu8yHR6FoEy3r
         JWXUWqDo2n2ZFnmoRkbZzxqhHgiGjaRRLxiXpgGrzFYx1vbXOP6cvcAngxwkd1cH0Ftd
         T+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605988; x=1796210788;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
        b=eIJTQ1rJCZLC2MNvmL9hFBi1ZPA3s21OXEvYhgPTcoffhbofwBbQjQl1bDggQUB6+A
         VR6535+Mq2L8hdik6PphwLScTRgvlXhdeEUIkTeaUwv2dykiMWmlwQlDL5vjnL7auQV7
         8DhdkFjNYzkzD1w8XpjcS+wjhAtMgManHWVJceJOfxRUPfEedWS7q4Esn/ilErp2vSBc
         /uoeFiWqhHCqTBzMI0sACYdaaG7tdV3QPypWgzr062BwXvpeS15B1ChZRWa5SZNhtHOK
         Lf1CzLahoadEvTPsSqS+Tpb2iOdsAIflFYrRK8O5gBcoshkjY+ynxSxahklbMfH0TJ4X
         9l3A==
X-Forwarded-Encrypted: i=1; AL+hErEFYnj311ZeWSEpS6gX0l4eVSTTMlkFNms2NEikal0YlO5DBx+riq7GnEuOIyHZWIYDRMxM8B2Nlz4OoBI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lVzjIfjnNU/HIdD225X8umoxB0lwrf/Wk89wT1i2tXgzDrQ29
	dWgKePAi0mX0gZ0oYBtrMpPWVcsZgguJ8wYUpNNwPmzdij9V/4JkO5+e
X-Gm-Gg: AZFdTZcMs7uhD+bq1dfWr0sg1X8ssxWaR2+0O4mcpj9XK2H+4ODA79s/q+UlZq/cqoW
	Uu4MT6ApaotcHN/hwRJfW32d7hoZnK+StYLFBcz8ZZ64dDxd5B5O0BoOst35T+5a3bzztvKDxEF
	obELj2eIWXru9eETn84RT8/pIT6OzADnGWnCkWc6l6XWLfvq+NdPEmKKD3lvlTs7w1TQWgurMdh
	ZPZiyhKeZmk3zyk5/OdEqB+F5JyR+YlrI2T5APzLjIRfq0VF7tRyG33w4rx1Y5d6xGsegGFHWSe
	JPnEmyyQbHl5JtdH/Mo7Pm6e4PoJA5HRV9gYl535z9h/miR1lVcyPfwi5awMUHtjK5HaVQamCzR
	ez/PrHBvfFkhg2Xh7gEsOsDzw9qsLT5V8u/MPeBRYUzi7LbvK2MsZma6iGhV+2kY6qZ71hqcx5+
	/Tw7C23U7oYg7VBAE3wSeSvbDd5l6b2sYOPFBIQ4uTRJzyhlBFcW6bD5cdaihWcc3TjO2SW493L
	l6ZsBvrm92PhLpuzyBFhmoiw5rsKsHxJoSHBxMuhidnGirBDgSIw/cpDQcJCNGnBICfBZAnE5ra
	6Qvp5sQlopSWi3LKEKBfrfOU5aSPIoYYbajuOSt52si2G8Hg5WoZQMRiPLJkRKSTp5mxXtnzq4E
	AB6cqZtkTKsA+Y5djGmA2UDlX8+7Xn2w=
X-Received: by 2002:a05:6402:1155:b0:6b5:7312:4f48 with SMTP id 4fb4d7f45d1cf-6ba37e90a38mr10062440a12.28.1795605987551;
        Wed, 25 Nov 2026 03:26:27 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 0/7] Tegra SoC specific Video Input updates
Date: Wed, 25 Nov 2026 13:26:06 +0200
Message-ID: <20261125112613.237333-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset contains various SoC specific updates for Tegra Video
Input driver:

1. Fixes for Tegra20 and Tegra30 VI configuration (clock adjustments)
2. Moves Tegra210 specific code into tegra210.c from csi.c
3. Addition of Tegra114 CSI support

All changes were tested on:

LG Optimus Vu (P895) Tegra30 device:
 - MT9M114 front sensor with complex topology and irregular pad mapping
 - IMX111 rear sensor which has simple pixel array and a single pad

ASUS Transformer TF701T Tegra114 device:
 - same MT9M114 front sensor
 - OV5693 rear sensor which has simple pixel array and a single pad

Nvidia Tegra Note 7 (P1988) Tegra114 device:
 - OV5693 rear sensor

They all work and produce images.

The "ARM: tegra: Remove fallback compatible from Tegra30 VI node"
should be applied with "dt-bindings: display: tegra: Remove Tegra30 fallback"

This patchset is based on
https://lore.kernel.org/lkml/20261125110750.223628-1-clamor95@gmail.com/T/#m46981c261c3178126ce806aabddcc38cc33f747e

---
Changes in v2:
- "staging: media: tegra-video: Move driver to media/platform/nvidia"
  moved into media-device conversion
- dropped:
  "media: tegra-video: vi: Switch to media_entity_remote_source_pad_unique() helper"
  "media: tegra-video: vi: Use entity function to check subdev type"
  "media: tegra-video: vi: Adjust pad assignment logic"
- fixed schema clock-names configuration for Tegra30 and Tegra114
- added "media: tegra-video: Move Tegra210-specific functions from common CSI"
  (Move and staticize the tegra_csi_error_recover() and
   tegra_csi_calc_settle_time() helpers from the common CSI file into the
   Tegra210-specific code)
Link to v1: https://lore.kernel.org/lkml/20261113161819.36847-1-clamor95@gmail.com/
---

Svyatoslav Ryhel (7):
  dt-bindings: display: tegra: Remove Tegra30 fallback
  media: tegra-video: vi: Diverge Tegra20 and Tegra30 VI SoC
    descriptions
  media: tegra-video: Move Tegra210-specific functions from common CSI
  dt-bindings: display: tegra: Document Tegra114 CSI
  media: tegra-video: Add CSI support for Tegra114
  ARM: tegra: Remove fallback compatible from Tegra30 VI node
  ARM: tegra: Add CSI node for Tegra114

 .../display/tegra/nvidia,tegra20-csi.yaml     |  37 +++-
 .../display/tegra/nvidia,tegra20-vi.yaml      |   5 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |  34 +++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |   2 +-
 .../platform/nvidia/tegra-video/Makefile      |   1 +
 .../media/platform/nvidia/tegra-video/csi.c   |  75 +-------
 .../media/platform/nvidia/tegra-video/csi.h   |  11 +-
 .../platform/nvidia/tegra-video/tegra20.c     | 171 ++++++++++++++++--
 .../platform/nvidia/tegra-video/tegra210.c    |  71 ++++++++
 .../media/platform/nvidia/tegra-video/vi.c    |   8 +-
 .../media/platform/nvidia/tegra-video/vi.h    |   8 +-
 .../media/platform/nvidia/tegra-video/video.c |   7 +-
 12 files changed, 324 insertions(+), 106 deletions(-)

-- 
2.53.0

