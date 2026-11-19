Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108271;
	b=WUTqH3k3kI2/If4Gzulire0JsqOB8bvW8E+UwyTR8BaAf6XBa5HLGCCCi2qy959dBPoV
	 d0D3OOJVr79yDkE7BGSL+90m8TZpjO07rFgqS9UkAXVV0PkomljOUGgmjuPYRVqCxlqFY
	 RkE4jiyIm7YOWkhqFS0onUu9RuAosJB+KHq/WfOiECD8CPzwLRS8P5Q1yVDlwgtHWfCFA
	 Df+QSd5zSweyAZ/w2kvke8fi5A7GYjHSnmHgcdwQao28rk8KkAuiCKoriPu7CKr4nH86K
	 2WkMQ+Bd+8wkyP4TgVID3QIj/dHol1g+ArvTRt9yPmnePLMO80udA476/n4rnUSxbXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=4VFgIkgO0QW6Uz1EsOOcOGBTY682MO/rz1J67OmLejE=;
	b=T6KEleJaK7lyigA2BvX3GPPyPM90NFVZ1zYm+VwsnIXC3ks0Z9oZ+yvMTc1DPRPk7W+V
	 8whgiXJPeVKvnLFu+HS9Jj+YuGIMz/SgoLcX4jt/zjfMH8qzdcTowpIpmh3u1qQasmC9j
	 7N4ha41BKvhgFGXWGnD50CAIL8CKQlW6DJkKJNWTuhhkL8eJ0lxo14bgY6KRnxI3H7bo6
	 M35hl7CrRX3bRIB7dH9kuUn1V+PG1Sp6cpFYRjgNekwc2W1IEAPYchLOU0jRsHj/Tf9jN
	 ETnUao+op7ZuGhFPgELBIYiyKGqjMxZrH4G90EqpVAGLvP/0nEKeLFYhDBqPftOslJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="lowx/aVS";
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0778960A6F74
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0778960A6F74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lowx/aVS
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2724051eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108269; x=1795713069; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VFgIkgO0QW6Uz1EsOOcOGBTY682MO/rz1J67OmLejE=;
        b=lowx/aVSQykwMLqnjGNj/79iso4pkAP7rg6f/3wWOIiz4v73UtR1RevRcayxqm43fk
         g+EpKB5gYdfYPhU8kCjR5q3eRGuv5YMT9f70uiF6qsQE866nsBSmZA6smrA4YKgjQ6NR
         pIZZq5pgToJmHSYAk/MzjJVM1kEA3QFK8WgLvGqwRqn/7e8aCvdHZFa55x+ap5j1iqJ5
         PzqLhIAR+3/u2dmF+qN8lvs8aXvngtNQ+LvNDh0ymN7VqRJfC8m3M2mcwi+ePrutWcwQ
         MlX31SDhoM/jNUIzcO1am/lknm0WRcMJEEs6225bVWsKFR1fMRd4g/GOhU4k7zf9+KCv
         djJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108269; x=1795713069;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VFgIkgO0QW6Uz1EsOOcOGBTY682MO/rz1J67OmLejE=;
        b=Mak5p9c8IuI9jeoZsxBIAPcbgIfrNU7uFaj3Hhdm812LPNNWOJapg0vHQqKtKB47AR
         qgEoBqLhU8sUlgBQrkFE6DXkkDApFoojZ/LpDpvEmV7yqwKsmTFdEUINylkLlm8bXfNi
         VeTcBZ8JkUlBM9HwYn9AheGXwEZYa6D5WQpwiP3P24kKZ7ONiGNlcO7SiOifNCCqnj4h
         VRkmV715/j9T8WMm4lemcls3ERRoUx3xeqQj6gxiGV6uOo0Qv8pkJB0lF5Vgd4qeRAkk
         1nXs8318GwLtGvb2F/UHZuS9+MGS63SoE9eFCcJ/xfFaa7lDZsz/wHwtL6mv1FlNgIs0
         6Pyg==
X-Forwarded-Encrypted: i=1; AL+hErFPtX2FQzldRndUD3LcHikhllml5aB+R4j4zPWTGPkGKR7g3B549wX0qEIlBGSSnuo12RhI3mgQvL+YBlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z95pvKDwa9yyrPNHWRK2crj8HToyblZoK2SchZ8iQo6GEPo5Iaz
	7ANQB0AUxRMoZA2ZgZavmlkXGnI+aY6hlvfZyDh+94R8YObTYeOtM4bTyMDf+538OwUTP+49hlc
	/0HCgg++vvw==
X-Received: from dyru27.prod.google.com ([2002:a05:7300:4f9b:b0:36a:120e:b9a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:fc19:b0:384:b2cb:5f76
 with SMTP id 5a478bee46e88-384b2cb60ddmr1689970eec.23.1795108268800; Thu, 19
 Nov 2026 09:11:08 -0800 (PST)
Date: Thu, 19 Nov 2026 09:11:05 -0800
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
Message-ID: <20261119171105.1538194-1-irogers@google.com>
Subject: [PATCH] ASoC: tas2781: Initialize subblk_offset in tasdevice_process_block()
From: Ian Rogers <irogers@google.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When tasdevice_load_block_kernel() processes a per-channel firmware
block (dev_idx != 0) for an amplifier channel whose is_loading flag is
false, tasdevice_process_block() skips the channel via continue and
returns an uninitialized stack variable subblk_offset, which the
caller checks for negative error and adds to the firmware buffer
offset.

Initialize subblk_offset to 0.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building sound/soc/codecs/tas2781-fmwlib.o with
LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
runtime-tested on TAS2781 hardware.

Fixes: 915f5eadebd2 ("ASoC: tas2781: firmware lib")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/codecs/tas2781-fmwlib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index e6429b4c8dc5..a5e6734723ab 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -897,7 +897,7 @@ static int tasdevice_process_block(void *context, unsigned char *data,
 	unsigned char dev_idx, int sublocksize)
 {
 	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *)context;
-	int subblk_offset, chn, chnend, rc;
+	int subblk_offset = 0, chn, chnend, rc;
 	unsigned char subblk_typ = data[1];
 	int blktyp = dev_idx & 0xC0;
 	int idx = dev_idx & 0x3F;
-- 
2.56.1.708.g77570a6a1d-goog

