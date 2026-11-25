Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640037;
	b=F0iUC630PkKg5MuR+Ij5B28jrr9nqpeiyrY9wbPukchDMclh9KgpjSQOXXIuw/4n4HZ/
	 Jd8qeCTKSVl+EXh1NQ7s2VbtIAxcE2/v4HwYQc1qV8dJb1NIiD3ztzewl0il/WohFVzsT
	 zxwUBniMm+3Y+fHHfRP1p1uzoTCmPpnyv7i5PH+vQTYB8PU9zWS/zZY59xL9rrcIf7SN5
	 quozF0Hj9MclMzROsAhT+nzIp8f76pk1bLJRF8Z8rWktCVngfhLGg8uv0zs7szSDGDNwG
	 sHCzKNU7j/Ag4hl4c15wS4FyTUuvS7+84GXJcO8PIkRBgVw+mifsGB7p7MhoClIYvMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/0kOuvaODKSr9qNRTrJCahBXkTW1GM+EZkzdPOkJXoU=;
	b=OlMf/rh8OojZgUW0t/8+pdaoGyH4rVCdwFcly8vZ10WZkSQdLqCfPvMZHbzaa3GjexDO
	 RRpXqaK9VZrQCUcc94iQf95nRKXoudGw56THpaRt3aiRkZZ+crgyXp9pD1S+My1q9H09U
	 8dwe/eYuy8eMYEiy7tqGaqoNwyV8tTtY+oZFMgwtIAD6jlc39CVatU9qY45xhDldJFsCo
	 GHi5fcDa8zn/hXX7xyAJZS8kHQlYBgME63PkyH6mab3G9pwkV7GcPh2cq7iMnNBOcO3pY
	 7Q3ez+vmRlO0diGxKFZQgNmCd5erNXudOE1NNT60XdUFlghds8gM9GKonLV5qExiM2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kHSUR64r;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E52606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E52606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kHSUR64r
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a32576da88so3609665f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795640035; x=1796244835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0kOuvaODKSr9qNRTrJCahBXkTW1GM+EZkzdPOkJXoU=;
        b=kHSUR64rxOaYJSvlMKGWvp4XkDYf+YqtOkLXLJoxtfrDuaapAEwMYZnSpWmS9V0hCd
         c7p4hvibiXhupX+1AaK8yvQ4SkfjVFUsqLg846rFJ3rbRWn9r84/+s274bNcebOpku6+
         rvCXEeOVxcVXxRJ0E9cRH45KTy/uGIrn8tNjDzsRpAqimd3y7dOEtl8TgJdbsZvErAMt
         rzxUYQOdRW0ghLWGyI6aJlg2hw36Ypldvpy8KdfSNv6P4JHed5oWvHkKr81+kvUqK+/X
         5LzQpCYPsYo4tYeQvdrvffjTF67HH3rWZdVMhc/cekCQ2QGK6T9a92ibEYjD5zJjwbQz
         mlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640035; x=1796244835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0kOuvaODKSr9qNRTrJCahBXkTW1GM+EZkzdPOkJXoU=;
        b=CfLOxwr3ekMmkLdcWwhCq0AFUoX1S2VSeN62xEk3m8Mdn9y+JFr+4NipRe6ajoFqgy
         ok4WGzfj0MDtKLTISK6EFyKEqnsKzCs/iBg2zMb0SyMm57QNAjdso2LxNXTJzvivRcP3
         r/XfyLj/aACvHsCud4T9yD8IBAPB74++o6jcZXqOWx6Iey1a2LYNJNKw7BUmLpnVC5u5
         Hm0GqMj0jresDbCA1I9ZHtUtwBXPdHabCjAg/WQmnWIgRUIDal/T9PAoRQbtlzIlx2M3
         tD1stEb5IHSp+6PJ4XRQx1pOdEHQGsPLTtU31jIVd+bmauvv0+XLBCclZxrGIRYXOfSw
         oCPw==
X-Forwarded-Encrypted: i=1; AL+hErGrh95AHwudHSN5YodoP8NqpBbSm/NCWLMD3aWXcfpTI77GSvaFl6Cv2ck4zJ4LCgTwD8WZKo9xdVpvR+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PjQ1QIhSM19CUdxG+g0tAhPomvQNtLlO8MKGJ/ACdUS47203N
	oLc0gh6ooAtr6ZXzPnDT1zAr3Zl/HyRW2L9WFKMWo7jPID/qzkUkbuIB
