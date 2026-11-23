Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463536;
	b=qipwfm5z8hbF1cyZhKOOtC2q5wSv9bu/o6kS7UD+tgPia7QtgElvjtYuxw4CO8tcwlGs
	 2laTrq3XhHBXMNPo0F8gfCcxRWEK+8NWvZjKMyod8Jg5Udm+47rdz7jjpSK2pbx7+ztv+
	 qs0IGxAjNYytk/cHn5ocl4GmEqtQvATn0+gSzNp3ZUz/jvERkDwa0JMipcoSqY8d5SJdu
	 IdlmSopgFgRPKeAvKohCRAFcyrBs7Ml3BOtc27Z2FRGE4/dYRHPahWo/fqs5aEloLsaLG
	 oKGRpasowiaXPUg2JPSI+3w5TIUVGrt8OHfaEvoZKPnaG+qXnI+ezEohT1thnoNFKxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=3RshK4Oj6YgNlZUOTXg8txJjkOgNgpHYtx0HE0E152o=;
	b=opqkX6yucQUlJtsvlxvDjSARu0EhvltG4+CDDYAEsEgjNrE5l+kec/O6E1XuUlS045CF
	 z0cu6DgkqPIeu7IJrAzGdK5fCb4E3f6/89h7GWnLWJvwgGyjjgaGJHi8UnsPn4Rve/3jj
	 Kc+Mlidktt5p8CXbMgazhWiJvZziOjyY+kHlhP7Rm3i7s9xWbn9CTLWX+e39R2ASRCpcP
	 uqTuQbBoJCvPowJQ+Hl9KWAvCfBxwc10PUOg2UNhox+20k9NzZnizzNM4xtniXbZeg8mW
	 8Pyy8r2KI6EJBTbga4K8ucOSMUNxuE/Is6xldbh22lUn+UlSpbKvDrsfK+KdusKy1kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eKjXMJpx;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DE1606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53DE1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eKjXMJpx
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so2847612c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795463535; x=1796068335; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3RshK4Oj6YgNlZUOTXg8txJjkOgNgpHYtx0HE0E152o=;
        b=eKjXMJpxtYOICHKcuFQ6A1dpf2dL4D0gZySlQGDXZHMLC1UCS6iGLPMH793/2WL8sa
         uwnT+vVUNBsaW/DzG0iqUfC8K51GsGNRx0I4N0WM++5s987nWrLa62t2mauAVmf+vcjg
         aPa4D7bDIDcSEXGqWZ3wTXNQwKhQvjCLmqJaj5zQTm/ezpz4n+d+T6o2r+O5ATvf3NTV
         dFm0QqKc+0TA4sWYXHDTCkx2Ns5QfkxKT+mcjvSMM8oEh9/HFDj2NjBXinEGLg4MA8VU
         RUlBsssMaWx8nMd9uD+/hfBn14cAhjjRkLwL9u21l3Lm2qn1OO1UtFKwlh03ZvlF31ZN
         qImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463535; x=1796068335;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3RshK4Oj6YgNlZUOTXg8txJjkOgNgpHYtx0HE0E152o=;
        b=nRyEUb7r0OSUx2nYi8Y61J7wvR1e46US32AzvkxeMwWF7PJxhoShxLSd/wgrunKFdw
         r1qT8ZQoxrc5tBCCSoDORq0xMdsx6/LzwB9GDD7o4qlxbXxSpDlMetD5E3sC2oohc7MV
         Dq7s2OVN5Z30fOeQvAtwW0NPTyvcQskwkqNGhskYNLO0HBInQUapqJOcFhJbgIP9d5Z7
         ApCH3RJMI2Mc9pHNLB9hjiRsxH/YatGFDhhTfCSjhEdgNXq33g+0T3gO5GCEpSO97Tti
         C3R5exG4WXoyfCzHcJTT02evIASSlUs2YYtQAAESh1ACfhbEBksfmq4YBkjpQ9SHhERm
         tnuw==
X-Forwarded-Encrypted: i=1; AL+hErFLu7jLMrXvb8KFbSLlY835bwyhM1V/yQ7zuj/TgoOcYwmvdDGlN1ves2eVOlV4+GQocsqKkenhdsigDWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PQHxa6KIuhsZU2sAhrTGvqaNBuyQ9n70uB+Q47tU5CcsKv6aB
	K6AG/pKR30tvx/YnKxjeXlqKAVuj0l8nvjCTq+dYjH569CNDglE3AHhK
