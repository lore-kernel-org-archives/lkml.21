Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108467;
	b=Ays4sGg5pV3OGkzowx15bb5oQoH0SCFym9V31txYsII3FdfUKUodEXEEWEnS6xmY0eg4
	 /mZRvmKD7nqlyR1WSf/4niYrvQDCepqmzZ7KqV8pFLWruvuAr5OhQeFP+vcDRekXbq7Ws
	 tkci8PakQp66WqDsxNrzHrc0vxMDkV/nNPPC0OkK1OK1lfbBFyxJkej/Ve3JWhu8LQ+iP
	 3Hgiv2hDAxz3iYyRoxN5eq7c5QnbBzVge8UETJwbIE84WQoYtmATxEV89seBC+3OExNga
	 dH86hB89+XRRs3Ee+e5NZcv56t13A1Jba7acHsme+W2pQXpWhvWxKlNmejcAOoS7LFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6QyjNsTJ8Pk5IbHY7V8NIIncLAiaHTchnKhUzfM71SE=;
	b=Uo4oBt3YiMvZ9zqj9Lmxc7fQ2ky07rxe0zrD6uim1aVPjdXo4zSJpXTwxjUmZKo1gDpc
	 MPlH39LxfoYSS1cR73+ChuRbXAwvSfONM4DqMd3hyTaYxFoUZLo/ueSFj3+7SpFkqblJE
	 cFwmdBWY49W8RqpIyBC0nU1fYOTY8+aJT3+4T53WUbs805UswysuffUY8RkrMZRwN46Jz
	 0xffZn9ifnA8m3xtg3ekG5/ZF4+f61Ed0dLzMLKy1ZA9Kv4P8dtymzxMGaXtbLTzcQnxJ
	 HqbKIc7oaam9lQkYbV8NsciaJ+YueMPqWWBswJa9uj/1CrEx6zF4XsR53Mi26urPT9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ahdZBSLR;
	arc=none smtp.remote-ip=209.85.161.71
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E3F606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E3F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ahdZBSLR
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-71aca016fdcso2491235eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108466; x=1795713266; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QyjNsTJ8Pk5IbHY7V8NIIncLAiaHTchnKhUzfM71SE=;
        b=ahdZBSLRmkgWtajli5Or8TH3BuvwgTLXqr5H29yjnIoApoEk68BHMwHb88v5FyHMEn
         XZMfQw6YfGpJiPxfJozJvOCA5KfQriL18NTjdabiQpCxDZHYq4hNkn3nSl3uEXY1vNbM
         HPIO4VO7nJI1VNcLtwzXflD9em27pTbZnL5P2Xnt93XcdDyaknW2aU6uPdI+rhOGLH9f
         KI1EXs1zKpMEC5ZmefMFb/d4Zgqswn2yK/cxp8Uwiw1FlCBU+/EfgMzFpcw6tXLs8VyI
         +5oKrtjYTO71d/x4ApzgtUyNDg+xevYue2YQrpO+qpCbw0Sn5e19b3rWGjxmpIpktk0g
         xVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108466; x=1795713266;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QyjNsTJ8Pk5IbHY7V8NIIncLAiaHTchnKhUzfM71SE=;
        b=iA/DxQzjwL77GcICae0Z1GqcDB0ZyIrqjQw/LQesJ+WCd2ocxe9jPwDKcjx+zfIbMn
         yoYJZDd9PPjDN3iryNCd1Nplp25SH+T/j3TzvlGTuuVCqZAqd9K9r1MFA9L9kKmmYvPA
         nCbXzammdYG/Oys+S9sbY/0jfY+Hjjn4BCnjdFUOx9vruG55lz/XPg9yDKJKnE0LxQyq
         ZQgIs4QHWNjHgcDbuMBwFutz2+s/pb8NL60A+enifwK29BMy//Vd81eIP4xsJqpTV8zr
         PoDfKByGPc8siEeBtJvgmUiE2qiXJlShYJdUXyB4qp2qf8uh22RbEcSDzSpdBdrifHCi
         i7RQ==
X-Forwarded-Encrypted: i=1; AL+hErFfwOkCksM5JpHjOdGp5dnXfsQDvCRSOdB2020iu3IqvS66bs/SPLkE7Ou0Dw5tzO/ErE2m+RPy/v+2gIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Lz72wlUUotN80JryVP7iX1N0PfdDFBdqT9V9lVAIrvneQW29G
	FQ26F+MM9HXllhSAz5uSjGhDq4WyWwXa+/RC3rEFzBGQ84rOmrV12gbmaZGJmPzvD/+jCs/x+zr
	bOVpNG3TvWA==
X-Received: from oakd17.prod.google.com ([2002:a05:6870:3231:b0:495:bb4d:1619])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:9d98:b0:442:175:cea7
 with SMTP id 586e51a60fabf-4bc7beb0334mr203879fac.1.1795108022773; Thu, 19
 Nov 2026 09:07:02 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:56 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170656.1522183-1-irogers@google.com>
Subject: [PATCH] ASoC: rt1320-sdw: Reject unknown dev_id in FU Capture Volume handlers
From: Ian Rogers <irogers@google.com>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

rt1320_sdw_init() registers the ASoC component and its "FU Capture Volume"
control before SoundWire peripheral enumeration populates rt1320->dev_id
(which starts at 0). Unlike rt1320_set_fu_capture_ctl(), the
switch (rt1320->dev_id) blocks in rt1320_set_gain_get() and
rt1320_set_gain_put() omit a default case. Reading "FU Capture Volume"
before enumeration completes (or with an unrecognized dev_id) leaves
'regvalue' uninitialized on the stack and returns a value derived from it
directly to userspace; writing the control similarly reads uninitialized
'regvalue', 'err', and 'reg_base'.

Return -EINVAL in the default branch of all three switch statements,
matching rt1320_set_fu_capture_ctl().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not tested on Realtek RT1320/RT1321 hardware.

Fixes: 7bf9e646af9a ("ASoC: rt1321: Add RT1321 amplifier support")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/codecs/rt1320-sdw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 20288ea7a2ff..19f7aafc6f2d 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -2672,6 +2672,8 @@ static int rt1320_set_gain_put(struct snd_kcontrol *kcontrol,
 			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
 			regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue[i]);
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		gain_val[i] = ucontrol->value.integer.value[i];
@@ -2702,6 +2704,8 @@ static int rt1320_set_gain_put(struct snd_kcontrol *kcontrol,
 			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
 			err = regmap_write(rt1320->mbq_regmap, reg_base + i, gain_val[i]);
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		if (err < 0)
@@ -2760,6 +2764,8 @@ static int rt1320_set_gain_get(struct snd_kcontrol *kcontrol,
 			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
 			regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue);
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		ctl = p->max - (((0x1e00 - regvalue) & 0xffff) / interval_offset);
-- 
2.56.1.708.g77570a6a1d-goog

