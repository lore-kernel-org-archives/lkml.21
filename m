Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180287;
	b=Y4slPS62Pk31sUc/249zx4UTZRjMGRfccluN12WIV1ezlpkBnCkdcqYmqG1qsAZyCnZq
	 aiVfHoLcQ0wLrzrc72vLgPFdjViLQoNsek8xAmJpafkTtyWAUcKSbxkGM1kRDEqcTlyRa
	 zNmjGcUN0WoAHW3/7vuDrF+7FYd9q+HgcdBE6ks0jh3W1nw+rwiOER0qt399qJbxBmfX9
	 o2AY8XWRE+xvG7vYACN4/Qt2+B6wcDmZtJdHJJ9SMedNe4+XzqU+cIBLt1jLZSHBtuFZw
	 OWxgj0nvZChyniSHcR3pfeWQ/tb3YFslrSwmB7d1zWFl+xN1gUffBY4rEJGbp20Ny2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=PpEHmlaRUkDXxpGvranXTA8vWqHmYOzyD7cdKeA7b38=;
	b=Wqd0QaBaUFqbDBYBHHTWH6jH+WbPPGAbcGE+RJu2urwRnhflqQ38JImoyaBCXZuqw8f7
	 DgDNOLZPGqFtcGeFyLHVQhNYvhEh7QCXIxvIMuqQqVyXWAKwVnpFvvfTewwsYuuxqXTbt
	 PFo184gqbBAkrH3sCOxreZ02s8GKT8q0Qk+6AtW0wyyJKXE9J+0APlHLzEAIwN7s92/me
	 PVrBKVa6/fRfyasDSqGdTCCjvaBsbqCen14Ew9O6dqEkMSlq9t+zA9XmP/Z+FL2qo8cVL
	 +CIaCTzO/t/oy5MZdH7idsxxBuLIGYfMnkcVc2m1LSpDr/sIfLQ/yeSsTRZ2jR5+8og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GyHa3yO9;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18DE60A260F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F18DE60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GyHa3yO9
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso6245405e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180284; x=1795785084; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PpEHmlaRUkDXxpGvranXTA8vWqHmYOzyD7cdKeA7b38=;
        b=GyHa3yO9XcmmXHRNWoSYegz5+DaD0NxLYkgoLQuVWReArzev9zK9iZUnF160zbyY1R
         AaYi2Kn9oOyjWn2ek2RAHVemv0qwJcU6jJ1J1ZCmoY0afljg/CCxcxPHc+6g0W/TP6fg
         KQcx1tovEgVuGDmRNTDRogw5sL37aBwPz+sFkm0ye94vNdsT6+a00o/Z/FC/Ey1BWcql
         scRKK0s7xfJhaAaZbjSLDddst69WUIGZ9dr3A1Xd5fv/sZA21LX+z35siG22exq760Oa
         7gaMmE5pR33kM27vug4vIwEL+F6z7Rq3JFSxJLFlrkQB7ePzP9GRY4YSdt+opRaVQuum
         Vong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180284; x=1795785084;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PpEHmlaRUkDXxpGvranXTA8vWqHmYOzyD7cdKeA7b38=;
        b=0DDkmyiBNCOsq/UJsBtfbAzNmSh9s4+e1t/qsZ2mYFyzQemmZiG0HjV0WLVkyX3iEK
         bqYTZyDJq8gcZPpm46jJ+SH1lo4tXOZ40uaXJ80O1qs2shhkuH2arA1nUEersTA6R8wI
         iNgGbr4N8JptYJi00NYzenyQZu9tP/EEzvwPLlRWdK17cRYN9LMj3qi6+7eMxwX3SgLL
         huvDT1y/wLgfY4y2Ad2HDMta7pgvyIqSYo/ltVl0cq6zLLo0heu0axevI9LNK6BpGbrU
         UWS7m6A1HyTLFDIvICWDZhY/EZR3wLxO2nrMj5fYvDmHj5Y79hzFrQGUYiC6ygYZZSyt
         a2YA==
X-Forwarded-Encrypted: i=1; AL+hErH/tmxICARtWBzInXaDaSVuwCCi99H9e+cuujkfm6XpDfFhR5YqMezlRX/YaY8J7OuHlUGN7syBfuTx954=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0n/hZ6Ykg4y25qWPJ6LooBxfnbS/zr5VdQ8x7ww57X6Qo1osN
	olfyLI3U2bppF1pOdra8zuTm+pU3XJZv6ZNNislEg7CQPezeko3jR05bwnQhZg5sSCc=
