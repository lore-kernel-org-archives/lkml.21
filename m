Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795494865;
	b=P072uWAdQSoGQcW6NJHdjV4WIkU91OW3gHdx+SICNmmFvfEohe4Ui10XGeMywjvWXoBc
	 O6R6rF5o5mPJAOJnGzUVV7v/5O+wwD6Tz7BlGfW3bw5mUruBKjg5+FgvddwlCd7eHADdy
	 BauPwEmdDpiGErmSETi0jBaiLjmW8xuSoHqDuR8oawyw4MR4/C4oPZ9rrPiNZKCuxROhX
	 p7DSXsyW3bV/wUf8Od9nm5WPhv6spn7peW7aL1Jsyj0zFMI4DZ9ErWUCMVtEZli9jsoO6
	 ZfXM/+RLl+dxdDGG+yDUA0/4W5tv+VpX2bi4cOraUUVzuncXwH1RHNIFWbslOjCPmOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795494865;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=/e6yF19zcnnSZ5kweRiKxTKNHNpF97qUwlGZCKVgLTI=;
	b=2MYBK+Xrb5ADHNKw6j1ia+XFTaMtR/hk9LamwJAj0lscNREOevN/hlXW/cJHRMF/kenU
	 WBDBxDx8loym1PuaEZ9oLGYlmfU6C4xCc63FAArplt4zOUQvr09hm57cpxlTSbPs8sgn5
	 EEe9r9vUVm7Ruh/OWY73aaW2Y+QyNXu7zIPf54L5yXhe+sKwYV7kzptx8cQrk0RlOBY50
	 G3jYOz/5TrA/CNsqd5BR+5k5eDNjzrCMNZZgEntC2b8KLSYTgZQPSqDJlqt1kjKfdTwPd
	 ypT6hAdWItguOxjg/aZ31RovRZ88h1kPT/+tzmN1fjpknZSb5IYixfPBIcXAwQwGmug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5648B606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5648B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67c246c0c60so3802592d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:34:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795494864; x=1796099664;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/e6yF19zcnnSZ5kweRiKxTKNHNpF97qUwlGZCKVgLTI=;
        b=FD9p5f6X613F3dOxsrHQ2HrqRdJ/EgRbtJi3E4EqTgrFnjRZcGEacrVkiDpp/uyYY4
         u9s87usZi/Ef/xenIpO5xmoQJqrNKKCDB97CRW/AgnISMJl2VcRkzg5ncVqarSobQkwW
         aDLAm2oXkoRrkJnA+QbX5uoEku0+dKdXJi0Sx87Ng96i95scxFG/C6JhwxoEhhbore0S
         WyTkSSsfbTzOr2hQ+4leSCD5GSqtVA9/8vY8RPq+YsXUECv3i8KTEdtDqewW/PgM08CG
         m+JkNYJNV3+aZ4/lOYXEQSL38b+pOVHffvudfERHuXzrzK+RLtQVQiomg0bceoQ0pcS6
         /QsA==
X-Forwarded-Encrypted: i=1; AL+hErHDeEMn29glXQYsKXb3hjzi3TBvXSEv9ntcKkH2nzdvJRjEzUGx/aKUS74KzFi63aLHPysXwuU7OCH5X2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PkaUcnqwlI1aVrSkWyBE/3hIjaiwsyurcTtE5+dHDJnodrIlq
	EwzUHfO86WPWuWJHJ/XCM7aM3rvjCXG+RGJcJRN7O+mfxCAyX1AqnU6t
