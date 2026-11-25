Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610996;
	b=x5SxKM+i3VyOah/btHg4hyKHEll6KSsNx7NQh2Lf88t039Y8cH0Tpu55f1eWvIGumrCV
	 6o8bHQOsyR/dccK0i3U0YlDO+vnZumkFWzMkYli3JhWWJO6PPqezgRa8lQwnRUVp7Q4hD
	 UB07078jQFyVevbvvKkcFBWf3Fwaq2fUkY4AzmPK4gkstf8nMSDPu4vKqJfd8AFZTHuhl
	 TVmezkUJduHPReEpRKATOniXArLdxBQLa2jmxKVwOlls7uBfLYBlkJCDELcAv8Oiz0hMC
	 xu2VeG/GofmS6ftz1/lpX/s2MC1fEcXMuoTbKYnstHXQzuHyGrEyte6sIg3DR2Orgdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=Le4AwFe0WXouABp9DXzuQtZ3ZnCfLcbkB8kE/IdX7wA=;
	b=5g4v0QfP+EZP0oYKtk04IePFOTCKSmZi0pKvJ6l7duXCg6eg5X8GN9WDGJj1GGwvnHLO
	 18gxLg5vvND4D24HmjzdMRZ8EfFE4IATeD+NEygFSjK2l3Eg6LiT1rAqkXjVYp7CRHYk/
	 rs1CeorgT+6pJrs/0/imSrO/yRG5xzajQrFH7ejT++QK03jkEET1GTWSsqarGyowp0uwz
	 vCD9snk5HBX1O/sb0vBlaGFUI+tsJJNpKdlI/Vpd0OutIthsYK66AfYpnh2qN8pGYZN5J
	 R4jSvUgPUG+vkLwIRqPd2yzoetPs1TIgYPPicPJpTY8iI1AAMfUeBYcnjAhbpDD+S6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ijrvPjrs;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E9C606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E9C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ijrvPjrs
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so46037655e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1795610993; x=1796215793; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Le4AwFe0WXouABp9DXzuQtZ3ZnCfLcbkB8kE/IdX7wA=;
        b=ijrvPjrs4XPMGxLv2/cLDzYf1DTkp26koBrs+YwuqX5elYJruc4hClaOIjF62Q3+YN
         LRHIUBC22PWGF/rAGALu7SoOt5zqUHESVTCa5vHMQJoFy4B5gkLHeV5hugIirMLPKc1z
         lwkIjSkykztPQpKhyKTDraxT5P3oaH7NzwApTcr02ARr2hT5KerzhwRvxghSP1A3P/Bp
         EtgDED95aoU7Ek6mxljMaLWO6Bx5amJKRdXl3ABZkqxCYsSCC5SlDmTZNR4DGfcavrRk
         HtSpSZ/UepV+pwNgpwEHfsqbflJPpiVU5KOF/FpJhp5lP9+HVdK4ulKpQ0NMqA1E55T/
         7WHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610993; x=1796215793;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Le4AwFe0WXouABp9DXzuQtZ3ZnCfLcbkB8kE/IdX7wA=;
        b=VZ1NTMSsyE0v5mNBNE2jsV+eomJBJM8lP0IYBp/UbMhrrxMwJyHWJqORVhHgwiIfVt
         vdjBBPMBR0973VJcR8odJ2jjZ8XohnO+DEduDUTZUZdwjd91jaQP5Q+4CIAtZTWJ5kN/
         +n3ivXkxuPRO+f3+oJNgn839iL9Z/Bdw885rcxdZ4kSXh3sKyOae0wlOUWrhja8n2S0H
         J454Kc3l+QquSBqXJAo+e4LbMjsqc3MfbX+hrQ9+MaKm//jfNqmMA/3j4qS0i/5mP/MV
         mxxZ1vh0wtrKc/1ltj4dvM7WDAqUOwdCqy9B31PBv4YpPLEBxS0kuyvO5p/zau6LSjlj
         RTkQ==
X-Forwarded-Encrypted: i=1; AL+hErFB54Fi8xEZMyw3GKlZw9TC0m9bg3beNDi4JN97qITbJ6pxMKtO4Cvy8ZGBwWAKI0LdHS3tJk3+b4wrKmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S26Rg5969zDCGguzTktsNZl/H8dFc54otwPyukqvf8NvsP1Hd
	Bi3dY/L3uaaHDXrcc4LzDttt8Ye9oqVxaOS8SC9H8DrE87Ka00T3iws5GyH1G81V8LB0
