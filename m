Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022089;
	b=n800Z8jqUShjve/nN1iliozJQ25N951WVXqRA1GFcZPfmEGZ4RCt7vg7arBCRMPtDw5u
	 KyHPvbANWRLxhijXjeG2dm1gCMkidfaXI2mYSu/7rMo72YZun2hEyJGRINiBsmv2UD1C5
	 NfjRt63TMI4z6VrZOJHTXwo0dnZ7gPcWq/DWpvR2rd0Lib4YxZYL8WsoHByBZSHCAuqYy
	 RmI+GGB3W50RSmuSG4E5OEB8ZG9HYkrvP2+y2lEItRHsTF0iCanWozTdC/pHBiNkQc7FJ
	 6oRIC5wkaqW5a9fVjWlGjw4cKORHnvD/yiW5GzVLETe4qQT5qpcbbNASAfL098SbHWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=veMOh1w+VgYOzxTfgQ657fK24oJmuF7rksxyyZSHFRg=;
	b=MrFKKtmYiBdHDjkK3wEcaQg2r7EsETnIL4ZQ4Jl/3sxpwk2XLWUNf296MTZsPMCBscq/
	 XVSerG9Qv7EKXVrWcpXBo9giGcO+po/tE5GmFllcqrLsAJTMRJn67MXgAS5B1Ew6BjKu7
	 RFlYO5Hv7Ee6qEPkP8jvAZk5b/Mx/GlvF4W3507UQo/mI3UlCnpgLlqRqP25d/ojiJi2F
	 6B28EmuDU6Lhq2wBKgSq/T0CAHa/2qzeFhBP7GRKhh1qunm/F/7RuBp/6jVq8ZuoSlFl2
	 v2c1+r7pdZsYtHt7iFzgptoiCgcZjV1vM1uhPDuzTThJOyqGgNBi25MCUmpyRHdbR8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=buOcGVpk;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD65606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD65606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=buOcGVpk
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso2030049a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795022088; x=1795626888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=veMOh1w+VgYOzxTfgQ657fK24oJmuF7rksxyyZSHFRg=;
        b=buOcGVpkEmzRbWtrzBOA1SGV0qr7GkxfbSBniw935q1u82gs9S+OIMil7i6e04IPLA
         KYQeIhDpzwmICGh2PBi9+F6n6b1djtV8QVs78t/T9+GfehNQFDjK4UmTBZhTrYrUiYC5
         9YeM6rgBTYJWCTVzWx5TvRDNkyujMuPPFm2Pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022088; x=1795626888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veMOh1w+VgYOzxTfgQ657fK24oJmuF7rksxyyZSHFRg=;
        b=OcnzRgiAm+4KvVHKGiL4yyPGqUlhhll3N2uiyPh9h5+poB2d7ymMVDbfXJRsuLZFTW
         RdRuzDhiEhTfRk8Z8kHLjqIxhK8j133wb0PeY3e6XitIfkKxSdP1JNthj2nhvG3ZHeUN
         CE9ZjVcvpzt/BstrPXcSB4p9vX3vSqGj/7X6XcdUuxlqLVtkSw26sZw+aX7qA+pt3FJY
         MbR84IUX2J/qk7wnZ3VfJhnmrteTHoNMxVEgIQTNeO90qcgfmIqkv/I7bMNbIQQdawPK
         3KtE5ZfhuU0uGzYXyS4JW13F7IzEnjcGr6X1kmklh8rIKfofSeA27EkdrkYwlxhgSNYt
         uhqg==
X-Forwarded-Encrypted: i=1; AL+hErGP5SSG8pd8tkeiX6pPOvjhmBeKeYByBwKi2um7UDP+rDr0pQvM78JZTnI8CNFMl+POdPXIBtuTQbX3Yj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vm9ZC6Mx/idajqc8/RFZQtiaqd63jOB5JvNXaYfSH4GcBT7ly
	XSAY0UC5uO/O9aYu9Ww52y+zABCpG68/CWnHy/vg2UYhHXxhop/dR9tPEWUnhR34R0F1HRcVvN/
	1W76gR3h7
