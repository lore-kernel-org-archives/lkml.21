Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162759;
	b=cu6EzLPCQrIFASQcHZKQL9f6B0yTF4Y6KgwVvC1SC26PZ0FMBwTPs0JQLwKXPBCMmkpr
	 ew5iQLBLsYyQZ0uc/U1WpAjMuJXaKVNDAlj1/W2Iv7qF3UbpOHiPHW8zXMQdyIoUpxwBH
	 Px34YVYoM0oOfKb08jEWL7yDfUOc1OHKI4V3gCON7IewXdwb6AnTDlniKDptNu2R6mHNm
	 cRAYYFzLOCg4XxwSo64S9Dabb0rRD+6Yi4UdMwdPJJ/3PnC+KwWrGo/heyR8iwY3kU5Qi
	 B3VmbFY554aJUdgVzrpDaylLhOkWphqflMk+AlpducShBC+6FWsaAcICmyn8vDwWnxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162759;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZLVZJxESS8nh61KH4gKvJ6pqCiTggJl/NDFsKtAxWgY=;
	b=1yGEzavHH37w5nYL1mUzOuRmBwPxCClY8h4Aw1J6OBj//FXOneFYTAshXWDUjT84GicE
	 Fp/Jtb7UKphrBfTINCloaJ51qJvwSFyqeSDqfh5adRVXmnMA5ZakzWKeqw19i3debDS61
	 DNLzU/zAxZqLM+AF3HSTgfjWblewA3ElOjiimRV4PhyG+aO0sxiXbq3J+ZyxDNMUkSKVX
	 N6tYfDcDm644RneVLs+fkqMjNcBsS8xzUpccttJTufMR1cIIP5LFxbbaCeD+FDaPL6DVn
	 5fddJxKD5z4mDM+8KzLrNwnAJvmlUXktdyEkFxI0d4xCr6an7MJziJJLBZCzsqKFJqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WlbJGa6r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D96606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WlbJGa6r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450F91F000C4
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795162759;
	bh=ZLVZJxESS8nh61KH4gKvJ6pqCiTggJl/NDFsKtAxWgY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WlbJGa6rvPAEL9wEVmhuqKwq5b9PQsHofUWiHjD6MEyvzikzfKGtxbqPGelKuVxYs
	 m5p9pRMK/WjoeetJ4SxALT+BhcI7SlSoqL30ucUrC7oL03QyMUNNTtC4p/1UFpHGE8
	 MX+wFnOe21Je8mXXfpJ+TZSot7025mlXytCgoxP/yg70OdLx/aoNnpP/g7pkk9Lg0p
	 35jxfSqJAb8gLSUUS7L4Esc/tpH27jCLNA6poK8j5LY5u4Z5WZKT/fPV9+K398+OQQ
	 ahs+Rid6qcYr9FlHQWxDJChtd/CB/HxmAWcACB1+HKdLeTUevE+FoNLBSvP7meyu1o
	 y20qAuljNqCSw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso722814a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:19:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHDIeCdI9gOtgoeisVAillpE4+9X6gnvOGML2gdi68oMzRq4JzJOsIBBtsXdgJuRIEiP/ZW7VVE+EaAciA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6B5zZ0xeLA3TzTrEcLwgUyWiIcoMkoLFbe/8xZcUpyqY7+TmQ
	dHz9b+Cb7NiLkOueeEcByDfWNdkOoetwlakWKLyjDYjerxGG29XxJPhDmjcr9ttImRt6+xCg/yS
	d7RiF5DUNCfqS7QGojEfQ6C9p0dZQovU=
X-Received: by 2002:aa7:c0d0:0:b0:6ba:144f:ae43 with SMTP id
 4fb4d7f45d1cf-6ba37c7b138mr1080749a12.6.1795162757947; Fri, 20 Nov 2026
 00:19:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAhV-H4pmcV8hah8sPyQn3nR9cO-NwkXMPLeSABAO-VEnS08fg@mail.gmail.com>
 <20261119125221.11897-1-dongtai.guo@linux.dev>
In-Reply-To: <20261119125221.11897-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 20 Nov 2026 16:19:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5ZZxa-wMovPdCEhzwPaxkcEac0uwBgV2jdfY=6jUrGYg@mail.gmail.com>
X-Gm-Features: AclHuK_s8BaVf06BT7xe6EODjiMXez_Tr3nUEr-rhXoD_pDYy5cCCc3-DaMT3_A
Message-ID: <CAAhV-H5ZZxa-wMovPdCEhzwPaxkcEac0uwBgV2jdfY=6jUrGYg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Allow memblock arrays to resize
To: George Guo <dongtai.guo@linux.dev>
Cc: kernel@xen0n.name, rppt@kernel.org, liukexin@kylinos.cn, 
	guodongtai@kylinos.cn, loongarch@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 8:52=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> Hi Huacai,
>
> On Thu, Nov 19, 2026 at 8:05 PM Huacai Chen <chenhuacai@kernel.org> wrote=
:
> > Would you mind if I move it between memblock_dump_all() and
> > memblock_set_bottom_up(false)?
>
> Not at all, please go ahead. KHO still works with it there, since
> kho_memory_init() runs after setup_arch().
Applied, thanks.

Huacai

>
> Thanks,
> George
