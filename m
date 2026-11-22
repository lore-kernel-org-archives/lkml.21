Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795320307;
	b=anGM6RT15Z2TwGa3cXFHYtge6E4HU+63/ZAECd7eKQCwEA5rMtv9oQew66+qPtS80v6V
	 8zxGtD59LIpb1OqL5A/edJCz2cIfsPuMrcziDLEBKuysyC2NJ6AyfxZDE5nrx/bOX3Gm4
	 cf6ZY8Dn1wJm2i1FRGOOQRdoKfsQo8CmWTbgWdlHpEutl6iPFbuhrKMTQH2O4uXRdrdKL
	 PrLcrVFHpKavEHWkLSsUrD4vDTTxOIiYJHH7s2civT6DSRsnehCEShdyO4DTUPJQsodAf
	 4Z44ot1ghp5PK6Allf9o3a4UPHOfwOUxl49RZQeqJo2Gs982UuRt8+spSMCkXUM4Ynw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795320307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EdQh1078VcVl8/I0mQZEP2eKR1ViU5tIGep2uHjM3/I=;
	b=itKEDRtn14sDq1gXHeVmsz56p5A072ZND1a3nfVrS/IsYIDmmz6XJpV76hmpT4OBqfho
	 9lKaJ9zz9T1AkX8rO5xqAH8ke1nC6evYc1+rLMKW5ri/oekKj8/BX81FkHKD7BiEGyTlF
	 9OpxG5eMk9YnToQnXycaHgxN4er9SAcVoqlOX2bYHza458ddR5IeSMwU7+uqpGZ3fjvXr
	 wm6Mm4kw8Rhp7RBcneCeRYH4kk0LmBRNaOzR5j5QWrwWcgQNrg4HGT+4oh419heYH8qAW
	 Wl4TvhZX0i9La8cFTj3b+ISBYzydYSKMO48PgFdVBVzz2Psjm+rhtYNQslZsbsan9eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AgfCyNOg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5E5606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5E5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AgfCyNOg
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533202fe429so208901cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:05:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795320306; cv=none;
        d=google.com; s=arc-20260327;
        b=iPxLlFtmHIp0TpHJyLF8aEdhlAOyHw8JZF9O7jVrg99PM5ZXiswyOOfnzY1gdQJT2L
         VCyEgvh3ezxwLBxUUMnvfEfIQ6UHQNEa88NkU4tfiMJ6Kl0qt900l6T5MPaORjjqPe3W
         2vKmCTzxPRNcVNDjIm/RmdVmLSG6sTxQBjedtOQj7nbi0zu+OOkgtqEGfkL7dJiSvr3B
         BSUwfIa0KhjDeUznMFQM+58/miMTJ+0H3g+7eWDO4FMFeKEkpfPYRS5ViK71u+8f/XIM
         Q68AJozoGxZU+CLBbn9fTNokG/OaC3nxRdC+bBLffcPDd4ifFzFzzMmE3JGTPtFXJ3es
         3cWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EdQh1078VcVl8/I0mQZEP2eKR1ViU5tIGep2uHjM3/I=;
        fh=bQV2gRniPG57eCVj1JlL61tOCa+8dhmlD+D+nS5lWw4=;
        b=j3Ez/hseWQOyZmDdf+XrS3Gx0q+8Y2820BP1WU9kNCBTaCJR/Vy8/F7eJHvjXiJFuk
         mXKVsaTjbKyIKYMDI4J/+WFfdvyWqv/ckvCXucCwxiTyOPsg//kR4HuUkF+EOouia0oz
         SrmesqX8O0J0SD99VHJ/rz40HnGf4EXBgNTdz7sTB3ni502inerj+wZr7A7Jhmp0/UM3
         XxbNpwrEqn3yOP/l4FlrIJNPCkxlamsi+2Vx6rb9TWH/DTcuRtIyzkl2VFLM4f+MVXk+
         ahefMJRMdaYRDXz82ER2DbqrG2FOEUobblVYsFoQ7YsD9mAQ12Sl3+qdws6ZYsIb1Yiq
         2XDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795320306; x=1795925106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EdQh1078VcVl8/I0mQZEP2eKR1ViU5tIGep2uHjM3/I=;
        b=AgfCyNOgNWfJDS8SMrofKD24TXks8X1hcCkhuZG4t3geeqiknyp2n7V9StUyz8fV9S
         HpVic0xaKWLMj+8WkRDX1h5wTDj53oY8IUHzcfOrR/iuxm1nnmFibJRfKxSIDIanLG04
         LpX88MM4oLRz8ln5MLmbCnolfeuse8gewgNpYwzBHoVD1678manwNdThIUgGPG927Qxn
         bbb8idu0IwGx6hW9v71ith0zNKxtqJ+D6K2N952FS5Jg9uVIOfNCiE2Lvmt5bn7GMrpQ
         ru3P8eUxODAi4orPl6K8UbWW2BHFftcYeIlAAk1u7Q4ZywKkpZ3MYqLd0E9eLrSm1S9Y
         r+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795320306; x=1795925106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdQh1078VcVl8/I0mQZEP2eKR1ViU5tIGep2uHjM3/I=;
        b=KaCPE1cILo/wWgfERs9DNb6RMvuj5iP8Q1RsqJw04ODqsoD0HQDwGkTyWA6xdk53t/
         wW2yKMz4CiibqyehtJuAHP3EPRuXcSg2GjokozMCSJ58+SyE1BgJ8nPU8f38mNTVWWXl
         5fBMsPyGu21KnhLl1FwB8FLgKa3DwvH3QD8e26R8WlAeUS7RqoZvrGlaomrpueP2nQOV
         RgAzqv6Rsndaece+HaM2b5MtRsCUU0UQfpsD7FwFSJjkzgkP+ehXG+3s+Z/OTGt0fKAQ
         riTaugYAt78Q3BhoWeYigowV7u5Kbpei155v41W9Gvd794xKgo5jqQeRLGKI1OAc7EDJ
         Xupw==
