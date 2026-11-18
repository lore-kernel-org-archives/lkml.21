Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975429;
	b=UwRxW1IQCsGMfU5sQn2Sd95I+l+8zWPOGFThETwDqNyvQDI+0LBIysrVmVoERT2YKBSb
	 H4zCjgxpfB2j2QLJNc4F3McrrmprP72KrSUOF6S7/ItGd6vHuo3eI5s5p6wTwedH9i9mE
	 xX88NCyAw4NKQiiCh/RwE9klU0iZLRizqaW+cezv8ty0B/pCnFzxP+5r1zMo4NaSv6CKn
	 vTnM0SDFLPvzQJbKFcwRec443ttMTyg/xC3OqUuR/kM1OkWQUfh02UaFZuuR1EqvBxObc
	 RzDrwGR2e/5y2TiLfUipK+zIdEgiuqHCTXABr88vF921DbrSKYy4w5rrUYQFZ7QAutg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ObB5BTr7jsOYIDsOdgn4jADX1XWHHDmb0QljBTUzZvs=;
	b=hzgBPq8VjiFGRtp0l+dCtNfx3shyCLt/9Al6RNj46dWQZIxrdpqX3du+GN0An/cOAvKG
	 XX2jRtAqUPc4rEKqZZJEeKqz26byY/Y0v229ihQ1EhWqycuQCSQqARiU2Y85oGeldAfcU
	 EUZMkEonlhq2ocX8dSQ5ZL3k6VknMSYb1OBiLtg6xYRdYgD31zQDLMMRMdNEVshytptO9
	 vYufIAEQY1peUA2372/8W21tJthXuCwN3sZp5yVy4ZUw6mDkeq3BB3qcKtBrr/MexGt6k
	 v9D5v+LxX05iLV5geTXDuC2d/upMRwpHtBUNMgycs6tdU4SB3lxHBMYloKlEST6pQWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J5aJpenD;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EAE606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82EAE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J5aJpenD
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50e9408873so58524166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794975427; x=1795580227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ObB5BTr7jsOYIDsOdgn4jADX1XWHHDmb0QljBTUzZvs=;
        b=J5aJpenDnTsPUY210EUpSyBOqauBUy8xcjmCW3w2KeEg0oW9mghjwcqHFkB1uCnYOy
         LGFuswI6EkwssoZO/8HM3ol1N9lRZcOkSX7dKRo+BqJzwYyCwtBA5wKJbTGgPgzlYoVH
         KotwagcoFC/3g9i1zLWsRJy18f7Rc2aN3yb1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975427; x=1795580227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ObB5BTr7jsOYIDsOdgn4jADX1XWHHDmb0QljBTUzZvs=;
        b=rj0vNY/wZAZW7X0pmShmzyfda4E5H+rqFbLeCD5vkwR7i1DgPrMhH7yoiiKV2jQJAS
         8ivEvid6lLZucMObBbhp/P+GErgW6qLuEfzgCHGHaqjtFnFp1gTNQ+VMNkn2CgRBYnY6
         7MXlCQmF067/TMPMNMTLpHOebQdIQNmv4gYVf6hczzl1CNjSvyJ3RNglFAS3c3bXI+4O
         wWgzDzU8YSfL1l+hWt4UqNQFnm/THQuTMeGtn4AHEH78hPXg9UdejRtdA00+AvehY+om
         oAmQle95BjSiq6nOm1Oio7SRXb6n0fh41dH3wibSCjibvsenzrRPVZFFTyHiV5BBZRbu
         fqnQ==
X-Forwarded-Encrypted: i=1; AL+hErFMNgTCFEcRlHWXoN1kB1J4+to9sqcOfY2P0DZf4FAOrznodZ5zn46SbjcqVpYbotME7qOf3+IYMmRjRUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OJi8LRy4urtBA4PBVCTUtqLhxPGgkOqjyyOHC3UuKpy6jW+is
	f9uMRBkdISgXAQzjbNPOXEOKGfGafgIJhXVxHFqZuqaXqyt7fP3mcuSM6MpAz1zY/UJ58LHaIg/
	pgzH+w1x1
