Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795555023;
	b=aO2lBIqG+eblyLEF6TFASl5RZPQb1l6EnX8gan7B2lo8hyIC6uXLZmjjU4kbRlts4Oqu
	 /bgXXVOEX5VQCaKnrkgWL73vfNouUTdYP4zojGSbKliJ1aHidouD3nxkZSnn2tZ7l4ZzC
	 E56Oks7vUGQpTE96oI1K60+Ti3Pm9a8p/EreYZKw2CIDFexfib00MIc4MEHbBQ15SVzBx
	 7xosQFFC3zxzhHjyLda4ypN78XdX9GPFIFLCUwQYwMO188ZDm3ENOfvJT/CXnURcVKIXB
	 VHlyHPhu0jma6l+N5jN7Efg+BYiDKcZz9WtC2Oo8CDiTNW1uE52zwDizL2CQ0CHjmMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=woptNqYegtlAA/3EhXiqmTlLN2r1UfDWEk1Rf7o05To=;
	b=MPEL3YHedPAgfq7BAoFwlfgIaKOPz0ozuWweTroe2o7BRLKTgX57kdA4iv3A7MTUuv1u
	 YAfVvwFPvuN4UHewoPrTebAHp1b+EImdSjpw/zOydriYQFoEQuLRtfkenyGenIQBESfdn
	 5tRTwArvVGq5G2N5m51kiGVIHnabtOBPe24BqMfCZjk+R9OsYgR8dUH7eVr+zinev+CyA
	 NNqSTRyYO30tVVuvxjA+WeqGhStEpIwlG4U8et/iHxHMhVwgihcEUR3TeFPDAnSSMAn00
	 gBm+TXrx7Bpr04+308JyX3W+Ck3Y8Ei1E4bt60EMhczMvqGWeuwlUiWflEkVZpTRZxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ENl3wJ3p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F60F606A6BA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F60F606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ENl3wJ3p
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb845433b8so146325e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795555017; cv=none;
        d=google.com; s=arc-20260327;
        b=PrKrgRPSO3nNdkBRSrK7XKVyW4xnYdsjxF9S+UxlvMJaCgf/vWvdY0wKvrjXOA/XRb
         7nxC4Get9kzw2TKlY1Hgs7OdmGUQsJrkE6UszTgFVo6Usa8CIneyLWyRPmwQ2KsXaz+p
         h//Gr/2+LGMZ4RES3AafJY+dDMiBMjM/6GENvprZVMbccOGcESN+f3WWV3O1dvgs54gH
         LLnVs4xZQPHYmtoANds9KC85t0cmyYCT2aRvJ4jIwxcaDrfTke7zTtlfVhbTpYjql7Vh
         fZnTksBH2mKB9DuL/xCrZXNITSXrt650EZkf7Qii5yGXSFX+1yQr6wt749JbxKRxf8lq
         z8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=woptNqYegtlAA/3EhXiqmTlLN2r1UfDWEk1Rf7o05To=;
        fh=yt3e4P7HSa7IjqFf+lIRkCldnKIUcuEsbQMdl8aZJao=;
        b=XXF1mwjLnrXL/uaFadXsf7+im86FuqG35xU6CdRhNle1lUSpt4Z+kThftt/ihyTUkw
         8FWW29pBoSQW5YdqwH+JNES+9RjGozE4rmS1mDG255xNM5oAQAa9ChFIaCZEtA1RmZFH
         YiRwy/xzEN1b4a0fiqzKmYvon+kJ/cwOyNgqYFGHjqy2PqKGTd+c9DaXd0HQwFTaR0ml
         Y8wlDqOGkBIoZD0zCxyBr9VBTabjIZf3FpZ1ZIsgyqytPPJtEC4moOBK6XJDxLaVNvmE
         w47up11wRFdYKny9bdsOsB1nlehEYqZlksWG86iDqi1saqAHmkBNIggMoztee2eEpyx0
         EFkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795555017; x=1796159817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=woptNqYegtlAA/3EhXiqmTlLN2r1UfDWEk1Rf7o05To=;
        b=ENl3wJ3p+Y/a1SysInSkiNRSJDmms79EIC1Gkrn1nJiecehtRbXtnZFv4RVHGWeN13
         oWsVLtdFGhxNYxm8tAQtl8LKZYYH5DKN4Rk/BA5L2yx0nJWokwMaTGXtMQvAWjKHD1nk
         CNM4bsZfr4zXqABXcPLWIxsw3Pg05osVgC5379nRm/Ljz8fpfCmuUL3S/JrmUrLN1kSW
         raRZHTuCtpniB5nXyv39eyBmOQpD894i0FQVqE7OuWjeMYjHbHKwufyXmPLo8SVoyBcL
         MuZgXoDc9Od6HIRKwTDpEdOkL6gcOlpyT/+z754mu381GCP2poipfujua+zr/3Alx47V
         mCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555017; x=1796159817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=woptNqYegtlAA/3EhXiqmTlLN2r1UfDWEk1Rf7o05To=;
        b=R+7xrds3Eu6zCH5hNyrhr7rMuoOQG5bRyCBKlSUf2zpHxkfXTcFUKFCDZ0wOb/oml9
         ExwFY3eKfN8D2FdWoHN9GF9+16dhTGkjhmCkEugufdpv1AZ2vntfFd4MYUDBxdkdOLET
         wHZTyzjfNrAaIjpsLaGHcZpWvHgiDxBRm1bfG+dO/xGHT0EpmwFAcfAf4795wHe2DB6g
         P5EwRKQD+uOjkJiQ0CWf/JjpNwFY1IO1fhRh5fp0GVr6xsswflN0KAo1yobZkRf7/6bD
         CYZ3GhlKsxfJvfON+QH9DxTAX3yqStkHv89c1lf7V45BMpbJhw807EQLkDRdl1fCWsxQ
         6YDQ==
