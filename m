Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944341;
	b=jj7mRy/RDk5zjr8jo7mHekSpLe7Shlmq819tKel4Y9GDbglsWXZ9920T+O67WT//BqPN
	 JhVINFS2rzPQ9IEuqenDIVZKYXn86/bQLbATvyxxFihaKL1BICrFbhUHpLni8LXBrTwQ2
	 ms3WZGbkdKw0n3Ik4psv3EoXVGaj1HksglA1w9886ZfQ5hdJcs6DWhc9q/SO9a/kkxIqs
	 jBRXDv1T0vsown2aJ83FuYdEulN0CDuFfVIFYy/VK31F8J3igEsAUxcS9fnXxgHjyjCJy
	 iKiqYHFtMyXtSXnUnallrU3MoaRU4GeMD3DDHIodE5KE6GI2qd0NH2ucU3E52DA0p+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mCdB6Y2b1KlIUU0/RI1kPyC4zaNgqRo05w312NX8tBo=;
	b=jH2KSGXSp5HSWXUKphFtIoXKJhe/qdQozAhFzNaM5IWir1fX16nOQ+r2E4fThK7cHbsT
	 X6C+2A14c1AcrYRRS/gvIjnL3urI9ctIBp/wCs9FpdMCVxnT8rTeGHXewduKmNpTfE7Jp
	 CWm4gXT56fktq47pVg1lJIbW5aNU9yJ8YFUJKxNpyTk+W568zWE3zTdAfmuk9eUnRFX8K
	 ZSybaaXpb6qH1HG/ZLewOcvp4Jq/zW5Th/Oh/8lGP2fTI8IPnSnrIWjNtn5pXxHKROEv7
	 +xVNWTTdBb8M70YJrOKzsjlEfN95eH+H3THFfNQ/SZrUUWJ4i5thUfkBPnoVFxOxzZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QubTfkMQ;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA5A606A336
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA5A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QubTfkMQ
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a42b34e930so105581f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944339; x=1795549139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCdB6Y2b1KlIUU0/RI1kPyC4zaNgqRo05w312NX8tBo=;
        b=QubTfkMQH+Ts0n7PGqp1tfezAFVn35HsdibP1yHdaShIti+vssRzeb7X3pVYVF3py+
         N+TBbj+V55oqnTdry0GwJJn81ooSWONI1H4OqaGzjbVRKQNvVwNadF2Kw8BFNYXjyjkg
         7A2OOy7g1wgh0ZIrLn/xljY8N126J8qBVJCgfw07L4yyljs2F80Jx0nA/+EXU22hUPvz
         0MPB4eTkinZFKUyAnwCQn5TG1P5udaz5AeQEDvub8iZYc+Yj1e9RfOoDnFe2+RoOGw2z
         kBySSvkQpUjLY+W/mH1PHjfnoTnXTNFZjTtcA7spK/+oGHCJU9JuT5UKcPWosDYI/uct
         2VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944339; x=1795549139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mCdB6Y2b1KlIUU0/RI1kPyC4zaNgqRo05w312NX8tBo=;
        b=LBa9fKv0EUA4EqfyiKoEhVWwtqoUHJv+SmfNJoEFVjY6tWRdEM2LY0+cfSOwxhtPpm
         KS4Wsv/JJAsfXcI/QvNGB0Q1U1pqBj7ZXfHe4L8LglSadjTBhVZcgvsnugvXW2Vga6Pv
         NAyR413iSel/uCea4TbOq2GqyTpryVagEu2APhgvO6D/IFgeVQ19suVMRLtlQmW6i4M0
         6dtgzWA3xPSbq//yO7T7yvjs3N90TpUtXJtRgaseDZAchTr0hrYwJmczSpbNlTE0PG1x
         vSi20F1aa0aSfXnkHU7i3EWdMggKEFAsbdybLgSw6mwyxSzbPo1pTlL+60hcvQqvWcVQ
         pLAA==
X-Forwarded-Encrypted: i=1; AL+hErFHoec+SgQjq6od4UijDajg58dsanTOJGXvjbWtg7ONhsn91e5rY/sUB6YkcCnvMPIQMSCQPLjRH5ClQ50=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Etv+Gx4g0Nw/xwBM5zOzCW6g5iRZB9IhDvEzT5ceF6ZH68ciS
	j9mDhgdKDFw9vMjsXeaW/deAObqFHtx/EMa4kF61l2Vkoz3REMjs4HC/vIjpNw==
