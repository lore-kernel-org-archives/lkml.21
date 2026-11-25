Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610732;
	b=HpFfPcX4+RbyfIyrZ+yrUoEquC7MjLeBInEKEGYd6pEZiQYGAH2s6vcf4wsgcLzGqxtn
	 xpRVcMtuc0vuApR3hALpNwD+coU76jDKM17MRpaqAZJst9ZBmaImHtum/b/aIHZWVYkvk
	 gd1YaedBdbttM7SLbBh9mkAqyVbSVPUQf+OdSJSUZvLBQcBuE3Aw/F8+14AuYoPMHCChc
	 IiTkuLxHQZ3ZVSaAPgicDtyHE0/IdlV3qBaokAOvx+/qui326ODvo5x8n+o7hW8bGbOf8
	 TLtBe4Huvmy7jWXfjy2118JODgDKTPAJNZPfqmB+WKdI++CQr16Tm8g9BMjhS8EbnNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=j8tGJOMZL0j/KUQBnDfeHMeTQs27ZK0iqIQ4+ayeZUU=;
	b=SZ67OkOSIqmFpoxtln7KyDzKS91oN8IPajZz+g/qXVoXMRsWV+24w7cFQoFrWDVLQfbD
	 pmwHCdltWgRAhbBiIBEqeSSfA/dhva/21Xhryw0FxBl1boEdcW2FtMgz7AA7xRQpUBBHE
	 qZE3RLXwY0ASyTSFJC2Gy5HnWLSuN4oWtTye76/HYBgQ+xFJYS8rCSa7dRrk7Jaw+n7Tj
	 3QKZjMOEKAj21igZKL5+CXHS5JcrD9pk1KItTaEYNxMz92KUDaVQeVKmeYPUSyeR3mjVK
	 jtDodySI1/9Uv4/3ZbirBuPELMCmJ15hrL2BbKqJzVpe0sqiWptUN7581lMu48e/byg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Dn8fSjUJ;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E982E606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E982E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Dn8fSjUJ
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4aa5833c263so5500874f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1795610730; x=1796215530; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j8tGJOMZL0j/KUQBnDfeHMeTQs27ZK0iqIQ4+ayeZUU=;
        b=Dn8fSjUJZ0W18CxI0+QBCtqPSCauc1BDi2lAYnZcUk/CGqeLcNTTMRBQW33oo9lIRF
         +qyvu2+iBnTdmOFaW8crfcRdDgjN3stD2TkOd+qiSFU64QZ91RZmDEemG0ULNn1RY3iC
         YFRu8prBJbwhpYRseFCHzdI0Xy1Rs6KvgbX+GhlEhKqDdK0OiWEd9dn9waUHZAoXcjMT
         SsjAuOt7MYheWutuyfu5btVDQIYz6unWA7QWHe6zy/Iegke+cOWGKKoWX05Ks4iYqUbX
         fZKTbaTyilEi/ETmhcznlr4c5D33jgH/U5Dd3FRA2SHdt5WUlH57N475qAk82MjsS/J+
         uPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610730; x=1796215530;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8tGJOMZL0j/KUQBnDfeHMeTQs27ZK0iqIQ4+ayeZUU=;
        b=jUQ9Fsk32gqb+Yg4bM2CVDxjZgZEVBDTIuSGrXOPB+Gg8y5cOrZ0dcR6Ip/8ofPRWr
         zDY5Fd07IMO+yX2/RM9Tbwg5qk/GHTB97JT0DH2C/XTbUG0kJ7bdDuqbv3Jw/8MRRCm1
         1SrGQ3gEPB9X/32A8JMTYi2t7U5bmsngYBfmyAemYiQD+loKxz5+2apEGEY4CDAs6pZi
         nbyMHEEVHpBQyZwbaoCJ/bgBghGTKsuMOBRXz74kaR3NlTRipSyeTduFwCCuB9BJgn36
         QQ+VBMar3FC+WuAnU2ztj2B+E1pPa3spTwVTxuVQIBLPjIVebVCaSIGQzbtXV6yVU2M5
         i2RA==
