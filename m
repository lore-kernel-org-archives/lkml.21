Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994738;
	b=rktiGbWNy3YEIDPKMYZHQQNrwhrCghV1nVX2M2x2B5s4zxhbSWv80cvUKn5Byx5vTwme
	 TiY9/qsDOEfBA3LTnKbF6R9VSg1/Jt2fkv/Gyum9rIbLGWP5VYrGdLfJmh/04M31I+k8g
	 1fdObJH7xIOViyxseoO/RjNNbc0mEP8pggh+1sLOJOkd/HHsaRkdYzfaV8gg/wdJ+g7Jc
	 cI32aZjmGYc0DW3mAIZsDJ25pG118xgY8iFgXaTd/Hxi8WUGEi1f668v9E2QH9TmcAuHm
	 ivgQzOD5d9L37/xLKs0VaGh1Z72uHAyiI+5S/Ihmn/s3naLbbiLCA7uyj1VdEk2m3Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mvTmHdxE8OSRyatKP7vQR5jJ2csgl9itkqZ6bj8IuTM=;
	b=AwP6J9KfGknLReiiNcT1rPBQj7w7eZA4olE/DxkVEHIYK8pWrSI4Hbo+2x8QAFwdMmMI
	 AN3ajm4WfQrqM6a5o53QTqJyS5zhIJBqqR3QrXPE/TEIN0TXDyJArnv4KM/kfyqEjZ4hC
	 RKUXeNPctGWp35v07hBoJxJXzuUwlazHSlRz4KAZDDTljSdqgjUvaDpiujkoZ5mDKJyJy
	 20d21e7PsXRw9dYVY+dgSHwknksowet+jLk4EIwPo48OlW5GkppFnP+qSXOGJJBWYNgh2
	 0l7S/UIvy7edIBnCw/kdlxlyMsC2DONlI04UelZuZlB7oUXuRLAOESqG31J1xwc0fdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0meq+bcp;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28FD606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D28FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0meq+bcp
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36dbde64409so1490620eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994737; x=1795599537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvTmHdxE8OSRyatKP7vQR5jJ2csgl9itkqZ6bj8IuTM=;
        b=0meq+bcpbMUaOyJKi4v7OMIYhzh7dIzGJh7I1Ryp21c2d2Z7x7ar4ld8fh8p3XtlKQ
         OaJuqGQ+w7hBpL/bifgJIQ49CCcIprQ/5FRtKsK0Zz3mG/YlOyt39stsglEZP/z+Tgln
         +liPOGf2ampV77tAe9mZbq08/tPjNh0jHm0fEt1NW9edu6XHAQJwH6THhXenhItPpG4+
         XmJX+BUpEaDbN4pzNDdNtPMUQLnaBEoq/qbzbDNdlrjEhSii29Y7o75PZWu1IFdaI6+w
         58T5+lmm7gIefSl4T4AwEIvNFh80Ei0EJst5zg0oWcaAhjN7sxeD2W+exO34JcRoCvtE
         966w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994737; x=1795599537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mvTmHdxE8OSRyatKP7vQR5jJ2csgl9itkqZ6bj8IuTM=;
        b=ug0TvvuDDOnIXBiay30RkyJm7TkoY27RchoBB/Ju5FWHO50vhEMtBjovn14ukXgGhH
         mPyi9gpdca6E8CR4ofnfrglbvi5h2NbUprQ+7wIyyLUbev8Ck5XhisVQCT5/Bwq7dZLh
         cc8GAf+yAJOt0J0ZxSAeSMyjeah13X5241joN9jJ78IQmEoXnDuKdxzxnoA0SDAY9BX1
         JzVhAH+ZnWZ5Phb1JtdsKMeS/BVd17oJeh1nWSkBXJuF/WC/BllQk28h+5vCInxgNnCz
         un4eG2TNHFg3c2jH1EGnySnspm1jRfsACve6K9aUPPa/jif9lckM63z2mblctFPzI5R4
         snNQ==
X-Forwarded-Encrypted: i=1; AL+hErHjCW0k42i2V/Ig4KQJ19e+7GfAugEhYDmzu2pApv/wPPbb9Il5jpGDORIjb05gTUqWaoQRVPgltcIUqro=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WM66mrJtH8XdGL8ssjNvZ9obvogNEno0H3+s3ZLhT+LPVJ/6v
	t4cARIa7I/8Ruxan6T4wCx8/2j6OICQdVMN+1hQ8bYfIdiYbsbZwZ1wd
