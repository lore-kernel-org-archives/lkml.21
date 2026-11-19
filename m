Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099875;
	b=UT23YTDhzC6B1LQm1Rfqxtq7nAvHW3uQAikI5c6UAFlGhwdopreCVe32B67nUdAr1hp9
	 DXT4daIEtwCnkCA6Ju9QAaq3myTLMFj8ekVzVe0btiyn5bLtR6l9jvB4Gg9CRy/PmxfvO
	 QT67HO7E2U4YBXJlXC2YVbVLhR9muPj/R2SbJ1AxYTSHQBwF+4RBIEdlVYxLTzqnyVOHH
	 xZeBqrwo61eK9SRvfRXEg+w50Cq+n7LD9whf9BUM6TuG8b21doB+S6E2pWlspsiSWI5ar
	 R2rANB5rMCODYjDiwmXqAYrpPc4C+rKHdMB2PCumjJ96+I/m5Mtydlx37S+I8Zn6nIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VI1AZtVr0OJhV8gaZPX5TclahNu0z1FGdCiJCKtdVDU=;
	b=0zml5zFliPeXabI3+2Hv8Jwap8nc6b7sLMfxEq41i2WOOzo/AzQGj0N3gfav4PdSv6QV
	 LqYJoTn+1WJhWn97joKebMYm8rXGHfWjciygLmeR0hFBQqEO1GtCvN82tO3mhxzn1x4Nq
	 x6ZWHsB00E1xdJGDlZwEEUlprnosvweX7siABIZ3oZb4ePdQ7jYdoWkoNJeYm9qOFy6Mv
	 3+MMwnYFAHjdLJH6lEVo7Z7Hr1aQm0/qH2jmyQ1p2Xl4TwAO2FNsrur3cfhV8M2L+f8Ro
	 OMZE61QL0NqThdx7RO1cRad6A9Xi1d8SNTy//mfkgO7FyfNb5vmDADUJbPDxJv04i8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VL7MC+zF;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD3D606BA90
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD3D606BA90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VL7MC+zF
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adfb744fa6so2560451fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099873; x=1795704673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VI1AZtVr0OJhV8gaZPX5TclahNu0z1FGdCiJCKtdVDU=;
        b=VL7MC+zFVy9dh95bxdI0i4adxbHSpzTznJz8NOe8ktBQfQdW132dePH/Zt5Grc5VYp
         tJUXKNhVIaRN1C5TmaeHf4EAy+7JVM8UnyWYN6PB0ahMjyIJ+nRjdIR52n+C4eGQkSqM
         QdiQ8oRu+d2g+jFUbUQL4wz7w6eWQ5sNGs312ts8oxAf/ravDm1bah7sz/7vIyfX1gU2
         p6cYrHvPBl9OsmoGWFuyIz2wKAujNHTDxzg0fvuC1JZ4JNGYSjz9O4b2H/w39HdHSI6O
         E8LuXuunIpl/zXVj1XzTaSKBcxAMgmDcXGmFAku/kysC0Bnq/132nw0A6n/CtzaXAN7n
         K7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099873; x=1795704673;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VI1AZtVr0OJhV8gaZPX5TclahNu0z1FGdCiJCKtdVDU=;
        b=o3riKrjg6vVTSl+JDurVeyHHNa+kEipy/yqdyK+l/VqIM9jbK6OhRmi4kSNWut+Yyi
         UgCY0UIKla82DWy4F4/PxMJ+v0HXHzxlWzEYjng6HyLIdiP4dYwhgcy/WDyC7vWXqdpP
         ITaH2NeDYFIVUdz/euBYlyblP+CWt6ETHCMjal3Rj54eRhowkDizu3uSUgonHrTKj5oL
         lQ+o0f9Uu4ON614q9aczHUP5Z5KnpORO3Fuzvd1XzDZV4zGC2Rs3XXHdrBipOtzash01
         03taf63IEuqBGocqSTqXVzZ5qeMXUugpms3Sh291aw4IGdk5CmjTOD9LwLFCDnzx/L4j
         Nclw==