X-Gm-Gg: AZFdTZcbKD9YP9/OhO1mQ0h+gpuwf1x81hkilnriqZLE53Yi98U1iCo0saENB/NiP60
	I5titCaq9dN1JgyFDxjZMnxn/ocnPeilYTAJNVfGAud4/OXEU7OHHd+FxTTnkoPb3Bh3CUCS3KE
	Vxcam8RoXgRLZYpLJL+SMIYDA19HLWgW+zDLryhHDRSxRs4ewGsG6sh2RMnqN17pLiuKXJfEc57
	HEVO6+Ci5QZoYNH8G6OjOIu31NH/kKR5Q2xMqE2w5BdFNWt4DLTXogGrmiAZgJkiNftOsl380EF
	QEM3kX4Q88fm7I4hyTweypwFbwvFzGOww296xFdTR/4Nzl66eRY7BRNCcKIs4q00XBK7amSOdIJ
	91jdIBYEuSzPZR0hjHK3C3EXgknjvb5FGPFQOY88ehoHeMfzy+Ke8oVhlYwfcC7hCVPi42ivrs0
	x9ZEOMW9LySlBM66wZuUblHKGT1kbnF+8JV3Kdc3D0yLrwj/uJWqdDef8jOs/KhO1DIFUBz3P+K
	ri8oiB9so2V3iaBIF2YPkNdDLcPnYonZVW7TzZINn+Zg3ysnfwJRwD8gdLnGfoOvIu0Zsjy73Az
	RRF168RutA/GYfrH6vw4MgBe+mzJIf6Nr7GAYPbgynGtHfyr+Gog7hma6622iIHYdjpXtNRkzCp
	KZ4SxbtDs6kynHZKX6YyzYm0dRsbV1TedTw==
X-Received: by 2002:a05:6000:178c:b0:490:9fe2:6a39 with SMTP id ffacd0b85a97d-4a6394756a8mr1002586f8f.20.1794944338756;
        Tue, 17 Nov 2026 11:38:58 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm509521f8f.0.2026.11.17.11.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:57 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] ASoC: Add support for AN7581 PCM driver
Date: Tue, 17 Nov 2026 20:38:46 +0100
Message-ID: <20261117193851.235272-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Add YAML and driver. This has been verified with loopback
and confirmed by Airoha with ZSI voice chip.

Changes v6:
- Better handle IRQ with IRQ_NONE
- Drop wrong DPCM values
- Add comments about CHBF_OFFSET
- Add comments for HW pointer reset
- Validate that slot fit in the BCLK
- Add INFO_BATCH
- Fix wrong define name for 2048KHz
- Drop unused header
- Select CONFIG_REGMAP_MMIO

Changes v5:
- Use local reset variable
- Fix validation for channel and bit mask
- Drop use of threaded IRQ
- Return if snd_pcm_hw_constraint_integer errors out

Changes v4:
- Add review by tag for DT patch
- Address shashiko bot comments
- Better protext tx pos
- Set DMA mask for coherent DMA
- Use more managed resource
- Increase users in startup

Changes v3:
- Out of RFC
- Add Documentation patch
- Drop SLIC testing code
- Add MAINTAINERS entry
- Follow normal pattern for commit title
- Improve commit description

Changes v2:
- Rentirely rework IRQ handling
- Fix problem for timeslow configuration
- Better support duplex mode
- Better handle descriptor tracking
- Move to Soc directory
- General code fixup and cleanup

Christian Marangi (2):
  ASoC: dt-bindings: airoha: Add AN7581 PCM controller
  ASoC: airoha: Add support for AN7581 PCM driver

 .../bindings/sound/airoha,an7581-pcm.yaml     |  52 +
 MAINTAINERS                                   |   7 +
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/airoha/Kconfig                      |  11 +
 sound/soc/airoha/Makefile                     |   3 +
 sound/soc/airoha/an7581-pcm.c                 | 931 ++++++++++++++++++
 7 files changed, 1006 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

-- 
2.55.0