X-Gm-Gg: AZFdTZdljXjFZOBmB5utmM7brhcEcOCzsLub2pAUTX9RS7cC0eS1PPld5YfHhluQGCA
	dmrSuM4CSUbJNwlWZd6JgpFRSXi0x145gMbfevvd9sh0QroEBGXUEZ6mvRisF8/Vd5LGA82ERHk
	73lkC7JgAmjb9Buk86HXfKpGL2oVr2sEBLXjZHfg69NfbuRqJl2UmEySOTVeB7bbzvjy0qEpcqx
	1uCEOfDjMvD0zEp6BNJRocjL0oGkHya9MhNqs7g1B6kcgW3IS7ON6d6bMi1fVI1J+fh/F2R76qV
	EpnPgVUauf4alIegkvopb8PubGNkhop5oOVuVZBkQ4fIyczgcCO0bc1Buw11t0DwSf6DaHDjSmM
	t2CxHWUFdpWKwvWkF+2Y8ptAUlfIczYz+QGslwjQ4NhXRlOEbAvloNt+rjU7Mcdtwr2K2tMNk1K
	euq62AiabpdaE+OYOtnS/puqrjJl9fk7YqWhUubVsKpRfIlWvMiW4thZlIuh3YstivrvSZvjFY3
	vkyO6fduljvKTPY2tnoLQ325RaStfFypTrC8kUTmb/cumfSn/W3wlTFeOR3s7XNmoGwrNeXYQZz
	J0vclvDcjYhAaJNLx6GeX0tn4adXlig6PGdOdhBBjaB/L//6KjuBx6jpNxKaYtmVfIzkpsq0MUw
	6UxncWzxJoiWgmUww9jIDhzmOcnc1cb6lyA1A62x2
X-Received: by 2002:a05:693c:42d0:b0:381:c15:1b6f with SMTP id 5a478bee46e88-3827f98c04fmr2115427eec.6.1794994736992;
        Wed, 18 Nov 2026 01:38:56 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a76d70fasm6365704eec.22.2026.11.18.01.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:38:56 -0800 (PST)
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
Subject: [PATCH v2 2/2] ASoC: SOF: control: Reject out of range volume and switch values
Date: Wed, 18 Nov 2026 18:38:40 +0900
Message-ID: <20261118093840.3514408-3-sammiee5311@gmail.com>
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

The snd_sof_volume_put() and snd_sof_switch_put() pass the user values
to the IPC put handlers without a range check. The switch handlers
store any value and send it to the firmware, so on IPC3 writing 2 or -1
to a switch reads back as 2 or 4294967295. The volume handlers convert
the value to u32 and clamp it to the end of the volume table. Writing -1
sets the maximum volume, and on 64-bit writing LONG_MIN sets the
minimum, both without an error.

Return -EINVAL for values outside the range the info callbacks report,
as snd_soc_put_volsw() does. This fixes the write_invalid failures in
mixer-test, and the event_spurious failures caused by the events those
writes generated.

Fixes: c3078f539704 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/sof/control.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 136e2ce15201..dcf101f7e1d5 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -26,6 +26,24 @@ static int sof_mixer_max(const struct soc_mixer_control *sm)
 	return max;
 }
 
+/* the IPC put handlers do not check the range */
+static int sof_mixer_check_values(const struct soc_mixer_control *sm,
+				  const struct snd_sof_control *scontrol,
+				  const struct snd_ctl_elem_value *ucontrol)
+{
+	int max = sof_mixer_max(sm);
+	unsigned int i;
+
+	for (i = 0; i < scontrol->num_channels; i++) {
+		long val = ucontrol->value.integer.value[i];
+
+		if (val < 0 || val > max)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
@@ -49,6 +67,11 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	int ret;
+
+	ret = sof_mixer_check_values(sm, scontrol, ucontrol);
+	if (ret)
+		return ret;
 
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->volume_put)
 		return tplg_ops->control->volume_put(scontrol, ucontrol);
@@ -97,6 +120,11 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	int ret;
+
+	ret = sof_mixer_check_values(sm, scontrol, ucontrol);
+	if (ret)
+		return ret;
 
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->switch_put)
 		return tplg_ops->control->switch_put(scontrol, ucontrol);
-- 
2.43.0

