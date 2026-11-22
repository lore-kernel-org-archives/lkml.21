Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795355443;
	b=zVI5RcAgceBqxp3gwJvNaIwPhkjbTT1EMsWhGJTLo769sWfq4VjL8Dhq5u1+jggw4cnl
	 D3UqcJZ9CD5OSwxCL7diNHxrWK9ll+LQHKCcVK7Q03+hh370s4sqlyCtlRt0A9vca14TK
	 z+4CF2qyZGLlNb0ULJHBz075FNejOSPGdABpIwbqOSUYZJa63pC/+6TQnfQjDZkXrXYUe
	 dkEwOX3rgtzjRwjA5k6uLGYqceiuUcvEHXxVxs/7bLr9KhSbI08ilwkCSevqCWdRTLhLS
	 nuHj8v/ooW7FQ+ywbvBrx9VUD6HInIswe+jArOMk85zm5WrJzkxY9Bhh938E4M5JuMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=94MINeCWenDh9avtDcgZ8osDEvM91PXXsyg9tlMKx4g=;
	b=eERqaKRwUHvIBUwzsBwRdzuffV4w7P2GKCaJL8hb+Fdw+4LMSZhcvxAJJQ+doj1yL5yi
	 mMbHcieYkIKnCl5LVRs5RUoSBqPMiuHk5LePdF2rRNuXaLMuQCAwJb3FVTyxMgaEfEPcm
	 XMF1aEWRB2vJoaL/HzP6P3rBpDPPE0bt7egY4KncIw9y9WnqNgGl6Px/Xhn+aoVlkShlk
	 9OsVErztI7rhSwFM77Bhg+5PHaEQtwjWnVFrqTWJ7udaDpuJSXFu3fya4mnjn8bcWwYtY
	 TzqQrL8aXkTVotBlrD5EYSZTHFV5+7NaNT9NUQrfUs/9QDnp4PtPLwVSJahtVob8KIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nw/bNtd3";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2DD606A339
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F2DD606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nw/bNtd3
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2810175c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795355442; x=1795960242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=94MINeCWenDh9avtDcgZ8osDEvM91PXXsyg9tlMKx4g=;
        b=nw/bNtd3Waj8U4tOxlOlNyEaUOHeknNFRji4dHsNP9/aBIcSZoYe7jHNNkiqkEXyJH
         Whecykv+BPp+NBZkfmZ/O9lhuDo0zb7hemxhPHEu8+Cg03I7lxNuoQ+++C53x4X+pEPq
         lRLeYOn6F3mVI2Xo7HCsaNKHNU6sIUQjcU68Jdwx34/FV8RsS7+9JfTy0g2OLRh8Y5cG
         DfplYY0zQYQWoGUbU1Gxn+/Uh9O8nBNRGDEQZBn3xW6GCM5v5y/B6cYrqoeZgx4v+18T
         lHV7IcvEnYLfGRKhyJcLuoM3JRlAeiM+959SzynxkqXyoF0DsW7WicTCmsr7YuDkF6iT
         gIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795355442; x=1795960242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94MINeCWenDh9avtDcgZ8osDEvM91PXXsyg9tlMKx4g=;
        b=KwWE6q44fzrPFCqmQGMzjg/3tMlDF273cWSOdAoeDO0V4Vza1ClBNgprMqhIjRlJWo
         heRLc57exhiBLJFksVVNh4Yp5SO5u/O6tJ7eqXH6us0cC+A7rcSSxHClpcyiC60PnLgi
         lG6Ba1B0tGY2XG2aol2ksi2h2iYfEPBfhh3HmaMsD/ZB0f4BCjNaVn/5Kjn/bZrYl537
         LUfdoYN+LLEeFxhrW4KXfW6gAQyU8D2WhPTuUzARBJpQSE5yeK8ZT36dn1cTZaZaQWf0
         yfzzoK7P8X3Rjx2bCEntMVgQNJJqAvfwiHuji8eKx0uV/A9L6CKz3QLaCe0U/+eBe6l8
         MNWQ==
X-Forwarded-Encrypted: i=1; AL+hErGOKRwCMQ30pK2LivBV8cBvSXk5g35hrCkSSrmUJQMV3lWLz4F8TFV/ByCNdCfsL/y3iwqGVlBCsvj8tM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KEEV5V/RDevT84nd9PkQImaafE0h39ZZfGZHckJlR2pKTs2h/
	EDpXgf9/jhj6xEXgqMtgfq5TFB1bebJtVgctoCOav5jO8v0HlOgat5qN
