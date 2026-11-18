Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994733;
	b=ZkSBD2vmEZF+02gtT65UrzCRr7ZxeZ3rDHTmgiT5gKYp8XE6T1oF+OYyhY7ZBC8b6LF5
	 aZs8DuD8TYIH2/0DniBL39xn7GcZLXkOuv3P7F/UduTmdcTAaxFPI5CLszNn31ltiffsr
	 gJZ3R1arTvxVJnCD0YZgx3SelprzJEkcuc59gW+nYfPMSof2c03YLEldvQbISl6e39dS/
	 VJR196Qj5LeR7/Y7xfkdQWCrEqAHD1+zsc21NWvN8PDvOWoees9FBBhBGdPMxfntoP6Io
	 8s9mXoIgziN/heKjSnlVR61JTnO9Kf89V1ZenNJ2rXutlYnds8JpecRK92jasKgQ+mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kupoLmsjeVtjcKhNtw7tTbay1eTmWzrCRIMwVpP8JgM=;
	b=WuGl9EQManYVS5NWjIg4ECAiDpgqX0h0Rv8CISt6hBiOMYVk4C1Pgo4VORVN/+eoKPzR
	 FMFysUL3OucjM9pwD2TYdJhm4GPTL8/JczfVydwXzDxwXs6lml9muTtUVhxc+04pUpmLO
	 +V9+3m3p+XUPQTj3bFwMau0JXkHrU3EXStkAomHj/j69d3u5SYFDB/KTqvWRJ6IMHMbVC
	 LYRGJB1fkYxQAGGn0PzXLemmfhmgJC+Un3GbAO5hNCeWvMXlUen5lxL69G+zFAG7eTfbB
	 9reYOCYcbEjgjXI8GJQxcD/Y8Befw1fJFCmBhq84wr/zKL2Fx36ipFAb09/HSFDkhsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NPSVwhhj;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3A3606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E3A3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NPSVwhhj
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-380b40312e2so2248413eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994733; x=1795599533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kupoLmsjeVtjcKhNtw7tTbay1eTmWzrCRIMwVpP8JgM=;
        b=NPSVwhhj/2xT9c86Ughcz/fq8cQwTf/6bGVdBhYheFukTdXnstjpWdarcUQisTNiup
         Ujk/l9nAsIROVq2Ib2/BuujTpbr8KdwXnsicNBlJclA28ZwJLcBuO4IXVCyGkNYofW92
         PqPvlXykpQ5LOZARG6etWQI1b3XkbQ9k70uXk8+wotzDfM0L7qfOsNmDe0L9Bx/qJvf4
         0bHobbKECPftOtl14GVvbxBRFWHoaCfYnH6brj5709HJQIsABCVIjPSqdIsgjkk+LrwC
         lJcK/6iiYo1OvfVYkc21FqjqdvyNGnmi9DUjG42haOUOUktsudJzTYyPaaW/Kny5bh1s
         1feA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994733; x=1795599533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kupoLmsjeVtjcKhNtw7tTbay1eTmWzrCRIMwVpP8JgM=;
        b=NULvYD4ioZgnyIqMSGBYkc4x+zjoMYviNy5ECbP6mUTkhgHQJhqpCPiphJHOeealxR
         VnMA4uHUP0p7yFC5sWpiKEwTHDEQIxRKU/J8pDE9gXX0zmDuf24I+p+mib8WXhMtFU4R
         4bDyi/REdQjqqED+LeDfdj1e4lFWo7Vt5gjNXFOpjS4Gpj9dAuW80DUvE5blF+KyL/vv
         11AbXMpX/lznRjwZPO/pdKv7rkbJvzd/K52f/tx3xN4w+oR6dNi9lSV9SIWGkIjAIdWM
         C8TXxhcKj8TcT2hhniQKB3/rmKUHO18O4cbUpjaJwndU9XeKzQsAAzi3qg3H1M7rRR15
         NBVQ==
X-Forwarded-Encrypted: i=1; AL+hErEcXu8qgb8gvlXsqhccW0gGZOXZMqxYPbiUzCI6yZJ3Ma6ztADPDVzBmuvFabYHgdCfXydYCv7hQwNwZ/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KrxklxmJp0zENZcjIa0u5YRwCPxgwHYJCUNRAC0O14TZAsuBD
	hu6N/tJ4LXQLmqnDVO5A5sbjH0rq1qgSxRIactiEdBy/z8JAEG26bPRw