X-Gm-Gg: AZFdTZdpccvGry0CQJPUBA/3pKpkrm0QBB6UisT0J3DBoaj4Cxb+ItiYcoTDa8fvuk2
	LNRBcZiNI5GDWvO3KyUGsC5EHsYpSx60AaFCxO5hBqDDyMbEElfFLNwDHb82BEX7mhmL8JL675x
	r8xZS6u68aMmz12LOvPR2sZnFpPwnVX+3ylkqa0gdDSOf9p8TJQKf+bujLKoWf3QQjJSoalqBHv
	4oNXcjHC5+M7qQJCZu8Alah7Fw8JNKdxzbA1pbEI5Culpk2gXlddg3ytBXoYwq7cfJGLtX1fZbk
	uF60RgpwarllVURnpCEyeQD6VqWFwbaciUfxKpfzXHVcWwHaPkctz5/oBIWSEEgVJc0397kH1lA
	fpLQPtTKvkoEx2W7uGtltlvuA36yPgfmLKc+MQWnA53AJA/W+VfiA+6lBsJna2aM7Ml0TefrR6p
	0Vb3XcUS3rydGPdlPh3II99a25e6JwVgy39TFyjo0pKjDg0QzyOjl24ZlKKhrBCS1R7bsPt9+0L
	iAEiGjfbYgRFpeBMqADK4zohKmwOLBR/WlzPeroc/23EaiIIPa9Mk7yb2rXbdLKTHHVJj0oR+4C
	RLx34YLIdCcQANXi+66szHiyrWVDd/nHQQ==
X-Received: by 2002:a5d:64c5:0:b0:4ab:c3f8:9f65 with SMTP id ffacd0b85a97d-4abc3f8a051mr35044102f8f.26.1795640035169;
        Wed, 25 Nov 2026 12:53:55 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37752535f8f.1.2026.11.25.12.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:53:54 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: arnd@arndb.de,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	Vijendar.Mukunda@amd.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: fix link failure with SND_INTEL_DSP_CONFIG=m
Date: Wed, 25 Nov 2026 21:53:43 +0100
Message-ID: <20261125205343.56030-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c8c7c888-4b9c-490d-afd5-0b49ae98b5cf@app.fastmail.com>
References: <c8c7c888-4b9c-490d-afd5-0b49ae98b5cf@app.fastmail.com>
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

> IS_REACHABLE() is practically always a mistake, don't do that.
>
> There is surely a way to correctly express the dependencies and avoid
> the configuration that leads to this.

Fair enough, I'll drop that patch.

I did try to express this in Kconfig and couldn't get it to work. Here's what 
I saw, in case it saves someone else the effort.

Adding this to SND_SOC_SOF:

depends on SND_INTEL_DSP_CONFIG || !SND_INTEL_DSP_CONFIG

doesn't avoid the bad configuration. SND_SOC_SOF has no prompt and is only 
reached via select, and select ignores depends on. So olddefconfig keeps 
SND_SOC_SOF=y with SND_INTEL_DSP_CONFIG=m and just prints:

    WARNING: unmet direct dependencies detected for SND_SOC_SOF

Putting the same dependency on the selector, SND_SOC_SOF_IMX_COMMON, moves 
the warning to that symbol and quietly demotes SND_SOC_SOF to m. That fixes 
the link failure, but only through an unmet-dependency warning, which isn't 
really expressing anything.

I think the underlying problem is that the provider can't be selected. The NHLT parser 
isn't a module of its own. intel-nhlt.o is built into snd-intel-dspcfg:

    sound/hda/core/Makefile:18: snd-intel-dspcfg-$(CONFIG_SND_INTEL_NHLT) += intel-nhlt.o
    sound/hda/core/Makefile:19: obj-$(CONFIG_SND_INTEL_DSP_CONFIG) += snd-intel-dspcfg.o

SND_INTEL_NHLT is a bool that only decides whether that object joins the module. 
A consumer therefore can't say "I need the NHLT parser". What it gets is decided by 
SND_INTEL_DSP_CONFIG, which is about Intel DSP driver detection and gets selected by 
SND_HDA_INTEL and others for unrelated reasons. No symbol means what the caller needs.

Moving the calls into Intel-specific code, as 194fe0fc3422 did for snd_intel_dsp_driver_probe, 
doesn't look sufficient either. ipc4-topology.c fills ipc4_data->nhlt from the topology manifest 
when the BIOS has none:

    /* no NHLT in BIOS, so use the one from topology manifest */

So generic SOF can end up holding an NHLT table without any Intel platform code involved, and 
it needs the parser itself. The field is even declared void * in ipc4-priv.h, which suggests the 
layering was already felt to be wrong.

If that's right, the fix is to make the parser selectable. SND_INTEL_NHLT would get its own 
tristate and module:

    obj-$(CONFIG_SND_INTEL_NHLT) += snd-intel-nhlt.o

and its users, SND_SOC_SOF included, would select it. A select from a y symbol forces y, so the 
y/m mismatch can't happen, with no IS_REACHABLE and no depends on.

I'm happy to write that if you think it's the right shape. I'd like to check first, since it moves 
an object between modules and touches the Intel callers as well as this one.

The config and the failing link are here:
https://lore.kernel.org/r/20261107114944.561731-1-jude.gyimah87@gmail.com

Thanks,
Jude