X-Gm-Gg: AZFdTZcfb0KAoTrjwo/gGdCsS7Mi7fU8vO2lkniO6e3rIe8SkFTEm8/NPtG5QbG8vWg
	Fz+02mn7WmL5TnLWNpLDO8ZdFFQ4S+3FQ2wacl8+NIZYKd8Gv8KJoznciVvus9Rk7dK6DfTnSGg
	4ggZ0tgsyougNnd+Dv7iqolPUYnMEhXrT1Gmz6XVc/z+YAILQOv+EIABmvBOXgIC8h54nWAJ1Xb
	AACRQ00Dg5376rPJgUOj6elsjvaQDZgz02A3G7127GyWDAZH6QfUzs8rDaLor3yY2WWClnlar+0
	Nwuh2Iik8fmEmxHdUwelLYDY7+QZ5M8kKFgb4oLi5VwsdYXNAkUn/tcIUz3UThm4h2ab+d3RrgQ
	thNyasGfoPlw5MkidqCHkEHwRptgpw00z2GjKyVCuLUrsdxP6BvszVqfpZv1nQfg+xCTzqm/ZI0
	cOyHT6QA/1KF1eOTeEGqIy4MGAswjTo/DJ/h3uOSr06EK0v2+2RbHTxFIVxNU9TWkfYy+VK92Q7
	V24j3i2mkigRmioPJ57USEQdIYEzV0+L4xSQ4RMHGO2v8d8+enkZeiSN9eX4RHHFWCdrqLvWgGT
	ULilAoUjUc7UDepaZQX5+7jmprRYVOflgScsXMPYac6EG7GtDHVPQIe58sVpRHmdDXOJsydqIGn
	kem5PdxmCzQRbVsY=
X-Received: by 2002:a05:7022:5f08:b0:144:c112:5f24 with SMTP id a92af1059eb24-1b5568f9e24mr12609285c88.25.1795463535268;
        Mon, 23 Nov 2026 11:52:15 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm34957036c88.7.2026.11.23.11.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:14 -0800 (PST)
Date: Mon, 23 Nov 2026 11:52:13 -0800
Message-ID: <dfdf0c3f2c02672514077465784ae1e6@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lee Jones <lee@kernel.org>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH 2/4] ASoC: arizona: always parse device properties regardless of platform data
In-Reply-To: <179414246010.3630016.7821414370886873553.b4-review@b4>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com> <20261105-arizona-asoc-v1-2-25ec7338446e@gmail.com> <179414246010.3630016.7821414370886873553.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Mark,

On Sun, Nov 08, 2026 at 12:54:20PM +0000, Mark Brown wrote:
> > @@ -1184,7 +1184,7 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
> >  					   struct arizona *arizona)
> >  {
> >  	struct arizona_pdata *pdata = &arizona->pdata;
> > -	unsigned int val = ARIZONA_ACCDET_MODE_HPL;
> > +	unsigned int val = pdata->hpdet_channel ?: ARIZONA_ACCDET_MODE_HPL;
>
> This changes the default from ARIZONA_ACCDET_MODE_MIC to
> ARIZONA_ACCDET_MODE_HPL, and might be clearer if written using a normal
> logic statement.

ARIZONA_ACCDET_MODE_MIC (0) is not actually a valid headphone detection
channel: hpdet_channel is only programmed before starting ARIZONA_HP_POLL
to measure headphone impedance on HPL or HPR, and the switch right below
(as well as the DT binding) rejects 0 and falls back to HPL.

Before commit 9e86b2ad4c11 ("extcon: arizona: Add support for select
accessory detect mode when headphone detection"), ARIZONA_ACCDET_MODE_HPL
was hardcoded for all boards; that commit only initialized the default in
the OF path, leaving platform-data boards that omit hpdet_channel (such
as crag6410) with 0 by accident.

Fair point on the ternary though. I will rewrite this in v2 using a plain
if check (only validating "wlf,hpdet-channel" when the property is
present, and defaulting unset pdata->hpdet_channel to
ARIZONA_ACCDET_MODE_HPL in arizona_jack_codec_dev_probe(), matching
pdata->micd_timeout) and note the default behavior in the commit message.

Thanks.

-- 
Dmitry