X-Gm-Gg: AYBFou2XlN6n4sMIrEXwhgs7aLV9Xiu9eeNq0dL0jDu9nl7FNIi7VDeeXtvCeoUDQiL
	lahrlPR/ordPqUCRxx/PgLzTK6FiioVTjnC+K4eSt8Taw81Akw1bz4yThIGzUs62oJX/o1DTxMg
	8rHNTJNRzQGMEoSBw4pzzwRdo+rwrZMjYdQoJtOZeeq2t7rsebYS9mBW1AxM0CqvfLlW29MMBQQ
	Fgr0CE9dmrpRxS5lfTsLnOMHTEj/fmEPSGldPYYbQI3OPU6oSmWbUYkKSNrlTGT69GAOGSD+l5l
	qqUENSSWEx3OjkxieEs5YXep5YltyWBRlHEs4/wRax29X/ZZYAszYUnAm2lKYNAZ0KSbGd9nrbx
	KuhIRyOpRbxNg7dkQZxcxKgNwpo6H5Loz8swN2VMXpY7zXX0SHaAF9WnexdN8puIED0o5tWjbjl
	FJ7UsBHl7dPF8tOoJti5p2OST2omNTClgHmV9I0n8+7ClJOvjjF0fXGTFp/qQAO198E7TmYS8O/
	oqRshbwB/i+lar2BqxUOSgsW+cyCt+fXShG+ED59/v0KQEdZ8T0pH08gf1b28AsDUu32mCvtWlV
	+YPzAA5WR3B/FeKslI4MF9uAJx+NmFeiG6SCtNItfGRrYK8qC7I5m/F801A3gSfx+akdymO6qJJ
	7frpyzId5fplRwQ==
X-Received: by 2002:a05:6402:ea7:b0:6b7:8444:a456 with SMTP id 4fb4d7f45d1cf-6b8877ed544mr2673781a12.0.1795022087746;
        Wed, 18 Nov 2026 09:14:47 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a1eab52sm1345028a12.25.2026.11.18.09.14.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 09:14:47 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a5506f09f5so814477f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:14:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHknAKpYOFwc9M0UWLoQYhogHnVG4walA6381O5nREVFB8/HGGYiTAshVtDOWw7UF0kVYSxaApzPprh57w=@vger.kernel.org
X-Received: by 2002:a05:6000:4706:b0:48e:5df9:1ec9 with SMTP id
 ffacd0b85a97d-4a6389ee18amr7563261f8f.24.1795022084796; Wed, 18 Nov 2026
 09:14:44 -0800 (PST)
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
 <avw_XKo3EzosfyIh@hovoldconsulting.com> <CAD=FV=X5DTqanxUBt9KoVh_93u9EUQm8_B2mnej=+-nxpA81gw@mail.gmail.com>
 <av1Q8B27DkF8Iv2W@hovoldconsulting.com>
In-Reply-To: <av1Q8B27DkF8Iv2W@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 18 Nov 2026 09:14:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U9Npdo3da+Hr8sb0DiSrrwbVocMVyyUnieJONoZ=Q7EQ@mail.gmail.com>
X-Gm-Features: Aa3M54osESd_4l-ScPsWj48EQ0uAO7q3qxUcSdmQmSBrC9QG23r9DoJATcHJQCU
Message-ID: <CAD=FV=U9Npdo3da+Hr8sb0DiSrrwbVocMVyyUnieJONoZ=Q7EQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-simple: take i2c adapter module reference
To: Johan Hovold <johan@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

On Tue, Nov 17, 2026 at 11:17=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Tue, Nov 17, 2026 at 08:24:53PM -0800, Doug Anderson wrote:
>
> > I took a quick gander. One thing I notice is that earlier in the
> > thread there is a Sashiko review [1]. It seems to point out a valid
> > problem here. I'd imagine that if I land this patch, I'll get a
> > nastygram from Arnd and his RANDCONFIG testing. Am I confused? Is
> > Sashiko wrong in its analysis?
>
> Thanks, Doug.
>
> Yeah, I took a look at that at the time and I believe the LLM is
> mistaken as DRM selects I2C since forever so the driver cannot be built
> without CONFIG_I2C enabled (and you'd have the same situation with
> the panel-edp change merged in July).
>
> I started cleaning up the I2C mess but got pre-empted. I don't think
> that should block this change.
>
> Johan
>
> > [1] http://lore.kernel.org/r/20260716134901.05E221F00A3E@smtp.kernel.or=
g

Ah, got it! OK, then

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and pushed to drm-misc-next (not -fixes for the same reason I
didn't send the panel-edp patch to -fixes).

[1/1] drm/panel-simple: take i2c adapter module reference
      commit: eb2d05056f5c65fae6e88f6d935f3f7089badf00
