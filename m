Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188565;
	b=GXjf6+Ki08RE1TnLTdeT21K8dbmEnBuZeYvXzyfFb0JtwS+daCzHoaZ6IunXhBvTg2Xm
	 yN0LsxLCehl4uxkcCrL65sL4Jvepf7aLJIhj8mBqU3+lTKcNSxzZcwLyZm8kvynQtJY4F
	 rxR7MBtFtdFy6sZ0uIYlpmqdwy97DtGfFHacYyuTU17y+nfbY5VcLnz80PZdtFjZYLeEa
	 JXIl9isM2RiR076v9RS3yJWVuhB4sMv6s+Va6gwoabILWzr8GyKS6C92mKcJncbPmjOIN
	 oNMJoso7n42vp99hsPcHv/fUWlSBh7A20mbrwd3jOndu9rAr3vjWx5yMTK0drKUGmEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=DjTk1CWHGC1H08TBW3j7WrwU8Yl7Bux9rvyQByoacuk=;
	b=gAPWiX9bv69GjgsrRmXsRlnn5DYOAiF/jm2/TJ+qcTNT2hobLl1zqqF2p1anJwCPX3zf
	 BvWCkrGaq1FsCcRWZuaSQTV6Fa4/++TEYMtwAGcihvJmgPV0B9A9rTDm4JooK2lJkof43
	 KKUs2SGD0CMWNeBh0m2BXkpfaS6rVkMuvKeaMdgSx/1pRrV7uNOOxEg2rbm6Dbij02CZv
	 vwPcKOwfUq9zz7tB6+2V1+/KTBtxUYqUDnb5/KSInxi5a24ARmKS12JX9IhtnYevsTG77
	 jwZoZBgj4gh7UuRQxWL+nb/L5cYzkoEbJ5z/EHllWjW4lSSVD0uZ4K6/VG1actxRrww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hCzH85BV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8F9606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB8F9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hCzH85BV
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso573427a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:29:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188564; cv=none;
        d=google.com; s=arc-20260327;
        b=qcGHpxA2DzF4r1be36hhSIE+3dDdJ1Aa0SkE5DxcNAx3Pd6lICn2ASdT3Hrel+Q3gO
         DVSDRHoMEEKAiIBE/CvU+8RqHtGFpnXFbSB+XBEPdqrnhhXtIk/n9rMdz+uc6ri5pfRG
         vKTDSjlASSpp0VfeWsCg5mzegJC5B6ewtr6WsK2IuV65GasfCBBonxZjejYs/g1n9yzN
         KaH+iRwaZCFtXq3uoHjGp0gx2urTk2NvzqKmTQO3QaTIZizNQZz0hTgrjRqYTU98V9i+
         yBOaYCf+BB3V4sexHlcF1Nv99XzyXz+OPQDB9W6kLqVTvJZ1+O8g8iBrWZm+GqtGvvrB
         YtAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=DjTk1CWHGC1H08TBW3j7WrwU8Yl7Bux9rvyQByoacuk=;
        fh=mMCZhndxBHXk7z9lGPT1S8TdcYKAoH/4MmqXE3jtLvw=;
        b=YH1f9efQylTbYel4zPRo7GP9BKKalk6ihkaA356tYlMHsuuW1nEbIG0g9G0F68OIOr
         DXEzNFTZivcup+QNCNo10huvXTYw13Bx4mNPbU45P9RXoF9aXPtzhO7NxNob/PwDuT9s
         /FGWRXzpP2vYQXKJzJPqNEh2dM4FnVh21fE9jgkOuVYYAg/BZnsCyMcgLJlZPNLS0ugJ
         BJK3uWLGiaWGJmNntZ7AQEV8ypprt8T2SpTB7/DBmVQbrc4xIHSSWrpJgd6VWR7y5KpP
         2VsSMoIfiQpz7IbIiSSuG+gSQbk30JimwH2ql4nBT364HLaSzadah6VRMUD26pg7GkBR
         TsmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795188564; x=1795793364; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DjTk1CWHGC1H08TBW3j7WrwU8Yl7Bux9rvyQByoacuk=;
        b=hCzH85BVPDhLO7lMrTvWeF/3llEmVxOgnazI38Q1Aw4R2uV++6lMSeDT86PyrWhCK/
         7FxiYQNuKkg5Szh+/Zun1ocRUKYdRdonyhbZq+3IcZvT0M3l6Wzoz6+FP4hdgW8NTCsJ
         fJLNAgsxfsNN8mM8MZeianG6lWMRzmh1BR2WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188564; x=1795793364;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DjTk1CWHGC1H08TBW3j7WrwU8Yl7Bux9rvyQByoacuk=;
        b=BrNnZ1c2VwsxKUq8Sdvd2RH/OewTIxjvkk4bUP1GewWU3Z+m34M5EwequnAnEOlDme
         eVCYmhHnXzZrFv+mHqjEY2gdRWnHQ38+6Gy9TRespya76QwWjU8//nUOoYBbD4hdKBmL
         PX6OPz5GLhsbb7bu46PUQGp0bPA+Y5MAUXmjzk3GfDjGP0MpaRJfsR1XXK3Lmg+lBftN
         Y5kua/nMm3iXSW3LVbGty08n2v9kFGWkENlakiZ8EP7SSgAqyH+NYln/3QjOlSmvSarq
         ZDRfm9k33K/e+la0i7m4JLsrehVzP+I+B0yXtAeVgKdvOoYNQmOIbQXn+fTNRRF0ow2u
         ftlg==
