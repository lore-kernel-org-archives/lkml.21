Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795661405;
	b=BjvpuXL29/V7YkprW4/LKYs5klKPYEe0tMd/TJbP2MUFVO7K1WczmQRvQPga5kkcWeIP
	 SSBl04AWigCsyQT5gsH6RNiOKF/vDiMLNNCeFpBuUFydvZdRI163aY3nFMEoxt6CBxtGv
	 mAYbzG7bwgwgn+59ABnfhIL9JT3xNmuuwxblEXSV746SzQ7j+QdcX7LtLpQnZm0ha8zMZ
	 Euw+XEhtadurmEKWMjejUyAwCE/3DS9vIIyInUy/yXfumkAoowJv3wmpHIdjc7/+YSn33
	 la3XcJpRmpKOF44CA0f85P9QF7U/ntcLKg9zyxjvCEF0Foar/ExMZhUvsxWUGy9L8sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BmeVPwr9SKwxZECZZ/qpqnmowyCWmqTyCjMYX/8OCrk=;
	b=Gwu4wI1WEetDhcGImRKVfx8r+oFkiBqGAQtkMDk9eayu7GPwRvGqXr7YiSwaXj9Xlexs
	 +cAjrxEmfwlHmo1Qzvdl4y2Tb4yGM/uNAGNMHWMKs++IybfTYMCpClC/2f+Kqh1sKd45l
	 soEh4wWg+RAIStCv13e5jmTTXyKEmWJT4UvrRb7mXvqHq79pdrL8WzgSgzDUGkfLHPec9
	 Y1YF9KTaqjyuXtD858KOBpT2e/NskXUygb8dBe3e/6hLL3Y4R7Qmhx2ixhZV6HzhopcqZ
	 xKh/6zReegomnEJkls0PktyHZTyO8PKZ0Cny7dNLZ8SKWlhUMLp1pR5EXuAb0Z+Hltw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=epBmNt2L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B326606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B326606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=epBmNt2L
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso6557234e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:50:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795661403; cv=none;
        d=google.com; s=arc-20260327;
        b=dQvai6REIsIuXzma7xKC9dvjGPpR0Z4vRUv1o0s7Khx2+SjKzr3fWSt4Lgnj6vBGC9
         CT+Kg6xcULtXcpxUt69qffAWHFfs1q0i5Nv24kACmThrrXdLoUQCEWVyubb8dH9ZykQC
         tDklk7tWIX07N4zw1EaAdhXf3XeI/DIm8ppOnqra03SMZ2z1MUiKVbw1H9vv4ELpjdJn
         dIQC7lUFJ0MaJ5wHzuw0fCBE1tXLAVNa9xy8LB4B8v5cwVHB7IJRJhAjzpUtOcMkMLEF
         GNwitYp2pG/mF/OQWaan4zrYHa6AZUlQh2iBge67edy/42MxHuYmYis2bYJLUyeSSa0Y
         A9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BmeVPwr9SKwxZECZZ/qpqnmowyCWmqTyCjMYX/8OCrk=;
        fh=kIoE8HXpBDrLa9xQvHEYRKtM1GlVGuOz9hAziLkkTXI=;
        b=YqTxg0gjL8RJbuJUgrmVaPxBof+zRtv64qQ+Ke34a3WyWUxC01A9ID68ZfeF811gPJ
         HFAlJTsR/NhrTIdZtsqzjmkkhT+7JjT3qCFb16F/vI2V44ybKs9a6P84S9+bH23dTDy9
         eFPe+A/g6Z07FFCX5WI6iILT8yPpf4Ei+u9Tt6+bqofDGMM4/KePJS2FytFoJm4h1aOw
         xD7Z7EMJm/8DD+rD4KGEn3NOnkdXRlHcNkKOKtWFulM96BzXxMbZ17nAXYiI+i2hVs47
         3KTFLzSRZquc8m5SxTFxoa2WPlDbKE3xsBYB0BmzF4ItlXAXL99vdgu50rk7Nray4y5K
         1C4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795661403; x=1796266203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BmeVPwr9SKwxZECZZ/qpqnmowyCWmqTyCjMYX/8OCrk=;
        b=epBmNt2Lv7Dcu8bzZ4iBr1H6rQ82whFFTrCChG8DCgR1ptCnX78/BbmIpTwF8a7L3T
         eIPXH3FwV2Ahe+Ar796UlHkbFTMIfk6SUNGp7L68LZ4MBNU0clJ1pPuiegK5QlB44jdi
         XeuaJXP4HWpl033aBhoIISlJlOjGvc2OAxZoVeXxAxvPW9IW2PHJc3iil1phHrn3Qmow
         tp5LPWh7gceHx8x8+yaJbZCAaRS+Z/AXpVEVZ6ed8qMJh0n9XCgavhUR49jhSJi6wUd0
         91dLuVfikSCiKeUStFiicmpr8uIEOM1nUNOS25HxhleNe5g1sSWCjIUv8bha7OoZrHM8
         yDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661403; x=1796266203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmeVPwr9SKwxZECZZ/qpqnmowyCWmqTyCjMYX/8OCrk=;
        b=CRoT1/2V2PRemDaEdQSySJELqDjaVBI71PtMXsYYpFVjmaDZLJy9Hfw2Xxa9ByQQmc
         A4vf+SuNXFi04sNGYr8PWWkqFgA93TWBVHR8fm0CnBnuwZIXfAsWE5UC9JH9D2dPAdCk
         c+XRfduoHD554cjYoGp88f+kDvR9R3mU3dbTX6pssUtiKPpYq90gJPVEqORkuzC12xbV
         F3jl5qStvRE4Iu5EyHnTVGU1SuZ2eav+/4tkapDBhNxtSoAuCT5y+GQNKhJV00htgeXr
         fG8CNYjBgIL1W0JazkjJqu7CPWLGV+xw4vkWx+tCz7RiCH24LsA+Y0vc5gjEag1fcjFu
         75dA==