X-Forwarded-Encrypted: i=1; AL+hErGX+9D666nBTSIWhTr6WzKveT3IKhkVomTOxMUR1LOUqDYdj2kTVw5gmpVuZ/ywQTyEm8lvrASaJWIWLME=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Td90GdcD+lPyGWFucOtyhR3xOs/Cx/96P/hKvRKVwp6nVWSRh
	35beRLdfuuuzm7ez+7E/ke/5NUt8nzX1CYfnEpyVaHtjI71pGJYMNbq1lcrfhuwo0arTZmdl583
	PtgWmghiiQu4gzAKb2llufO9LgDo8yb7O1SKKaBoJ
X-Gm-Gg: AZFdTZe+5VB6oCx2PmtUY4jUCZ6/dyz3KlDMUNvKFPxSxo2986WZ6XjdJXJXQz9UHC4
	LraAe5T7CZwa9RL8TEpq3tFLMN9WkMISz3tjSh2OQFgHdXOBHe4QdNDgmo5ZlpJSkJ7IEwCPwGg
	h15Y2bT63RlJKXThnfPkD+nI49iLJxkuz1kf7IhEC6g+PcYpLrg0riOTRCi26Ftoc4uPHF840hB
	U08V8uYg5iCGKsBGqldGocyHQuD872zkKiu3Vamaa4wVngl2S13yiqUCd6IJUGBHA7TY7ecRlyq
	VX+ydRWJmdDXkFbrNTzvo6qx8+RGGBsyLPjrzubx5dhJTNa7beyrk/uTe1rgKtMb/BDEr7axY0r
	zHpyS47JALti5fGRYW5f06M7X8ikDVnCJD1cCh4tYqkUf7G+VwTk4JqQJAE0iskW8/hVaJkA=
X-Received: by 2002:a05:622a:2b44:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-55d88013e93mr20693911cf.2.1795320305782; Sat, 21 Nov 2026
 20:05:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116071325.263682-1-hao.ge@linux.dev> <20261116071325.263682-9-hao.ge@linux.dev>
In-Reply-To: <20261116071325.263682-9-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 21 Nov 2026 20:04:54 -0800
X-Gm-Features: Aa3M54rNW-fgq1PCt8XmLDMf2BnWeGOuBPMCOY35tY8eLiMpaqrvJYSsrRzr_ls
Message-ID: <CAJuCfpF==pGi09rnh2ts6VhV6Cj9kjk0rvvkGD3=8TmFKW-VpA@mail.gmail.com>
Subject: Re: [PATCH v5 08/11] mm/vmalloc: drop the KMSAN metadata in
 vmap_pages_range_noflush() on failure
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 11:14=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> vmap_pages_range_noflush() sets up the KMSAN metadata for the whole
> range before it starts mapping. If the mapping fails, the page
> tables undo themselves now, but the metadata stays behind, and the
> next attempt to map the same range hits the leftover shadow PTEs.
>
> Tear the metadata down on the error path, it was fully set up before
> the mapping failed. The teardown follows the page tables and skips
> cond_resched() when the caller's gfp mask cannot block.

I think this patch should also be folded into patch 7. Leaving the
metadata after unmapping a failed partial mapping introduces an
inconsistency, which this patch fixes. So, in a sense you are fixing
an inconsistency that you created in the patch 7. Instead of
introducing an issue and then fixing it let's avoid introducing it in
the first place. That's what merging those patches will achieve.

>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 4f3c320a4849..28e65073624a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -801,8 +801,18 @@ int vmap_pages_range_noflush(unsigned long addr, uns=
igned long end,
>
>         if (ret)
>                 return ret;
> -       return __vmap_pages_range_noflush(addr, end, prot, pages, page_sh=
ift,
> -                                         gfp_mask);
> +
> +       ret =3D __vmap_pages_range_noflush(addr, end, prot, pages, page_s=
hift,
> +                                        gfp_mask);
> +       /*
> +        * The page tables undo themselves on failure. Tear down the
> +        * metadata that was fully set up before the mapping failed.
> +        */
> +       if (ret)
> +               kmsan_vunmap_range_noflush(addr, end,
> +                                          gfpflags_allow_blocking(gfp_ma=
sk));
> +
> +       return ret;
>  }
>
>  static int __vmap_pages_range(unsigned long addr, unsigned long end,
> --
> 2.25.1
>