X-Gm-Gg: AZFdTZeFhUoDBUFaHYh7fjDFNWSScPsg0qOEGPvWqp/jFkQa2ED4ln5UoVyVFcBBa8t
	KvsTbLn5aPFXZ0GuZWsAODtincVu0Xs9AJmNQGJJB72MDiYfLdmkjS6tpknj1zO9F1J3zog/Q8d
	YI01naq9ooe4BHutXrtRXLo5gi97ir6Ty5rGExVtIWxXVelCG/XX8TUViqwOPte7nMocuIsgvHo
	nL8ndS9DcemlRiaNXYy3fqwZ+cxOoK0i6qWELnx0ge6IlASbY0s6l57PdlyrZpLe32uCooTHqla
	+BdxDgKvoV9B3ML6/H4gMFpjywX349PFpfIxHtDaz2f4C1YsmvZvKONKND8c13a6xoofQ1B89U1
	A14fYMCnVC4ycjTX15AVzhuUr1P490QuSvnr/FukpaBKza4JHdNFVbj8cF8TFDi7vqOm1SzgAhQ
	oNp/pD1/tOzB6BeCVUz2fmheecAbcoS5t7UnvsEg9UWb0Dq30CjAubsMS0nl02nBzewD70vY7jL
	ehmUPVRxm6stJ7CGpDivUyhjlwNvZEW+KUkVLiI8o7St8nfemGvOH8B1gmNegvDJ/tt7S3Gf/4c
	FIsH7aJXPbTmWqd2K9Dz0tYMLb8=
X-Received: by 2002:a05:7022:b051:20b0:185:b157:f271 with SMTP id a92af1059eb24-1b5568e30b9mr9964368c88.23.1795355442402;
        Sun, 22 Nov 2026 05:50:42 -0800 (PST)
Received: from localhost ([154.21.93.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm18999164c88.5.2026.11.22.05.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:50:41 -0800 (PST)
Date: Sun, 22 Nov 2026 21:50:38 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Arun Raghavan <arun@arunraghavan.net>, 
	Yao Yuan <yaoyuan0329os@gmail.com>
Cc: Michael <jagerkin@gmail.com>, arunr@valvesoftware.com, 
	Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
	alexander.deucher@amd.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ALSA: hda/core: Log stream DMA errors on interrupt
Message-ID: <awLx3tBrQODt9p3e@sapienza>
References: <DKT5BQW7XPHP.2KNASR1XE11UD@valvesoftware.com>
 <20261026013835.98210-1-jagerkin@gmail.com>
 <5b34b0ef-9eef-4049-a018-3e60bda634f8@app.fastmail.com>
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
Content-Disposition: inline
In-Reply-To: <5b34b0ef-9eef-4049-a018-3e60bda634f8@app.fastmail.com>

On Sun, Nov 15, 2026 at 07:25:24PM -0800, Arun Raghavan wrote:
> On Sun, 25 Oct 2026, at 6:38 PM, Michael wrote:
> > On Wed Aug 19, 2026 at 11:53 AM PDT, Arun Raghavan wrote:
> >> On Wed Aug 5, 2026 at 11:30 PM PDT, Takashi Iwai wrote:
> >>> So what's the best option for users if this happens?
> >>> That is, what happens if we don't restart the stream?  Is it a
> >>> temporary fail-out and the hardware recovers / resync by itself while
> >>> streaming further?  If so and it's short, it might be better to leave
> >>> it as is.
> >>
> >> Unfortunately, there doesn't appear to be much users can do in this
> >> state. The warnings we have introduced should at least point to a cause,
> >> but the issues seem to be around GPU clocks and power management
> >
> > A data point from Intel hardware, where there are no obvious issues
> > with playback quality.
> >
> > 7.3.0 logs this continuously as soon as PipeWire opens the analog
> > playback stream:
> >
> >   snd_hda_intel 0000:00:1f.3: stream 7 dma error: 0x28
> >
> > Per include/sound/hda_register.h, 0x28 is FIFO_READY | FIFO_ERR, the
> > same bits you reported.
> >
> > The only open PCM is pcm0p (2ch, 48 kHz, period 1024, buffer 32768
> > frames), so I'm assuming that's stream 7.
> >
> > Counting the callbacks suppressed, it's something like 7-8/second.
> >
> > ThinkPad X1 Yoga 3rd gen:
> > * i7-8650U, Sunrise Point-LP HDA 8086:9d71 subsystem 17aa:2259
> > * Realtek ALC285
> > * snd_hda_intel
> > * no dGPU
>
> Hum, that's not great. I'm not aware of what the Intel hardware might be doing. Maybe Peter (cc'ed) does?

Hi,

I have same issue as Michael on Intel pantherlake device, no obvious issues with
playback quality.

Device model: Thinkpad X14 Gen1.

some info from dmesg:

[    4.355830] [    T456] snd_hda_codec_alc269 hdaudioC0D0: ALC257: picked fixup  for PCI SSID 17aa:0000
[    4.356574] [    T456] snd_hda_codec_alc269 hdaudioC0D0: autoconfig for ALC257: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[    4.356962] [    T456] snd_hda_codec_alc269 hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    4.357355] [    T456] snd_hda_codec_alc269 hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[    4.357734] [    T456] snd_hda_codec_alc269 hdaudioC0D0:    mono: mono_out=0x0
[    4.358113] [    T456] snd_hda_codec_alc269 hdaudioC0D0:    inputs:
[    4.358499] [    T456] snd_hda_codec_alc269 hdaudioC0D0:      Internal Mic=0x12
[    4.358885] [    T456] snd_hda_codec_alc269 hdaudioC0D0:      Mic=0x19

>
> -- Arun
