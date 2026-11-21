Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795283428;
	b=QCnuVhpp5Dy66wZfb8xrWRt1iiZBPDAkjzoBZGAc1IX0GiFo8+TJACqDwCOGRtS0Grag
	 hsoOc3GhcuDMw4YHEdurgbivJX3PmCwZ5w4uc4WB1E5igGqVYdzdVre0acVL/ZT2L4ypk
	 AjY656+meuGA9IH/9FUyQQHc7JARv0qMphrXtxRNhLCea5Bf+PHiLxhIEzAYYtKpwUKRW
	 R5faSS0ztD6RVOhEppK6rviDPqmI8S+gka66RUQvukEcV45P9kSjhhz5LquET+AtM4D/Y
	 /7ZXRPRFfuSh37zarGJaQK2jpf+v+B4g3DalZDuM+wZLZC4S5SeJbo2k0UD2YhubN6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:X-Google-Nh-Sender:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Xu4M4Rq3wV8DgH+HqoVMbKaQd8J/D8bo49jgEyUz/XE=;
	b=p3TDplVxzlhNM3F1KLO3WDteoGrDvWLv82zN938z0v9EG3ry4INihAUwATTCCCFMEST4
	 0/YKz93dwGpIaC+kDGhecQJrrd7RgZK6WSxDLpy74fVIbQ2VcO7+Nl7GG6Th0+M72ZEny
	 c+p0lPdaufxRY8NOFF+GzfHbALSvym89+L5I3CWZtEQytbYLQpx3jwyRNPwy6mivxNoGU
	 yPm8EBwGs4V9Wpxwzqc0D0pPf5qFrTieYEvqmeZx0J5XNmtTRRQsZ9EovUXYef6UPPWLt
	 FBZXT27digl/cNHWscH2TvWNwDMlgG5Hs+xcU/fFxehjvG/SwF92ypUuS69KC9j/AUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iLk6aNgl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A88606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A88606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iLk6aNgl
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b10d24345dso17634157b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:50:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795283426; cv=none;
        d=google.com; s=arc-20260327;
        b=mZjToSahOgw5JRALx2GAnbwhTURzTtCcQF+ohuVvYmUoJ0ANaT9IM/WaD7adTPTnab
         epnumlBW1ULd+yZt7JLXek7SogHfmkdPYAQe+5oDYgh/pEH/3sx/T0qIE06lnCl5SsOn
         D1+4t5zjGwF0kEhWq3J3C4kQkCSdulDREIUAr2AOuwtuCxgRCDwToMZyl1T2R1GchALK
         dvpTr+jVw/d9SBBBPWhJSBl466G9jz0qsF7WduwCyGOWXfu0Dcn18OiNDwsL7EZL8d43
         BzgRbMLyv4S9fdjmPsJYngYShITC6VJir9nfKgwyOnahpi+ZsuKDgAkidKK3dX5zYmYT
         hQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=Xu4M4Rq3wV8DgH+HqoVMbKaQd8J/D8bo49jgEyUz/XE=;
        fh=Yi29athqrXIxFA9zUHSAd0wkB23EAFMgbG/ByhdwCq8=;
        b=PWaOgOPiid1hbQfqyMNJ9YpE0SxSZAEYiOGiLTGtqDgxip7pbZES0UUHOonJAGFVM1
         uHm3bGIXYlwpiKsRAXX5wC0iEuRwsfUtvJFfFpoGf82gcEji6Yqdv8nfY/7g/LCfBALF
         vz0tEIZdGppt8Hbgs5gmmd3HfifteH2aPwrrwvE5cEWM944EkPSkwjOAa7jQ39fvWmQd
         M7so6Kg2IzCKa8Qwf9O6V01FYlvLlIrxoj9KKuE3aTcmS2nxk+RwD3I3a7xeu2LqXX//
         t2V3GEIgUBCSdnZuO/oQ7nklcFMp0+cQiCCR51U4Q+REKSW9QsxIt4flSEAlHzp4l8QY
         fasg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795283426; x=1795888226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xu4M4Rq3wV8DgH+HqoVMbKaQd8J/D8bo49jgEyUz/XE=;
        b=iLk6aNglaHLSfejsdDCsnc7RX/dVGHcxO+3s4wAzV4vM9SNB+fdAI0/vrzVTvqc6wc
         Svla8+8t3JiJp43AkfHtiCef+rSVtiUNXCNiNnDXv0Dx04IxY9NLHX1ExCHffschAOCp
         zy9jJomDn1DUzt7yRUM0A1XYpKDHMS4SKU7rqS7KN91edKs9iqJeydIhuhyr1Om2NmdV
         lRkMFCB0dne8OaN3X19CagYPJxfBZpEhA+ywtlMj6Y2hGUQw8E3//KydV1ur0kiFCzYP
         oBOPzz4qB5+Klf1SFq2yHbYTX/p3M1ScQrrPlf53r3/tBT4Cy0VAnnSsIel3030+r89S
         czUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283426; x=1795888226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xu4M4Rq3wV8DgH+HqoVMbKaQd8J/D8bo49jgEyUz/XE=;
        b=fbC/bZ4mwIladc3xUl5d5VLfTEN0D+iyMscpFmU6XNsIZCv5/qbt7VrKt+0htMSbkz
         uXPAYZEN2sfSeDIrdNTX5DwH5Q3VQF9HxtsJmifCexh8IKtvgUNfKRmOkvA1tfRqx5j0
         oJI/6GcY2ZrsFyQSBrmJwbLjP7z9/tZ4jA5IDUYTQoH74k1/u7hz6AIiDHlo4DfYQF1E
         iOF9ZO8ZLljchyv0c/2RQBgOEFtKwWJRRLecBZMAPhcWr6CU+8PFpvEgbodHjqpxwptt
         bkQHa9jdDzdSP8FaPvr6Tsca+FGJYe98GFtSWDI9T+F2bH03qRy+hIQdCU5i1ew1P6pJ
         3H/Q==
