Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672773;
	b=OEAqQ7Gh/5NMp1Q+OsleA5qQa1EssIac9M/3t3Ns++WyInQlH6uQLxGW5+kG+Hdwf47R
	 dmuEYTITCFZFBD5tDqiuZ2f3oAJEBNiF82yNn9zc/FT2DiX6CPo5trVFs1Pis17rBVWmi
	 gsxetWMJhbOKYrGMV3wZsSfipidddcGXkXMzYxI+nLTCwvhwZhEaLWVIyCvGDNLvkW0FR
	 ORem8TT/FOTM1S3+1LOP+k7DIRGBrh1uBSDbb443L66ptnGEVz4/k09QH1OqsH67dm3Jr
	 SWCmjzO8UNxdq4ASb+XdKhjHyfldoHYtxA6EIIb7vMJeBUjLf43pTmGj8iPPdyWqtMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672773;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VsisjEdAcEQoikyIb1phqdw1n0JZDLyJ/MLeqYyqG0E=;
	b=wnJMp0R15/FyOXPWry/4e6uKv9bG2Qbhst6i5y+WSiFq02rnyPVYbCAJWa1JLhido0jH
	 ORqW7+aikZfj+brPjq/KTZxPuu+pF9O4jWYtLS3u0jlBdMxawFIGU3gfEzfq4sZzXDVnb
	 Cv8XyPxAkjqquV1ECAJRRntqI8ZTi6VedMctmQkIl13rt7p06C3rY9YiGppFU91VWfk7n
	 XvvB7FNhhdsNIOPymOi4TVqE4AK9bvgT5Wp6FSB+suCaOu3vpbfnkzpglXhN+wocD0bxb
	 mr/lpp+Ps58RK96CJ2xX1vUlS1NiMRO3PuhoalVZYMkcmCGooLs+k3cPkVe1rDwxizA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jX5gf0s3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E81606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jX5gf0s3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF381F000ED
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795672772;
	bh=VsisjEdAcEQoikyIb1phqdw1n0JZDLyJ/MLeqYyqG0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jX5gf0s3CFTwpoga7V0Jihxldl3viYJ63kjPyV3ognxDwWErcdcRKbm3bvkVNtBU2
	 /gBef46Y9q6v5yjRZPQ5ERn7s96pnEvbPHj/hsqaTrZDKdlNtjs/gOGFRJorIPII/H
	 bDslLOelA2fmLqD+NzeCFSf8kKgIx6SCvT2EoImDnO8WdBVabWYTR6y2F6VyiiEzEG
	 wealsmoaZV/QngF7f+H4i4hMppmO1Rh2P8k0w1RBuuNxkQUc3JY6P68T4ZFZeXYM5s
	 xmYP6BvFaraGVv3bDpSb8IAuF9frERxVKFq2lXAXG8hrQVNDyqe3GCwOhmIOvfFLV4
	 6eJDSJLvk/EgA==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c513a854320so206795966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:59:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGK5ybh/V0O/+hcOaOPKo3XY9Xfvgn6irFvsJFPrCBWC4DPAGxXLIU64zC3rrAdOGm8zTZz6FCfDVE41oo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8O9YjV2jUgC8m+/C3OyvxVgZb19ig3xV9+Z3ZAd6q6otTP820O
	G1ybxU6QGqr7sCrU2kZcdJlTGzROJ+LlRxaZwBT5+LhNwkNt6ZqJr4Qd/kT73PtXF315DznhJEr
	dllZgSzcg7dA8yTMEwsoSZUfh+ndhO2kfaMpAnU1pQw==
X-Received: by 2002:a17:906:da0e:b0:c46:a72:e0c3 with SMTP id
 a640c23a62f3a-c513a84dd04mr1356707266b.16.1795672771599; Wed, 25 Nov 2026
 21:59:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795439990.git.lianux.mm@gmail.com> <3e8d55101602d5ec982ae636eaf5eb4dcaad3ba8.1795439990.git.lianux.mm@gmail.com>
