Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477262;
	b=oYjnQuM8HNj4DwBq6Y3qVSnE+FEjA2joPLb06OlxeG3uOmkJZwnSdDweSue0mT6jPcyd
	 xX8VqL53UIBfx4ev9HmQMvdhCKh8rZt9g+tRoSmBathFX0g5MRvwH+QbE1bEunrg9IfSy
	 UpFnBCjiOCe5hsZnu9gpwTZvPCdJ9vVMnGtzR8BTpy4SEyZNFpck+LhqMx4zXNyJdteF9
	 4gyfKmnpQMHVxJYdPkqwbxsKSzTKjQnpYVJBd0HP6C4JJVwnAL4twkaQokH14pVlaoeIj
	 K46xth6WBu6+swMpnohO1zGztW8xZi5/CQcsNcvO7cKiTmcPoUBDOXRIRiFogtz3fVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6Jona4pqFJCvkAlDQiwA0g0kWVm7ypHuKu5UjsDxy74=;
	b=HnX90xMvii4iy1kd4xU9uwUBbtkcwlJkuicLgUCKzFVxZtNesw+Mr023dK3q0FS4LME3
	 ivSEVomcPZpv2/ZjBZFVyliZOlI+osoDLOhl5tIGrJ3Fh7RpwBgBa9ON3ZwD6ePFzIAo5
	 WahoV1J7NqNOvIbiGvTH8ZRJDi0kjNeBGIPqgCGZrEPIBpGS25PbTdTsw1ImlfZwP6Co1
	 3vnWFqRPL8xxFOyCDufUId9lYJE6MlgXhZwuSkzRf6l8qikdZqTX9vuUGTXsqkjgUTSBB
	 FmXzeFgnQhIgqNU7Y55JoQ7bLSfQBAVGYNXw9EH/etqZkpAgGqtThSUBnLHCcLcYG2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BjL5nyIr;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C560606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C560606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BjL5nyIr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so26326415e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477260; x=1796082060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Jona4pqFJCvkAlDQiwA0g0kWVm7ypHuKu5UjsDxy74=;
        b=BjL5nyIrKNh+QDVjf8eaQALxMPjdbelbz5KCEraemj4Zj/ingQwfseuZS/YGQakrba
         ckzOv0cdddsuNSTHBdjHm1t2s9FTpkQjGA0lxx/C00IN6K8mqfmTBloLhubbPehKPmMz
         LfMjiuMiI1oDQiiaxBqmqTJc5qrD+V/AtCzj/up2MKr2A1tJLjGQ8igIwcAMIqX9/hNX
         L3f77wnTbGIgzpQzePV43x7HSWaZmIdGlpnPP3iPf9oW4rqhFuTdfroqt5h2fHs+U4lw
         20ywHLQC+7OtzvpfqF3IgWLJ7DXF7gLaVej5WT+dWs+tiIt9HbN6cS++FOxBIcwsdu/W
         VJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477260; x=1796082060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Jona4pqFJCvkAlDQiwA0g0kWVm7ypHuKu5UjsDxy74=;
        b=jJLb6j5+e90pzrkQSGjfyClLRoiy6sB/WdnsEItwhI8P4rKSAPXfsZf+Uw5mnfe9K8
         B6l4LwKaZcq9XnYLKM70Zoppk/75rrs8MYAV0oolYIn43WEQy+m2W23dBnl47lq1xfif
         uBujzlWlzofScirl77WaPquEVJdW7drPuq9PS2foBdqi2Mzj4PSFNYQ4H8V78xPuFXDB
         up6TpldyfdWc5rs9lolyO1AZr9xWFwqZLjOsGZiMFm0871ASdRev+rLElrvcdyt7/Avy
         7qAZWkZPJ3XA11tteyEiWhMkCcTYuh3Yr/BHDxtxACI0bN7aYsZ2zjF28dlqUE+alMM4
         XTXw==
X-Forwarded-Encrypted: i=1; AL+hErFHHobcqD3ihLYuVga//6vRYp0tf2YHwwnSzg7jCqjg7Z5pnjtqphpw+NSPAtpifFBMFpMED26Tg1LeJBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k0LZ0+rvbvaNGNYHkMJgBh9a7eExInOXIffRstZCkOX0bWNGq
	Y6gXQMX0ZMOo/SgC9VVmLxHujadUIsxuw8yZQU9XWn2cHWVSTg2sHLo=
