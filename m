Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018679;
	b=maRLA3YgTO4EZoedpC7OqHOEJVxrzrLGFX0AueOR+l+RioF+MEHTIoEG4zGyYHEqHj/p
	 kmBH5ZnmSwII5p2IFFfRkjn+oBmz4mLbpTbiqWmAQeIyZtMJ2WHlUR6FhN/byEj8xE1Gi
	 A/b29q1oHHR4Y5+ebUwQjjPQB84ioLMVuLX0CLkRLc41RZegHcmimhNNwg6Lys51yn2/N
	 m5YpD+gm1fDJCVaaKQLkE3Vx0JoQSVwxtDlivbQT6u0NCwx/R+v547bFiERCPVCbc+LLa
	 4OHum6qLDLMx1Hv7tneuq7e/d18/oergzvKfPhM1VIbHgAUUqFJTWK7/gFmu32lV5Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=;
	b=SRLReHgU7J7/fyF+8dYjAWs1HShenV3kFnjpJycv2ETKvJ1s+8I9mFu/z8WvXqeZZSPs
	 VSCczVWV3lcKyIbg4hLc9Kgs01FtKZFooRydfUBvDD+AIYf9xzzjSqgQMWlvxxE2iTxex
	 aTWMeLktxfsYhWTuevB7U1DC/gkJtk7HUkC1hW9bjGbSgseHbJ+ovP2S2pFzZojDbkZmW
	 cRB5m2AYWrY3/RCmrMWv7kVV+S9v0pyyYJ8JebbzQXpyajIw0+pUGDkLObySm1+Z6LLZQ
	 aUg0FHbjBetmLVmHHhy0kCnXVJCrUORKd6HOg9cyP90zRkia/NFwTXT9xpY4XVuGBMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc6Xxqmy;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583A5606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 583A5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc6Xxqmy
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e47347279so733760f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018677; x=1795623477; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=;
        b=xc6XxqmyzRj7lQBrNXY5fekJIw0z3FkGPGRktiNOzf5zUKTVp6yeg/YY8ZOXrUVjhu
         Ll5mMFWWkIV3ZzAXWggdOiVJQK6UxbCQobIv14PllnAqt+8uPjZvuE/ZQkWgB070Mum3
         UErfPdO2l80nUj+spYZORvtk2dYswb5fwR4YQwfZMtMxJzrASV9Ums7hlAoDxGiP5POO
         5efc2QK/CbafNHSwkOA47uHHJ+TeYlRVKI9S8opug/tym5mDQ6pLfH4uguCWARHyG8Cb
         qiUGE5t+qdf2fd5uBlSqE5ocA7YMKDwSmE9UffnoUr5Z46Mv9S4PAfu/B8w6cGZFeoyu
         uXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018677; x=1795623477;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=;
        b=XQIajUqnk6ZeBgVWSOOh82yFdd+MWBZl35Ah3g9+PprSbITb7s+MFa1v3EKz6xAamJ
         Vqn0Ls/IRonSlrBdTzzIL+SOP6v2VQWHfuF3/XiJMTvdRBFL8xPt8c50q/EuiiXHJzeC
         tLi1GCTWykii5CYulePBCc4aa3N23i1a9ahP2oYrj9P0JsxTJrF26oUrgDN17E7Rbo02
         Anto+wztwnDSbblNooySihN3wfm7IT+2MGLD4zU4mzJ4sYN3yz1WvzTb/OaKiKGIMe3Y
         Y1oQpb++KfVTZrr5feMYjwyFL7UBNOd47be2M8lm0zCppSECaR5j/8ZCWlKeI89Ac/1m
         GHXg==
X-Forwarded-Encrypted: i=1; AL+hErFo+yTstyRLWG+yJYHk54wdziMguj4QRwqpNZQ8LttKIby07OGBvMEDNffMv4coGgfT6GCI9aht/QygyAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o3MpYdcAcqxcVeKdInec3+IbVlKGqv9ngVTsPgGl0EpN04OpA
	qkR5mn526P8nxMlB8VlLPjQI2HZf244F8m5HuHqypKQK2xgHCSwXJRTI
