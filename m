Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795651871;
	b=3EQDgXxRLfwZW6Qei0glOBvpglT3qH+0HvwMSddORmXGHJgHDpsNRSidDowb+w/zgp8b
	 EPj0UoOI3Cv+9cHhpYFYC5lLBhIK771D1jMtFfO6kBWAf8WaKN2M6MGaz2BkZtKPpE+Yq
	 2WqmTtsYxN/iAM/h3YI+xMRA0YuONXh3Ahr0NBW8pNBFwG3S0PyhWQLA4llHRUFZ6rzle
	 1e9jlzNb3TrZJhFwWrL7PxaIrWgqfVrLIcbHgQt6tX4qV7nJYuQAyQCKY7nwK6xr2xjg7
	 5HjSWsMN38GeauoQ7+ngvvtLDebdBxsnlrIamOrvIabUNGPlXO40QSlxwQBepE7nZaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795651871;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RDINDvHKD6MZseAlC2/IPYtXWUlAArkqAjR7GnUg3Lk=;
	b=0cZAh8okJdQTzlavlS115vgcmGpQTvHjrXZ/v9M2I57/hq0S2cCF0mFCVOcWqsoLLdy7
	 EjvK/DBlqb9bvH5PWVs6aDkoNIhVSX9i8PJGAlmNdQE+dJAFh9g9PtoM8oID33jaMhcoi
	 hh9rIRM30+i1uT9icMhunBX5K2ogFaUl4Xin9kn6ElyunmUh2JCjdnt2FUNH5dfaIDtS9
	 6z5Wop9MyNpLnZiqI4kLVF9sOx7BZhA+HQ07GSOlNA5gmhP8GOCXgVdz32thRnwZhNNDl
	 lKG++5P2GYQHj9lNlvPrXIWS0K2INxIET6EFzzHNUz9CMthjhDU5kvKd+aoLiF7F8gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bxchyc4J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71252606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bxchyc4J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03BC1F000D0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795651871;
	bh=RDINDvHKD6MZseAlC2/IPYtXWUlAArkqAjR7GnUg3Lk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bxchyc4JfjA37MYjy8kPfsVM9Ol2cupkuK0ohVXmFUTPfH6j3gHcSouV7rL/Gl5Bg
	 vE6fKxChav6JXnCWMZENtTaYOaEMteR6ijkUrVK5ed7GMnRtFXlJVjVnU8LmCLxEn1
	 6QXl6H69cWtNLEq3YGCm3XYWJCmqwJkVwVVPgVtySQeIrtyJVaFOmgqim+/r2CstDF
	 1V7UyX0tIhzFziHodoinKQ9JrFI2noNHZQs7gbIAeqaFA2PX2ZqVBR1mDI49AI4uAZ
	 6dpUWhqsfJjQ4PkBBAP/ItbaYuH6DxmchleB2vCB1B2PbvrUn7qprtIAU8cbGMYX0h
	 g3rzZYUMstphA==
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9496577d4c4so707664885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:11:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEKxxroErnqg/ycN8fLplwzizCXi9EAmmaKVzVlGH+GJe4aXtLEjqMe1sY1SAFklAkPJjqU6BXQmAgDbdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fEiuapb2oXhPXCBCABVL8U0nxNdivnZU2q6KyqSpdyURRxD99
	cH7guoMN/uabz670/MuoCuNViWZSOenE3mTd/xy++GvQ9VUOgpjFk9Sbmm+H0166rqsRQjpenx+
	ztBf56De58mykwF9KCuLRAG/FOUl4eaU=
X-Received: by 2002:a05:620a:2585:b0:949:7058:dbcb with SMTP id
 af79cd13be357-949b35723b2mr3687848785a.14.1795651870358; Wed, 25 Nov 2026
 16:11:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114200803.23129-1-baohua@kernel.org> <20261114200803.23129-10-baohua@kernel.org>
 <e2595c80-c223-472a-a756-d352161a3330@linux.dev>
In-Reply-To: <e2595c80-c223-472a-a756-d352161a3330@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Thu, 26 Nov 2026 08:10:57 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wTMF3qj5tzT1FtFDgJJAL7hw=Gb2w3uq99ZNrCK0vcYA@mail.gmail.com>
X-Gm-Features: Aa3M54qEbqb2UlKYb-QEOhd5-I-lklbxngV8mRirioZSLDDnWN8UWOGBIbJttK0
Message-ID: <CAGsJ_4wTMF3qj5tzT1FtFDgJJAL7hw=Gb2w3uq99ZNrCK0vcYA@mail.gmail.com>
Subject: Re: [PATCH v9 09/16] mm/mglru: Avoid placing rejected folios below
 populated gen
To: Ridong Chen <ridong.chen@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org, 
	hui.zhu@linux.dev, kasong@tencent.com, kunwu.chan@gmail.com, 
	liam@infradead.org, lianux.mm@gmail.com, linux-kernel@vger.kernel.org, 
	liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org, 
	mhocko@suse.com, qi.zheng@linux.dev, rppt@kernel.org, ryncsn@gmail.com, 
	shakeel.butt@linux.dev, surenb@google.com, wangzicheng@honor.com, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com, 
	zhuhui@kylinos.cn, sidchintamaneni@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 7:47=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
>
>
>
> On 11/15/2026 4:07 AM, Barry Song (Xiaomi) wrote:
> > We used to scan only the oldest generation in scan_folios(). In
> > evict_folios(), we checked whether
> > lru_gen_folio_seq(lruvec, folio, false) =3D=3D min_seq[type]. If so, th=
e
> > folio was marked active and moved to younger generations.
> >
> > This was itself buggy, as folios in generation min_seq[type] - 1
>
> Should this be min_seq[type] + 1?

Oops, a fat-finger typo. Andrew, could you please help fix this
in the changelog?

[...]

> Reviewed-by: Ridong Chen <ridong.chen@linux.dev>

Thanks!
Barry
