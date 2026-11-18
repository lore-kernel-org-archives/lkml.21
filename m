Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997899;
	b=CaqFA/ljnctE8Ap1atU19oIOprnb2KAC5w7xZn08QhjESBFeydNl1shG+GUAasF/+d7n
	 BNWBM3rNp5cALSpLrXBg2bkt4eORJwH5hCHUPmmawTEPffElEH7SMLYiKSxXiSZCICzh9
	 wrTr9IRdF9I8NMV3xZKpTngLzF6c7UiG6qJtp6maLWF7QFaWf1IMaScxeld6OnY1BhH4A
	 9OEwwZAUiMe5j/qNsew+509zmcao72s6VTthbm/J3di4dJhLqSjkU/0ZhT/79Zibs+N3a
	 IHqflt78S8CGiM3s+9E4AS0Qziw8ROj3XOL0tQ1Q7azRit/MGf5vrwEuAHiETIkud/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bnztXEWVlq0WgNonumco/L8/aGkUW12SZEgErtiCgMU=;
	b=YsD5nG76uUF5+QzTrzEqbQiEbLcSNgYf7ZjKZ0XMbf7LsvAvDbGxDIJRzf4xX5WnV2R0
	 wUaEW7ijM+ElLYf9daEDlQ4dln1mA0Cl7SxpeLNl7hTqEKjxkyIetnBc5Fva5puaAenZ5
	 4XqnBOio6mzHWqrTr4AxSYLkomFlx/SQJ0CDuJWkPbtJR9ZpgjmIjAQ12WMA2DueDJc/C
	 ATWuNkUGISnklk/rqSxMnX5QTE2A3nb7RtydJQlldNI5TM2oWR8aXEpPD9Efig89RE2TW
	 HViOm71UBK976pHvhXKxrOSnPHCYQRONGg0JM9nEotNGrCVLOEcLqqbe6bEYecKedWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNs4ryqq;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D9C606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D9C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNs4ryqq
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37198ed3727so2281134eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794997898; x=1795602698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnztXEWVlq0WgNonumco/L8/aGkUW12SZEgErtiCgMU=;
        b=GNs4ryqq9Fh0bDczmFrsxEM2JwcDs8PglmVanfJqBX3ZMpBAFo4DBKHdXqmVQsO2bh
         paQaIv9vUu69JBYgYJIvtt+gmiWHLdTyz2IJChL571JIRzIxAdTlz+mq8o1Sa3lrAjWI
         fmZN5yrQdzPtJOfbqPFKBVCW3VuQx34YyBMTknIC+nHS7x+mqOTtlcYRxl6AaCssol7P
         ubYp2wUy83Vnj+X/r1C6uIThyDoiTZeEisAH4BTBE/XXFzqBShUwPZyyNY4y75dNJh7c
         UEd5xCg3VspLk3KisY6FKtNSuP/1SuFlQKgHCfwPJ2zuvBVjhSUbOUc8QlNYeDLIgKxF
         qevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997898; x=1795602698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnztXEWVlq0WgNonumco/L8/aGkUW12SZEgErtiCgMU=;
        b=hPpUgAo4IzOLHixwknwOE7Is2O8/ihn/S/CMwt4dK8V358MP/5I/uMqpg4VO/L8oSi
         +80tZKfTqa2ci+LyoEXEQkqm7CHrV7KS5gR0o00Rj1jcd5SFChSzxOjKELZVVVh4KTvi
         JQqJSrHGEgdWmR8V1Ky0oLEBnYe/RTnicOzjGEx7W9rrNIphAM5yfFCqhFzVEwcHNUBb
         GtDcjwSU9k8r4giBhRNSUsh5SAVt9Mz9yq6UZ8Em6jPjjf8On1zIztC5TEGN/N7F+Rtm
         aNhv2Z6eRoU5PCBIMABbDkqzMUWmxftHdCtxHOjtx/fRWPsq0NSEin6496zrL8oHx1sT
         wP6Q==
X-Forwarded-Encrypted: i=1; AL+hErERBjpoiNMdwe4lbEaKLQNHm1iqPmU4K9QFi2ToRWQk9ExRrXOvWXOQvRw4evBsLCkA4WQBSnsF4Tk9MEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ofi51MI4C34a6sV5CNogapJ/A0wZ5182GWo1AK/j/bpCkO7n+
	UapdQHRr+FmyX+veDRWfUPhEfe7M/hN8WNJPJrGXitbDFYRvQjxr0qmn