In-Reply-To: <3e8d55101602d5ec982ae636eaf5eb4dcaad3ba8.1795439990.git.lianux.mm@gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Wed, 25 Nov 2026 21:59:19 -0800
X-Gmail-Original-Message-ID: <CACePvbWzE6AvbLzNFe=J5Vid8iy6FFQh0RBgr+V_jJJ4p=OEVw@mail.gmail.com>
X-Gm-Features: Aa3M54oIbvTBzc16n1b5zBCTLN35erJwZkNIaRd8dYijTduchcrgfU7gWLxR6Vs
Message-ID: <CACePvbWzE6AvbLzNFe=J5Vid8iy6FFQh0RBgr+V_jJJ4p=OEVw@mail.gmail.com>
Subject: Re: [PATCH v5 02/19] mm/swap: clean up hibernation error handling
To: Lian Wang <lianux.mm@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Kairui Song <kasong@tencent.com>, Jihan LIN <linjh22s@gmail.com>, 
	Kunwu Chan <kunwu.chan@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Thomas Gleixner <tglx@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:16=E2=80=AFAM Lian Wang <lianux.mm@gmail.com> wro=
te:
>
> From: Kairui Song <kasong@tencent.com>
>
> Restructure the error paths in pin_hibernation_swap_type() using a
> goto out pattern to avoid repeated spin_unlock() calls and simplify
> the return flow.  Also simplify unpin_hibernation_swap_type() by
> making the si NULL check inline, and clean up find_first_swap() to
> avoid an early return inside the loop.
>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> Signed-off-by: Lian Wang <lianux.mm@gmail.com>

Acked-by: Chris Li <chrisl@kernel.org>

> ---
>  mm/swapfile.c | 39 +++++++++++++++++----------------------
>  1 file changed, 17 insertions(+), 22 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index c06f9f532e74..0ae901296731 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -2331,21 +2331,18 @@ static int __find_hibernation_swap_type(dev_t dev=
ice, sector_t offset)
>   */
>  int pin_hibernation_swap_type(dev_t device, sector_t offset)
>  {
> -       int type;
> +       int ret;

Nitpick: Here "ret" only carries error code. Maybe we can call it "err".

>         struct swap_info_struct *si;
>
>         spin_lock(&swap_lock);
> +       ret =3D __find_hibernation_swap_type(device, offset);
> +       if (ret < 0)
> +               goto out;
>
> -       type =3D __find_hibernation_swap_type(device, offset);
> -       if (type < 0) {
> -               spin_unlock(&swap_lock);
> -               return type;
> -       }
> -
> -       si =3D swap_type_to_info(type);
> +       si =3D swap_type_to_info(ret);
>         if (WARN_ON_ONCE(!si)) {
> -               spin_unlock(&swap_lock);
> -               return -ENODEV;
> +               ret =3D -ENODEV;
> +               goto out;
>         }
>
>         /*
> @@ -2354,14 +2351,15 @@ int pin_hibernation_swap_type(dev_t device, secto=
r_t offset)
>          * the same session.
>          */
>         if (WARN_ON_ONCE(si->flags & SWP_HIBERNATION)) {
> -               spin_unlock(&swap_lock);
> -               return -EBUSY;
> +               ret =3D -EBUSY;
> +               goto out;
>         }
>
>         si->flags |=3D SWP_HIBERNATION;
>
> +out:
Nitpick: Maybe "unlock"?

Chris

>         spin_unlock(&swap_lock);
> -       return type;
> +       return ret;
>  }
>
>  /**
> @@ -2441,11 +2439,8 @@ void unpin_hibernation_swap_type(int type)
>
>         spin_lock(&swap_lock);
>         si =3D swap_type_to_info(type);
> -       if (!si) {
> -               spin_unlock(&swap_lock);
> -               return;
> -       }
> -       si->flags &=3D ~SWP_HIBERNATION;
> +       if (si)
> +               si->flags &=3D ~SWP_HIBERNATION;
>         spin_unlock(&swap_lock);
>  }
>
> @@ -2480,7 +2475,7 @@ int find_hibernation_swap_type(dev_t device, sector=
_t offset)
>
>  int find_first_swap(dev_t *device)
>  {
> -       int type;
> +       int type, ret =3D -ENODEV;
>
>         spin_lock(&swap_lock);
>         for (type =3D 0; type < nr_swapfiles; type++) {
> @@ -2489,11 +2484,11 @@ int find_first_swap(dev_t *device)
>                 if (!(sis->flags & SWP_WRITEOK))
>                         continue;
>                 *device =3D sis->bdev->bd_dev;
> -               spin_unlock(&swap_lock);
> -               return type;
> +               ret =3D type;
> +               break;
>         }
>         spin_unlock(&swap_lock);
> -       return -ENODEV;
> +       return ret;
>  }
>
>  /*