X-Forwarded-Encrypted: i=1; AL+hErHX8G9Xjd13mHfS2rkWTSCuLsglRhiTJnKV+eaG6nXl5flFuFMAGe5KIJM6bAOkW1nhYam3+an1a+UZc9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CNwMhkOKC1zFWxXmaDwvnpD/sAdwvKikxFkrCGKbHtNAWRAZ0
	KUNTY+XyKhfXV/px7XfchGsg8NTNy4Y+d1yoNezk56j05a0Gp1QDhTeEKJGxOeKkzvdoaxd8phl
	hk05qFP5fcUtpqs0tLkRv5sDZK/Gs+bM=
X-Gm-Gg: AZFdTZdx+nvLIw3u9yCkUAEkNcOeSqU+gJgzj5+yw807ElZQX7iy1mLmKVyU7XXu1y3
	hQa0XWO+qYzIxgsn6lXiiK1a5sYXqP82X+L8VcgeH4RgwlC5xtw0x2u5/FbEuCftae578Ywub96
	URZY7ts2MEHDdJop6i007KHTgZkHf8sg+62QcKjLZimbtrbhTA3w9A93iA2H3hBP4MngtFgXzw2
	E4PzXAj0UrzaUh5Rl+cUzSOPDZ+sPG3XAGNPcNcAvWJfkQMrnnxCPgsSSOgGIsu5kqH0rgbV0WW
	KEadpKtBZ8JLzwM9FvMLEdUUP3zl+pDoL/UKyusaByV6r1ZTf1jFOpJJmj3wT/q8JB+Kp30Qr/o
	wPy18iYDYOp//2y7gWu34OWLahSCt8iUGd/njNnRXigXw/Zqa3CQX7OQAQzVtqmGhmlsv8VEZcG
	vgsUbCWX6/+vF0ai+5esMpBpQTWhrjiaddGJHthLsPSDFRJttnDjhvVdAdgzUdDTh+nLUa9XZFh
	Q+AbABFw7Ti2wK5Nv+kNY2rBvg=
