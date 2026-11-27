Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795794284;
	b=iqblQFLI5ioa+7Y4PAbPZQY6tgeoAO0gU4OstpZtuT1ApRfmOVE0leDRZ9OBudCaI8+P
	 5X+UXHLJ4I0DxphSzvh8oUBQ6wqSREyLgvVre1p2D4ZeT3YBFCd2uwM973nJROIwgPfNo
	 DiDYEBO95QVAb7iVOTdBXfD4AZ+i5nHFlGbQ/dIWnpZ5E/I7TiJBTDg5rDazjAE9ET8fN
	 ZXK+gx4x4ti47UrP5kuL/rL1jKxH00lIAZEMREDKi7Fcfnk9EdF6usVkWUgkjF18EbJby
	 azZeox45kuSolrV1U0iH+mEuTxxlOlXNVmuO9zwzQy2tvJr3b76S9rGevdku8kGNCEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=20hIHl3RLMaTBqS+Fk6fMIAVdz1sONBQQ/8y3gKeNGo=;
	b=lMjSe1940xCDYAgxvslo3Z1rUBoIDVqEero4+3O+pLUKCZRuibaTyc0HPxdU+LF4kb+G
	 VZL8pKIs/l2pSzdh8Ezw1W8MVU1o000Uymz1rS8PTkoFLf0mmXAUSstOMf0WoPW+Hc4U/
	 TfTufBwwQriCaTP8bbNin7dygI/BJngE/JUaeQNOIGl5ilRPj0xP9K4cOLT/rquMdKDlF
	 UzmvD9NiSLTOFZlTBCUAd4n9VmLlR0Hf6xhFHsTa36dVDEon4n6kO5cUfPLkPLMEhiaSg
	 Be4oRHAqUOzGIX0+fwaz5x2MDIj38UuE8B2VMz4EgNisg/plLQV5L8w5AAsBUpSBh2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBSs0WoK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D323606A682
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D323606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBSs0WoK
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so58305607b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:44:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795794283; cv=none;
        d=google.com; s=arc-20260327;
        b=pKNWOfMOTyflKi8QgHr2Bu2MYo7PQy9R2YbPvJamMYWOdlgSznyeg8BsKMxo2VxB7E
         0vT5xxjEgbwjRFGtFYeqEyoPziOfuNwNucOcJTk/CiLOVHqadYMz9m6hveITVaRpceHg
         j9DRPAUcx5dIP4+sl7ohGHa0jqOqiHidped3zWMc7nRlaWnBFMdEaqnB/dMmUcAQkJiU
         IHMYSG83WMmvjAQbOWfQujZCb2teoErSCVvfceJ4eLZBQvgO+unTLsPWNrz9fpn0gg1j
         4EELp5cL4BEvawo0F7XkUpJjUu0HGabz11dw29mahC2FWuAxGZSEHfG7Ygf1DuXe37mB
         bkhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=20hIHl3RLMaTBqS+Fk6fMIAVdz1sONBQQ/8y3gKeNGo=;
        fh=a7eINb428L11KyQYjhwJ1NvoK5A/W+7sn4H7SSSGcPQ=;
        b=Cc5YGMRW1aag6S7YDR+820teWGWn10oL/h/p2FxEglXrVG/4DYAsi6zNP/jt4ciAkx
         mo3a01YYR8J773zgJeJ+EReLPmCFkoNx6uvULsenyCaH+jp7OJidhMyayZQdccaac+TU
         pJEknQpRuDzlQltIXEjAN0xzOUSrSZei/ovgKfR3aZOAAorioaO/e4QvGN84Fj9CHWSG
         K1TumRNQtz72gqdFNYI7LbjZbIs6VcAxx2iGvTZ68CKi7QTaNIM9vUZFFBTvnNv1LeWP
         Rh58WLulEuyZHOEEoI4T5XZCZPlwTBMmwkW+BbfykWjpqKdPBlqiEcpydBtQ+sHImu4f
         FzGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794283; x=1796399083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=20hIHl3RLMaTBqS+Fk6fMIAVdz1sONBQQ/8y3gKeNGo=;
        b=eBSs0WoKph+BgARDKxCiAXQoEMQKep8iZBhIk5t+R23v5BKOVwlwSF07dVecJJ3Z+0
         qMsu1Su8j9nbTJoGLJT7Z0qqBLqLlMZ4oZI8NDoZGgKXuCW0uRtMmmRUaDrZ3Th8lnsh
         OTiuRVbBRyuHUCWJvr3jSZQMumoi11s7VfrpAAXcZvqt/rSJlJuKIQu7IRJQQQ4OHCH2
         al+Mn1Hyff8EEeoWH6q/HaPx655Uniq7Mh7GsYOgH0zC9eO6EBVn8+voX7V5TMTkIyOw
         GNZxBGwdcqwDA1lQ1kBjaO1EjTFpX0Mt+V9L/QOTdPjdBgJO8B+P4MEFIeRmOuNUxTwK
         JUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794283; x=1796399083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20hIHl3RLMaTBqS+Fk6fMIAVdz1sONBQQ/8y3gKeNGo=;
        b=0mEdlRYY1hizWA1YuyOLj4Y85KeK4m6wxv21sUjwstUd9Yk+E/K11dd4yrKeoVRuHA
         xFadVf7J2vrQsYwm+mj7hfWgzUmk6rHX66IqAH8tqkK9xKYpRNpwfImugEFH9a0Ek1gB
         ARjeCZ/i/oVcrgcyX9+2o3si0YICeUp/jYy32FXkrDs/+llSUCAYupo6ymA93lHVtxH7
         VDMP88Y36w9TpgMnDA2v63VyL2wvDA+jdSTliRWkpjZX4LqRhiCppy59YAw3bXBT1tFj
         mbhzvJzXDfDoxVKyAWaba9xD4YGOk4NE+S1daqOzextNN32HthplWkxwu27H6F/83tRV
         dNaA==
