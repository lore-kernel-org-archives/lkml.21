Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993213;
	b=uNYOsBjWeFKITgK7C26v9gUtGHxe7c/dhq7Ap45cjoJRntLPR3bALmkEMSuHS1KMQ+6H
	 Exyc4PBFPKePdZAxLgkQ8e5a994Oe9xXxlueIh0HP/z6M2kCpdh0exGpKcZKHebajq5Xf
	 20oLulBjrYDoF35obmze/PkzE9jVAGFoDoWKHcx4l6qJgKOsvPtxHldLkpTBVRBuNeMJc
	 Lhlf+1xTx9NRJHDKaB+fzwdaefdmFI36kMNDAaO8LyJBvVFTI0fhSdNcavFcl47Xh4lkj
	 9wI0a5Bji+4TNH0VQlgEuGQ/DLqnHmTG+3pwr6jvhTNN8nTkrWdnDiqgVE/I+LSsXaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bxGcwAbKwaNTQzjeV9MHB4wwSLCCyf5n2YQi0nGHaFw=;
	b=ZLDFunzxYuONvpO+EO4OVqNYB3wbieTE3iD8OCYr131TXM/F2cdRWzS9Jor2TPTPnhcq
	 fqTJhy0MWFKpl9ND35uEjY7iRr5r80pyoWAuAc74TWcZPftGvl0ZExl+tGuB3XsaC6ovP
	 2tHdiIeRDEB4Z9hM4+WHSPe2olQeo+qMyZnO0kYO7dR3UbMxydt095DTTXWaN9N5+1rfx
	 OElxfAI5TKZj90Aqz0lY31xnfVeDdhBMHGyxI24fmuTUpWmDnuD9d459sWSiUpcVuAYYx
	 OenMe2usu4lJXPpQuTNUKCYojFY5hCyYSjOV2Hyt45rVDEMU+czPj1QGr2gYKYTu2Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJ4JpYQx;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE013606A88D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE013606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJ4JpYQx
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a357b1c649so359269f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794993211; x=1795598011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bxGcwAbKwaNTQzjeV9MHB4wwSLCCyf5n2YQi0nGHaFw=;
        b=EJ4JpYQxImF2683BNSNESrjgbGsWqtKaUQDO9aSOZM+4tUCQoJlW4gJCnj5ApFlMRh
         hjsz1zzXSO8639LMHAUjviGw3SnFOrS9DTWHd+Zj91U+pUW9adVKRNEFBaE8Y/5iEFdd
         W4XXwVE+tdX4twRY2ys4pSQDC6sDYArq07Dpovw2BywaM/xvHPn0JiNWfE9pi9UXXG5L
         xt2gQnnXPXXaRzIHm38J5kL1aDbf+EBbPN2qWo/dzMbpnjKJjWTsYiCCZe/wkdhPu02f
         GUT83P1Cste7ZskoOigVIAefSHwxuPBoShK1eaGQ4VhLdgfXVkDnHVwIl6IiRsNbufh7
         B6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993211; x=1795598011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bxGcwAbKwaNTQzjeV9MHB4wwSLCCyf5n2YQi0nGHaFw=;
        b=IOIpWDX8Wy6zrxfeNfX3581SodO3Sr0uRPG4VIaqMdHgc/ZaiDSODgWaNzDyxXtvYm
         Qwb9yQAUeksRkfIogznt5zmzT9TPFLRPhyD0Ciwo9w22KwJ3Va7Zt8AvpuKtuBm2sU6Q
         a/oVTvnlRm59byd023aydACVdmKA22ZusRwA4/xaS+TFyBneB1qef1noRcGnxV0svt+v
         wOftK6rRkKYxF4nERdnRbSLD9B3uLCqIfQO9fVdUNZpwKqgdAi83IJWW+4zVxwQ3m1Os
         AQr1Lh3LeX37x5y5sXNWp6xRZta7IsqF/8Mt8naEkz7yUfrGLtvMjZYK402i697u6xkz
         sQBg==