X-Forwarded-Encrypted: i=1; AL+hErHKL38YXC2l+zPun61+RGTx9A0sVMe6KaP1y+MnFOyxvzK4X/wFRn6coUtbi/0RmN31GG2+sWv310z6Cvg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EkLz3XXd7aL845enTZNSb8wDu5g+PHOCwHhbZhwjG+JK3f8dZ
	E5PDi/wCtDjLpjqqgggJ900GPrN7GE+nfTpaBDkeS1vGLE0YvXJ7ff/MIko5/bRclOWi1RsXxr2
	8pqR7RGSiAPkQ+P+ngDBKYo2nKQdAvXJLAZ0JrZuN
X-Gm-Gg: AZFdTZdt/h+J+AzJD55bcWcQcBCdR2r/KhLJPv1es53f9F+xlqQou4a9HceeVzJ8z4a
	YUlQXyYIypLyTtEuYGCShqZl+k4dUBXJxnruInf3DFoNeL6KZDm+9hrxX89rk+LBGA2VN6nbHTW
	OLOqF7SNgK8nDNEbFF1yMl1B+jLoM6F67tTnDGkUO+qQJL1+2pTojR5wuBNkHbBVvm5rlg2NGnk
	cWbWMv93Sa6gZhs0Lw+6X1a/TZO9ns2BRpGm61C8AXrpLuDCrX80DmQNQkYZMNi0GAeq5Ww3H7S
	Pdp5RehMaGmYEST0V/dt/qCrDiglN3cTjAdpcrMCeeo0KKY26L/FWsV2COoluwlWSR9JDvIkMRq
	Du7hVySDhTeFLJmoVDyoy3D+iAyOxjeM8UvpNcKQtH/9D7r5TrN6ZqNVWsoOROhRGRK4=
X-Received: by 2002:a05:6512:1318:b0:5bf:b8f1:80cd with SMTP id
 2adb3069b0e04-5c1bc8c2613mr5298026e87.49.1795661403093; Wed, 25 Nov 2026
 18:50:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110020632.4003499-1-svv@google.com> <avKAaJxlxE8gOYVV@google.com>
 <CAKF84v00nJ_+2Tf8m66LhGEKvqnHb26YD6p+FRUXK5juYEPQZA@mail.gmail.com> <awNosbiWPFdsbUN5@google.com>
