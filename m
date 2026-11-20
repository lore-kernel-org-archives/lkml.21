Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795214783;
	b=QzzaOgCK8xS8KRg6mDXDP1Pn3VEg1yLDvWrovz40bY6f32AGdhVtF5NO7QwkbkYu2/BU
	 1wF+JZ6LgSIJ9MA41ktb/M403pM1DKMgUOoXnO2j0dCKuOaWanlOH5Ep3tufv7EvkYKuj
	 KWNS7hgEibJLIPu4ty60TAUXz4vwDBozMcxhKnKZXEaW5IEbLcqFYCdCAX+PJZ/WvmUC0
	 uTt7YlC83j8G29Xt3GOAo9qEV0rEg2+XvJSofvl0OX3TRWSTJ3Q839foyJUqHRaZzspdt
	 RtCkkSkv52qQzSLLvVD8RPEanyUyGUNmvVxsmFa/8vwFZJD+L+zFXCF+kqxEu8gyLkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1eGqv/h9Aum9cuRfzP0GxawnzKTcJHSd17/iuLvj8io=;
	b=5rWIhx4e8dlgpCfY33tnHz5+M47cbnKTFSj65RTX8ICIt3/iOR1m3z5prgAJUI4AbfND
	 F1EmmZMORb6QqQ+1FkMQF+BnUKX4Ti0wrA31v3yDPaosfyG1GIt41B3Na8w53yWKEiHwK
	 6Yn5xViDRU/3ndLtmAaiPXZp0aHqvBaFJjubiGSGSu+n/S/N06FcBx9Ila/7RigEHL/iC
	 aMTkH4vllbsLkWTsjyVeMZqGZSnaA+tPCDaDo/Oj4VdB+GzuDg50cPBc8kd9/8PxEYGIG
	 PrqccMFOhyV+au20+uajuylc7LrUE507sl/CJnA6ogpXej1cDPZY5uQqHJetBo6OQLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXxtM6ef;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352A1606A69E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 352A1606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXxtM6ef
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-498f5fa5103so867110f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:46:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795214779; cv=none;
        d=google.com; s=arc-20260327;
        b=TK8bfaPpCqYRLJ+RVbcyeN1Z9Jrovxy2vphxJum4qEs7UJksaVF085bFE+HobRiiPu
         3cEtkjb4hfkGWUbUprUH+t7AwDnwdpfygWWodS/kPNyLbkI1uzYKY8TxgHkJFDLKlhYJ
         iWDrrKsZQet82N4Zf+djYYwD45wj0MmuLnfKggVakeuHqz8I9wFfBg8hR9DFRqZfvpNE
         M1P7JyiqOP1YyoWkPQ6A+CcJgNvRV2uG74ikESR41OEJtuRPBkKRi6CbY/yrfSG2hllu
         F6i7THyL9cU9TDOH7vEl0YMUW0nNrBL8aYO+a1iU/gdfXCupXWC6guiLS1FMxJwRVGnV
         plqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1eGqv/h9Aum9cuRfzP0GxawnzKTcJHSd17/iuLvj8io=;
        fh=VLxpfKl58L5YbeIe/A5LMuMmT5mr1RpvPjrF4f5fnA0=;
        b=Kr/OXLFOlU2/VMeZJfuniF9xGb0fz67AAdvLTJ+Wa9tFw6VsEHX2aw8I5l3GVENp0u
         DQZ0vQPhkMx0MVyQgBY8zj9cCh7baEous2XxwBTqZPilynbNDaVD89WjjDK6v1B0QMTC
         qCIbqJEavcCKFY80F6wCU/4/L+RqxDT+Oi1Ktoyuv619nXGFJXeQPVQ/XYD8JkRPeGDm
         S7BVhyTsW560ma1YYFX/HO95jRH2S0mFnRKGo6c3CnIr9kMzJjdWRJGiEkNKcnEznezX
         TRBRfz+i5t9RNZKOJsfGk96Wskn1cDcr+3ltDyeQkI0tBHu5+vDtnUq+5QAPYTnFN470
         PZxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795214779; x=1795819579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1eGqv/h9Aum9cuRfzP0GxawnzKTcJHSd17/iuLvj8io=;
        b=JXxtM6efpKMYh8NcFlNlL34CJqOtSLgN0aveDnBAqRyYx68pSiVD49Kqm7kSotGC3A
         bl6gLnNe00THoito6CQZkQMQt1u4ySRnZ1A8jaCgU2hdnoRnS35H49m7AEc7z1z1YxRc
         6jhTyPc752y+2RBneI36Y9oTtZlkyfa5o2jsXktBaQyITQV/2bE0jVbWT4Q/5RtCjpll
         V5GPzrHPA13DZzPlSau1N4f3O7v1j8+cTCxFXN23g4CVhp9+3O0657IzM9Sb1ll6FVgw
         ek/qsRXgbfq274lmJrVv+Fzk9q1rrEbEc0jhsrlEq/iSzFMwnqx5WP1t14puP8BXsukr
         gMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795214779; x=1795819579;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1eGqv/h9Aum9cuRfzP0GxawnzKTcJHSd17/iuLvj8io=;
        b=g7aZK5B+avmZzHkzJzpzO05APy3KNHjA8bhhr0eL5QBbP8TqzgJMLzZ78Tm7OjWRHS
         e+RmdoZn8zt+XBFNH/cdukL1K9n6/mhAYXolcgcQtL/hE7sXRLUorffOlP+OZuBqw2r/
         RCpGWTb0jozMtQORuyqCi3dJx7Z9HT9PRj7w22tor3icXKHLmU0wrDAbbeZjMLix6pJu
         EII2Yz5NswlMGHyXirNd11Zle7pYsq0Lf3y4s/dMapTKtmS0pITJAQgLMU91eDEGPp/B
         LaaVq5qJxA4sKQKiWUtVVQTGPiM7IW++bmhBimumDh8CxtMJGACDE/8Wxn4FyroYijMm
         7Nrg==
