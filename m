Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671833;
	b=MAyfoZwZLYzuFIyXoTcisVJvNOtRfhSMN5amtHpqCNkuf90m1uVUML54gfHeMKUm74X8
	 m9S3j4k6dS+nF1yYCyKe8A+xmS7lJwdBiLCk68+q2sLvEBBWO7wWaJ6CHVLqlbBakJ8gA
	 G+ds80j5RMoo9m2SS4RLEawAc5Y40SNKrwXCopKTsqZVi31jgRjb5ZnKIhwBc0BoxCS8Q
	 5SJ9L3BtkWj4LmwR3aYFbklqBN3CaD4AfRo/z2+dLDOGC2If9ZAJ8C8mWR78AwoWMF5bO
	 nmUCsWWxsAl4h3G+m6xW98EHPvw7nHaRKgtIpjtVw81h1UCY0PSVLLx92tpdXLy52+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IjWEhqKblidu0NNXiwNq191cI1P0Mw4BZxYNdNdYS5Q=;
	b=YKfVbHpGNiV40Kg/8eRx6UeqwWZ5wXusmRpkaauUQK5Ni6cOnLA6L3r21J2UrTukeaUz
	 N+8YaS/3pTnSn6yEyrH+xXFrayrOR/ZfAEiU3A/QqMUr8XGuHZ4BA9wi4NJ1fYxoakB20
	 UQlB5NGRVYQSVh27nIvQ8Lmmc6jbeSMtFy8W3Uxp+gwqmiLM73Fvze3EP93ymdxD8iV2b
	 /0iCm/CTnwlHpBpejsLXt5Yffnj9w+sNDN5Xcm2rDrpg63tFPnstGRZTVHpAd6F0FG3nz
	 4buDzKpcaZ6y0ibZviOttPKMlI9pJDkL37WvNN26EhWSh4HAkJGT7pzJ9V0520V2AGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ne3uzrdf;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA03606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ne3uzrdf
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491971ac844so5869205f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795671832; x=1796276632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjWEhqKblidu0NNXiwNq191cI1P0Mw4BZxYNdNdYS5Q=;
        b=Ne3uzrdf87dnpkAp3soaNtolLsKaWcbEirA3AeMcFFU0Ubn++8UUgemfvjN7MNVgb9
         CgUdOlGvuATvWcm6aPL/7aJ6kaI+A+RkvcZtm6S7kAqMhu4ju/+bX51gryoMs9gCwSec
         8SYvOV6pRpap2zoe2FeuereNjBGwsM1NSPOQRbUA+Dpc1fdICzIkqfFFloBgZRRNigIv
         rOI6DmYxqoeFSbBOQVz7Jvu+3J4pC2fKs4Gn42gqQ+V8ZxqpInnyhQwduSn88eFR+lle
         qcmP41QNReFe0pwRv7vJRow5a5yG7PRuK9A5GyO5KxHuvX4jXCVdGtxOrod6FzZRJ6WY
         f4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671832; x=1796276632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IjWEhqKblidu0NNXiwNq191cI1P0Mw4BZxYNdNdYS5Q=;
        b=aGfVfdPTygoKoV0nm4zkOZJQ2M09W3j0reOS3MVwmcaaewNmTOLvNacXtkraiXwBbg
         aT2DJOzpOzAYET8K1XdHaJzyD4RtVVoIp0wG10BZsf0nC1i4sEWoxFzbRAdg4kloGZVk
         BlpPvcBUpsN4Ei64+TRe4bTCey46qjmYki8eRRHLz39hKjrbjaJTHpv7KWMrHANYeXQv
         P/AxVeYgsYj/vmdZmyxTMAhZmJJ/TBJZreHZD/d/QegAetU4ZhGJstRx465g2RzRktIh
         VKrBoU1EORA2wrCgo57vqkgixzTLns8qgnWdTRpyqT6opq36zfL2DaDD7+v0NS2pX3sF
         +77w==
