Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448209;
	b=r5O37B2Owdb+Dn9qGQgZVPCASFC/A+rnHmbZGbx+MfumfhNN9bo3o1Tdb+OWHM3zgDCI
	 0hJ+/4L9etGvhKDuV3HgAps0B8u/O+nh+47NtJXZMF20kb/GV2YqubdnTPqBVSH+9mrD1
	 T6pESChtJM6O1CwgnDh8HRRKWxRq+mkbk/c1g18zSnOpbnBZ5dmOPtQ6EPx7CfYHQ8KQe
	 8vZXXiFGC25iP8AZKKoIV4VwXjJo3ZUQ5o751jq/FV1RgcXHzHRvr7xKSu4u537pVuBvQ
	 vfnQNCytYnvj+b+lzMcdVKilb2S9Nir/OxtOclWTXdUmYGoaM0kbP1nBg+c9x57lubA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O+ZsCUKlDNFkykdhaFUY00lREXOJ7VO+hfzdF9elZiI=;
	b=ENR57diZjn4O1TAnw4WRa+6sHbAKz5WpRVigSbSJFQf9Z9ORQ3E8UAKTA1wejBMDk6pD
	 Do1PBOeY2+nuAMnFYwhdYAyF9Rlbfu7JEUThfpho+opHIS6YzKWXztXk3tjGKzUfGYR0o
	 1vvpYLj6PRaSaugVlWgj2R1aYd8wilLqkU3UsrzKpc08hQibE0sGT07dVlB9N5FxyJPce
	 8CNWW/WsdJd00BsPcXoORCm0SH9sWQdIytSC1QdR7jyTZIUFKKWfUYmL0rn/Hh3DjMx+a
	 kLAbz54lpf+2O59LY4jT+XoSJtOYwhfSTiVCoZlvHucbGJ6WYwQoTVuT7kODpxutwlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNsI+PYe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DB6606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77DB6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNsI+PYe
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-83c1a9bd428so464474a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:36:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795448208; cv=none;
        d=google.com; s=arc-20260327;
        b=dC2D/fqzING8Q6NMdbwH22TDKJudYwgvbytPteHaq07ovo8a6+2aLIM1BQ88eaI1O/
         meJ933KKEoApifRGIEv0uO4bDB0HFQ1VHhQRw0YlYk0SsmM+Suo50NJp2cU7ueAunvjS
         0qO/ad1ICf1jlDu9/3SP/b+dLujRB9yELjMMF08pVypNDECjXioE1QOd6NjDBC/1wW7K
         BD8DdquA3XS4Eiy4J156YcOS5Z9ePPh31PSUw6yLjL3Apu6xZNNnGQGivt78IK/jQW0F
         hLTcav5eJlLnJxzYj64j/5Fb8MSLHqGpnk4YzRriV0gd7KUUOD+37h6ksdhENXdd661O
         00Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O+ZsCUKlDNFkykdhaFUY00lREXOJ7VO+hfzdF9elZiI=;
        fh=a1UMyskmx7cIcLYO3UXKRgNrQbHse5J4jTFBswQmv4A=;
        b=VLIyRNgXujTQnaRCZdYYotrvKIqBu0QuEq3MgYQcRCakWxzsutHYz/1oTMAn6yT4fm
         LsgLJouJKs3r8hwp5UcFpCXpzLX6bYNTFfPs2h5FN7lWSuf4s1SqA9ah/qq2NAtoCxCs
         Zgmpmds794bmM9JoelrhWOLuLLX4Y3o+kGTlhVtIoXWOam9LMRB8H3pgcSQ8H2k/hWtJ
         pmiIFsjr5FbAbG9O/tbBP8k/HxSQrP78JUrk9GhaXfNYXXeU5wxOAg40kMulI8JZBcCY
         lytKpibf+xY5iRaTMfcdXSG1FwNOhd5Zc2ZSSoyDBXFVVA+uk3ciZ2V+ucfZru8mN1nv
         x3qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448208; x=1796053008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O+ZsCUKlDNFkykdhaFUY00lREXOJ7VO+hfzdF9elZiI=;
        b=PNsI+PYeQ+AW09+6hNkMulQLnuzoEeuSdYCoVNzzIkanwU2xHJWVP/orUp1hCiL0Rv
         K+7YCvNR/JTfv4WE9fcs8v6Q99IIHCQP0jfTzN+wK0LYQ+p+FRRfGfTOoQB6TG1jt40W
         jY8zxhZdTki73RTytVq0gPVG5RSBzrAFlmoouBYfCKMMO/AjbXyiBFmOshYE8uOF42MG
         YObKKnHi1uPpxcTSXi2THkliysydFb/IO3gXCEkwWDRJ870hNm5wbRb46UUD1/56Ib0G
         1RcK/jAslCmvTIbfYXrGhnwlwDShfSM+7L2kWhg7ewtoIMdIlDaMWd/m0wFF8ByQQZEG
         NDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448208; x=1796053008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+ZsCUKlDNFkykdhaFUY00lREXOJ7VO+hfzdF9elZiI=;
        b=nS/tnGZhRdXtHkIoHaJiLAB/MOQ1dBx/solNfadEGe3DE9TJcPMnzCh4/hhKdlCBIL
         QsEBwVbrhA2jnFuVjhqp2O8+lZhEQQgvaGlGXobnC/S6jUNHZ8HVIZPBz2qhKRtLyvru
         API19PpzJ0V+xC+BuoOvdzVdbpWy1BxYxcF6W1IDq1n3C5C12Jhf4KthotEe53olWViB
         UpyfqHZAqAVbxlwDhh1IgdrmgzDEY0ETaJSULqXlmkeQxPLd+uhAkmMvOFuKOpDqJDkr
         jaCo1G7iqfFXWzaDqJJT2jaohVxYjiy8DbphOA2CCjSh1yL1xFzLtQ+/eAf3v/BH2hof
         p5rg==
