Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012065;
	b=vRClN5uQOQAQ9ymGs+02S0A+bu256cIFxAPrdF3RCcGsaJhqLcR1RSfgnx+qF+ZG8h04
	 7okZP2qdi8cjp+noAVXN61RYT2d6HAohAnfbRCY+SQgxbvK01voz/xwwjNSQ4SBpbn6hw
	 ME/FoOelSzMJAFeDk1goXnO3kYAK93vSz/2140f5jU76Jq2QCigHCxETyyeIMOhkXP9Lh
	 doDQbQSIXP3YRs5+shNalCUam+ZZeE4TDmWrhCVA45HDjPngiTQwc6eZYgdZ18VjP7Lbg
	 Yvbbd4B/SrIRnMurp1Hg7cZE6gu0fPUxAuNRDW8zrNWu9MU//cqESbOuhVn80OmuoWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SzCtrb4I1oeIw2u+c9ts0iXdAzyI2eH808CNGZDafBc=;
	b=TU3EoiydL57NmcVFnXd/uL9V9K+OqpVBBVkV7NL/ltSdyY5enx8+e1Yvdi/D/qNFS4XF
	 tlmvqOx1OPhWNOrXBnghPEbVTdRODlDHWsumYrp5sCZIx29+pKwRyV4poy814hCFPFv4e
	 k6JtPOAYLhLa7v5LSHjQyQKXr1JzOBDb17RIgqLoNd71HGgxVasrADJlzt2C2YX863HjF
	 mZq3/9A6QsbwHavja533K510GKlq/kgD5afQahKg6Gbqj762G0NvSPZcynUCFw8IK9Tk3
	 8v4WyJmbRU7cwpJzXaeOreclvvtnw+HQ50B6q1k0LXYfms1bnL7yf/MYWN2FiyG8U0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=asseily.com;
	spf=pass smtp.mailfrom=asseily.com;
	dkim=pass header.d=asseily.com header.i=@asseily.com header.a=rsa-sha256 header.s=google header.b=C4YetAr+;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F46C60A2613
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F46C60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.a=rsa-sha256 header.s=google header.b=C4YetAr+
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so1907217a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1795012059; x=1795616859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzCtrb4I1oeIw2u+c9ts0iXdAzyI2eH808CNGZDafBc=;
        b=C4YetAr+YHIjc2/kUvXelgtBNjt9sT0Y/7cMGhiuYIvjD9INfpG2dZNd/caXXtl0zg
         De/7JuA+pjifP5SvGgt0gnK+XDTSsg/2bXp5Vdn3mSQzeZ3ZqlOAxcI/1mp1B6FrQq/+
         F9dDkmjUrNo9jEw//kbBgzIsPcXnBtYLWjG0z7/OXjFbWyAjLvCuHwQ6s+5W6FuO7jc/
         iA8nTtqh31En3/anLweP3q88d773l8bClzZKTmGuWbZq3hD098dR6sSEoO7ja0KKvLO0
         QpOQQQYWLTYm57+OZkylLuNJ6cdEq4mTL0dl/Yz8t+VtpGZFqu/NcV6HWpQ25fo2Yj9p
         /cYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012059; x=1795616859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzCtrb4I1oeIw2u+c9ts0iXdAzyI2eH808CNGZDafBc=;
        b=O8hlklrkUzbpjvrirsV3+pOhYh7FK1BialhBME09Q88B3IvuQ3EiKCnJTY4xMWkz33
         18YIp2smPAz2I0OXY1N4DdjEv2IR18X8egfsp0tnB6yaa9z+0okG4mr1v6QIuViBTYXu
         fODpKjJf++FveKhlJ86EVI8L0q5/E8c78qjlg3TCKKIPH9O0Rt4oFKgRSgYC9If7dsqD
         Y3SIbwnr3i15wLHdI8Y682ORx9bzzOsVNABsXvv2mn32JIvLkBjyBNcpDFrazt45sAHq
         UrNdXel80N6jm6LL0hQsFApjBjO+6C++DyJ56G6/umn6vXK/67iw2OOylqkOo8lqF4yS
         /PUA==
X-Forwarded-Encrypted: i=1; AL+hErFE33EWyl7YBMLRh0PgQI6OVJuTjg5fgqcDqHGGgp5N1OG92cg7CRt1NKmxdjsYgikVihwHizDWlCYUhII=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e3RRt4ryxkXeQ2vMadXvWkPTevR5LTqWnFZjf29sUYGkEPP91
	KNtGl1N9Rk1G9XjX9BWqsH9fZWQVwl2ftFj4j+ZN4I05Fqas3h4kcCDZZbQOtnS6/PE=