X-Gm-Gg: AZFdTZfhcnIhSt3N56DoQMNb3zoqc3l5I1hi10OSdijtQk7YcgaQjTfqkhfJHHqDkPS
	cMs1zYCxR0U0AM9on7qgfd3th01tm4tY6gMEUdDA9+TGKShzCo2OMsiYnqp4NOiKakUVmEhv0tu
	rEYIgR2ZXreoa1xlGdJcZuLKlE8ezHaQ4LcdRrtm46kWbIhn3N56Rp10Ipqbo49xA3AUTY3kley
	C829bEs/s7VrC2+Vo5kTRbF0wTv1by1bbMk1I7/Mg5EfabtfHIotFQ6+3pqv/gcQffWYWSz5QvU
	Zz6xeeSbmfiDzHOK+E/Yi8kMcMg2TIMYMrblyruUcNYVmUpMR8ZZXDTUo4Mu8PMpmT0IQP4t/iR
	tEC0LVKt9+m5QHZ3zr+vnZVn/0c2ogCFWh2vA38pVyx3FwuYW5mExp5aRFY4d3wRt5Mr9r1bf/5
	rbsStDbiE1lhDwacrynMkHrdMXb/ySwdhrJr4CdFEjRKpKuzmncS+cx+PxKRglubgetKr7H2BQD
	PZnYuriojfvx1IkqUMVO4FU9237+AGz09z93Fh4wJioQeVU/B8uNtRlT4DMUqeEXFoiewqRDdg2
	xeyp5FQuXtiWpztkZqHQHVKXJNikupToy9eiFx78wS+rpZ3TXFGyBg==
X-Received: by 2002:a05:600c:6749:b0:4bb:8508:7fb3 with SMTP id 5b1f17b1804b1-4bb8881c3b3mr247978235e9.11.1795477259871;
        Mon, 23 Nov 2026 15:40:59 -0800 (PST)
Received: from localhost.localdomain ([193.207.76.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm568321645e9.13.2026.11.23.15.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:40:59 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 0/4] ASoC: tlv320aic32x4: Complete analog routing, Mixer Amp bypass, and volume controls
Date: Tue, 24 Nov 2026 00:40:46 +0100
Message-Id: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
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

The TLV320AIC32x4 driver currently exposes only a subset of the codec's
analog input/output routing switches and omits support for its Left and
Right Mixer Amplifiers (MAL/MAR) and analog bypass volume attenuators.

This series completes the analog DAPM topology and mixer controls per
the TI TLV320AIC3204 Application Reference Guide (SLAA557):

1. Add the missing cross-channel DAC negative terminal switches (L_DAC
   to HPR, R_DAC to LOL) and output driver bridging switches (HPL to
   HPR, LOR to LOL) used for mono differential headphone and line-out
   configurations.
2. Model the Left and Right MicPGAs and Left/Right Mixer Amplifiers
   (MAL/MAR, Page 1, Register 9 bits 1:0) in DAPM and wire their routing
   switches into the HPL, HPR, LOL, and LOR output mixers for amplified
   analog ADC/DAC bypass.
3. Add the non-linear analog bypass attenuation volume controls for
   IN1L/IN1R-to-HPL/HPR (Page 1, Registers 22-23) and MAL/MAR (Page 1,
   Registers 24-25) using piecewise DECLARE_TLV_DB_RANGE tables.
4. Expose the CM2_L and CM2_R common-mode resistor selections in bits
   1:0 of AIC32X4_LMICPGANIN and AIC32X4_RMICPGANIN (Page 1, Registers
   54 and 57).

Tested on two TI TLV320AIC3204 boards (one wiring IN1 with LOL/LOR, the
other wiring IN3 with HPL/HPR) across headphone, line-out, capture,
driver bridging, and MicPGA-to-MAL/MAR analog bypass configurations.
Since neither board wires both IN1 and HPL/HPR on the same codec, the
direct IN1-to-HP bypass volume control ('IN1 Bypass Playback Volume')
was verified via alsa-lib TLV dB conversion and live I2C register
readback (Page 1, Registers 22-23) rather than end-to-end analog audio.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>

Gianfranco Mariotti (4):
  ASoC: tlv320aic32x4: Add missing DAC and driver output mixer routes
  ASoC: tlv320aic32x4: Add Left and Right Mixer Amplifier DAPM support
  ASoC: tlv320aic32x4: Add IN1 and Mixer Amp analog bypass volume
    controls
  ASoC: tlv320aic32x4: Add CM2_L and CM2_R negative MicPGA input routing

 sound/soc/codecs/tlv320aic32x4.c | 117 ++++++++++++++++++++++++++-----
 sound/soc/codecs/tlv320aic32x4.h |   4 ++
 2 files changed, 107 insertions(+), 14 deletions(-)

-- 
2.25.1

