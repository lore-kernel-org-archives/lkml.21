Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372377;
	b=E2m2aHw7RgFeDQ7qRwugkG8Ukz8FgrHN0LVYKTOZNe6dCyVCwircTLL+krGKdLo0uJ+Z
	 o08fKuMeONbe0Vhkzgz3gghe4V9QAT+6LabCMydWY9EPOwyQDdkLTQysSdf2ZkjYJU0Ka
	 zDHjHPU3GYUwPY6rYoX1o2v43cTyEAkdRLsDdSoi671erf+x4L+BO/xI2RY9ULRHjhCt+
	 dOgI5jRdNknHKefA22+dq65M7aCTkv0V+m6auZqrMh0BfPrcxfabW2qjpOMh4dYzQQzC7
	 d0dn5V21nxE96GPHvkEmhyFCrHmyKfmWubwjiX8aluDqjPmVVyZIX2ANPYyBothLYlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=X+meJuHf5F58nCaEDiUBHnNkHw6+quYPT+/xls6VrBc=;
	b=rZNPAMkaELpxX1dQ+CsVD6IH9RE4qDLcrIbMw3PMzyefh2PK+bWwRfhoFb4zx2N+xAO2
	 TppUCOS/MwBcVkCYiuiHVpCZMm10BQRS3xJqpSIaqOkQFNWUTHnZF2dsmeYDNbG5/r3+Z
	 5LS7cHCq8q6N5WPWRS/GpaIpC695PlicsagT/phgo1/Y1rUQI1x2i7xJ0oSlYnQ6Xc6GA
	 4QyZT7LQX1K36DxiHnqDHOZfasZPiuNmePQDEzbWVRunYozyQNTGwf8dnoTz791sWBZUx
	 Cu1aVA/yDs/agzlrjg8txot2DDGnvxTTJ0IiXYUrriWxXQsZbbshELl21qBHkmu8FBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R8kVJrqS;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B170606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B170606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R8kVJrqS
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4395d31228so408998566b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795372375; x=1795977175; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X+meJuHf5F58nCaEDiUBHnNkHw6+quYPT+/xls6VrBc=;
        b=R8kVJrqSbRDhpn7yx0pZTpEl6EXd4sinCjpp76E/qzkiaC9BUywwbAmTz5u8b5+eY3
         zmHldpnpI2a2euf8TO0gPSXPSrCyrnb68+63Xn/okQqwpwdaTy5rYCJogzDkm74wRJal
         1VuTJrvN69o2c0AK0hh8BzVzy2V21x9veiVLYflDcJYxtPhmf8mbO4vZ5BJzRWqHZ2f7
         1TVx/Yavuqr/4Jx3cGyK7LBi4imYQXfx1DxmFkHQwuTpqn1e0ONyM9ubktEnnAcbLlqK
         PxvYXiufXVevwIXcmiTBIdp2pb5g7lzK2T4P0ZumpcoLtthptwAcAxTJlNOtXLg4iedV
         bW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372375; x=1795977175;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+meJuHf5F58nCaEDiUBHnNkHw6+quYPT+/xls6VrBc=;
        b=qT6mY+pHG/1DmHKjWSFlGL7oJsLCMR0yA/AB97k8+Dd6FP2YhZXAr906i5P87XfcCD
         9r7HJETbHz/Mif5cTN5k6YDKYiclQG4lE6fvUe4FYPqKTPH9uOMwd7EeV8N/RIOe3QjL
         m3LScGB1LMPqrpbTXCMZbzaf28qdKbxpWctDGL2p7YrzqCSNmYft6noLyANT0l2vYHv1
         J0DOklrrmze3M+pxYdnrni8QIyZh0puILSy1CtOVXaHccd2uQEmabjR518AeCWFLvJuW
         z4fbBsTQNF9OQ7Ej2S7gKkhuHAiJyLuaJZzyfoeOR3zq/0J8/UavmEcibJBHf1ZlfjjY
         t8hg==
X-Forwarded-Encrypted: i=1; AL+hErFcRtpTuHeam58YZm2zWxjSfyWFeljWp2owrtCLHTJW8B7+9mw4mWbSTS/1VmSCYFrrzC4CJ0CRV3IO+TI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bv31ZHjaVJ8L5ZleXVpJu1McWX1/2yAamYF3TugXUq86v59rl
	P9MCUc3lzkhHRFPpqNGH+1nesKmbIm2oyfdYlfwuirMpzbNBDYMqPqZW