X-Gm-Gg: AZFdTZcALb7IcC+2VxABCYPMhVfhYa8vBf5La+YApkTZZ329FkmOOZnJTHIBAjFSE7/
	KosrJAz6Vfh0sL6zs2PBTXyWpithVuvI5qFEytyHUC7yAEQOh+eGUDC/q01KK+cgukJYPHgECU/
	TYsiual5sUWdF6ADIm82Aet0tuFT5AYIi2m92vWJjYC4mHz688IvyVyQ8OCOi70nk6kpYZbxZTQ
	SebLJWPb75DX4VYb85BNkTTA5zNHEgSRdWSeQPAvKj5I9M1PbyOY5ndxApBsyP/iqgPgOsHbstY
	nNU1avwLReAj0I2LxnUbPTnMGWN9ECdB8rIALLq+241k2dJznnCxK8Enqt1HMXKtzZcNc67GnHH
	F18Kvw9RN/R0AR8K1JtztMhHNG1SQO7nJrdCBqIfgwF58TdshGwchd8Hn7QCZj8BNUVrJuguuKS
	R3OdMEw557ChY4d7Nzc2H250ExnYIeWVumzn1L8Vbt9Ufc3/+IKJOVSqNQo1JO16IqimOvbwGM3
	dj2Awg/Enhk6vXKneIh5vbbFYZZNbG99aSaQRhdhbw/EuALHtsqHgoJP2TiG3xApCaBcnhNofiG
	96vUCHijNyulc0tvnSdXtLfRhM+f3bSNy/PgvZJ2uumWqwY3kCfN8JjRfJNUypsxCFdsuR2S4oa
	AkF3t0Amqq/vw7scq2lcxY62dt8vHKt4U2g==
X-Received: by 2002:a05:6000:3104:b0:4a7:557:fcc with SMTP id ffacd0b85a97d-4a705665645mr5379933f8f.53.1795018676598;
        Wed, 18 Nov 2026 08:17:56 -0800 (PST)
Received: from [10.161.246.232] (host-164-37-100-34.net.onlyservers.com. [164.37.100.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100bf42sm5329699f8f.1.2026.11.18.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:17:56 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Subject: [PATCH v2 0/2] pinctrl: mediatek: Add MT6895 support
Date: Wed, 18 Nov 2026 19:17:35 +0300
Message-Id: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6DIBQFr2L+ujSAVKmr3qNxgRT1NwoGqGlju
 HvFrrucZN68DYLxaAI0xQberBjQ2R34qQA9KjsYgo+dgVNeMUYlWdDq6Ccyx0peL0QKyTmndS+
 Uhn20eNPj+wje2x+HV/c0OuZKNkYM0fnP8biy7P2Nr4xQ0tdUaCHKrmTqNswKp7N2M7QppS+y8
 HwtvgAAAA==
X-Change-ID: 20261108-pinctrl-mt6895-84822207f4ac
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

This series adds the pin controller of the MediaTek Dimensity 8000/8100
(MT6895) SoC: the binding and a driver on top of the common Paris code.

The pinmux macro header and the pio node are part of v2
of the MT6895 / Xiaomi Poco X4 GT initial support series [1].

The tables come from the MediaTek driver in the Xiaomi kernel source
release [2]. They were checked field by field against that driver and
against register dumps from the device running the vendor kernel.

Tested on a Xiaomi Poco X4 GT (xaga) on top of next-20261117: pinmux,
pin configuration, GPIO and EINT.

[1] https://patch.msgid.link/20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com
[2] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/56ec519f6
    (branch xaga-s-oss)

Assisted-by: Claude:claude-opus-5-5

---
Changes in v2:
- pinctrl-mt6895: pad mt6895_pull_type[] with entries for the virtual
  EINT pins 227-246 to avoid an out-of-bounds read from
  mtk_pinconf_bias_get_combo() (e.g. via debugfs pinconf-pins)
  (Sashiko)
- Rebased on next-20261117
- Link to v1: https://patch.msgid.link/20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com

---
Alexander Letuchiy (2):
      dt-bindings: pinctrl: mediatek: Document MT6895 pin controller
      pinctrl: mediatek: Add support for MT6895 pinctrl

 .../bindings/pinctrl/mediatek,mt6895-pinctrl.yaml  |  228 ++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6895.c          | 1638 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6895.h      | 2717 ++++++++++++++++++++
 5 files changed, 4594 insertions(+)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261108-pinctrl-mt6895-84822207f4ac

Best regards,
--  
Alexander Letuchiy <asalde.le1@gmail.com>