X-Forwarded-Encrypted: i=1; AL+hErEBwpdx0ribn6EtrbwMvaJ/x41P4iEvjvOVp0kAI+wQJxydmWTAQ/snQgfBUYiZ4HIDoi7raIM6urXb46U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x3mJ8+Uks4ifO0Aa6YNnWFe0q4TFVgkz8+swjeLypTqGuT7YE
	dho+fbu2jGlYW9p0d3ewcgm6JhaP35qEQodoBk6kXBbFIhowLBiNhs04iGeDEjfbZEBC
X-Gm-Gg: AZFdTZcQC8k0sgKK0zOHSSIHxy1ntHK7PEJLkRaKLwl2OKSNDw7ae80uAxsznjzseoV
	5lIl6tK1L5rdI03aWyrQm0Uozh5KIuuDD/eJ6QqPPFy9RBMCz6COc0Q4mbvnXkNgrPGmhIHOtUL
	8sf3M49Q2cvMugsS/7ZIX8XdlAMjwmzWXi4dAqdSN7tfG6Y2Cq+MNdLxacv1bsBZypgFauelLGO
	U/cukA+NKnxUkDYre5z+g6bdL5PSLroxN/neDfTvTAGDhegMmb6imQFZ7JDQ4p5KD2NLG3CMTeo
	+HNbvWzKrKJClrTXJ/LWJzaqRyZJcWBq0tgukFzEHgTerL+IbfdFikGfV61LPFkvm2a7FmkUf7w
	yUcOKudi7GA65n+15PJpJGNO2br6JAX0szdvYoj2RGsxWGhHHKcr3W/o3K9jMvzL6GAUztArq3B
	UrWmH2w+agbTNKdLXGAHO6TF5LUIfvEQ9qxcUNFGyeTRh32IauDY2QeBejpumeFsUQrNdFlNsXN
	/MgO2+MUdgV9ZZC4kKgV2eHNOP21dcKcz8F1z9hMM5Xae6T3B5wvsh/PLIelGw+aQUDc3wXHH5o
	TdfASQa4zouSRdbliSJiZaUlEKij0ZJ2+5AKy1XEQ5tOdJJPVAp7TInnuSs6KwH2yI3+i0pREoF
	zyWMKJiiwclcoZJf+9jBHv2vIuyim1t7BRm3cHhKAh8DKHj/ma/+CjA==
X-Received: by 2002:a05:600c:8184:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4bb8881e969mr338093175e9.28.1795610730212;
        Wed, 25 Nov 2026 04:45:30 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:c235:97b:8b16:8928? (p200300cf572c2800c235097b8b168928.dip0.t-ipconnect.de. [2003:cf:572c:2800:c235:97b:8b16:8928])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba3d3679bsm34001885e9.2.2026.11.25.04.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:45:29 -0800 (PST)
Message-ID: <9f460569c2d4236f470231a5cce0b6086c612e19.camel@amutable.com>
Subject: Re: [PATCH v2 02/13] fs: add d_real_data_inode() and
 d_real_metadata_inode()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, Amir Goldstein
 <amir73il@gmail.com>, 	linux-fsdevel@vger.kernel.org
Cc: Chris Down <chris@chrisdown.name>, Miklos Szeredi <mszeredi@redhat.com>,
 	linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, 	linux-trace-kernel@vger.kernel.org,
 linux-integrity@vger.kernel.org, 	linux-security-module@vger.kernel.org,
 linux-mm@kvack.org
Date: Wed, 25 Nov 2026 13:45:27 +0100
In-Reply-To: <20261116-work-ovl-d_real-v2-2-90564c4ae347@kernel.org>
References: <20261116-work-ovl-d_real-v2-0-90564c4ae347@kernel.org>
	 <20261116-work-ovl-d_real-v2-2-90564c4ae347@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 10:43 +0100, Christian Brauner wrote:
> Currently, d_real() can't fail. When overlayfs fails to look up the
> data
> of a metacopy file in a data-only layer it hands back the overlayfs
> dentry and callers silently work with the overlayfs inode. That's
> more
> problematic than current callers realize.
>=20
> For trace_uprobe and bpf's uprobe_multi it means uprobe_register()
> fails
> with an -EIO that has nothing to do with the actual problem. For IMA
> it
> means the stacked change detection is skipped and for IPE the file is
> evaluated against an inode that has none of the properties of the
> real
> file.
>=20
> Teach d_real() to fail and teach all callers to handle errors. This
> adds
> two helpers for the callers to switch over to:
>=20
> - d_real_data_inode() returns the inode hosting the data or an
> ERR_PTR()
> =C2=A0 if that can't be resolved.
>=20
> - d_real_metadata_inode() returns the inode hosting the metadata or
> an
> =C2=A0 ERR_PTR(). overlayfs never has to look anything up for the metadat=
a
> =C2=A0 but we don't want to promise that it never fails. So callers handl=
e
> =C2=A0 errors for it as well.
>=20
> d_real() can't fail yet so this is a pure preparation. d_real_inode()
> stays around until all callers are converted.
>=20
> No functional changes.
>=20
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Link:
> https://lore.kernel.org/all/CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo91QjJH=
H9T_Yw@mail.gmail.com
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0include/linux/dcache.h | 45
> +++++++++++++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 45 insertions(+)
>=20
> diff --git a/include/linux/dcache.h b/include/linux/dcache.h
> index 84b0cfe4ed0e7..a75016a713d4a 100644
> --- a/include/linux/dcache.h
> +++ b/include/linux/dcache.h
> @@ -3,6 +3,7 @@
> =C2=A0#define __LINUX_DCACHE_H
> =C2=A0
> =C2=A0#include <linux/atomic.h>
> +#include <linux/err.h>
> =C2=A0#include <linux/list.h>
> =C2=A0#include <linux/math.h>
> =C2=A0#include <linux/rculist.h>
> @@ -660,6 +661,50 @@ static inline struct inode *d_real_inode(const
> struct dentry *dentry)
> =C2=A0	return d_inode(d_real((struct dentry *) dentry,
> D_REAL_DATA));
> =C2=A0}
> =C2=A0
> +/**
> + * d_real_data_inode - Return the real inode hosting the data
> + * @dentry: The dentry to query
> + *
> + * If @dentry is a regular file on a union/overlay, then return the
> + * underlying, real inode that hosts its data. Otherwise return
> d_inode().
> + *
> + * The union/overlay may have to look up the data first. This can
> sleep and it
> + * can fail, e.g., because the data is missing or because its verity
> digest
> + * doesn't match.
> + *
> + * Return: The real inode hosting the data of @dentry, or an
> ERR_PTR() if it
> + * can't be resolved.
> + */
> +static inline struct inode *d_real_data_inode(struct dentry *dentry)
> +{
> +	struct dentry *real;
> +
> +	real =3D d_real(dentry, D_REAL_DATA);
> +	if (IS_ERR(real))
> +		return ERR_CAST(real);
> +	return d_inode(real);
> +}
> +
> +/**
> + * d_real_metadata_inode - Return the real inode hosting the
> metadata
> + * @dentry: The dentry to query
> + *
> + * If @dentry is a regular file on a union/overlay, then return the
> + * underlying, real inode that hosts its metadata. Otherwise return
> d_inode().
> + *
> + * Return: The real inode hosting the metadata of @dentry, or an
> ERR_PTR() if
> + * it can't be resolved.
> + */
> +static inline struct inode *d_real_metadata_inode(struct dentry
> *dentry)
> +{
> +	struct dentry *real;
> +
> +	real =3D d_real(dentry, D_REAL_METADATA);
> +	if (IS_ERR(real))
> +		return ERR_CAST(real);
> +	return d_inode(real);
> +}
> +
> =C2=A0struct name_snapshot {
> =C2=A0	struct qstr name;
> =C2=A0	union shortname_store inline_name;