X-Received: by 2002:a05:690c:b86:b0:8b3:4911:2dc1 with SMTP id
 00721157ae682-8b5204ae0e7mr30662797b3.39.1795283425537; Sat, 21 Nov 2026
 09:50:25 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 21 Nov 2026 12:50:24 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: peder.bergan@gmail.com
In-Reply-To: <CANiq72kWXzP1SWUvhOT2k-rNjopnySXeBkjwrx63V2QUaLpnGQ@mail.gmail.com>
References: <20261120-rust-helper-namespace-v1-1-3b9a05553ff6@gmail.com> <CANiq72kWXzP1SWUvhOT2k-rNjopnySXeBkjwrx63V2QUaLpnGQ@mail.gmail.com>
X-Google-Nh-Sender: AW_J_UoEym23HGvNQ5zzCr2fkBwchbIS39LY0o3smkAVD0qDlNYdj5QfaNo8KarZLsYzQWlSiaO47uwNu7Ha77BLqJukKxnb1c3zQq1IDN7OFCWayb3yR_WclseoF6OW9P26WFQRXvNRjHgOWmoGpPAk7z_ifQH_LJgp626YEFxxIOIOhhyVgfEATPSFauhLyvCp9Dpd-VJp0i-FFJ0ot5roV2PTcyNx46IlCqKQGMzHu-SbF6WUbJBJ4C6Us7wCCwDfy5Nx
Date: Sat, 21 Nov 2026 12:50:24 -0500
X-Gm-Features: Aa3M54oiSweFMBwEnXr8v5RhNblmDh0i71sIY4AU6gHF4PbmUFHsoRQyMcHMRfA
Message-ID: <nh-eaa5d67e-6d05-468f-9f19-273bc5b23ad0@google.com>
Subject: Re: [PATCH] rust: put C helper exports in a dedicated namespace
To: miguel.ojeda.sandonis@gmail.com
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, mcgrof@kernel.org, petr.pavlu@suse.com, 
	da.gomez@kernel.org, samitolvanen@google.com, atomlin@atomlin.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, wedsonaf@gmail.com, gprocida@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

Thanks for the review. The export formats are literals, so I'll use
:=3D for both. V2 already added the namespace import to KASAN's C
metadata.
https://patch.msgid.link/20261120-rust-helper-namespace-v2-1-14315658f59e@g=
mail.com

For v3, I'll build on Giuliano's assembly conversion and generate
EXPORT_SYMBOL_NS_GPL() directly for the helper list.

1. Would you prefer I wait for Giuliano's series to land or send v3
   with it listed as a prerequisite?
2. Should I keep the KASAN import for v3 or move automatic imports
   into modpost in this series?
3. If you prefer modpost, should it add the import only when a module
   contains a Rust object and references a RUST_HELPERS export?

Cheers,
Peder


On Fri, 20 Nov 2026 22:34:24 +0100, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Fri, Nov 20, 2026 at 5:32=E2=80=AFPM Peder Bergan via B4 Relay
> <devnull+peder.bergan.gmail.com@kernel.org> wrote:
> >
> > Suggested-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Link: https://github.com/Rust-for-Linux/linux/issues/216
>
> Nice, thanks for going through these old issues! :)
>
> > +rust_export_macro =3D EXPORT_SYMBOL_RUST_GPL
>
> Do we need a recursively expanded variable?
>
> > +++ b/rust/exports.c
>
> Conflicts ahead; this file happens to be going away with:
>
>   https://lore.kernel.org/rust-for-linux/20261112121512.1670347-3-gprocid=
a@google.com/
>
> Cc'ing Giuliano.
>
> Also, what Sashiko says seems reasonable: if we do it this way, then
> we may need manual `MODULE_IMPORT_NS()`s in some places, which may
> become a bit annoying, even if there aren't that many mixed language
> modules so far.
>
> Actually, perhaps we could just import it in modpost if a Rust module
> has any Rust translation unit in it...
>
> Cheers,
> Miguel
