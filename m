Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450823;
	b=gTQ26GLQ/b/OFq9t3e4Tw32OStxpMYr+yGiyX/2HLnjEqfpw/juG58O4R4mOtLiYUoXI
	 K6rcvjY6NTjeQHYj7NuIwaO6syJzNbr6/czqZSv1B0TGd7Y+1WeiFVK+OvMM2g1Uj9Tfp
	 wJwjwlkYUvr0i/R9r6tLpNWqeT0eeCti4ypIzz/qnpmUVOu1GXXjqtO+So2JcPY1YWWgX
	 kKMkTKEkoLzkYYPysyY9edHzewin/5rLBHRvvgMViWGaZP5Y9UvW11PK552kh0i83FNH9
	 +l+c5+KL9wcvGnllRFPemvFnPO/g8CEj29nZvSq3VHxWI+y8zghLbOJF8t5t5cCGWjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450823;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VMHCwMuWqOW4JKKsOO+FUuvLN27CPePpxu9ZaOnKa9E=;
	b=JZZlXLN1/hsygV8iwaKv1aLEpnRkBL52/usC+XXqvs0sEnmmnWb3NZR4/2FvdFe5tb/o
	 3DffHE7WtB7mw4cyS0VzK1coP72Hu/qpFXp4uDfQkvDlRg4wuI/YfUiE75TZb3qyzDv67
	 27z8UGxwhoHm9EI/wRX98W6TF/j3ZMlN9kqkaZ7HNIfMh44j1ce0F8OHKMv5JTt6GI9Lm
	 AUEBv03mWx+bOE6mUU/QMw2SO9+f+IK4HdviWXu6v4qn9jIWAjA6h/r45OXw/gORe7rnT
	 kuDe8jsJp+ca3SXpSmxWEqcsY7aMWNkydam2JvHlFtySq2wqSfAGYZfJZMOXpG9vLbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDGEYtL7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE889606A333
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDGEYtL7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729851F000EE
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795450822;
	bh=VMHCwMuWqOW4JKKsOO+FUuvLN27CPePpxu9ZaOnKa9E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GDGEYtL7lELpnekg2dZtA0noURTy7b8Qqb2t8Aco6KI9yGEey4fOdVST0kDaZmm9D
	 qC2767n5fEM+SF/OXeH1t9cTXTP/JKvCy756skEqRJ7Eg4CN972uwQAZN5ovDno7CI
	 mUXd5gPHzP9IfCpfhvbG4S17C48Rz5PdKk+55UH3coS0CP5YCH3+3lbgoDbVUytG7b
	 qm18Tkjao+EplItC6lP/zxbj2jul7amNgqUtJk95OK+gQNITt1B7pUJsqIpJnLfwWb
	 8zyOFDaA2eQUm1tuXM8bC0l8uJdybFb3+6sKhiu/fmashydUuDYBl8Tu6PI7ZP4QsG
	 sm3I0pw9V8XpA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c51373ae637so531183866b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:20:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHap3wp0BPo3SjNasVDY8YiFiJbTZpRTKxfipzApwa6WpWNlyapMvnvSAyMqbKqTfkBtcuT062uW/oRLdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fUHoTYAEW9QnFqicm+sgjad3eQLvBGuold9rQ5LvKxuaAXyvo
	qeSf+x+tfw/ExQlOTtfBC8VD01MI/FiCu5k/cVjKKjhchEomOXb7wutkvX7f0xxmGEBpDhQvKA5
	4i5p87PmEjZ3/BrKMmzX0Mp3S2eHYmkk=
X-Received: by 2002:a17:906:7b48:b0:c26:1648:a062 with SMTP id
 a640c23a62f3a-c513a9ae0d9mr693411966b.29.1795450821212; Mon, 23 Nov 2026
 08:20:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123032512.6119-1-raizudeen.kerneldev@gmail.com>
In-Reply-To: <20261123032512.6119-1-raizudeen.kerneldev@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 23 Nov 2026 08:20:09 -0800
X-Gmail-Original-Message-ID: <CAO9r8zMhvpiD6JXBfd=KCVfHxQ3=VgmsVpcoydC89Kyj37thJQ@mail.gmail.com>
X-Gm-Features: Aa3M54pyWRX5QSV5IVnMsgXQsdYhEWxByyxSD0tUw2dlim72dadxdTz936Q7lRk
Message-ID: <CAO9r8zMhvpiD6JXBfd=KCVfHxQ3=VgmsVpcoydC89Kyj37thJQ@mail.gmail.com>
Subject: Re: [PATCH] mm: zswap: remove dead length check in zswap_store_page()
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: chengming.zhou@linux.dev, hannes@cmpxchg.org, nphamcs@gmail.com, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 7:25=E2=80=AFPM Mohamad Raizudeen
<raizudeen.kerneldev@gmail.com> wrote:
>
> zswap_compress() never succeeds with entry->length =3D=3D 0, so the
> condition is always true. Remove it.

It's probably a remnant of same-filled pages that was not dropped in
commit 20a5532ffa53 ("mm: remove code to handle same filled pages").

>
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>

Acked-by: Yosry Ahmed <yosry@kernel.org>

> ---
>  mm/zswap.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index ae19e301fced..9590f333d83f 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1509,10 +1509,8 @@ static bool zswap_store_page(struct folio *folio, =
long index,
>         entry->swpentry =3D page_swpentry;
>         entry->objcg =3D objcg;
>         entry->referenced =3D true;
> -       if (entry->length) {
> -               INIT_LIST_HEAD(&entry->lru);
> -               zswap_lru_add(entry);
> -       }
> +       INIT_LIST_HEAD(&entry->lru);
> +       zswap_lru_add(entry);
>
>         return true;
>
> --
> 2.53.0
>
