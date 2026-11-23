Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453332;
	b=G1dtLhYrVUj1+ak/T6SVmWZJ1bqbeX1u2MreMAXrafKbsvFFNP0SVnc/P/BfI0nVi/Bl
	 GnId0FsvRezNNFG8glm+TuTP/AYNTtoMDQhRtt901jhSCB6zOpCRrgBGVWDuRd4JXysxd
	 vnqmr53ZcVfxfppUY5hN6N0hYiDUOG4oajwUucKzSv5iuTdWyGVuO1G0JbyaMftjHqR3Y
	 5TcG1viAjSQxU4q0pyHJ0e8vQeOLxLzUeEh8z+SLMEGdGfhP4vUBzI+OlkXeKD0a0Kw4Q
	 11RWDWtqg2+Jo3Qj4xqHwQzC7xYGtSnS1/F7w+O0afvqGhiY84HKC6DjN60527oDTug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sajfz+VOzkFiN6Z4YSSWje5thArCDnqKYNZzEWbPt78=;
	b=I+ytCfi0g+Nhl3nLQ68GJsRON7MlUVJSu0tpy3kJYJDLrLFexJbbQ3T4tORdrgDHJ7US
	 wdyJV2Q/oft/EXVUO36y+D2XKdytv8sDfPhYrO3o/epOos0SV2UZuqPZDATfn3cuLAVql
	 reKP/0h6C1BUMR7bvZVHsrdNTQtaJQ+vFvnhic4rDp1VjR+cPsBt7O8Z3HZMF7jsOUUaK
	 NwdF7vpwLqK0LWDz1OGcBES27lufnsTi4GqIe+b8Fsyvf534wiPPPsuf8QboMaYuM7swE
	 fkUCPy/NGcKOsqkGmNFmgo2cSKC6eZU4MfoU3qL2g/BWQcj4RzoWRDV1/pf3BldI+NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fhKNW/tQ";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD91606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD91606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fhKNW/tQ
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so5198739c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453331; x=1796058131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sajfz+VOzkFiN6Z4YSSWje5thArCDnqKYNZzEWbPt78=;
        b=fhKNW/tQqtlD+agu91CE51WLKBw09Istmps93yqU4/EEuatbwkm/FfNqORb8WMoZZj
         tSbAabc2t3LO5Z1RWXIG/wkOMJKhNMMm/LK9/1AXB0U/now30ZQuoAooNb5JnjGPTL+Y
         8dCBBKUBwf3M1yCbQH+h5GRh1AO9I95rGyPSq0QcuBVTbYPIMX3TGOHY2ObnSoTgMmjQ
         X7KxR/LGpNkSxwA0VKAw9UCQ+TshlfLRQ/EcdLkSem8jqK5G92b4m0qC3OJ2QfYiCvHK
         F2pkvlXSbk38o0EGA5NmDOwSqlccCZ2onOAQaY+CPTQSkqZbFvu1YZCtRpMpC9OMNRbl
         tkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453331; x=1796058131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sajfz+VOzkFiN6Z4YSSWje5thArCDnqKYNZzEWbPt78=;
        b=KW4wVKWX0NQJWugZGkI/1zoUZBqGJsyYX/mwAWEh2sACFIq5z99bBx5EtPzZHjXe16
         mS0xSbbnXw3tWsDkLD8TlB2zXo3hvEQn+zbmcXRvMJfSHidRuQJE/fYeEd/5To6sldRo
         JuFX8yGGqJ7CslQ/y5k4TTUx99Ij8DEkhzDhbrBBqJ6GjjXDVXPfsex2AzFqJqU5ZYLh
         19St5VrwG9G/y7zLtgATUbzps6VlBS976NSqx38E+2BdKyot6Pe9g8WVV1cFh6Z9Xmwq
         AP+yN/uvWfklYjX7e75EJE4fw9+XFfsGrdm8Y63c6OlWhvZlQVB7KS6a53ISQFw49sMV
         DgSw==
X-Forwarded-Encrypted: i=1; AL+hErEzLmUzu2h3B50SMagXISyK966vJ7Roc9VvxD7EpLdm5UryWaGDLdcDuvvGnMEqMCrmuieiesZhUPed5jU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NqEXbbD+ctA4IUwLdt4QhRQLFMtEINr6t0M37dt+Ta5JAe0oY
	obSKzwbRIdk2wxCDn+09Y+qIhWUBfJzSea/CVHuDTMFkVkT36VZY/sL4