X-Gm-Gg: AZFdTZeDJ+O2fRiTB6bbelevmIL9qAj9FZml7Pt7WpHbAhaQfxvHdYLiWrqphfZWtjC
	7R7uXyvIIaAkwT9RGsfGMck/9CEDnid7usxNxlLJacyw1FZdOSKXB9y3bCRNDcW4AHvYqcNQQKh
	1HmjeHKq920tz8W4/Cuf9HQfRJmXYg+jxSLfEYRE1TGv/MRUxVh8pLTxHUwDuJQ1UX0WQCWNgfC
	NJvTNxftrq7g0tMY6Ex+sIfny2vW0gyXV0SZsqe+hl9JjOGSff89CkfYLpAzeIpjNMgX7eZg+2/
	mfU3Ov+UI/BYMaui6z7OBz338kHBUr/TRBP7bGTuCRhmQ4yQ/KdpoWuZ5qSK7Atox+BDg8HfJTO
	7Za0CifQmLjuax68lcmQmc+tBKuwAeMWVocWLL2xO2+orNwL5hBIcrmZuWgY/xoHt7RUKqY7Oj+
	RL5xEOFE5c85pApLuFznGZr39zOzvWcvPf9dd8ZS92vSFOWN3pkvrQKveMr59LNmBOP3eCA17Fh
	uKg8bigde9Ac0Nw+vz0t0W4r8ZFLb+ukkL/1C9OWVr+KBGgJRx3/Ojs6+m4spDt77E0rNZ5IlOd
	3QyHv0eYmqPRTCHdGKreuSHiQX4vJLEvlF7TzaGOGgIihAr+Vlxfrn58t6qRYkqd9oDlezgR593
	yn4Epzh6a0DYTmZdNDbNNfkXz4ZnJ/vG1EIRbuSkZqyBvhagBLM71Dw==
X-Received: by 2002:a05:600c:a11:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4bb888120famr364999585e9.16.1795610993400;
        Wed, 25 Nov 2026 04:49:53 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:c235:97b:8b16:8928? (p200300cf572c2800c235097b8b168928.dip0.t-ipconnect.de. [2003:cf:572c:2800:c235:97b:8b16:8928])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm710678895e9.13.2026.11.25.04.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:49:53 -0800 (PST)
Message-ID: <34297f66e07c1a64d81205c7669801738676f356.camel@amutable.com>
Subject: Re: [PATCH v2 11/13] fs: remove d_real_inode()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, Amir Goldstein
 <amir73il@gmail.com>, 	linux-fsdevel@vger.kernel.org
Cc: Chris Down <chris@chrisdown.name>, Miklos Szeredi <mszeredi@redhat.com>,
 	linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, 	linux-trace-kernel@vger.kernel.org,
 linux-integrity@vger.kernel.org, 	linux-security-module@vger.kernel.org,
 linux-mm@kvack.org
Date: Wed, 25 Nov 2026 13:49:52 +0100
In-Reply-To: <20261116-work-ovl-d_real-v2-11-90564c4ae347@kernel.org>
References: <20261116-work-ovl-d_real-v2-0-90564c4ae347@kernel.org>
	 <20261116-work-ovl-d_real-v2-11-90564c4ae347@kernel.org>
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

On Mon, 2026-11-16 at 10:44 +0100, Christian Brauner wrote:
> All callers have been converted to d_real_data_inode() or
> d_real_metadata_inode(). Remove d_real_inode() so that any user we
> missed, or one that gets added in another tree, fails to build
> instead
> of passing an ERR_PTR() from d_real() to d_inode().
>=20
> Add a porting.rst entry.
>=20
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0Documentation/filesystems/porting.rst | 10 ++++++++++
> =C2=A0include/linux/dcache.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 -------------
> =C2=A02 files changed, 10 insertions(+), 13 deletions(-)
>=20
> diff --git a/Documentation/filesystems/porting.rst
> b/Documentation/filesystems/porting.rst
> index c38f5df755bb5..aa0fc43907017 100644
> --- a/Documentation/filesystems/porting.rst
> +++ b/Documentation/filesystems/porting.rst
> @@ -1422,3 +1422,13 @@ helpers take a const struct mnt_idmap *.
> mnt_idmap() and file_mnt_idmap()
> =C2=A0return one. The idmapping is immutable so nothing should have
> modified it
> =C2=A0anyway. References are taken and dropped via mnt_idmap_get() and
> =C2=A0mnt_idmap_put() as before, both accept a const pointer.
> +
> +---
> +
> +**mandatory**
> +
> +d_real_inode() is gone. d_real() can fail for D_REAL_DATA now and
> returns an
> +ERR_PTR() then, e.g., when overlayfs can't look up the data of a
> metacopy file
> +in a data-only layer. Use d_real_data_inode(), which returns the
> inode hosting
> +the data or an ERR_PTR(), and handle the error. Use
> d_real_metadata_inode() for
> +the inode hosting the metadata and handle its errors as well.
> diff --git a/include/linux/dcache.h b/include/linux/dcache.h
> index fd8853622f250..fe1aa8fea0c7a 100644
> --- a/include/linux/dcache.h
> +++ b/include/linux/dcache.h
> @@ -654,19 +654,6 @@ static inline struct dentry *d_real(struct
> dentry *dentry, enum d_real_type type
> =C2=A0		return dentry;
> =C2=A0}
> =C2=A0
> -/**
> - * d_real_inode - Return the real inode hosting the data
> - * @dentry: The dentry to query
> - *
> - * If dentry is on a union/overlay, then return the underlying, real
> inode.
> - * Otherwise return d_inode().
> - */
> -static inline struct inode *d_real_inode(const struct dentry
> *dentry)
> -{
> -	/* This usage of d_real() results in const dentry */
> -	return d_inode(d_real((struct dentry *) dentry,
> D_REAL_DATA));
> -}
> -
> =C2=A0/**
> =C2=A0 * d_real_data_inode - Return the real inode hosting the data
> =C2=A0 * @dentry: The dentry to query