In-Reply-To: <awNosbiWPFdsbUN5@google.com>
From: Siarhei Vishniakou <svv@google.com>
Date: Wed, 25 Nov 2026 18:49:45 -0800
X-Gm-Features: Aa3M54r6fq9UxV6r7ZXlZATug1kAneGhSH_0CFFee4KvRhKktEz0ou5Sv9ToIW8
Message-ID: <CAKF84v1B6bu_YAAcdKkOxC-BKY8f72tWQMz2s5D3Mg-pMnEH5A@mail.gmail.com>
Subject: Re: [PATCH 0/3] Input: add ABS_TWIST and support it in HID and Wacom
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=81, 22 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 14:1=
3, Dmitry Torokhov <dmitry.torokhov@gmail.com>:
>
> On Tue, Nov 10, 2026 at 10:57:31AM -0800, Siarhei Vishniakou wrote:
> > =D0=BF=D0=BD, 9 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 1=
8:25, Dmitry Torokhov <dmitry.torokhov@gmail.com>:
> > >
> > > Hi Siarhei,
> > >
> > > On Mon, Nov 09, 2026 at 06:06:29PM -0800, Siarhei Vishniakou wrote:
> > > > Some styli can report rotation along their long ("barrel") axis,
> > > > commonly referred to as "twist". While the HID specification define=
s
> > > > this usage as HID_DG_TWIST (0x000d0041) in the Digitizers page, the=
re is
> > > > currently no corresponding evdev axis code to expose it to userspac=
e.
> > > >
> > > > Because evdev has no MSC_SCAN equivalent for axes, drivers and OEMs
> > > > currently work around this by mapping stylus twist onto unrelated a=
xes
> > > > such as ABS_Z or ABS_RZ. As a result, userspace input stacks must
> > > > maintain device-specific workarounds to know which axis carries twi=
st.
> > >
> > > How is it different from orientation?
> > >
> > > Thanks.
> > >
> > > --
> > > Dmitry
> >
> > ABS_MT_ORIENTATION describes the 2D angle of the contact ellipse (or
> > tool projection) on the surface of the touchscreen. Looking strictly at=
 that
> > initial sentence in multi-touch-protocol.rst, it sounds promising:
> >
> > > ABS_MT_ORIENTATION ... The value should describe a signed quarter of =
a
> > > revolution clockwise around the touch center.
> >
> > However, the rest of the section clarifies that this is the alignment o=
f
> > the contact ellipse with the X/Y axes, not the "twist" of the finger
> > itself. In fact, the docs note that orientation can be omitted if the
> > contact area is circular - even though a circular finger or stylus tip
> > could still spin in place, and that rotation would not be conveyed.
> >
> > For a stylus, orientation is equivalent to the tilt
> > projected onto the touchscreen plane (which single-tool stylus drivers =
already
> > capture via ABS_TILT_X / ABS_TILT_Y).
> > By contrast, the proposed ABS_TWIST can be thought of as keeping the
> > stylus at a fixed position and tilt angle, and using two fingers to rol=
l
> > it in place like a pencil.
> >
> > This also matches the HID Digitizers specification, which defines
> > Azimuth (0x3f, rotation of the tool projection around the surface Z
> > axis) separately from Twist (0x41, clockwise rotation of the tool aroun=
d
> > its own major axis), and hid-multitouch already maps HID_DG_AZIMUTH to
> > ABS_MT_ORIENTATION. Since styli can report tilt/azimuth and twist at th=
e
> > same time (and single-tool pen devices don't use ABS_MT_* events), twis=
t
> > needs a dedicated axis.
>
> OK, let's add it then. But we need a more precise definition of what the
> values mean (i.e. is rotation clock- or counterclockwise, only positive
> or negative, what 0 means).
>
> Can we also move it below ABS_SND_PROFILE in the doc?
>

Great! I've now expanded the docs and defined 0 to be in the North
direction. I re-sent a v2 series with these changes.

Cheers!