X-Gm-Message-State: APuU4Z9HtzoTsWaPH4pHH/P56ELaidDWQ7ei+Jz64FuHyB7kI4SzdWzX
	kZTdPHP6ROr2ZlVoUGLJHh6n5wTlW4jBj9llJqh6vTGvmIspBijZuecT/Q+70w==
X-Gm-Gg: AZFdTZdg/KF4PxQKKCC94uOTmySEu+yj9mszHo0f0FXxeGPvRT4lgS3hQT0iFgUi2m1
	bG+JDhCvLAkdCGoq/GbQv/I0mEaRyt4v7hkkZlsQkKClkl2j234hXCgSd7jHmTqJyNine5Fb0Sq
	gwFD2zzlizxyZkdUBBQjuuycU06j/7mBblQaQHnJRzq6pk85snvbDZs/L+HckAvnxJBXsMDLiDW
	6TkDUKUxVHH5Vl3+CEsMh1xM++YUAWAWbfXMEMLcElpQjiq3tAwgaGxKkMtWmAomeKl0S8wJtLA
	HQSsP56XIX7zdUV8+Gk0kRF8kDZFZRe4A8aUf+NyklyLfaxUdFVRCwFzl9hFvaPtfLhV/yF8DpN
	4HC/FRliN65GlFXcUBn0+MgrXE88qiCHQ1qiH2gNjqE3uwOVXQJepXB3o9A/bLysLSpSP6pZaln
	o0GhI89vxIRHoc9jm/OeFmuy3zAV4lLizR5p7uF19gQ43h8s8l/EO1nVGwAe1j1F9Tl5lLwsTaf
	SnHphCdaM8dyUOqKMMrHn135V4Rt8K3P/P8vH5k7qPvENpnpHfmvxSfWsxIgX18bH0M3eyQLfkt
	Qwq4iCuo3qqpxjip5WjB5B+cvvGhKV/Fw+jDw8FGqbvnlgtcIGsDprdTsbvpO5zT9okD8EDg+RH
	wlVLrQWEy+2BOCblaCEDQs9wMLBltvavUJnRiKu80qLF+HbG/VACjYYc=
X-Received: by 2002:a05:6000:29c8:b0:491:6c24:65f5 with SMTP id ffacd0b85a97d-4a63984b729mr2543753f8f.17.1794993211077;
        Wed, 18 Nov 2026 01:13:31 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c406sm3634609f8f.14.2026.11.18.01.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:13:30 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Cc: pierluigi.p@variscite.com,
	pitchaiah.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Hans Zhang <18255117159@163.com>,
	Luke Wang <ziniu.wang_1@nxp.com>
Subject: [PATCH v1 1/1] mmc: core: Add secure erase/trim timing quirk for Kingston MW2816
Date: Wed, 18 Nov 2026 10:13:19 +0100
Message-ID: <20261118091319.8268-1-stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Apply MMC_QUIRK_FIXED_SECURE_ERASE_TRIM_TIME to Kingston MW2816
eMMC devices with OEM ID 0x0100 to allow larger secure erase requests.

Co-developed-by: Pitchaiah Prakash <pitchaiah.p@variscite.com>
Signed-off-by: Pitchaiah Prakash <pitchaiah.p@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 drivers/mmc/core/quirks.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
index 98cb680e3ace..b25592d70da3 100644
--- a/drivers/mmc/core/quirks.h
+++ b/drivers/mmc/core/quirks.h
@@ -161,6 +161,8 @@ static const struct mmc_fixup __maybe_unused mmc_blk_fixups[] = {
 		  MMC_QUIRK_FIXED_SECURE_ERASE_TRIM_TIME),
 	MMC_FIXUP("IB2932", CID_MANFID_KINGSTON, 0x0100, add_quirk_mmc,
 		  MMC_QUIRK_FIXED_SECURE_ERASE_TRIM_TIME),
+	MMC_FIXUP("MW2816", CID_MANFID_KINGSTON, 0x0100, add_quirk_mmc,
+		  MMC_QUIRK_FIXED_SECURE_ERASE_TRIM_TIME),
 
 	END_FIXUP
 };
-- 
2.47.3