X-Gm-Gg: AYBFou2bEyeh8zcQzTW9C/YbR1AjxLOzHCI0fMsLNXgCTemfC8URhwJhAMl2paBUsjd
	DesWI3PO89txFL3pN+yIJvRwwuFS46ZAbv2eVmr++fEeZoV4mElzVQnpSke3gXVgYAItg73V0za
	NicuFgehrOccH68qbdkBWoEHBxRXknsU0lqh4cBRkRnN9iKJZ9xWe7BzelXLsAXqpRbWcoiUNVd
	OTzTflDLK9FyghOqFYiiz6azfS1FKVQY1zhd7CDRYRtAn2gKpdD/UN3TvajTvK6eVhC6fPWsKAJ
	nhjnLpOn1JoZGEcGPJn/Ezrr6XosVYPR4vwxb/yIUFva75P4X9k/IcNeabxriUE+j6/++LNM0NP
	m9DXiVDugdTOo1RKIh/YLQMI567MJBiIZ6VD5VxMrROl0oQ5i30t7GdrxkzgE8L3vJ17fdtUrLW
	13LdYJV5OepBoIiRt8qOGPLRBjJiTMM7CmBgONNmyoxdb8fnNFCeQBNDdJWOIb/rCg5eDQcBcAz
	xukSCHney+zAr66Ed5YQuJ39yizgkLoU4U3E31lNpVsnsgi6pDruQ5PykmqlsXXd24IafWJ7XqZ
	LizswunjAs4MAekFCrFeKypHaKfLBshGtgSQvXDA5b+n+zB/5Onl/GndcvVRnBemqSh3X30rt/n
	Sb2f+q3mA14mNGzw5vB7RZCOON+UswtBXTo4yNuIFXbZG3A==
X-Received: by 2002:a05:600c:6749:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4bb8881b52dmr64713635e9.23.1795180284211;
        Fri, 20 Nov 2026 05:11:24 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:22 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/6] Add Amlogic S7 clock controllers
Date: Fri, 20 Nov 2026 14:11:03 +0100
Message-Id: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/2WOyw6CMBBFf4V0bU1bQklc+R+GRR9TGeVlW4iE8
 O8WMHHhYhZncueeWUgAjxDIJVuIhwkD9l0CccqIqVV3B4o2MRFMSJ6GjkOIHlRLQ0lN86S50yB
 dnstCWJKuBg8O33vjrTo4jPoBJm4134SH15hU8RerMcTez/sfE9+2h5Kzf+XEKaOlLRi3UkjB3
 VWruUHt4Wz6llTrun4AhMrrGdgAAAA=
X-Change-ID: 20261026-upstream-s7-clk-3fbe6f33652d
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0

This series adds the clock controllers of the Amlogic S7 SoC family
(S905Y5, S805X3): the PLL clock controller and the peripherals clock
controller.

The peripherals controller is close to the S4 one. Two changes to the
common code come with the PLL controller: clk-pll handles PLLs without
a pre-divider and PLLs with an active-low reset, like the HDMI PLL.

---
Changes in v2:
- Drop the SCMI clock IDs patch: the IDs move to the DT series and the
  binding examples use raw SCMI clock cells (Conor, Jerome)
- Use exclusive or for the active-low reset (Jerome)
- Use absolute addresses in the binding examples (Conor)
- Rename the HIFI PLL to HIFI0, as in the datasheet (Jerome)
- Model div0p5 of the GP0, HIFI0 and HIFI1 PLLs as a read-only divider
  instead of a fixed /2 (Jerome)
- Swap the VCO and div0p5 clock IDs of each PLL, so the VCO init runs
  before the div0p5 divider reads its register (Jerome)
- Drop CLK_MESON_PLL_NOINIT_ENABLED from the HIFI0 and HIFI1 PLLs (Jerome)
- Declare one clock per line in the fclk macros and drop the default
  GP0 frac_max (Jerome)
- Clarify the fclk_en and HDMIPLL_CTRL2 comments (Jerome)
- Say why PWM H and J are read-only (Jerome)
- Fold the video and eth_rmii clocks with the composite helpers and
  local macros (Jerome)
- Add Conor's Acked-by and Jerome's Reviewed-by
- Link to v1: https://patch.msgid.link/20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com

---
Carlo Caione (6):
      clk: meson: pll: Support PLLs without a pre-divider
      clk: meson: pll: Support active-low resets
      dt-bindings: clock: Add Amlogic S7 PLL clock controller
      clk: amlogic: Add S7 PLL clock controller driver
      dt-bindings: clock: Add Amlogic S7 peripherals clock controller
      clk: amlogic: Add S7 peripherals clock controller driver

 .../clock/amlogic,s7-peripherals-clkc.yaml         |  125 ++
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        |   71 +
 drivers/clk/meson/Kconfig                          |   30 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/clk-pll.c                        |   51 +-
 drivers/clk/meson/clk-pll.h                        |    1 +
 drivers/clk/meson/s7-peripherals.c                 | 1637 ++++++++++++++++++++
 drivers/clk/meson/s7-pll.c                         |  696 +++++++++
 .../clock/amlogic,s7-peripherals-clkc.h            |  245 +++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    |   42 +
 10 files changed, 2885 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-s7-clk-3fbe6f33652d

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

