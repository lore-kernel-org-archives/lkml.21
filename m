Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547910;
	b=K8bTrJKi8/kjBxva1GTICd2X2nuijDVQdbWYJ0F4ZWBT7xHB1pTMsy1OS4I8ZU8p0cnw
	 4a8H+yys2I8CH4eIhiE7n/t5B48BQiSneSXxzCua8HR6dJMS40vOvNji7unoJ8T/+Tm9m
	 +5/NzI1oViIlUhruCkDjyWoHdgven6j+tiEBpQKrjJaXO0yQIk/jZss6EgY5P1y4Y4AXQ
	 4OEQmvw2IvJfd+9xN3jBP8AoBs/skd4nknmdjE7TNVgqoVqf+KPzPvKOqAmJfcWeuikwN
	 TDM8xp42mob6H/maKEPL+afAmgDxA13GB4UrIywLyTqugTixec98vx3EzLnEJ+7YDDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yPaStIqUsFXmNLYCrNHs2JQTzK46Sd8vnaUQkzY6azQ=;
	b=eKyBPNFrBDUzRMXgR6Z8+qyBj10qPLTy6SGj6NHud51YVipWa8kOXLC94i01mEMh6MEw
	 VPTwMeBWGraqujZ5wq664iXXI6sA2HaCuIuCLF5tMI8y8ye7qtcBI8efN2oyGg5JS9+Ui
	 DErzSU2qCZg4YL1ZRN9lXzZw3b5wscYZs0vo1ENCoNOtLQScn3Lpbh9l5dsyITHHEdG80
	 KyFgPXWJKjJRzP/JIJhDL1FOXYfhW7gRtn3k7XH24wXnjtAxGgsxjCmfwcseRDMfBPEh7
	 DLpnk7xiLWJRMzBUy7xPGIy/1Ls62aaMyyyoWgTEunEW5LsaH59cTcpXYenTDh8NnSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+vE4Np7;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7E2606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D7E2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+vE4Np7
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so39686645e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795547908; x=1796152708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yPaStIqUsFXmNLYCrNHs2JQTzK46Sd8vnaUQkzY6azQ=;
        b=z+vE4Np7heATfeNUbsGa+8Y/j19RZ/ggk1zmUogTT1iTjRESol4zWOwX2BNeXKVzqb
         S2L+aaS4/WRGjwKeC7PsrUD1IXxRAmepqxC5c4xEFUBjS4SOFxvE5UHvqeEOQfWjkKq1
         0fkimxO0+Aaz+iznCSSv9Tqnvoi9eCWEYwxZxWjKTPYrxDvjbWS4v7nQiV04ZphDJM4j
         bGS5LqDUwqXbhREs2KqvuHzV90AJX9LpEY5qj1DOFvNRYgCBtKi28L75UXzKu66gM9xa
         Btjr2pux4f/NSFpilNuaobGJ5Lw5qSsQDMJIJBSjU+51+h2nICgoZSxhFnEYCiSuDqa8
         IpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795547908; x=1796152708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPaStIqUsFXmNLYCrNHs2JQTzK46Sd8vnaUQkzY6azQ=;
        b=fNIayIK2ragqSkPcQK2cfypFWrh0I5/oQsAqTEVW6MZNT6GCS/cj2iuYA9tZADv3oc
         IA2eI+3vfotN3jO8Wo4vCpmXyWz4h8R+RPQpXY9hqbbq+/59oy7wftc0eXrNrXTb/7Y/
         T9Ei9DIN8QSdMGNjOWWcBIp0gZgC7ZgCOPzEODTXinDBZe3EkWwyBgEsAEt9Yv2JK8dg
         uI49eZOPSqcgZguEk89gBnDjzZpPq26/ZkESWsFBvc0ujepELN75wcDAPwYY9FjAfSeK
         +EB1xrFPhq5MGnbJ6ACvMcDHzKYwR34JrRFTQOk9iVKyXbLIbtHckDuqY2T/08IVJpRW
         drCA==
