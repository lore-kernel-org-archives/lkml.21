Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745299;
	b=z4Q3I3KvhiLjG6yMLu/Eimw1rN+bc0N/6lVuzqgKsJF8OUjCuASrrVwEUD+yIJRDTgvv
	 L06ej9uEzR1gSe+zfYuxg98hk2XljIpvJrk85yETSLPoTrAT/VxL+unIgwb08mm0Z9eWF
	 p9O+09h/rGPMw08h/DAm+p9/s7ywGxt8am+Dv+VpnL/P8pAcRvt3kYxcZqWdAWCcS37DJ
	 /T5llnJNjrbhsJeVaFaYXnBEi4pKctediN+4tjxFzXlDugdW2ctO+8V+oUv3h0UBKbzyA
	 /Kq/X877eg1dPzJv46oLL4ijwtL0CTdVxkHUl0moODLf33qJmY2OGvpFCpg0vRl4f8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w4DH6C+tDE1JFdLKzQpNer3JwD5m/dqh3XkJoVpVm9Y=;
	b=QovtU1YGfhtg84XtwWZpy9dsnzZBf2J+P7XsxStfYu2ss0pB2IF9xNoonD/4n8kK109u
	 rmeg1w5hpMsG247Mq4m3uBfIlyMidq/WKSf0yLv5/uHExrwVRVjj4krxxspTHuLAAuS86
	 q1eNQAsGaDpHjP8pg5/Sumq5zL4xEt09vRF9BBMKXBOEo3VPuU7DlGU5qEVxyBI7hzqe/
	 qyLOfqtlxtdYXLEiXGyEVsDmhs934mv7k5M5HtoXaq5p/fSDOZlGTEJ0OsZuHBN4/FVFV
	 KOkHolspQQdsOe4ZjfstbKuwOOj0poAgbJPdfoxtp9SJgaKfORQnJ0tZFIR6W4R+Q1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RXq3xfXb;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D678B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D678B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RXq3xfXb
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4442036f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745297; x=1796350097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4DH6C+tDE1JFdLKzQpNer3JwD5m/dqh3XkJoVpVm9Y=;
        b=RXq3xfXbLsHrng8ypROZemCGGWcz1RcTZE0uVU9BI3OuZtL7mBbhAsjo7FfyIjEV9n
         dvvI9nETqV06MMIkGFKuParUyky/vprdTb42rT/lApYHBtXXc4QPTtJ4UMfyrD9YoM0u
         6e+9FyFPPRPa3Eu9SfzVm+bhfCkkhvpOaeb4Nx7KpBeArlxeh8sfJYP5xQnf0afwKRM+
         fzq6j8VzNDEbyz6KFtsyeytoperc91SdmgcCKKP7BghOif3NpzgGbDUY2ckuj3GbDOf3
         I10EJXEvwr7HhiXKKmR+V2p5I6e1t6UL+lL/hggoCotZGlp9ukFJmA361zV5joYNv87i
         UtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745297; x=1796350097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4DH6C+tDE1JFdLKzQpNer3JwD5m/dqh3XkJoVpVm9Y=;
        b=sb6LUEufEzc/sNRG2bo8F3W85yWfAqpvs18Grcjc3pMOozJEj/ChPETZNa+cAkUwLj
         Lspf0b8nG17S55DkcvLDr/zwby4jT5eqGQoWWVxZA+EVHGGfDRalKHo0qzeH6TavT7sF
         JPOEDXeS0tmJHGJ6wVyWp1jei8/+JU5vaCk2AJSxj/i9LEwryQl7lwDi20ghaKcXfw5O
         suSElKkkgM5ww6NsVAB+JdiG9s4gbDCTm5hC/1HtMqZi+ckIwsHtMzU89VPchGmDtWTY
         seJzyp6WgxGqvZx8HJ74id/5IGeZN7US0ssy9f4ra+fBu+nVV40VdJQkCJwpF3f0XVxj
         YvtQ==
X-Forwarded-Encrypted: i=1; AL+hErErRKjNCKqHmvT6BtFpcwkqT09L5D79d5jcWDCiVf4ThYdy2ppyvqA7BrDqwkhJaDppB3uxYswh8OxqrX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YKO22TC0QH7KI8rImPk+mlDmkcmMuDdzGLNpyTS+DqSOwstjF
	haXxbSPQZVgb301S4HR/l4fzbWO7LLwXVvnACI9p7VC1Si11M2vKxqOV