X-Gm-Gg: AZFdTZd8aLU2cf5/sp5sUYLwo+sXq8w4vc9EGDFLs0LhwAEFgl8lbkOS5eFo+WwpA7G
	zXRKZaY52jrgmAV9Lo2nq8oWXMr7GPemQma/uW+n+46SnMe5Uh0HMZngIC4R0riwVKG+NyfE2mP
	WevLUMcS/5dAO1iFBvVqZn7oj2oLyo8uHXDdCbbl0PMNOgmS6prRbjes6m8XbI/zGrdy7sDEvrE
	AymQsRMxcmS7myK4SV5/6JK4ubZLNuvhuYLRtLnYpXvROv33+C9c8XQWTsXQPPpkS2A04Qi/aCL
	lH0+LwD9WWzof66FUgG67HDr0aH/StMt/RkqS+IxE8MbYeX+XDUgM/zDsvsts96WC1kBtOjpbpu
	r9w2sOHHsp8ihmmHE1aiAfBwHzYdBPd8La2hucW/JVOM/u6Y+XFisg4U9OO+ww7pDU9/18f7k4F
	Cq3ZF6IbSsXpetZdrlW0L23ruIR/oWclUpDY2jJ9WiSIee2hzPWl1bmWA/X/0vPd/IbIbVL4Y+V
	XsjvA1dOYYH/mJzuXctN0Go8UVDmQPiVv4CNpuX11SVqmNX6yIefVon0GIbVABbvwmXplefaLC2
	X86yiq454NfyKVsk0F0RZ/afh3p9ImA/Qihn99mE2iOSrr/ySwjZOrKhEE2Aoj8S+g/VFOlLrKp
	YaImyQE1SFBqqXhPI1ow=
X-Received: by 2002:a17:906:7c2:b0:c50:f0fe:438a with SMTP id a640c23a62f3a-c513a5e2526mr651298966b.8.1795372375267;
        Sun, 22 Nov 2026 10:32:55 -0800 (PST)
Received: from fedora.localnet (81-224-151-184-no600.tbcn.telia.com. [81.224.151.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6841asm342978666b.24.2026.11.22.10.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:32:54 -0800 (PST)
From: Erik =?UTF-8?B?SMOla2Fuc3Nvbg==?= <erikhakan@gmail.com>
To: bentiss@kernel.org, jikos@kernel.org,
 Michal Pecio <michal.pecio@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: steelseries: Add support for Arctis 7 (2018)
Date: Sun, 22 Nov 2026 19:32:53 +0100
Message-ID: <Rv7nePC3RfOSidIKv_K-KQ@gmail.com>
In-Reply-To: <20261121121129.2a1d3013.michal.pecio@gmail.com>
References: <20261121121129.2a1d3013.michal.pecio@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi!

> URB status -75 is -EOVERFLOW: URB buffer too small for data returned
> by the device or the device babbled (exceeded wMaxPacketSize).

I can't reproduce this locally, neither with or without USB hub.

But it seems someone else is reporting the same on Bazzite:
https://github.com/ublue-os/bazzite/issues/6344

It seems the hub itself reports that the port is disabled, both in this rep=
ort=20
and in the bazzite report:

"Nov 19 20:47:58 [REDACTED HOSTNAME] kernel: usb 4-1-port4: disabled by hub=
=20
(EMI?), re-enabling..."

"Nov 15 16:05:59 [REDACTED HOSTNAME] kernel: usb usb1-port2: disabled by hu=
b=20
(EMI?), re-enabling..."

I was also contacted by someone privately regarding a completely different=
=20
issue, where the dongle sent incorrect battery responses by reusing the buf=
fer=20
for the connect response, which caused the battery response to look like th=
ere=20
was only 3% left.
After digging around on the internet, I found that someone else had already=
=20
found that on Windows, the Steelseries software waits 10ms between requests=
 so=20
I submitted a fix for that here:
https://lore.kernel.org/all/20261024-feature-arctis7-v1-1-583951aa6583@gmai=
l.com/

That too was on CachyOS. I'm on Fedora.

It seems like we simply sent the second request too fast, triggering a bug =
in=20
the firmware.=20
Anyway, I have a hard time figuring out what might cause this, and why I ca=
n't=20
reproduce it. From logs it seems I have the same firmware version as the bu=
g=20
reporter.
Any suggestions on how to go forward?

Cheers,
Erik

On Saturday, 21 November 2026 12:11:29 Central European Standard Time Micha=
l=20
Pecio wrote:
> > The headset reports connection and battery status on HID interface
> > 5. When the device is disconnected, ignore incoming battery
> > reports as they will incorrectly report battery level 0.
> >=20
> > Clamp overreported battery values to 100% and add USB ID 1038:12ad
> > to the driver's device tables.
> >=20
> > Signed-off-by: Erik H=C3=A5kansson <erikhakan@gmail.com>
> > ---
> > Information available online suggests that at least two other Arctis 7
> > revisions (2017 and 2019) exist, with different device IDs.  Without
> > access to those devices, their protocol compatibility cannot be
> > verified, so this patch only adds support for the 2018 model.
>=20
> Hi,
>=20
> It seems that adding this ID here (or some other change?) has caused
> regression on some hardware, reported in bugzilla:
>=20
> https://bugzilla.kernel.org/show_bug.cgi?id=3D222298
>=20
> URB status -75 is -EOVERFLOW: URB buffer too small for data returned
> by the device or the device babbled (exceeded wMaxPacketSize).
>=20
> Regards,
> Michal




