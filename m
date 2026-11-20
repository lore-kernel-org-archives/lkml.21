Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135465;
	b=itejT70GYLYLynKCLyQekzIobnOVrSeSgoe204DybmPDRjmZtEjD+nl8y6UCzu3GWZ74
	 xNd93SzdRxQbGNsO+IlPhAeJaVYa4OjoBRWhOcm22xwodU2R+r1M7m4jpFNFTLPrIM02K
	 uk4daLQpSJ0ReO+5Z3lU4Gtcl7qSi1iMEDXrmpyWHU6anP7X8wNwpArckX717bvjwmEEZ
	 Zxn644xoP+IsJfcfYu4Fa1+Bub8gHmT4H7q1xd9iYIPCCedfK3kmmqUXamjTJCzkfWWni
	 E8hcayGD2W5hphsJXyaoYWeiof0nU7AmAvsm8EJJe9tSZZGB8gQrGb8ZX9ne8b14Mwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lq4xVgtNlmtEagdZAmjDen81yw3EXLE97jdOjgf12ho=;
	b=oxFuB9Z6vZZR8xDZaKLFbZJ66rRaIwn77L6QwXUbqOkhmhDkQ1FAOO2SxnEIE3iSUN3W
	 q/842J8SBeJxQlNu3NiP4x/J7bZ/sCOxcQTkoxYXLEKkjwzUlu2YWhZEWifUxj/7pBP8o
	 DY5z5IjBxCtmxwKQdX9NopqI3xJanMPhCqgyayeuNIkuUtDkSCbn26pQ57qA4aqKKNBFX
	 Qh6yOVVxO0F1+YzxaSw+GmGQECfAxHpw0vr90xGZnrDheK/SddmJRiJJAWZNf4HYJy+8l
	 MFsoWZLUUXjuUYLxT+Zf4lUnEZksQVBUumZKXPpaPgHzbdGZr0KafwfTK3USDvVQXnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IRFlv3VN;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6255606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6255606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IRFlv3VN
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a5506f09f5so190532f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135463; x=1795740263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lq4xVgtNlmtEagdZAmjDen81yw3EXLE97jdOjgf12ho=;
        b=IRFlv3VNsJ1GzKjSCCB7rSjUtYgDKXWzZhfkSD3dJQiG4X9YmvRIAgxwKegRoqEf4c
         DPm9/TLjvO2VxHjeHj91AaKMhQoCj0kmRhRYaiR+46zSKr9qk0DZlqqSDTV5qXAlvaGY
         Oq0PTBJ8ZPz4q/QeeOgpU8C/7HbdXncslutjkH7MI+yPdKCzCf+OtZ9HYU789kIpbq/5
         v9NkbLCVirR5k930wDDy4oqZ4bubxOdAQ+6bJHeTJX7PZfXcQnWeUmdXs9NG9lc9BJ+I
         OughswD6Thx5e3VpkEXvj4WWC/zcYjFrnx9Qt8gAs8WMXrZJ46EAafW+FRsR+UjgfdC+
         DjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135463; x=1795740263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lq4xVgtNlmtEagdZAmjDen81yw3EXLE97jdOjgf12ho=;
        b=fvskrld3xU699JrH22nR0UIerV11t78sc3vGTQeRtigUXNRQuSi6/Ou49z8VLNNESz
         ypYZGdF12x8R9rxdXnznBOujcos9AmSjzW9vMnQuDsRX6GW4ejKJQ3zK0JMWU5vi+68e
         HMHYrJI82anET++vCt4AyJUly6Rt11t4yX0pDpZqopg9wOHRNeqvo2o15eeIFe9aeuHD
         SrN2l6NmkJt5mgr0AIBLKKnKgwF5o3eQ95cwOPKibmEXmviLHMwwCbhBU7qse8g1gR8p
         j/MGz4dJHSXwxLZ/jeZztDo2zHDnRs3nswr7odLCyi4mDsyTSlsuF9EuUofSsBRT1pEW
         qL1A==
X-Forwarded-Encrypted: i=1; AL+hErGMj3ABgYjT6YtSZSgt7y3EG3u2QsxQtXhk78k/9LfR31dal1MZTCKd8Tn/DaqYsxAzMdQabfURNKRhSn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l/69xFaK6i3O9bBU1zlaBb1iPHmxBqaEq2mvYup+2OQYdtJ3Y
	iK+bZOfafupWkiWZdXEnYiWxSb++QwhQdGfXRu1uhMQdgzYaO39m5cI+
