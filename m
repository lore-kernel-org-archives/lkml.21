Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795743276;
	b=nk9PwD4E6gsdCwkDUtzxXdrGb01tK6P3O2xGKeCQ4nbvxrDKroYOBapwww+FQ+bpfsWl
	 N8C7JVRDzKM+JZhImLckknl4PB3cpUsvwadj+YUX8XexvlVwWVq6IrTTEVWosPbu1J90s
	 b/+cDuNAojb8/0xQ0V9bS+BwFkour7I7wB49kJhctnvYe/4mXbv38Zr4+djd0VBNlQ1aK
	 dIaW7gdctYSzQj+eA62ah1/NjjZ51oS+xDjitbq/o8hBvqMFKvs6MxdtezDnRrHfRSpuE
	 Bkocc0v+VAj7ke3tyUbz4WMJ3yhpSndN6WjzYJKnvf0KjjQIroWAANhgQY+3L1r9L8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hU2U5lk2837LuV+creZT1TNKTOC/1AOVTgldGOkkXaw=;
	b=xkU6Pg/Gq0T2/0bE2h1S+XNeq49Dn3D89j0et1GUEpopgF09SoCQ2V2PQ6WqaWowQzKr
	 zU0O9Be5OjbhOLR2/2MmpJRlxROgU3Rh+o8FsbtsAe9eOiicod8TXgbpBoT9uq4WkwMag
	 ciRxG7/4NDfQIuHwBSYy7sTl2l98g7E6ILLTV5MvwKLm1Th+TO6ptUELAjplv46ZarsXt
	 doCFdk8aDAIasBsknE3pA9XhG8FCvXO+mdzS+vzMkDUQuW1vFItcaJk+mrEmHdWqW+Tgy
	 b8JRC87l22g/iGIFQL3HnSgWuO6mjOmkvaI27ZoGqvJJyTeFeT+RYGjMxaR0AiZPLww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9jPlAPf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC39A606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC39A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9jPlAPf
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9215934a14cso53213736d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:34:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795743275; cv=none;
        d=google.com; s=arc-20260327;
        b=CHCG9QfqDjw/vYTJlFh33gBK9wdVQztyGMXDFnvqR1vXMEqH2rcrAPgF+aKwP1TOq+
         ZvPGCdOMigxms5xNajYjegspgbEZjGAS/otsLCr5157B2ywiOqdaVV/ETm0PdhbaUqOA
         s02cIC+i+MoLQta0sf0fcpMtdY4+VCGTzIUzZt1zrLuSk/wHOcwkuZV0kriQLJqysojU
         5r7IfAIEGdL8H5zLSVqb7ShxS/K3PRlBJsrtsVl8BFTuVgyxv5QZYcokA4dGIcHYlxov
         vJE+wUByEII9119E/0GaVruRPN0Ta5kScLV9rfVixY+9CPhpgF+pWPpXwSB15tONIzxE
         5q5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hU2U5lk2837LuV+creZT1TNKTOC/1AOVTgldGOkkXaw=;
        fh=zSS3NUqlFIHKJ9h+OaeCR4klksXMmZwkhbyzbf4Tong=;
        b=YRUS1+R4x35ZArklA/RTsDjlrLLbL8DR/l7VImKaGdb87LcgMquwJwY7243/s/mJYT
         2aAbDle/xWJZdDeXp8S1yM8tQLxquTL78Gpb7Ht1B0Outo1AngNs2pjxCgZefLigE9XJ
         N0rod3kUykoBzqvcOFFy+3fWnEw9W/571ZacOFApJfLMjlnP+9zloTW8lrOHb2U4swVo
         RUYmhnLHCa8RD6Aggep4j/RPWR0zoDerQ+BX2wI+nM7UaP3BtRnz4jjLbHA/wtOuSXY7
         JWe8MS0M9cKq5D/rvBy/Tgqb1b9wl/9zUddMWGC0RrTnYoDLXu7WtukLTdNGgjtMZlem
         ZfmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795743275; x=1796348075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hU2U5lk2837LuV+creZT1TNKTOC/1AOVTgldGOkkXaw=;
        b=Z9jPlAPfbk11RA9ZLquc0hQutA2zNbigq3YWXDATzqziE2qrm0/T2BCT8UE1dGGhZv
         Py7XYzq309HhSZvBcQ6Z3S/09YJH+SoNOa0amq9U86WBx0G1Q7bj+UZFv5+oVbvqHcdG
         91JJgW0Qc7j6CpnhiO7VlylYkVuWWUKRSJYN/IFA2jPIdpgsns3PpwYNKs1kHTm/KPwM
         Cv+AGWCnatJOXWoBwMes4DY3EgADioFGvE8nYqS8udCNcXaVnp1XFqJcCEBeorvGZmwH
         tL9onYYGc0c8U+bAgZay58nUbfOIz6/7h831VhX0qxuN7J6FQqpKw888dhyp+jQsfiIm
         sjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795743275; x=1796348075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hU2U5lk2837LuV+creZT1TNKTOC/1AOVTgldGOkkXaw=;
        b=lE759M/G6gJIXRlfuGZnri6E/MH7DU1wi6j04HIuMOtAUYu+iwl+FGe7yAasjMnRj7
         ZXw2eeOnPFYb8HREkVibOPaIFwWjxy4Nvrth9464kqSnbPtF2JHRVVGnelQ0W5J0uMEJ
         3Ob4Xmlf2PqEhKVmwqOoT4yPv2uaEuJejsHMrFVER33aFVUNY3tWXO/CA3Zui2sJ2JkP
         Oyt9SrUnHTevr2wqWanU/js7xC8q88VUN8dk2ohbr32kX0EXwiYIIJ0lwM9e3F+hECg9
         +MOnC4TpXxlWYg7u4FGxXWMPaj18M3IyD8GLWFu8vWbrJcT3t/KarneihMgsV3GYj1kP
         zo0Q==
