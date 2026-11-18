Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995789;
	b=w6E4R9QlxNGSk8Iar05b7zUWU9R4Gaa+/BfSOFqO2TikzzsdEjtY0GOycmN47hcfDeMp
	 1gM+vhonnPLg91kCIM0+bNiD7ugRgnh0k83wCjn1/xV8f008BC70LwH2clgVmtljQex/8
	 dfqrlPPAyl7DDPZfcL/7eUs4ceJbI98j7hpDX6HbqXFN6hLMkxYugB4qeQogkb6w34aQ8
	 N3mYrnZyugGAlV4hd3LT8Rt7eltFtkMeMGrndgmCowq75GXohswXLrrk0vnql6fSpWsZF
	 xGn5JFZy/fFMur4L8OV43y4Vu5TtEmz4beZ6x39L2nJ1ewLBhJQCVpOgKyBUz+oZq7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995789;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LVjYfSHFtJGzfxCKWN53IDRtrshFC2glsaaN9aRIShs=;
	b=NilNmZZGYDkMMKiUBCMLs8fVh7Ad+JCkauufbVqiqfKRSreQB2/CV/pnSXrR13gryDe5
	 6MLYMoXQRtHaviIDjsA8uvs+AOmVYmgAaKntRQt5TsIaBuu14g0ZqafSPJwsm+z3x5JKM
	 cVjIdLLj8BZvXm5bkV/rZ+eES3XKkXc0ADsD2z3yBGuv7Obw0zhXWJ4lXmBVqLc0n5vWO
	 HZrDQDaEagiEoxHnrHmSHO5xE7ocbCNJ6UUoIVfOqPnTfPEZZVZxHZ4tWpmzEkPEVVHue
	 UuSEBiq2tf4mrmtMmDCU8xpPnHtkSgBNBq42vTsapafSSE3Dcd0HirVh41SIwoUNIyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XzPV9Ehz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F67606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XzPV9Ehz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D421F000C9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794995789;
	bh=LVjYfSHFtJGzfxCKWN53IDRtrshFC2glsaaN9aRIShs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XzPV9EhzQvrAVF0jTfMUA9Q1hoZgmWj9Pi9NKbnr+6BmpuU+uBhYqPLlfnHrAh3fG
	 9nie/ihYu43SeMb+42fMyAM0SuDXTmytuWMbaHCVd720HMCGtoR2rbhQUlWWx+EbvU
	 lh0b1yE67KZNc0moW/77CM5W+aiTzuhBLK5fpDkb6uI72KKxJPvQVahejHPQsqabqR
	 EaDzgy/fdzT0oatxiu2TqyfiQQ+dkvy2s1C4UWxLVMLrCg9jsUS+lf3uKZ2tlek89e
	 NeYfW70EYDCZUYOQ/xIwWCROh3dtbYxHIOonFthtBswZn6GaDbnBIvpbgWU4l/IJvj
	 7Dgb2gOgqVzVw==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso104679366b.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:56:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHJJWiBGvCNj5T6pfsxHvCIbjk4efPbQunLr/heFZu1CyY2IxZW0EKNjG2SpSbDS9z9mFKdnmiM9Zyp91c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FY+ZIvnGJ+0BiYo+7zY1ect5Rqf5UMdvKmZOBAuYzhqms2EUf
	3lK+xFLL3tQZNu+B6KIoIKovUkwDd1epsaqSVq3am89f1y6+whVjHqD+26fDRbKxTdw4qU3DpSu
	7hVbg7Imkg4xo2waPBAB9HylX5XM+nD0=
X-Received: by 2002:a17:907:eccc:b0:c49:bc1f:fe2d with SMTP id
 a640c23a62f3a-c510e2bd578mr158715366b.28.1794995787589; Wed, 18 Nov 2026
 01:56:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118015802.899847-1-youling.tang@linux.dev> <2df33679-680c-4fc5-a279-e0e38025f22e@163.com>
In-Reply-To: <2df33679-680c-4fc5-a279-e0e38025f22e@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 18 Nov 2026 18:56:14 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-xcXFh9fxGEz9CUc7t7N_PDqNdBEfj+85nkQ1jp8M7nQ@mail.gmail.com>
X-Gm-Features: AclHuK8r_-YDa3_7OxNEaErJr4ykB6Ed4EZ8_VOz2z-KgaiwfjiSKLanpAfgezA
Message-ID: <CAKYAXd-xcXFh9fxGEz9CUc7t7N_PDqNdBEfj+85nkQ1jp8M7nQ@mail.gmail.com>
Subject: Re: [PATCH v2] exfat: hold s_lock for cluster-chain updates in __exfat_cont_expand()
To: Chi Zhiling <chizhiling@163.com>
Cc: Youling Tang <youling.tang@linux.dev>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Yuezhang Mo <yuezhang.mo@sony.com>, exfat@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 12:22=E2=80=AFPM Chi Zhiling <chizhiling@163.com> w=
rote:
>
> On 11/18/26 09:58, Youling Tang wrote:
> > From: Youling Tang <tangyouling@kylinos.cn>
> >
> > __exfat_cont_expand() allocates clusters, appends them to the FAT chain
> > and updates ei->start_clu, ei->flags and i_blocks without holding
> > sbi->s_lock.  Readers such as writeback call exfat_map_cluster() with
> > s_lock held but without inode_lock, so they are not serialized against
> > the expansion and can observe the chain metadata mid-update.
> >
> > Hold s_lock around the cluster allocation, chain append and i_blocks
> > update.  This nests inside the invalidate_lock held by
> > exfat_cont_expand(), matching the order used by exfat_truncate().  i_si=
ze
> > is published via exfat_pagecache_isize_extended(), which takes the
> > straddling folio lock; since writeback takes folio lock -> s_lock, this
> > must happen after s_lock is released to avoid inverting the lock order.
> > i_blocks is therefore updated first, under s_lock, which also ensures a
> > reader never sees i_size beyond the allocated chain.
> >
> > Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
>
> Looks good to me:
>
> Reviewed-by: Chi Zhiling <chizhiling@kylinos.cn>
Applied it to #dev.
Thanks!