X-Forwarded-Encrypted: i=1; AL+hErFRLVVxOUqtC3lc1ChmsUg21QG4O+D6yuq8B4n6bZHrKUk0eD92UrDWksi3Q/EkoOy3r450fxNIqAyZkZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tP/rG2y5kFFZ+i/S2YmG79FvnPunMT1cV/PVZPra0e7kCHJtp
	OO4J8d0gte9Tin0rQuP/KZ8GblnjJpJr9K7ikNkrqvjHpgSHqdtykUI=
X-Gm-Gg: AZFdTZfig3mht1YHkIWlSmOaTd5CyDoQZB/OvtuUx7o2AdKA9UbZwygmxUV80A2IwW2
	sI3J01jYsUCdVBJosVMO8C2OrchRPyrcYVlC7F2WSXxH82Xi+igKagEHl77iwhQQxyyOLjQUbKl
	6viRZiKR6rAHu7BWeB31kn07BN+3IrUYfb51NSeuCw1o7fScJ+v+IIhJ+i9ewVYL+wzeeRFvUlK
	WwL+dx/clC8HDcI3+twz7QQ+RxxwTUATw2/UysL33+KSD3GKfcynLsEuO4IrE+LXXrMlyvkIYDW
	Sp2NvLeB+kK3DZdU5WdJ3sPjIyWWSijIxZxNaTweyOf0eVHtb2DkQkNMjlbX1i4g8r0BCll/nRo
	kHuvgfJw612e091YjBb13k//D/JATMXS3o2CnM0pN0d9xCrhpMsPcrpmdaT4Z/O5/hc0joO9Cdp
	9y4SSzt4fAk5B28Ci+sEUYoFUV84wMCx3szi56o1rlWv44t80E0faceyoUb1r0ZfzJNdnN3fdVo
	s2yorOitextFgf4MXyjFmizzAaMgwQbMUyOT8OlmbGAJs2uh0msc4bnyWXpvLipWFgSPtJZppQG
	Kw/UepMkULqi6TP5Ga+DqfobcimRvTXZKVw8dQbsv/Z+Xnh497k8DA==
X-Received: by 2002:a05:600c:5249:b0:4bb:665c:a078 with SMTP id 5b1f17b1804b1-4bb8893a89bmr317787135e9.28.1795547908057;
        Tue, 24 Nov 2026 11:18:28 -0800 (PST)
Received: from localhost.localdomain ([93.145.31.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm463320985e9.15.2026.11.24.11.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:18:27 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 0/2] drm/bridge: Add Lontium LT9721 HDMI to eDP bridge support
Date: Tue, 24 Nov 2026 20:18:01 +0100
Message-Id: <20261124191803.283266-1-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This series adds Device Tree binding documentation and a DRM bridge driver
for the Lontium LT9721 HDMI 1.4 to 1/2/4-lane eDP 1.4 bridge chip.

The LT9721 accepts an HDMI 1.4 TMDS video stream (up to 3.4 Gbps/lane) and
drives a 1-, 2-, or 4-lane eDP 1.4 output at RBR (1.62 Gbps) or HBR
(2.7 Gbps) per lane, controlled over a paged I2C register interface.

Patch 1 documents the "lontium,lt9721" binding, including power supplies,
reset GPIO, OF graph input/output endpoints with lane/polarity remapping,
and the DisplayPort AUX bus.

Patch 2 implements the atomic DRM bridge driver, registering the DP AUX
channel (supporting both Native AUX for DPCD and I2C-over-AUX for EDID)
and populating downstream eDP panels via devm_of_dp_aux_populate_bus().

Hardware-tested on an NXP i.MX8MP-based platform on a v5.10 kernel
(driving a 2-lane 1080p eDP panel with dynamic EDID mode discovery over
DP AUX), and forward-ported and build-/schema-tested against linux-next.

Gianfranco Mariotti (2):
  dt-bindings: display: bridge: Add Lontium LT9721 HDMI to eDP bridge
  drm/bridge: Add Lontium LT9721 HDMI to eDP bridge driver

 .../display/bridge/lontium,lt9721.yaml        |  169 ++
 MAINTAINERS                                   |    8 +
 drivers/gpu/drm/bridge/Kconfig                |   16 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/lontium-lt9721.c       | 1640 +++++++++++++++++
 5 files changed, 1834 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9721.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt9721.c

-- 
2.25.1

