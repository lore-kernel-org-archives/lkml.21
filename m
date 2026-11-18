Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975909;
	b=Z5B/O3RkflS5sqdBF5U3tNna4pUPFx47gBXhGbX7Vwe/4jKcyT/3aMD5Hj/uioDlaJOW
	 vv/fMeG7/a6ADxFaDUlKPHZmVHWMZqXZ7eFCErzHxQ3ItweGXxy7q7KTCvb0K0AJlN8qv
	 9Id4zCJzR67JuxztRYWm17GCMyWQ5oK/VMGLn3MBYCEeUk1f1WcCTovVDIeFD1Y0iONl+
	 WCmHd3DgnaA/aT6nEqrjHpnDbezglI2jjLlM3d6amk3aoCbkT4CW5PvkuKg1B03ngZI7C
	 rcNJssIt42PW88+YYvSmLpVCn0Jb9qYgY6hHaAkLMHZDC8XIXgdW+WIo74i5gABlchQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=g/y0SanlVtgObYSEwLsEUV68JNF5YijD2dEdh3NZmus=;
	b=Dd4YUd4xtia0Ea8QPjhuhhuovZhETIaEd1boXl3q72k1UyWwEIBZt8WQgte66HDGsFq5
	 zQ9seVGKub1mSqfqPmXLp9YP1VhCWjXffZk6jkUZoqrUMAm/7jTol2jQpweVW0CGMwRAJ
	 poeSikcfnhihy9uOFDAimgssK59u2y/82ogrxYuUrkxh3u0D0/UJ8P6pt0Ye5y721tfrN
	 6+heNCCtD9DuXgIwxaIDBIk6+bzJaDPb7fiTSDgdmOqE//gadymvxvUFK0CvAvfnbf20w
	 0VNSyL3ZQx9/rMyCqhBhRurEhNx085zt79U3TGX00KEV0zd4xrsEbl7u9CPPh6paErA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UfeD+++R;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DBF606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70DBF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UfeD+++R
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4395d31228so70425166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794975908; x=1795580708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/y0SanlVtgObYSEwLsEUV68JNF5YijD2dEdh3NZmus=;
        b=UfeD+++RusFADgBHQ3a7+DiNrW9C/C596dXdE+2xb6rr9RHt+hmeyvoaJK/OKO+x0n
         V91e1gZzMC4LaBikKu3K1Xr4CCcMM/454Lw4WNbbu54ejHueEH/iDxMU4SFt4+qIxb6v
         xfnsaukiQNN3GTnb546XQ+h5LSvPNs/+WNGmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975908; x=1795580708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/y0SanlVtgObYSEwLsEUV68JNF5YijD2dEdh3NZmus=;
        b=FCWN3AK9tnF9xFP4vBwthi99XvZg7EpyKQQTaF/r+hf+a9flcNZn8JIdSi+wJwyyjt
         O4cC4FEeWhxSVY2ewmJmxF8fNEUdv4m/k3eeYjFdvTgZsTd32cgrkmlhNKq5jNsjZvu8
         /fdLn6Ybe7/vNd+7yqeE6skFG2BfuYnOUs2gl5twHTRW1lyCuHNBO6NVFqKhM1wLODCD
         w4CVjny1c59vDOJImbQ5i0F3WYgBEpOHraI0dFiPE+HEXhB2gwNOSP2myPYvP/PuL5k1
         4hsJiUeZMvpe6il6wrLlKWGPApPc1yrwh+oNjuS5fF31aXYoWkrJlxWqa/zBfcmZITT/
         KLiw==
X-Forwarded-Encrypted: i=1; AL+hErG7KnKj9yYmE2SvMlbNU0fTNn6jkpqB0cFT7/HUB2ucfmUg+sFRo3ZQqL3bI2i1haMg/vzsG8YH+9W1A8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yGPDQMPAB/QDxLuDmjYFqcTYzcpyg7ffZMtTkrNeIpmNBDCXq
	UjywaZpaM3MSN35CcZ/+Rx/mgKlQFVAtHh7e5Cxj8edq9iaoP1ZgfoGWnmLlc536rXdK8ZlQjw3
	gDeNoLn29