X-Forwarded-Encrypted: i=1; AL+hErEZ3XFcipJBYx5DJzPca7lVNnqd1TZIDI/boiYaLIHLsl4jkSx/I7zrobeQXF9ngJGMCnbofj0EYmLrQeQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2bYEY9pKsGG9fQyiFTNyh6+32QaMWKyLWD9NrNl9Yw7Ci5rSl
	OR+NgAxmj9gVcma1FG/MjbC8PzTtfxerCvs2QMGcuWdPkGy+ILjdkoTlxg0lALb5EKX8xVY3w95
	6rsnJbZACOAdqvT1NEtxc8LuBHz73kT1wDA==
X-Gm-Gg: AZFdTZfuAvMTMAudsd4kA2PtDlNS13sN9Ybf1SwgkGHUDpO/Jxq1lRIM3gMPZNXDOAZ
	Sv39ybUHXV9dlvySPQBNjJwYs9gl4LQjqxNJx+YLBl3CJP1XqRLpolU72hThqIVKDvZ/UlbgoZg
	R0kzLRVQY1m7Do87ltZv6seoyNMMFavwfyId0YVsUvCbEI2nqhVYnv5JRAMxGGPFkmw8/MO/Ecg
	LcRsORpizvO9Kt2SMgYx3JxNOkto91fxbfpC5I7YFMwkthgH9yMUr/ffdrTt5174jJhI0WEnAw4
	o35qifTlEqsy0SIjKAdW7LMTTKXSWht9311E+/yS52DOq1uS4psTAz4PKn7EEKBVCLs49IKEIHH
	W/fBXLmuN3lLxnuI3X0aTOmtWI4/8nIohGV3JxFmvKDtmvvIJQLtAzpBiKKDElP8zrl+n67BkQI
	l8OCrERpfLvz3haYAf0rlSu00d0p7WnFkpnEPZAQ==
X-Received: by 2002:a05:690c:7203:b0:8b3:5b88:a1ff with SMTP id
 00721157ae682-8b520510d51mr105499077b3.64.1795794282949; Fri, 27 Nov 2026
 07:44:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-pr-fmt-v1-1-3ff6832f5a50@gmail.com> <awhJooa6HkPoKqSH@pathway.suse.cz>
In-Reply-To: <awhJooa6HkPoKqSH@pathway.suse.cz>
From: jim.cromie@gmail.com
Date: Fri, 27 Nov 2026 08:44:16 -0700
X-Gm-Features: Aa3M54o2jG_Z3yd1uKXpyB79RBB4We_Eb9nyFArcsaHU2GACLzlfr6Wqn0l7ldU
Message-ID: <CAJfuBxz3epK54DzVNztCzA=x=p=MPM8JbHkssdNjj4-qBHDtqw@mail.gmail.com>
Subject: Re: [PATCH] printk.h: fix overzealous pr_fmt in pr_debug_ratelimited
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jason Baron <jbaron@akamai.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, printk@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Philipp Hahn <phahn-oss@avm.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 8:00=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Wed 2026-11-25 11:12:53, Jim Cromie via B4 Relay wrote:
> > From: Jim Cromie <jim.cromie@gmail.com>
> >
> > Historically, the CONFIG_DYNAMIC_DEBUG implementation of
> > pr_debug_ratelimited() passed raw fmt to both metadata and runtime:
> >
> >   DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);
> >   if (unlikely(...) && __ratelimit(&_rs))
> >      __dynamic_pr_debug(&descriptor, fmt, ##__VA_ARGS__);
> >
> > While descriptor metadata was clean, emitted dmesg records lacked the
> > pr_fmt prefix present in the !CONFIG_DYNAMIC_DEBUG fallbacks.
> >

,,,
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
> Looks reasonable to me:
>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
>
> Jim, should I take it via printk tree? Or would it be better to take
> it via another three to avoid conflicts, please?
>
> Best Regards,
> Petr
>

thanks Petr, (and John)

Ideally, AKPM will pick it into nonmm-unstable -
thats the most likely path for my dd-classmaps-fixes series (cooking now)
which verifies the test-module output, which this patch alters.