X-Forwarded-Encrypted: i=1; AL+hErGm4D1gaYmLyKLsyCrJ3fiNKPoV2n9PvNV8OwQ8vLYq1PE8eEKx8xrZ7AnlAa3cLhzFDIh2azije0EQ2BY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C8SU8ug3gtjTdLnPSlxQ4r1vRUnmmDBwux2veJQU8KBJVLyeh
	g98cCbGqjk2T5Vy1T0oJwjRz8w3egW24zFckmuAJoZWe+9JSua2lR9ar
X-Gm-Gg: AZFdTZd32BYsbXUUfUxC+n/RWdk6jQi1l1CkSP4q4Fv3VuIDdn6gTJ+SDJpD0fi/PKt
	YJ4dXwc7u5NaK1oLrd8+1a40NS6niFhEfa8ZTYDGbZ5m+NtZGvQM9+px1pkE7MxmFoV9CfYdiSS
	YFg9RAy0X4NX4E8TQdFh0BfRP7lxGJmHNTv5yrp92KHtIUyG+Q/DHJIDWP2KHTclGjvbP/0BHzo
	F+ZvgKIR7wrNpK3DysnYDtAVi5sNR99Mn8cKAw0GobNMzJ6Ax6Pv0oZue5qBzgpZQMSrMnpsQDl
	8VpEHvKtFP8Lae5J69Fetk3u+PNk8ytI7+4rr4sOpTln+qjlhtUB27Hp7IbxBOTBcFD7OaNLwy+
	2ZruXFXnelkhu+Fv7PExRgIP/JJEkibWrGC9H5EtuvijThxdgbghWHPRQcTO5Z86dbdLEC/WqU0
	lU6yr9NiofooL5xA0ImzV0n0d267mlsbk4GvHqfHYpQFtA5xQgJo6skYkh7X1ASStdhJtZlgWVV
	1+TqhX3Tsm3BuE4OlNuhDigwhBP3a9lAB+OUCieWl31k/7kkjMIb5NVToxU5V0c4FsgftQxgZXq
	A00QYowadRNLPrkuOi/wYIpxUNe6/JxSYEw=
X-Received: by 2002:a05:6000:2913:b0:4a7:7bec:e16d with SMTP id ffacd0b85a97d-4abb0c5d670mr39494437f8f.20.1795671831732;
        Wed, 25 Nov 2026 21:43:51 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm43959416f8f.55.2026.11.25.21.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:43:51 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Jes Sorensen <Jes.Sorensen@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Shreyansh Khajanchi <hi@shreyan.sh>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [RFC PATCH v3 0/4] wifi: rtl8xxxu: implement AP mode for 8188EU
Date: Thu, 26 Nov 2026 06:43:50 +0100
Message-ID: <20261126054350.2893087-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <03be9df5-43e3-48f6-98bb-27d7d7ba2074@gmx.net>
References: 
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

Hi Georg,

Thanks. Please post the 5 patches as they are; untested is fine. I
will test them on my setup and send the next version with your
authorship kept and my changes noted in each patch.

Shreyansh posted a patch that only enables AP mode for this chip [1],
the same as your 4/5, and Ping-Ke has reviewed it. My test results
for it are in [2]: without the beacon fix there are almost no beacons.

So I would build it like this: your 1-3 and 5,
RTL8188E_MAX_MAC_ID_NUM 64 as Bitterblue said, the beacon queue and
TBTT hold time fixes, and enabling AP mode last, so that it is never
enabled without beacons.

Ping-Ke, should the last patch be Shreyansh's, carried in the series
with his authorship and your Reviewed-by, or will you take his patch
now and I base the series on top of it?

[1] https://lore.kernel.org/linux-wireless/1381CC32-E73C-483E-8F64-27EDE6AE8E6E@shreyan.sh/
[2] https://lore.kernel.org/linux-wireless/20261126052152.2887192-1-mehmet.fide@gmail.com/

Best regards,
Mehmet