X-Gm-Gg: AZFdTZeAJwLiDHgYnlGHLqvWNr/4MVmbL59lJhw3RLvluFaMsZPWfFCtrRKVFIZDk5e
	scYpAGdEchq8uWw6KyW7imTISG8CqPzco0Q71i8jLhIEUzrHI852fjFJ3hp8TBHDMGlfOefcmBy
	pcTHBh/vpkot6pyIKT3zFOk+axHuFPpchDb2peogg9oMoLZGziVOkR9Crmyx2KCi2QVY0Qr/0YW
	5RvnH3azk7fm4d6yrwA0LT22n9b9wkKHHz3f7z1wJE4DIGyJa+M/mwLwoZlcfiZNCCmuJDrSwdS
	N1rMXBOCOFoureCLX5qMc+EsrrIi2ZnHFBiAq3JS7h43dzjcGtvRnnUBOZdRk6RWcxvtblj1Wxl
	wHXuYENA4kw03+xz1i91QoyDd/Qj7xAHi72ZLFvNVG+o/1xUs7FPh57PAsMNZvMPnAezQIqFzPP
	T5ONX/FYE2cm6bJ4aZLvBxcFK2KWwPHgSQ7bl4CKYvEDEyiUysGBfiYbPxpLt2VTXpiVTZGsS1A
	5YvVVhxYWWfhP9UIRFZ1pW8mjGZqHmNmsWWZJco400ACUeWkbiiWH1hnb8Ip985o56c12evkkFg
	EFkUtpwApcrSzj4DFvdR0vVt5ZjaITRJUw7C4y01S9bbeACMu2T7+wgs6ClwHccC7Qh1ETfu1bB
	Y3uEn7KCvbjfHNvSGQBVaX/mg1bfBfzCaQwszgqAF9OMOzv9t7t2jBncYEhBWRpG9MZVRlysZ+Y
	u3wQCVVlJv7P79Q+5HLYLuFwM6fk8=
X-Received: by 2002:a05:690c:f16:b0:8b0:a01e:2ce2 with SMTP id 00721157ae682-8b518ec3105mr54040937b3.15.1795494864418;
        Mon, 23 Nov 2026 20:34:24 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202fb0a2sm53106397b3.27.2026.11.23.20.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:34:24 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Subject: [PATCH v2 0/2] ASoC: ti: omap-mcbsp: TDM slots for generic cards
Date: Mon, 23 Nov 2026 23:34:19 -0500
Message-Id: <20261123-omap-mcbsp-tdm-slot-v2-0-3e3aae215952@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/22NQQ6CMBBFr0Jm7RhaoYgr72FYlDJIVSjp1EZDu
 LuAcefyJf+/NwGTt8RwSibwFC1bNywgdwmYTg9XQtssDDKVSgiRo+v1iL2pecTQ9MgPF7AgUuK
 QHaVUNSzP0VNrX5v1Un2Zn/WNTFhV66KzHJx/b9ko1t2voP4WosAUlSnbQuss17I8B3pofd83F
 KGa5/kDEdJeA8kAAAA=
X-Change-ID: 20261115-omap-mcbsp-tdm-slot-7ee61348226b
To: Jarkko Nikula <jarkko.nikula@bitmer.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

With simple-audio-card or audio-graph-card, McBSP as clock provider runs
its bit clock at the full SRG input, since only a machine driver can set
its divider. Patch 2 adds set_tdm_slot() so these cards can ask for a
frame of slots x slot_width bit clocks; patch 1 lets the divider use all
8 bits of CLKGDV.

The ADV7513 in the test takes S32_LE only with a companion adv7511
patch:
https://lore.kernel.org/r/20261116-adv7511-s32-v1-1-40ae8228db42@telaak.dev

---
Changes in v2:
- 2/2: hw_params() checks the stream against the slots and the sysclk
  (Mark).
- 2/2: rates are limited at open only for a sysclk set outside a stream,
  as simple-audio-card does at init; a sysclk a card sets in hw_params()
  is checked there (Mark).
- 2/2: both directions share the SRG, so the second is held to the
  first's rate and sysclk until the first's hw_free().
- 2/2: channels are pinned to the active slots, non-empty TX and RX masks
  need the same weight, and unsupported slots are reported.
- 2/2: a sysclk from the internal fclk must be that clock's rate, so
  simple-card's mclk-fs (rate x fs) is refused instead of misprogrammed.
- 2/2: dropped Jarkko's Acked-by since the patch changed.
- 1/2: commit message wording only; keeps Jarkko's Acked-by.
- Not supported: dai-tdm-slot-width-map switching.
- Not tested on hardware: full duplex and a sysclk set in hw_params();
  the test board has playback only.
- Link to v1: https://patch.msgid.link/20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev

---
Joseph Telaak (2):
      ASoC: ti: omap-mcbsp: Use all 8 bits of CLKGDV
      ASoC: ti: omap-mcbsp: Implement set_tdm_slot

 sound/soc/ti/omap-mcbsp-priv.h |  15 +-
 sound/soc/ti/omap-mcbsp.c      | 334 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 345 insertions(+), 4 deletions(-)
---
base-commit: 2c0f21bfcda98db49f6476ff9b042402e5f20d3e
change-id: 20261115-omap-mcbsp-tdm-slot-7ee61348226b

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>