X-Gm-Gg: AZFdTZdWb6ray+Npc7yo/7rY0l07erJ5k4bn6KABEVCuz8IkAF9UIbde8qiY2J1OWUX
	pdA1DREVTQBaE2tOOn+pkbnpsvQvBU0zxvGxVuqNAX6LaE/MggYXraAAIi2WVi8RF0GTrLSg4Hj
	zscDdAIiTUgs1nVaE91HW2J4dowZcYXJgh01RHGQcQgCJ62/hFuuQIlAKEGXM66YVrxdNxwwLbp
	iF8OsEYOqugf3+3Hr+E7JVdbXV5ANIU7wuy9crzanDJx8aNCb9mY7ng87CkIiy2gkahJyXPVh0x
	Gr8l3JVhEV5KJwLEFLARbIlFqFYDqVG82kOrYH5Wug4CW8pucse8VaR0PehfFlca+c7ez/X+aIi
	fzbDWB+uWBhvUSjbee4ObIzAqsBqvpUgRRXcY0aw60+/QpiSlbc7p6PfEvE2mmgajKUQtxgjf+9
	izZgXrQ6xY5BDqcI4nQu4gKL6dfIy04XmSMlDgB+W7fGIWY4bg5YuBxMqSDEILskEDD7V1fwUOw
	OwWEf4Pe7WhEoqrXMe4yfC52DPC0SclO2l2o2Z1QcPLBTYyIa7PX7HN77SRSzWaZebiSaaEDcJW
	K5WiumnKSp9h43+ocicHiWIfmkH224idIRSuO4zs4sjPYdUOljpKi4fW9kGmDxe9mQGYS+uK4gF
	sJAxRq0Lo5nlOsD/5UKqVhnd0HB7r/t+P803/0MXzdCfRcQtv/XdYS10hKoYBcuSHJurvg3xtwu
	/xcZ6vTUYXnsazKS9u0K+Bmgu+Nbd5n1rX23T+bPO4VA==
X-Received: by 2002:a05:7300:8283:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-3828161e0bfmr1974309eec.11.1794997898243;
        Wed, 18 Nov 2026 02:31:38 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm11457702eec.3.2026.11.18.02.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:31:37 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	HyeongJun An <sammiee5311@gmail.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2] ASoC: SOF: control: reject out-of-range enum values
Date: Wed, 18 Nov 2026 16:01:27 +0530
Message-ID: <20261118103129.113970-1-kapoorarnav43@gmail.com>
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

snd_sof_enum_put() passes the item indexes from user space to the IPC
enum_put() op unchecked, and the IPC3 and IPC4 ops store them as they
are and send them to the DSP. With the IPC4 sof-hda-generic-2ch.tplg on
a Tiger Lake laptop, "Dmic0 Capture TDFB angle set enum" has 13 items
but accepts 13 and 0xffffffff, and reads them back. The ALSA mixer-test
selftest reports this as a write_invalid failure.

Reject indexes past the last item, as snd_soc_put_enum_double() does.

Fixes: c3078f539704 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Changes in v2:
- Only this patch (patch 4 of v1) is left.
- Drop the volume and switch range checks (v1 patches 1 and 2), which
  HyeongJun An's series covers:
  https://lore.kernel.org/all/20261118093840.3514408-1-sammiee5311@gmail.com/
  This patch doesn't depend on that series.
- Drop "report volume changes in mixer steps" (v1 patch 3). Its commit
  message was wrong: the mixer-test event_spurious failures come from
  the out-of-range writes the test makes being accepted, so the range
  checks fix them. Writing back a volume right after the driver loads
  doesn't generate an event on this laptop with IPC3 or IPC4, so I have
  no case that needs that patch. Thanks to Mark for the review.

v1: https://lore.kernel.org/all/20261117105953.188645-1-kapoorarnav43@gmail.com/

Tested on a Lenovo V14 G2 ITL (Tiger Lake, 7.0.14 kernel, IPC4
sof-hda-generic-2ch.tplg): "Dmic0 Capture TDFB angle set enum" now
rejects 13 and 0xffffffff with -EINVAL, and its mixer-test write_invalid
failure is gone.

 sound/soc/sof/control.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 74d997a4f620..625a17624f41 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -120,6 +120,11 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	unsigned int i;
+
+	for (i = 0; i < scontrol->num_channels; i++)
+		if (ucontrol->value.enumerated.item[i] >= se->items)
+			return -EINVAL;
 
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->enum_put)
 		return tplg_ops->control->enum_put(scontrol, ucontrol);

base-commit: fcfcd6db32adbdfe81c1ded257200e3ea6815d9a
-- 
2.53.0