X-Forwarded-Encrypted: i=1; AL+hErEjJaYBFcJnEd8UQ/xPTuqs4YMFQrkO9tKWh0qP3FEJGjJcyu4f28xgsD0/Bo2hOmjB8I/eCHXpoFbG4Z8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iwJiFnQmmP0b97Yw9zof3f0V0YPlpQiiZRNjXKlO7IiYdFEuF
	gbed99zrKItybj++yLUwm9n//LmE9xmL7FHz13frZG9f3V//6tDSIxvGSv1JC0+1TCg6gnF8nc1
	tl3bAPdlCx85GIh84FCkEFS/tDXl9fYCzrhj60DQs
X-Gm-Gg: AZFdTZc4KbS2ymNV5vCDAy+sskKsm33Hs8ZfqSZjDircwvKv4F8eHKaphfyMzaJOVlU
	b1vspO3Ie5j/4pkjn3bmD6MUAk4gDdZpFnvJBjsf5uscDtHrvJUXmwRJ/yK+iUpU5WZNyBm47S6
	JD0uwvnG8WEqhlSs7mgoVvb3LYeLwgSHMNQN1C65wkJHy4gLU4YccAyvb/TadIyRt8H/HvsYuu6
	T8ZQ7NTTAvHiZkk5dMEXxWbuZRvnebYxTM2XKTe95wMQbzxFbmIq1gfScH75AqoEaUvkPkYIdwq
	5tTdr4kq2zP+5jVSKq+7w/p3P2KfTnsJtvhK7jif2F7u8CqSE6DIBp6dJ9QZmdHDMuKSY8Z/AJh
	e30JnENuRkqcI2PZgCGshSsJtodkPW6XfomJtCSwRd2w1NPmb6kcKCn9zbfYWZcjQ2kMB+Jok0F
	uJ8iC/OoRqCs1feS35dE89aA==
X-Received: by 2002:a05:600c:4f0d:b0:4a1:a48c:17eb with SMTP id
 5b1f17b1804b1-4bb916369c4mr5002655e9.11.1795555017146; Tue, 24 Nov 2026
 13:16:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev> <20261123-feat-udmabuf-huge-pfnmap-v2-1-3254f801fc36@linux.dev>
In-Reply-To: <20261123-feat-udmabuf-huge-pfnmap-v2-1-3254f801fc36@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Nov 2026 13:16:45 -0800
X-Gm-Features: Aa3M54o_hbLVSlOG7JsmOAd1qF2KuaOISZwlNoGrfoGShDk7KQSGd0nh9FrptyA
Message-ID: <CABdmKX3_4=HiNZnurUAHcrY5hkFLPrLer-q6cV76FvmJkikmYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dma-buf: align large mappings to PMD boundaries
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philip Yang <Philip.Yang@amd.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Natalie Vock <nat@pixelcluster.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:45=E2=80=AFPM Qiliang Yuan <qiliang.yuan@linux.de=
v> wrote:
>
> A dma-buf exporter whose buffer is backed by physically contiguous memory
> can map it with PMDs from a ->huge_fault() handler, which only works wher=
e
> the user address and the buffer offset are aligned alike to PMD_SIZE.
>
> dma_buf_fops has no ->get_unmapped_area(), so mmap() places a dma-buf at
> whatever page aligned address the default allocator returns. A 4 GiB
> udmabuf, for one, lands 616 KiB past a 2 MiB boundary, and then none of
> its PMD-sized ranges can be mapped with a PMD.
>
> Use thp_get_unmapped_area(), as filesystems that support huge mappings
> do. It aligns a mapping that covers at least one whole PMD to the buffer
> offset and leaves smaller mappings where they would be placed anyway.
>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