X-Gm-Gg: AYBFou1BTu2oTvJRGjgd7oT+jfEqusnSzGzEEg6oD8O3G06i/37pCif52HbFBIkQE0i
	Hnul5jpj/l8R73NNxxhkd7JFZHMELJYLkC1g9AnrmGcEs+g4t4DHcNQIuX9tttd5/6L0ZxbPJEw
	gr2ylC76Wnz+oTDrch4KYwMQjPjDKz5R01fCMa7JspK4LmC1sjOZfZZrRkNfwHL3z/a30f26TpT
	N40+2LoWZ8T8MsUzwLS1vV/2sfmAVF8jP5mFrRkN3x0ZRJUa+zV2IcSfa+yG8yxfpLlv5U2k8n/
	BNqPT9mCIJXeuzefET/YseBpy1KlsHEtkZ1p2XtfMwu0eJ7zhT2c207ThwQwJqD+RL68vnl3Sst
	8uBkFtXRa0yvxXLCWo8xB03tGfCmCdsBev6SJCefZKm5K5/H2tKljMMVTXKq9wixaAoubNDbbQU
	thPABQ/BfebcIh5mks+nh9H+DNggu28T3+mKPqxYeFiKsKwW6ggFS6MxDhSHD2K/xWdt51c6DCj
	cL/frgREUXF2lvw9azxj09ZPI/M2i63zX7gh4PCRLXpHIkyMAR9y0vhi1jrH66uERWuJy+/IVKL
	8CrTTi0UW2WGbYef4xZY1soqFzV5ihJyvtcHIZy0ljOuxMPZKMx265lU8u30n/V/6LNDJ/j/lYb
	qxWgm0FtPkwPbVeYrkY+c4CiRvxRbdnl80cy9gJC2
X-Received: by 2002:a05:7022:e2a:b0:163:a197:722d with SMTP id a92af1059eb24-1b543b193camr3049076c88.4.1794994732386;
        Wed, 18 Nov 2026 01:38:52 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a76d70fasm6365704eec.22.2026.11.18.01.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:38:51 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnav Kapoor <kapoorarnav43@gmail.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 1/2] ASoC: SOF: control: Report the volume range as ASoC does
Date: Wed, 18 Nov 2026 18:38:39 +0900
Message-ID: <20261118093840.3514408-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118093840.3514408-1-sammiee5311@gmail.com>
References: <20261118093840.3514408-1-sammiee5311@gmail.com>
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

SOF controls with more than two channels use snd_sof_volume_info()
instead of snd_soc_info_volsw(). The snd_sof_volume_info() reports
platform_max - min as the maximum, while snd_soc_info_volsw() reports
max - min, limited by platform_max. With min 10, max 100 and
platform_max 80, a control reports 70 with more than two channels and
80 with up to two.

To fix this, compute the maximum the way snd_soc_info_volsw() does. The
helper is reused by the next patch to check the values written to the
controls. It also no longer stores max in platform_max as a side
effect.

No SOF topology sets min or platform_max today, so the reported ranges
do not change.

Suggested-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/sof/control.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 74d997a4f620..136e2ce15201 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -15,6 +15,17 @@
 #include "sof-priv.h"
 #include "sof-audio.h"
 
+/* the maximum value as snd_soc_info_volsw() reports it */
+static int sof_mixer_max(const struct soc_mixer_control *sm)
+{
+	int max = sm->max - sm->min;
+
+	if (sm->platform_max && sm->platform_max < max)
+		max = sm->platform_max;
+
+	return max;
+}
+
 int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
@@ -50,20 +61,16 @@ int snd_sof_volume_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info
 	struct soc_mixer_control *sm = (struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = sm->dobj.private;
 	unsigned int channels = scontrol->num_channels;
-	int platform_max;
-
-	if (!sm->platform_max)
-		sm->platform_max = sm->max;
-	platform_max = sm->platform_max;
+	int max = sof_mixer_max(sm);
 
-	if (platform_max == 1 && !strstr(kcontrol->id.name, " Volume"))
+	if (max == 1 && !strstr(kcontrol->id.name, " Volume"))
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
 	else
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 
 	uinfo->count = channels;
 	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = platform_max - sm->min;
+	uinfo->value.integer.max = max;
 	return 0;
 }
 
-- 
2.43.0