X-Gm-Gg: AYBFou2ksWudmGw32ebOuxVgA6rKWR+P7jjwccC1Ofu2u2pf87xGV+ydaOzs1TkDnav
	zdu16XrLO7k9NgppsUnYPdCuoogsXiE7JSdvmZIe0kJkdpC3WofdiFvAtbzpA99GdwhlviuPhnn
	R/TZfVE3UXIwQpJ1V61p6J+VPRc5f99OoHvrTuAi+tZjPYJIxOsC6xNaqOYq2ZIFey4VfjykkkR
	hH8UgRPT1UR5jXXhEK0oLO5Ys2c+lV+j+3K/YlFkWdK/gDISTC7IhXA0ktWYIKCpHG81iVa4B2u
	a4K+66ZKz6pu68oqP9SMvv2MNjocsGksseMgLuS5jXWl8SJGqVUIcUgw/DFO00ULCXSClyWqav2
	jPxEAJVmT4GGTmOvf8KbkKEpwFJdpePVvlqi8BTQxs4vEl/8ipGEJekjjbiSeUfxfcPng1pP8L6
	uq7SqkFJuPTyWoRTf0VeJg2g9fXMW7pbw4GwJVkXBRaAJr3Gw2F8UpFW/vnxvR91Wjib91DCIJC
	lRAj2BnLQGnEBl6BkhQ/qPEi9VrXettFh+HUMZgFtz9atUmtJ9Vqbv2ZxUMJNj3zx4hXIdU2JN2
	zal85HhPOq6k2R1v62Om0e9JKkx+ydxnwTzW7L4S4Go=
X-Received: by 2002:a17:907:6d07:b0:c42:102f:15d7 with SMTP id a640c23a62f3a-c510e275424mr242780866b.10.1795012059362;
        Wed, 18 Nov 2026 06:27:39 -0800 (PST)
Received: from localhost.localdomain ([178.135.21.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88993e76bsm1100538a12.12.2026.11.18.06.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:27:38 -0800 (PST)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH] ASoC: es9039q2m: Enable the DAC clock at component probe
Date: Wed, 18 Nov 2026 16:27:27 +0200
Message-ID: <20261118142728.101180-1-karl@asseily.com>
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

es9039q2m_suspend() gates the part's internal clock tree by clearing
ENABLE_DAC_CLK in register 1, bypassing the cache so that
regcache_sync() sets it again on resume. The part keeps its registers
through a warm reset - only removing power clears them - so a reset
while the system is suspended skips the resume and leaves the bit clear
for the next boot.

Nothing in the driver sets it again. The register cache has no
defaults, so the first access to register 1 at probe reads the gated
value from the part and caches it, and every later suspend/resume cycle
restores that same value. A stream then runs as far as ALSA can tell,
but the part automutes both channels and the analogue output stays
silent until power is removed. Boards that remove the supplies in
suspend reset the part and are not affected.

Set ENABLE_DAC_CLK at component probe, after the mute and before the
datapath is enabled. Of the two writes the driver makes behind the
cache, this is the one probe did not already repeat; the other is the
mute at resume. On a part that came up from power the bit is already
set and the write changes nothing.

Tested on an RK3588 board whose ES9039Q2M is clocked by a fixed
24.576 MHz oscillator: suspend, reset while asleep, then play a 1 kHz
tone. Without this patch register 1 reads 0x35 where 0xb5 is expected,
both Automute Active controls read 1, and nothing is heard; setting
ENABLE_DAC_CLK by hand mid-stream clears both at once and the tone
comes back. With this patch the same sequence reads 0 on both controls
and the tone is heard, and a part left gated before the fix was
installed recovers on the next warm boot without power being removed.

Fixes: 004e260a5475 ("ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver")
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    Tool use (Documentation/process/generated-content.rst): the cause was
    traced, and this patch and its changelog written, with an LLM - Claude
    Opus 5.5, in Claude Code. The fault was found, reproduced and the fix
    tested on my board, as described above.

 sound/soc/codecs/es9039q2m.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/es9039q2m.c b/sound/soc/codecs/es9039q2m.c
index 2a451dfcc..e3f963909 100644
--- a/sound/soc/codecs/es9039q2m.c
+++ b/sound/soc/codecs/es9039q2m.c
@@ -1634,6 +1634,18 @@ static int es9039q2m_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
+	/*
+	 * Turn the DAC clock on. It is set at power-up, but suspend clears it
+	 * and only resume sets it again, and a reset while asleep skips the
+	 * resume without resetting this part. It then comes back gated: the
+	 * stream runs, the part automutes, and the analogue output is silent
+	 * until power is removed.
+	 */
+	ret = regmap_update_bits(priv->regmap, ES9039_SYS_MODE,
+				 ES9039_ENABLE_DAC_CLK, ES9039_ENABLE_DAC_CLK);
+	if (ret)
+		return ret;
+
 	/*
 	 * Enable the datapath. SYSTEM_CONFIG[1] is clear at reset, so in
 	 * software mode nothing turns the DAC on at power-up: the analogue
-- 
2.47.3