X-Forwarded-Encrypted: i=1; AL+hErEBvx+9QTdiQpYzSLpPMx4ilAsvVzTQWizfZSZPTIumH6/msu113c1WD2rP8DHaZYiCB7/MoidoQgv4cJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cS0I0gkADhB33IM97COry4XQDCDzuOuhJz0lk7WqD2d5WhFyM
	bvfqS5ek/I5pZBPpJK54j6SIEV+syZqBZg+CfYNiucl38CMSvq/Dvuze
X-Gm-Gg: AYBFou0ZlFED7vAJl+9CHIOR1/mko4fMTKfTl3GPI1KigE6k66dPEtKkXMaVxtfozFq
	XHUDOME6pOzla7W9QzSmY9fNlW1wyjWkeSK5u5r8W7pYyoNvjElAEpisvDIamE2X+I9HlLxqmHN
	oBu/OZUJY6Pw6L1SBcCZdQ29MqqXUpcOpS8PDYrA8V12CckbQ8D1ppASd370FG0imYgtuimPew0
	LSVKHxkP9MHwSUzDox8hR9AhhsuR7Nranloid7PLN9Ax1/5qU+TLhFMV4179rxqMK3T7f/yrygm
	A7nWPom32OKQivKeZqyS2vJRSx1ECBlQs846SpMW/d9aQzS7tqO5zM5BRaIb33yN3h/HIeK5C7k
	9wIl0vEGvrjSpP/Mm4NrntFjWTudAUz6iJr6rtnSAbQztc9E91PLiLqZEK0ofAwCmmwre+mTHfN
	ptwYMeLQ3wnWwEA9N3jf05u3+a92VmGYtqV1aIFUt2LGtEdnBE/eZaD74enzrDjGVRCG0u2ZYlc
	GRFM957fybxUQqnHTFGwreeGa+ZW3LbR2gVMswIl1R3aWYyjaTWM/lPHxUsNKYpI4WrADAcYvl+
	MwcRRsY3K77+fm3Nr4LgZ9os1gfP/LLRHFUXt12E3P3nUXHb9dZ12Iej31TOJje5UpOlZfJ7Qbl
	t7GV4afeyhvnJxpnGe9E9NzwxGAXQBtVIfg5LLkopkYXV0cLfZreA9gCfKXpjRQ==
X-Received: by 2002:a05:651c:c011:10b0:3ac:dfad:319d with SMTP id 38308e7fff4ca-3ae7f9d6f4bmr334811fa.1.1795099872835;
        Thu, 19 Nov 2026 06:51:12 -0800 (PST)
Received: from localhost ([178.150.68.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6ea7c659sm11264611fa.12.2026.11.19.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:51:12 -0800 (PST)
Date: Thu, 19 Nov 2026 16:51:11 +0200
From: Ivan Verbovoy <ivanverbovoy@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: wcd934x: drop the MCLK on every disable
In-Reply-To: <179509724666.116416.15851195764740977182.b4-review@b4>
References: <20261110-wcd934x-mclk-v1-1-c62956792a3f@gmail.com>
 <179509724666.116416.15851195764740977182.b4-review@b4>
Message-ID: <20261119-wcd934x-mclk-re-ba7379da5f2f@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 19, 2026 at 02:07:26PM +0000, Mark Brown wrote:
> Are you absolutely sure there are no other paths that could do this, for
> example take a look at wcd_mbhc_adc_detect_plug_type() and the rest of
> the jack detection code?

No, and you are right to point there: the jack detection does not
balance its calls.

wcd_mbhc_adc_detect_plug_type() requests the micbias once per insertion,
and wcd934x_mbhc_request_micbias() takes an MCLK reference with it. The
releases are more: wcd_correct_swch_plug() releases at its exit, once
more for a headphone or when the work is stopped, and
wcd_mbhc_report_plug_removal() releases again on every removal. micb_ref
is clamped at zero, but the MCLK reference next to it is dropped every
time.

So with this patch alone, a removal while SoundWire is running would
drop a reference the jack detection does not hold. The early return is
what hides that today.

I will send a v2 that first makes the jack detection drop only the
references it took, and then removes the check. The board I test on has
no jack, so that part will be build-tested only; I will say so there.