X-Gm-Gg: AZFdTZeLumnW5/HCRyyX3vlvM6n9ju8Dl4lLP0GzOXLA1HbYepqWgcvZ2occ/bJPfXH
	sa3ipYdLAlevOHK4Z3r9qilGewZpIpHPimFmoHOsSTqR3L2lMneRuuUMSsUN0bVKZkDfUhh/q12
	YDQR+sv/ILBHbwxUMoum9BldGISyEr5qR3pO73RHc5NgkwXlfTJlSeUGhymYB5vJbALminXEYqS
	0umExjO41RrIzzgGJHBF5Vz6XELt1xeeE3eEoNmATMLPDvQMPr/jNccXqp7rHZfaQ/j4Z4L6cUL
	ugFjrq1PW0m8PwbipLPI6DjZ2JXtev9IzuFHS+hTbxJ8VxpHLZFKbk0wT1adEE2yykgYyVa6Nmy
	sehXLRZYqdNYV1mUKT94OcIxgkXxeCrgBg6rZ//7GZwXgWRvdxyxJbnYnjZUwEeTuz5erB8OVXm
	5CKYKbvNGeXUCoXyeFalVxqkMyG0Gs50SOnSQU38+e18djw8gLPALzQJ09MtVqpC2yXWbAny7eq
	2mh1bkSeSgxEEd1MA2nvYC2obhzHlpSL6lvS/6lDG6jVFLHaEWSZTOpiO6EoltwKsFnUrrhbUjV
	854Dg0aK66N5HAS6fcTSC+QvHsMSpApnjjDkbbE454YN5O5U9WDtN9Yz2UVNO9XVeUHr/bbkb+l
	K5mpLsYWSjqMggzx7mid49qegMgooP5/sJlTB8A9kxLc39A==
X-Received: by 2002:a05:6000:1863:b0:48d:b940:af7a with SMTP id ffacd0b85a97d-4abb665167bmr54566966f8f.55.1795745297215;
        Thu, 26 Nov 2026 18:08:17 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm43390844f8f.49.2026.11.26.18.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:08:16 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 0/4] drm/panel: st7701: add the Miyoo A30 panel
Date: Fri, 27 Nov 2026 03:08:11 +0100
Message-ID: <20261127020815.1621790-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The Miyoo A30 is an Allwinner A33 handheld with a 480x640 2-lane
MIPI-DSI panel driven by a Sitronix ST7701S.

Its stock init table doesn't fit the encoding st7701_init_sequence()
derives from the panel descriptor, and the panel doesn't work in the
burst mode the driver always uses. Patch 3 adds two optional descriptor
fields for that, a complete init sequence and the DSI mode flags; the
existing panels set neither and are unchanged. Patch 4 adds the panel,
patch 2 its compatible.

Patch 1 does for sitronix,st7701 what commit 2f50e0a0f9d3
("dt-bindings: display: panel: Make DSI panels port optional") did for
the other DSI panel bindings: the port becomes optional, and stays
required for the panel with an RGB input set up over SPI. The Allwinner
sun6i DSI host links its panel as a child node and has no output port.

The board devicetree will be sent to the sunxi tree separately.

Testing: each patch built with W=1 for arm (multi_v7_defconfig,
DRM_PANEL_SITRONIX_ST7701=y and =m) and arm64 (defconfig, =m), no
warnings; dt_binding_check clean for sitronix,st7701.yaml. Tested on a
Miyoo A30 on 6.18.54 and again on 7.3.1 with the same driver change
(A33 sun6i DSI): the panel comes up with a stable picture and correct
colours. The other
panels of the driver were not tested on hardware.

checkpatch --strict reports "Alignment should match open parenthesis"
for the continuation lines of the init table: they follow the style of
the existing tables in the driver (46 such checks in the current file).

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session: it
extracted the stock init table, wrote the code, the split and the
messages. I reviewed and understand it, and tested it as described.

Romain TISSERAND (4):
  dt-bindings: display: panel: sitronix,st7701: make the port optional
    for DSI
  dt-bindings: display: panel: sitronix,st7701: add the Miyoo A30 panel
  drm/panel: st7701: let a panel provide its own init sequence and DSI
    flags
  drm/panel: st7701: add the Miyoo A30 panel

 .../display/panel/sitronix,st7701.yaml        |  13 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 115 +++++++++++++++++-
 2 files changed, 122 insertions(+), 6 deletions(-)


base-commit: 53063c88338aa6125d43a7ce3ff1e0cf5066bad1
-- 
2.43.0