X-Forwarded-Encrypted: i=1; AL+hErHUs9XhE2r+kJKzksMTeIufAYOl+PXKnUevviFsald/mCgFCzx0Wq1waymOTnb/RJ9pn8EuVwez6kfRwgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z99XGj2uxKxtg6sUkC7jzqf9O3i+yDKUv42y2durUDQxoK5yx9i
	dkDIfScs838FqX0fyrMCVK1QVHlTq9YDQgU747DDmnRw/A1FciMpMkDkPfjVuunwy5aAmkEmPSX
	SZD2l0pzy0X/9dQlRA9y3sZ1nKw3oNLM=
X-Gm-Gg: AZFdTZc4dFr2LEMa3ZQKhjxwbz7ta4pJdNyAb4v16x+zIvGduOGMdp2TIr62YzA8HGW
	nWCAOrGmuf6MzvRzgHZumzavNAgAkwyFV9oNS0wqTkq9XkslmlJPI/Myd59Mvt0Rcaa90k9IlOH
	G7NXgewllOvzY3rWP3FD31rjr2SUsncfBBDIC4ESojSUFKUrIPu1SCtvsR3jFIe7Vpdzk7sh/cu
	fVP7pwqEJ2nbe63U5mqVgTUOYxq2PCua9WHePqEMasdU0S7hPxhleZbDwZ0ZzwiKSTJMeDOUu+R
	1TURUA5Li752Brbtg7C8soDSrawFstNPSXU8EzFlkH8za6IhwfBfke6cq2A+TC3W0J+E3H6LKh6
	EecmRyAZJafrV7X28Fsxrxi48KWWCqKkuotgY
X-Received: by 2002:a05:6214:5f07:b0:921:3867:1bb0 with SMTP id
 6a1803df08f44-9214220c37amr376789406d6.24.1795743274810; Thu, 26 Nov 2026
 17:34:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127004411.109585-1-artem122novak@gmail.com> <awjaHB2ugCG_F3Io@google.com>
In-Reply-To: <awjaHB2ugCG_F3Io@google.com>
From: Artem Novak <artem122novak@gmail.com>
Date: Thu, 26 Nov 2026 19:34:23 -0600
X-Gm-Features: Aa3M54r2A9iEKs22yG_w3K42aATDwZjN-MFk4H_IHS7ixiYAkVkVNmajCvdJ7Gs
Message-ID: <CAPufuhb9txcosy48VXtfxwnC7Ct448J=_HbR00JnZR1QG-NfHg@mail.gmail.com>
Subject: Re: [PATCH] zram: validate decompressed page size
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: minchan@kernel.org, axboe@kernel.dk, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Sergey,

On Thu, Nov 26, 2026 at 7:19=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
> Yeah, I don't think we should do this.  We only ever compress PAGE_SIZE
> buffers, if some backend decompresses it to a something that is not
> PAGE_SIZE and doesn't signal an error via "ret" then it's a bug in the
> backend and zram should not cover it up.

I see.

I thought it might be worth having a defensive check here,
since allowing an incorrectly sized result to propagate seems a bit sloppy.

Do you consider this useful, or should I rely completely on the
backend contract?

>
> On (26/11/26 18:44), Artem Novak wrote:
> [..]
> > @@ -185,6 +185,8 @@ int zcomp_decompress(struct zcomp *comp, struct zco=
mp_strm *zstrm,
> >       ret =3D comp->ops->decompress(comp->params, &zstrm->ctx, &req);
> >       if (src)
> >               kunmap_local(src);
> > +     if (!ret && req.dst_len !=3D PAGE_SIZE)
> > +             ret =3D -EINVAL;
> >       return ret;
> >  }
>