X-Gm-Gg: AYBFou1w8JlhRw8q7IRlGOBOWItRajAPGg9x3WvUF+AY+hy0541k90551w8A2LmM8Lu
	3SOiu4JT57DVgpaHQixDg0jKLi8/3TETtCObTh19uWyC/x7yh1BEXul+qbQXYZH4HfJpW2WXzNf
	OIoJ/b5rhEz9GOx4OROwJqQyJFih4PrfG/QbRgoay+M7VGUH1mBx+6vSAyO2MOhkd8WJfDjKV5U
	vMD2YCdtNgKl9EsP93VRBdpmASPjd9QA/7XpbaasxPAYOPgXBKbu74mnpjo242J2Cjd1KpT/QCn
	f17iAHewrd5/Q91E0NWlxvPJSjD+oCuxqEndh+grQcg2xIWj1z3Cg1z9P9bPJWECTZFNtbHTRAO
	UXZMCzDJ+L1ibtW8yBCP5PTrmHkQjSr2BVoWHW4FM9i3YpDU3LM3wFX9iIBBa4TAtfdkou3KUuq
	oXdnj2eC6IqlTkagyTFbih83P8sbM8nhZX67fvtoua3oL55ffEjWPLcwzu5VqnMADtG/cN9gAtt
	o9BeSVS/gEgkM41n/Kumfjc1OT4oKwuB/FRfG8ZkfKAIJucoVuokDYZ6TeWjT+ED6GlJo8XBsrg
	ZSW/+s5Xildeiie9s+1gUSPTPggcey1dAU6SZSwpktPOtvmGS+vXTR6eTZv//c1TD7CY
X-Received: by 2002:a17:907:8e08:b0:c42:102f:15df with SMTP id a640c23a62f3a-c510e199de1mr104476866b.8.1794975426869;
        Tue, 17 Nov 2026 20:17:06 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510cab990bsm52260766b.64.2026.11.17.20.17.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 20:17:05 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso8336515e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:17:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEkZzRKM4mBGo4cYRQLQXT0v1Sm+MAMuCqScwX7XIkHGvQ1yx39SM35cHN4yHeRLf1TAVEX2xEU3zo7lFw=@vger.kernel.org
X-Received: by 2002:a05:600c:3b0e:b0:4ba:73f:ef5 with SMTP id
 5b1f17b1804b1-4bb7da5e261mr24365865e9.34.1794975423253; Tue, 17 Nov 2026
 20:17:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114135251.32775-1-architmore303@gmail.com>
In-Reply-To: <20261114135251.32775-1-architmore303@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Nov 2026 20:16:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WrvpqkEeR8a0AypUZe24GABVXztAsDUSX_eGdX-mVi8Q@mail.gmail.com>
X-Gm-Features: Aa3M54p2JFOXsxd40N6OC1_2keDGa2qbupiaZ8BvzYKarZyYBxstOB6amzQmF6U
Message-ID: <CAD=FV=WrvpqkEeR8a0AypUZe24GABVXztAsDUSX_eGdX-mVi8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: newvision-nv3051d: Propagate init sequence
 errors to prepare()
To: Archit More <architmore303@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Chris Morgan <macromorgan@hotmail.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Nov 14, 2026 at 5:54=E2=80=AFAM Archit More <architmore303@gmail.co=
m> wrote:
>
> In commit 3944ca3e6b7d ("drm/panel: newvision-nv3051d: Use
> mipi_dsi_*_multi(); fix minor bugs"), prepare() and unprepare() were
> converted to use mipi_dsi_*_multi() helpers, but
> panel_nv3051d_init_sequence() continued using its own local struct
> mipi_dsi_multi_context and unconditionally returned 0. Consequently,
> errors encountered during the panel init sequence were discarded and
> never reached prepare().
>
> Convert panel_nv3051d_init_sequence() to take struct
> mipi_dsi_multi_context * directly from prepare() so all DCS commands
> share the same context. Referred to panel-elida-kd35t133 to solve
> the issue.
>
> Signed-off-by: Archit More <architmore303@gmail.com>
> ---
>  .../gpu/drm/panel/panel-newvision-nv3051d.c   | 383 +++++++++---------
>  1 file changed, 187 insertions(+), 196 deletions(-)

When applying, `b4` added the "Fixes:" tag that sashiko mentioned.
With the tag added:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll also note that on some similar drivers we've also had a followup
patch to change hex numbers to lowercase (0xAB to 0xab, for example).
If you feel like another small cleanup, I wouldn't oppose seeing that.

Given that this was found by code inspection, I don't feel this is
critical enough for drm-misc-fixes, so I'm putting it in
drm-misc-next.

Pushed to drm-misc-next:

[1/1] drm/panel: newvision-nv3051d: Propagate init sequence errors to prepa=
re()
      commit: a3621d124f7b1c4d6d31a68fe096d287b52bbdae