X-Forwarded-Encrypted: i=1; AL+hErGzmaFUqRMJaTDFx3Vj1i3bt6wpNjTe5pmXDhT+/BuXBXQInS7l//RZu2WsJna9xJOcw2V3zXb00oc1tEc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Im9B8onTr9BfDOT5IS2cMG7rKFJ1e69lFC7eqqXJNvzaBGm+Z
	IQsPoNBAqMgbpsZ7Jq3tpU/JPTNnnAAV8+lLV07VEARVCNC58rS/iP+BqlQ8ziBz04eVhRNrngH
	67oken/vs12Yf4+lsaU4TQnB9U4lb8oE=
X-Gm-Gg: AZFdTZdj0D3GkyVAMw5fVuDfEgZqX8dUiollwWEun/kdoixDG+icGnOyIq2g2U4P2lb
	rp/Hu2SeVY1pk6Kr1NPqEXRw3q0b1lu9aq7/kFxLfMw6YnPXQQ0jvHE9z2z0/m7VjiVtRHXGxPv
	PxuVgrNKc09uDeeaLwJuq5nXU/ZvPpVshQPq2UD/sl4ndoRfoelP/eHGOpHwJPtBClRkhZTdqlL
	jyCA1ZgcmHJaNrzFmikZr5OAImxTCmEDCulBXrmDBsfz5ie63pvkqG+1bxtNryAJOJlmDs3IMRJ
	/3Wab8WWXBbgMHJUwqCCUf4HqSIdNAy+0Ttv/ibTQs9pKALqDJGxPnyjyNimy5i7yu1UvRXX3S9
	X3R3+ae5Ux4ZsSshk741/IL0NqK5Wa2h3mXgNoDFAuWlk/7fr+aNzsozupVQ7UDrw18zXqcV7wf
	3k7KgeACiJ650diyPxV9cz24FMkq0iysmyED5SKZP8g4vX0mt1yHr0SxU=
X-Received: by 2002:a05:6000:4813:b0:490:2033:1477 with SMTP id
 ffacd0b85a97d-4abb917a9eemr8798576f8f.56.1795214779042; Fri, 20 Nov 2026
 14:46:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com> <20261120041906.5785-6-kanchanapsridhar2026@gmail.com>
In-Reply-To: <20261120041906.5785-6-kanchanapsridhar2026@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 20 Nov 2026 14:46:06 -0800
X-Gm-Features: Aa3M54o22x-4wryDrkjAa-WgAkVk_I6WmUJ-pJSJHTNjra4aQw1mQAmQSzWMpFQ
Message-ID: <CAKEwX=P7To+AV9X3cXLCcuw5yoigdB8w5Ns9c9mDxJf+u5k8xA@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] mm: zswap: Store the folio's node id in the zswap_entry.
To: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Cc: hannes@cmpxchg.org, yosry@kernel.org, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 8:19=E2=80=AFPM Kanchana P. Sridhar
<kanchanapsridhar2026@gmail.com> wrote:
>
> When storing a folio in zswap, save the folio's node id in the zswap
> entry instead of relying on the zswap_entry being allocated on the same
> node. This enables optimizations such as batch allocation of zswap
> entries for large folios using kmem_cache_alloc_bulk() that does not
> support specifying a node id.
>
> Accordingly, replace the SLUB allocation in zswap_entry_cache_alloc() to
> be node-agnostic.
>
> The size of the zswap_entry remains unchanged as 'referenced' is lumped
> in with the 'length' (as it doesn't need a full unsigned int anyway).
> A build time assertion checks for the zswap_entry's 'length' bitfield
> being large enough to represent PAGE_SIZE, which can be 256KB on some
> architectures.
>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Suggested-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> Signed-off-by: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
> Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>

LGTM for the most part:

Acked-by: Nhat Pham <nphamcs@gmail.com>

> ---
> + * nid - NUMA node id of the page for which this is the zswap entry.

Maybe "NUMA node id of the original page of this zswap entry"?

>   * handle - zsmalloc allocation handle that stores the compressed page d=
ata
>   * objcg - the obj_cgroup that the compressed memory is charged to
>   * lru - handle to the pool's lru used to evict pages.
>   */
>  struct zswap_entry {
>         swp_entry_t swpentry;
> -       unsigned int length;
> -       bool referenced;
> -       u8 pool_idx;
> +       struct {
> +               unsigned int length:ZSWAP_MAX_COMPR_LENGTH_SHIFT;

I could have sworn we agreed to just inline this macro.

(btw how many bits do we still have here? )