X-Gm-Gg: AZFdTZeob+yjvEMFsjiGQF8JcWMC/o0xlA5Ucd9a0EXpEPz2lZ9ctn4N/mjtrN9UNby
	2k8OoliSiwpvtvnkkLdqSAcUZX/sTuC0fUZMbSUHl0rFYZVkDflbFj50Ycc7XvYgbKS7b0Z1Iol
	/9psjjAGw42Ib7YcxDINCXsK6bTvZ60qIQtmHDbb7mfBMrrcPgZ+lhe/2TShqLZza+SCgzdQ3wt
	35TuXRH2VkzkkzS9UWgJkxNu3XC9RSnSdH+g0ZxfdCFHXXzO9qnMH0thfJ/afmgEuqzM3hDm4LJ
	dPD5vJU4fKRB4DGSaHprAq40m8mqSEkl2qSKk+phuMkNaOe1hIpwl3n9EfSbu0giQDScg9x6wZ/
	dqMo3gfnd2llkSBhI5/jZKEFVSuusLI8/2jsmGXu603aXXnk7wUwUloo/V305QjUiHkkt831Yk8
	5ynv5sFCUH+Zm5ziluaDqkOxZGYeLwXcVVjYyTbFTYCtBXCjF3w9PFkHDmkDSsVto4DSRMM2mjY
	sNj8oUUUvWUIfq4pxofNy4k5sIyPraBvIOGUHY2Rw/cLDUmOhSyJyVQHwXugk/4lWN0THtSqMpJ
	MAMff7nBnjDPJlbPmHEie2lnD+sAAVsf0qSdUvtfdGmv8hn+i4L4Q5APhHZInEuhQZ4tXqzqHBI
	XEBE5wPXScS8acdFRy9UySJpZnXAhvsBY/uKQWoLXsPMO2IZs2HJ3y7iROlAC6u7MQXE5/liC8l
	YMgmVsQk54KudvMlkkfdTcacFSQyyYTVdKMQ3Urw8+nlg=
X-Received: by 2002:a05:7022:b902:b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b556877a2bmr11038677c88.9.1795453331420;
        Mon, 23 Nov 2026 09:02:11 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm30163645c88.12.2026.11.23.09.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:02:10 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] ALSA: hda: reject invalid values in the IEC958 switch put callbacks
Date: Mon, 23 Nov 2026 22:32:01 +0530
Message-ID: <20261123170203.243633-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

snd_hda_spdif_out_switch_put(), snd_hda_spdif_in_switch_put() and
spdif_share_sw_put() treat any non-zero value as "on", so writes of
values outside 0..1, such as 2, -1 or INT_MAX, to these boolean
controls succeed instead of being rejected. snd_hda_mixer_amp_switch_put()
in the same file already returns -EINVAL for them.

Check the value in the same way before taking spdif_mutex.

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Tested on a Lenovo V14 G2 ITL (Tiger Lake, SOF, 3 Intel HDMI
converters, 7.0.14-based kernel) with raw SNDRV_CTL_IOCTL_ELEM_WRITE calls
on the three "IEC958 Playback Switch" controls. Stock: 2, -1 and INT_MAX
are all accepted and read back as 1. With this patch applied to the 7.0.14
snd-hda-codec module, all nine invalid writes fail with -EINVAL and leave
the value unchanged, 0 and 1 still work, and the card comes up as before
(no new messages in dmesg).
The SPDIF in and shared switches don't exist on this machine, so those
two hunks are build-tested only (W=1).

 sound/hda/common/codec.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 51189e305ece..0470f4e085f7 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -2353,6 +2353,9 @@ static int snd_hda_spdif_out_switch_put(struct snd_kcontrol *kcontrol,
 
 	if (WARN_ON(codec->spdif_out.used <= idx))
 		return -EINVAL;
+	if (ucontrol->value.integer.value[0] < 0 ||
+	    ucontrol->value.integer.value[0] > 1)
+		return -EINVAL;
 	guard(mutex)(&codec->spdif_mutex);
 	spdif = snd_array_elem(&codec->spdif_out, idx);
 	nid = spdif->nid;
@@ -2557,9 +2560,11 @@ static int spdif_share_sw_put(struct snd_kcontrol *kcontrol,
 {
 	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
 	struct hda_multi_out *mout = (void *)kcontrol->private_value;
-	bool val = !!ucontrol->value.integer.value[0];
+	long val = ucontrol->value.integer.value[0];
 	int change;
 
+	if (val < 0 || val > 1)
+		return -EINVAL;
 	guard(mutex)(&codec->spdif_mutex);
 	change = mout->share_spdif != val;
 	mout->share_spdif = val;
@@ -2632,9 +2637,11 @@ static int snd_hda_spdif_in_switch_put(struct snd_kcontrol *kcontrol,
 {
 	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
 	hda_nid_t nid = kcontrol->private_value;
-	unsigned int val = !!ucontrol->value.integer.value[0];
+	long val = ucontrol->value.integer.value[0];
 	int change;
 
+	if (val < 0 || val > 1)
+		return -EINVAL;
 	guard(mutex)(&codec->spdif_mutex);
 	change = codec->spdif_in_enable != val;
 	if (change) {

base-commit: 11ef0d515100259c7979f5b4c61b6ea97c6cdc27
-- 
2.53.0

