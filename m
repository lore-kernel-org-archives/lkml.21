Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795836437;
	b=zHmEb1kQi5IGOAprKEi69OZlL2f19ZjI4ilyF6hx/7xg11xwYTiSd45GHMf7fAtu17Vj
	 Vx5HsB58ACNh4r0xt2Ni01+xez/9Gx2oOGc3uiQtzWlCU3JlLJE0CFfa4uZ08daaMgPFI
	 pjCgB5T5EX4bUeLkRnfHn9KhIvkz+rix1h/i/I+nQdDUNnnzG7Dc+riUv6dCbm7GJHS6g
	 BbeE0y5e4bYp7jkM4ES2Ssctm5j2zxTtCYom7uyFjGCprPkNiLORXyr2TTWmH+4Iadd/f
	 y1nNZfcAQAhRvn0W1YGBxvvNWcBvJFtfUY+sAHLDCz8tdJYvxcofIZhXZzEi4U1v+Wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795836437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vBHWdp137VAn7lA9+DpI0GObYR6F1NE7+wrNWZtHzuM=;
	b=U9fUs+AhgVFD8vG2TnjR1g1/mj0+LvSxYmyMuAJ8U3WRmKpuoDmHxTS19SrGkgWbXvcq
	 O5Vgehi22bBTfI6THvwtsOpcd3958QCh8a66SPQziqvk+0h8Cr7jwb3n1OJ+V5WvDF7wO
	 +x0V9zxOkyrppr1RCokFstgfjQQP7yoGuV1ukKBHoJwabxo8oCFGsY8D9DLkN3O5dOGrH
	 DssOedfEfRr8b/Nzipq5I6hRPp9A8HP1MQ0Q4qcK/qswQ5K/7ZopRfI8uvKYr/nw5FIr7
	 /UKiob4BrfnOspLo+0VsZhRQcZvOhAmblwaJ97EQuKLb3O6az2Qw9Q958Vl5Lc2bwuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXKWfyuW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED60E606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED60E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXKWfyuW
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso3313359b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:27:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795836436; cv=none;
        d=google.com; s=arc-20260327;
        b=eonYRHDhsaYxZF1qNlITH/fN2t3pVQ2ZCkYIYw7GpXA7uu4S+7cyUyTh4gmQfup4nJ
         dQawlQ2cw7y093EWT1VouPV2ax2HY0h4v1TQ173yiJ4MhGjeP3pJSQjRRm09glXSpf0k
         bqoPya/St6tT9umbYztZHgjAqq7YmYZKA5kTu21/7r0w2E+4MAtUi9Ofpo2yhy1zx+0S
         xYQs/ny0xEW1tx/9YgcPLGVC4McRWc7vGhhaLJ4Qp30t005DF5gsNEWA9JX4Ogr4n9vI
         jdRzDEDSjFQRy3VTYkAy075GIrxMw8IQuCEy512J1xgOEeYnMdsOjhEQAh1htmGgN27y
         s+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vBHWdp137VAn7lA9+DpI0GObYR6F1NE7+wrNWZtHzuM=;
        fh=sLHgljIwI7REa2dPek2MXXLcAWhdPj9siqBnwXhLeP4=;
        b=i2P9qPNDv6e6RA7zQv5cgFGSb/3HHaGMytH6Ek1bOjH7R/q3AyBDB7TQcxtokghi9e
         mHJsLvFZk4Yqd3fnd96g2S4Y+L1oEY0oqsElgPgIWdES9Im4T+QmyzO8cDhPbrbD5AeL
         okgvxpsLSa2LJDd0QDRm4PEEX0CknxBVtylAUhV+xkC20ONDv8gQsDEBJpYY+CHYkvC6
         aN8TKNwyQ7M91Zp6N1YHzFqgqTgf/AIx+5e142Ks6cTQQikaE8Jg85cBzFjzFOCZuBNW
         sym7oMdxpRXK9sxIH2gvpaDIQ083mBd5nHzsuIu4EzwY6+2MKeQBspIzwMB3H+e1MYYq
         iNow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795836436; x=1796441236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vBHWdp137VAn7lA9+DpI0GObYR6F1NE7+wrNWZtHzuM=;
        b=qXKWfyuW/twBZM5FnjFyDa6SXiNmJVI6bRpJbUOOmNXR3XOeC2xhWMLE+OsZDUjNRT
         xcIhN2wUyR69ViAGFwLQzjsyiI0vSE+z3iGLIv5RaW7u52Z0WkNPJePI6YSHTdJfRx+J
         9tB7g/ANuqcKHLKkizRkwoXqVu/W6+odlczbdd5gjhvi/9D3ejQ0T+2DVrPELsf6+/L7
         eXdJ9jaGH0JV741glAkjvjoPq67x5uInmSAW+4EgCvB/gL6MuvoKU8qJDrEsy6yKAghg
         X734SwWwTsHpb5HNH1GBSMFhu0KVxM+NSOvU+AGhTqDWWBbdjU3s1wH0WXVCGPFlgHnE
         7bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795836436; x=1796441236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBHWdp137VAn7lA9+DpI0GObYR6F1NE7+wrNWZtHzuM=;
        b=LGM9t8qhI3nFgbHzSM0DYxUL3FbnGdd+WJASXQ/t5/Bcj+0SkVwmlvjS31BGu0JKJt
         DR31oZy82rWWEGgluQhJFGaFWa+r400J9FFJ9Wowg4p90aDF+TZBDB8+LJR1GtdtrBV/
         BNGOaCH/MJdhw7jI8vroDMs0drE19U/JEuXXTTbQSd8Mq+rW2odmn67FGsOvUsTdM6DR
         xwafF1u5C0dnbbsvAgnv55hI+8aA3JG/hULOLFTwwTuYXwMX7s/xq2092tzCrQSL3TGx
         wNjuh2pjMG7HEHQWp+3+OElyGicRDT8qrjjqu2eoigBraA//UTISPRLFstKEOkKfkaL+
         CMtg==