X-Gm-Gg: AZFdTZfKmibSuMyxhS+5JlVyN06omr985zmX75Q35KfN95N4xCR391VYVsHg7+4A85P
	oHY1HHAsze3fny4nzF2MvN3nrwgJnHVQdrU+f/VjKyoEZaUUNWi/hUO6Zgi3MMEf/BJM0+853oE
	aQHH4XHsDsooOKXI557JcSfaj0VWxA/410Rg+l1enIT6Q2SStL6wGDEyOo+ZtcpvAKlgbwxlEMy
	nafxqk1kWQwW25mWnzqMhZ/BMSoujsJEQ54y4rhLPxw9M+MQsKUEIgEctxtsXqVLWNFqMa6mExp
	S4AmxW0pbaDo+SpYZII2KoJ5TQyCjvKNisG/HdfA1TuZayAIlclwb0CULqtlcCQBRmRyD2JcVEE
	X3IViC2ldX4vTpvMblP0ALVLeCTiTyKupKuG21d3E7cjhvZdqbdDaVOHJX0GPKtXKdn2cYOiRb4
	FI5ddsuR9BeloPkvJEeaPT98v3bA1HAU80Et0rSz8JjCuIJkUWFsZG/h74ZZx8yOVGq9CTCW9I1
	aHa6fSAeEhm0n4mllv88I4jYTimxbffhq0gmP9enBeZmzG1fKg/Va5Yhc6rUjqNOo/oMm/SM/eh
	jKvODZNzTL5mYT8/G2Uwa9iZg34CEKDoZjPc+w==
X-Received: by 2002:a05:6000:250e:b0:492:7efe:3fc4 with SMTP id ffacd0b85a97d-4abb4b86685mr2252995f8f.21.1795135463090;
        Thu, 19 Nov 2026 16:44:23 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:10:5673:5f22:93eb:1bb8:839c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm2686669f8f.21.2026.11.19.16.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:44:22 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	"Wang, Sen" <sen@ti.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] ASoC: codecs: add Texas Instruments TAS2557 smart amplifier driver
Date: Fri, 20 Nov 2026 01:43:22 +0100
Message-ID: <20261120004414.1686884-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The TAS2557 is a mono Class-D smart amplifier with an on-chip DSP for
speaker protection, controlled over I2C, with audio over I2S/TDM. The
DSP needs a firmware image tuned for the speaker; without it the chip
passes no audio.

Patch 1 adds the binding, patch 2 the driver. One node describes one
chip or a stereo pair on one bus, using the reg-array convention of
ti,tas2781.yaml: reg index 0 is DEV_A, index 1 is DEV_B.

v4 uses tas2781-comlib for register access, adds the firmware rate
constraint asked for in the v2 review, and addresses the v3 review
from Mark Brown, Krzysztof Kozlowski and Markus Elfring. The
ti,imon-slot-nos/ti,vmon-slot-nos properties are gone: the register
they were written to only holds the I-sense scale. I/V sense now stays
on while the amplifier plays, as in TI's driver. Details are in the
per-patch changelogs.

Testing: built against broonie/sound for-next with W=1, checkpatch
--strict and dt_binding_check clean. The v4 driver was run in mono on
a Xiaomi Redmi Note 6 Pro (SDM636, ASI2) on a 7.2-based kernel:
firmware load, playback, stream restarts without a program reload and
unbind/bind. Stereo pairs, TDM, DSP_A, ASI1 and suspend were not
tested with v4.

Link to v3: https://lore.kernel.org/linux-sound/20260717233402.414326-1-morf3089@gmail.com/
Link to v2: https://lore.kernel.org/linux-sound/20260711145722.188556-1-morf3089@gmail.com/
Link to v1: https://lore.kernel.org/linux-sound/20260709221331.989109-1-morf3089@gmail.com/

Gianluca Boiano (2):
  ASoC: dt-bindings: add Texas Instruments TAS2557
  ASoC: codecs: add TAS2557 mono smart amplifier driver

 .../devicetree/bindings/sound/ti,tas2557.yaml |  158 +
 MAINTAINERS                                   |    1 +
 sound/soc/codecs/Kconfig                      |   13 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tas2557.c                    | 2973 +++++++++++++++++
 sound/soc/codecs/tas2557.h                    |  207 ++
 6 files changed, 3354 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2557.yaml
 create mode 100644 sound/soc/codecs/tas2557.c
 create mode 100644 sound/soc/codecs/tas2557.h


base-commit: cee03387d20bb267663085d9ac2622ff9263d302
-- 
2.56.1