X-Forwarded-Encrypted: i=1; AL+hErFnE+vnbWO9bj/CZb8nlDiM/jipKziktQf0UWoM1Sh/37khPdxJKErgBjRurbjIDI+58fWEmyB4741Ejxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z91dUhZwChtEaQ0CwTJCU3KLBqFiDnmQMfdNWS1rFkj2S4BvZcj
	bVepVO3+9I/sucwjWxe8eGF/5SjWL0QOTffTqraOB5IZNje3xtV+RNpSr4NDwt2i6lvojjrFxLZ
	vfNT9/bu1V/1O2LY8UstQzBLpRkUIsymaIYy37Bt8
X-Gm-Gg: AYBFou0zi0cB7cuQ3iX4W8ocWZ+WIeC9kQWEGjdhL0G2YZEri3H9gSj3BxaP3QKG6Sg
	Fv0QEkzqqP/1Xxg4gNW9KVAIJV8iz0FobUN6SsaU8hMS6UJvwl/h5IxxvSXjdUuavjbniKM+VUI
	pr2ArDPDt/AsP+4Hjpafft4qOuMUl2tz1+77c8r5/MGHezrjwkuoKQQdbdnIAEFJ7d67FqbMGCe
	Ebk+cwATku8SLa8ZIDre0q7PetIf4eZQohLGzPH9An1Xuk3LP3g3fH1Tt2zkAm8CBxivtd7VKM8
	rSSBamMys4E4KWGTzugOmQam0yvV6lh/EtSpyTcVfi9gb2uwEmR5JDIF31FwSlWdOJP7nDr/FBq
	l9ra2KqqFNj8KoCn+01kqpP2Dbo2QZ3KJzVwmnmPT42lyF3XJ6fyFespPxX06/EZjO0Kea/RBlG
	wGp45csnfCkyqtqi6X
X-Received: by 2002:a05:6a20:3d07:b0:3e1:89d6:ba1 with SMTP id
 adf61e73a8af0-401493a748cmr4551292637.3.1795188563880; Fri, 20 Nov 2026
 07:29:23 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 07:29:21 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 09:29:04 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261116205320.1621386-15-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org> <20261116205320.1621386-15-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 20 Nov 2026 07:29:21 -0800
X-Gm-Features: AclHuK9eiK6dJA-hmCi_yTft6UpmFh3_W8w1gc2pLqne4iXEAqPidl99ghlI8xc
Message-ID: <CAFLszTjEczj5OYCV4sXuAHieg4rWZk7F24V-uME9Jvv--=9x0A@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] fdtfactor: Parallelize blob compression and decompression
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Douglas,

On 2026-11-16T20:52:57, Douglas Anderson <dianders@chromium.org> wrote:
>
> Because Python's `zlib` and `_lzma` C extensions and `subprocess.run()`
> for `lz4` all release the GIL, add a small `_map_blobs()` helper using
> `concurrent.futures.ThreadPoolExecutor` to decompress input blobs and
> compress output base/overlay blobs across worker threads in
> deterministic input order whenever multiple compressed blobs are
> processed.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  fdtfactor | 190 +++++++++++++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 138 insertions(+), 52 deletions(-)

> diff --git a/fdtfactor b/fdtfactor
> @@ -140,6 +141,32 @@ def compress_blob(raw_bytes, comp, filename=''):
> +    if pool is not None:
> +        return list(pool.map(lambda t: func(*t), tasks))
> +    with concurrent.futures.ThreadPoolExecutor() as new_pool:
> +        return list(new_pool.map(lambda t: func(*t), tasks))

Is the shared pool worth it? Creating a ThreadPoolExecutor is cheap
next to compressing even one blob, and factor_dtb_files() already
relies on the pool being created here. If _map_blobs() always creates
its own, the 'pool' argument can be dropped from
_extract_fit_fdt_entries(), _strip_fit_unfactored_local_fixups() and
_factor_fit_group(), and factor_fit() doesn't need to be re-indented.
What do you think?

BTW the default is up to 32 workers, so with lz4 this can start up to
32 processes at once, regardless of any -j limit in the build that
calls the tool. It would be worth a -j/--jobs option, perhaps as a
follow-up.

> diff --git a/fdtfactor b/fdtfactor
> @@ -1668,7 +1731,24 @@ def factor_dtb_files(args):
> +    dtbs = [
> +        ParsedDtb(
> +            p,
> +            comp=comp,
> +            fdt=_open_fdt(raw, p),
> +            uncompressed_size=len(raw),
> +            compressed_size=len(fblob),
> +        )
> +        for p, fblob, raw in zip(input_dtb_paths, file_blobs, raw_blobs)
> +    ]

This was the last caller which relied on ParsedDtb reading and
decompressing the file itself, so the 'if fdt is None' path in
ParsedDtb.__init__() is now dead code. Please can you drop it, make
'fdt' a required argument and update the docstring?

Regards,
Simon