X-Forwarded-Encrypted: i=1; AL+hErEuSejiOyZGx0zCA+m/un80Ir4oCLxJB5FCawinDgtQJeWzf41BMl7KH17VpEaP+GFOTrcqVSJlLeZmS/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m64EQCPCj0K1V8wEwyMQbZhsAgkQs5jJNxZmWnw3qZDkwYlgT
	q9NmYTYdRoiRAfqHuhbMbxxj5YB/2WhM7TFnkkc5JPiYM5indBLfNoThL+tDTWBgFQeH7enVEfn
	/4t52FeEQLpdyeke7xn1KHsmmIM/MSmY=
X-Gm-Gg: AZFdTZfJhE6ymxNU5mQIu/LztARWV0C1Rpm65B7GBaSB1V5b7XYfxza/aGRk2yk19Lq
	U2B5djhyjGRMtUYptBEZqLUh+TM1v2/Lhsi2f1mB4AhXs2kXXElUymmEpZYyQOE8nu5C4//umif
	nrSS8DOlnO5EeFXKpwUSLMiDMjEdVjhiT3/ofdgbi7nFZTOY5TOJp6y1DWADS0qZtW1MUA2NKm3
	ohfUwEqOKhbzrVCTJt+2AWd80aWRJnC6b2iGsCMpLU9b1VtaRQP9SjGw5iAl7FctjHN0Qj+yVCz
	/BakPpEB64CmksIsyRLXnPspIKSrR7Yq9Tu8eJOvaAp7R2YQz+Cr9JQ24x8rEhj2GYGvg7UemIC
	s42R6PbUGQmRvGYkR/QX3g09N+MWGTXcEUXsQYSxVaz3LrH6ZkmS9BmO0Km3VMe+kjypQBql5qn
	QY5NxwkcIs/uxItxC6D4swSIuviZ1dyPwMSO6ms6aq/Bz+2HSw6CJj7OkDAz9xvWRX1IZAgDJk
X-Received: by 2002:a05:6a21:3b8d:b0:3e2:13e9:fbdf with SMTP id
 adf61e73a8af0-4014d4587ddmr27430610637.35.1795836436206; Fri, 27 Nov 2026
 19:27:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260707093004.987846-1-phucduc.bui@gmail.com> <avRbEGoPh3bqR93f@ninjato>
In-Reply-To: <avRbEGoPh3bqR93f@ninjato>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 28 Nov 2026 10:27:05 +0700
X-Gm-Features: Aa3M54p5j-n2pabLvPLN9nW_rTRNPtSo4v-MXvotIWyiblkPP7zdfuetqXMVZyQ
Message-ID: <CAABR9nFt8LDyupBiri3PxDTERAQM0qs+cRcM41TRo1gQVAu+fg@mail.gmail.com>
Subject: Re: [PATCH v4] drm: shmobile: Fix white screen after resume when LCDC
 is stopped
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 7:09=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Jul 07, 2026 at 04:30:04PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > The LCDC on R8A7740 may show a completely white screen after resuming
> > from suspend (s2idle or s2ram).
> >
> > After resume, both Set A and Set B registers are reset to 0. As the
> > Frame End interrupt is not generated while the controller is stopped
> > (DO=3D0), the hardware register switching mechanism is not triggered.
> > Consequently, Set A remains at 0x00000000 even though a valid Start
> > Address is written to Set B, resulting in a white screen.
> >
> > This is a timing-dependent race condition. In some configurations,
> > debug options slow down the resume path enough for a Frame End
> > interrupt to occur, which can mask the issue.
> >
> > Fix this by priming both register sets with the Start Address while the
> > controller is stopped, ensuring a valid base address is available
> > immediately after resume.
> >
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> >
> > Note:
> > It was originally posted in March and has already received both
> > Reviewed-by and Tested-by tags. I'm resending it to bring it back
> > to attention in case it was overlooked.
> >
> > Changes in v4:
> >  - No functional changes.
> >  - Resend.
>
> Still not upstream? Who is the person to pick this up? This is a
> valuable fix we surely want to have.
>

This issue had been around for over 10 years, and it took me two
weeks to track it down and fix it. It's also been about eight months
since I sent the v1 patch in March.
Hopefully, the relevant maintainer will consider picking it up.