X-Gm-Gg: AYBFou3xKYav11TXMY006TzIvskPLfJz7RKk+sQP+IQc6uXmBGWcEB3N49d9wJh3ObQ
	uBfmmRghXYXzfakohWHjy0yp5WTEc4ep3jAT86ofa3+Wu3RGg64POO6Owi9hxvSsUA93CNSK4Xq
	p9SpZdcc8+uuD6KVUH2u/KIzbSp+ukTlaSnIZKj2t5M+m5HRkTtwKSmkVtGiZDCmsXOkOaZF+8Y
	J+uJTIb/GThLZNDj3QvpwUaGWGlj2W0ktMUgIaIBECn8bD9Q358XEKpzD1y1YZrn4rh8A1iKzls
	cjYdmueM8avZn0lNPgQaqNFgQWX6murv8ZWa7kEmakehZu3r2nFWCOqToOvdqGt0i+tF62SJmpf
	GGWo5NJxY5aVkzJzM35WztS3Mk2yK9VG2xLwNSMCbZHzOTQd+1lHC2R72CH6IxjRA3vU2eWTHHz
	Nn2RFWQCZsppyLDwK1F1z6mJdfSAQWEK7bG7ob8ZZg24lWckvLNgNXMBCKowJvShG2t6iUOEK9I
	6QFPSil9Id2QnkTHj6geBSYar0N4xmbluqu4hbiT0Q/k1Armq6DH8tynlfOJFPpsc6FTDPy8UqO
	3gELPJQZypsHaT1TOyJ3ZKHBaBlCcGfBeAV+jJXpM8E+LfquYdtRFbpnaEUY8lPnepQjwDkH0Si
	U6Ad3TRVBMZK7SA==
X-Received: by 2002:a17:907:a805:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c510e57d441mr105086666b.44.1794975907840;
        Tue, 17 Nov 2026 20:25:07 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510cb404f7sm53085366b.82.2026.11.17.20.25.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 20:25:07 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso3334165e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:25:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF5MxSLwkT7pI2dT6E6JmGdu/exMag+p6ku5HFDW11eHDMSeRGMvcLbKrWoC/xuD2pQJ0lLxFQ0uF0fsxA=@vger.kernel.org
X-Received: by 2002:a05:600c:a303:b0:4a2:84c:52f3 with SMTP id
 5b1f17b1804b1-4bb7da13acdmr20021395e9.6.1794975905159; Tue, 17 Nov 2026
 20:25:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260716132334.1565183-1-johan@kernel.org> <anx_MPm2Y0RVwZ9h@hovoldconsulting.com>
 <avw_XKo3EzosfyIh@hovoldconsulting.com>
In-Reply-To: <avw_XKo3EzosfyIh@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Nov 2026 20:24:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X5DTqanxUBt9KoVh_93u9EUQm8_B2mnej=+-nxpA81gw@mail.gmail.com>
X-Gm-Features: Aa3M54og-zJOYzu0vMfj1XrR0iPAewvsqdZk6M931gUhwaCa4nfWXvCzQ92vVVo
Message-ID: <CAD=FV=X5DTqanxUBt9KoVh_93u9EUQm8_B2mnej=+-nxpA81gw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-simple: take i2c adapter module reference
To: Johan Hovold <johan@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 17, 2026 at 3:49=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Wed, Aug 12, 2026 at 04:12:00PM +0200, Johan Hovold wrote:
> > On Thu, Jul 16, 2026 at 03:23:34PM +0200, Johan Hovold wrote:
> > > The i2c subsystem currently blocks during adapter deregistration
> > > whenever there are consumers holding a reference.
> > >
> > > Switch to using of_get_i2c_adapter_by_node() which also takes a
> > > reference to the adapter module so that an attempt to unload the modu=
le
> > > while in use fails gracefully instead of blocking uninterruptibly.
> > >
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> >
> > Can this one be picked up for 7.3-rc1?
>
> This one is still not in linux-next. Can I get one more ack or whatever
> is needed for this to move forward?
>
> Also adding Doug who merged a corresponding patch for panel-edp back in
> July. [1]
>
> Johan
>
>
> [1] https://lore.kernel.org/all/20260717143119.1815106-1-johan@kernel.org=
/

I took a quick gander. One thing I notice is that earlier in the
thread there is a Sashiko review [1]. It seems to point out a valid
problem here. I'd imagine that if I land this patch, I'll get a
nastygram from Arnd and his RANDCONFIG testing. Am I confused? Is
Sashiko wrong in its analysis?

[1] http://lore.kernel.org/r/20260716134901.05E221F00A3E@smtp.kernel.org