X-Forwarded-Encrypted: i=1; AL+hErFn+RHOT0BHScTG3KaJ9L3kGQ+lxWd8rY7ppE8MMPav07jHwL340QlRXHA61wsyo7BB4ltlgq/Os+RPawQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rgpi4iZEsGG+gaMIx1pXIGABMuZ3lXfLkQy1Jpr8jLZjLuOJa
	eBtpvwQTaUt1Vt8l7OXYmaSYG/NquG9NIGlWAX/4xsrYMPoKWCmSH1gXnFgcyKwELTCF7ksepzZ
	N6ZTo6eRPG8L49cNsRreh6HdMDPXz8eY=
X-Gm-Gg: AZFdTZeEaWk3X+6UYKEzvpvW0AIO0JTpmRclvbXVP1gtvIFOV+S0UY8zQBFzzu+lflP
	fJYO9b/hkF+ON0RQD7rB+UwNKwRbjhCiQBqDjrzIuXNChli7I9L7vmHO9L49xi2g5QGNQvS1rrx
	yIY0+pCi83OdY5BnHAnYMRxzPh8J1Lx6/ZJMWoAW80XwxntrjcC0WaJOHtEnwKRdkhxR1zA78D8
	vfccvip4ajp7ozmIbEC2+a7gZCMMSb+tuMSgE06d7mxbg97cO15lYECNDAtgY4/mOHlqUY3k3h9
	ucz/AAg3YHhlVKz712HCrV79fW/Iofc8SycbiNgLr5/TpwL8Zx0Pi2TAten2EmgHMZwOa3LZNBr
	LwdF7A4wWmLuzkYEhoy21LkPE92Pmz7CpRmd9wpUSlA+wXKjAYFmtOR55o+JfUHR33NTrICGczU
	dw3e5+i4C0H1SrS1aLftMocErA9egykIdq4DHdf7kY7sEc8dRK+eDTN54SzIQ=
X-Received: by 2002:a05:6808:1383:b0:549:e9e3:9460 with SMTP id
 5614622812f47-57a025ed532mr17234457b6e.0.1795448208292; Mon, 23 Nov 2026
 07:36:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122045319.18651-1-irogers@google.com> <c7a81b11-73de-49dd-b38d-76aabf193dc5@amd.com>
In-Reply-To: <c7a81b11-73de-49dd-b38d-76aabf193dc5@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Nov 2026 10:36:36 -0500
X-Gm-Features: Aa3M54rvn7dkOhohcibCJnEbcJ8Ls1D79SvQUldxYdV48pGWUDZbdwQoEIZo65U
Message-ID: <CADnq5_P23gnpD8eXOF-hOE3bjHcffEOQdwvfjY9xMsF_Awbx9Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/amdgpu: Initialize r in VM and TTM buffer helpers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Ian Rogers <irogers@google.com>, Alex Deucher <alexander.deucher@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Mon, Nov 23, 2026 at 6:56=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for both pat=
ches.
>
> Alex will probably pick the patches up, if not please ping me again.
>
> Regards,
> Christian.
>
> On 11/22/26 05:53, Ian Rogers wrote:
> > Two fixes in drm/amdgpu for uninitialized return-value regressions
> > found via Clang -Wconditional-uninitialized on an x86_64
> > allyesconfig build:
> >
> > 1. Set r =3D 0 in the 'else if (!bo)' branch of amdgpu_vm_bo_update().
> > 2. Set r =3D 0 right after the while loop before 'error:' in
> >    amdgpu_ttm_clear_buffer().
> >
> > Build-tested with LLVM=3D1 W=3D1 (-Werror) and -Wconditional-uninitiali=
zed;
> > not runtime-tested on AMDGPU hardware.
> >
> > v2:
> >   - Keep 'int r;' uninitialized at declaration in both functions so
> >     future missing-assignment paths are not masked; instead set 'r =3D =
0;'
> >     inside 'else if (!bo)' in patch 1/2 and directly before 'error:' in
> >     patch 2/2 (Christian K=C3=B6nig).
> >
> > v1: https://lore.kernel.org/r/cover.1795106955.git.irogers@google.com
> >
> > Ian Rogers (2):
> >   drm/amdgpu: initialize r in amdgpu_vm_bo_update()
> >   drm/amdgpu: initialize r in amdgpu_ttm_clear_buffer()
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 ++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 1 +
> >  2 files changed, 3 insertions(+)
> >
>
