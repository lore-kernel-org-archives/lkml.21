Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795379168;
	b=vw5wIYhqxL3e+Crg3NEgiML5+AhxJWEr+U6gL5C66BpiobmRPe5eiMsFifGQskmHbReC
	 J0jl6ULsv4EMUnvba7MMA4YAInpThDaFOcg/BeVdMZwXtBO6piEpQictIEa1lAsTIENq2
	 f43ho4g00GFsOR3okVY7Pnhk9KUBoQl7P2YCdZI1SiWs1FAMCdEjJwk1FcUs77DMPy3SH
	 0dq7tyUQUkgYzivTzv+Fdt/+/Xhfuco9cPClgrRqRKx4FXlCYC54bDuMejreSULWRjeQG
	 mJ12BUCuj2u94q8PRvWUiWa5NtE2Jc7gNn8XW9OD1wnvKkYEz+z12SUNCxfu8AezR5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795379168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jDO/H+Y4L9JRvwYDS18T8LLRtt6pdAf4wwDTNx1nY+0=;
	b=tgqzwiHhROTh2S7nLVWgkct/NXdXqtfQT8FeqZcaV+IVqOpyw67962+ta88OZmueuKUb
	 QHjpCccqqD9mUWlSJfrIh+gzlIyK0T7KQTfuNJFWeT0olBs6qJY33CXv2rNMOjMYRF2O/
	 7qxIQoL2nG8iVAbLLgzMbFSj4eLgidon0EtDe6ZikHjDYhqAkdlAtlezQlpOve8LoAGo6
	 dNj3OHpbw9aU/C9YRy3dSbN3qFY3mJzpFnoQhaU7kcy6NK7y3GKSCDvU16T/526KY+dXq
	 eUn9lcy8i/uZTvH4CXvFZtAnfQkP7nUeREQZAaSC2rx6BhaRNiNDkmEv+j1gVUanLOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bynar.io;
	spf=pass smtp.mailfrom=bynar.io;
	dkim=pass header.d=bynar.io header.i=@bynar.io header.a=rsa-sha256 header.s=google header.b=jlOBZv7y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68A8606A327
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A68A8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.a=rsa-sha256 header.s=google header.b=jlOBZv7y
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-380b40312e2so6294483eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795379167; cv=none;
        d=google.com; s=arc-20260327;
        b=AlSxFryDSU3SgBjYrc80IrW8BH8M3UNFerja3+jiDvGBiWvOg21Ffa4LNrbbwFhjgf
         Y3advj5v1eZNLhL5tNptKhnUMaJAnhL02h+UHqyNNbEcliNoShs+QSV9fZoKwjQock9n
         4xbiy38/saprTv+Y8S7C7raij3UQVRpu4HwW1WaXa9Q1Nw7go03jtXZJLh1Chmhmkuz0
         bkIVkqD9W9ldCD2vW43U9hIKhXNUAHm1H32TIBec/dk70AbJUcFm+IllhPNZZ3ot7yZf
         yb87IijhD5RUP7AY2bT0J3pKuxCo/qSrKXFppQTDKTGgueUFnqOBlyCo37YnOHGkkYu4
         xjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jDO/H+Y4L9JRvwYDS18T8LLRtt6pdAf4wwDTNx1nY+0=;
        fh=F3Tvl/EUb4So6wFSa5Jxxw+pc0YPlsFTivDxvvCMGLs=;
        b=PopLwM/5YzKiDW6QbykmcAsTmYnt807vIcy+u5Mml9Ab0gqYtisMdWj1ckssyNtEfD
         zuq2FIQTKtDl6b5CMltpfaMIqq6i1lNdT8gpp9BTnr80DNK5LPo9b6jJ+lBoM1Ms7+WU
         BkFBjmvzMWyQo8lsblBpXninZVg1fxxBgoiH96t5q9M3hhiduFVRLAI/7GbP/T4Uk5Xl
         pCAUxP45jjFPCmLRquEYzLEJN0n3fb+3O4PBoZ5j+SHcfSb43/cZ3gBAO6P2VTft9UU2
         Hnk6QDE+sCeKwEvfZAfPszUrbWpLeWBewQ/HqU5mhJAL+TB5yoBNIIb5MsWSPWO4uAGS
         CvCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1795379167; x=1795983967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jDO/H+Y4L9JRvwYDS18T8LLRtt6pdAf4wwDTNx1nY+0=;
        b=jlOBZv7yXjbS4PVGkY4TyPfVt1f6YxrHNWne5CMzIzfmeCwP+IS/yMNZ08waohPsvJ
         czJo129OWBAi6RVO8jB6Es1EAsmhW+OlYPrulBmApcPPo7Kdlg2FnKOm/meIq5JJAmoL
         1Aa8NGDlVGAnWvo8vbfTcPyQMLV7rSUcxLM+lqCc1VyoZBidorcEGA/zBvWmSI4wvzf+
         qOVBNAMIiHx/oikBRrW8pBFcx4QgSvJKSpCCy11ZIsCF0J5Z75UAWsdugAGo70dnlxN4
         Yj+Ig15621WeZQRPNm3n5R96uEKQB9wfKeRIrgWLtJp6kR0n/81vglzHjfWqHDP3Y1Z6
         XY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795379167; x=1795983967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDO/H+Y4L9JRvwYDS18T8LLRtt6pdAf4wwDTNx1nY+0=;
        b=R10/CvVTIOS+HWnEDy0bM8FSSep+YVQqD6sTcPVt2gzB4Au3G8/7GpXLzlAMaWVyLh
         iRMZizhDSU8Qsncp+JFQPK/73iufKHdBPkrB/fe3AqdhRAzAKONqwjsdjbnqo5QmwBwR
         /WoW7gJxKpy28EB/HAbHXArqyuEmbSlI/Pb2sLvWfer8VCk6bnxlpIcBW79m/AymCQ/n
         t2kbfYzmv7JcVtLvJXbRAEIBoUdn6GA7BhooGBh3H2KlXtyxz0ha+SGUdQPDnOrZEcB6
         cHGQO8oX8BehXV8gn8atIXiziSk6OIaJwrXYd/9Z8au4/twSOK5vywmx6N7qVH6HYNdB
         UvjA==
X-Forwarded-Encrypted: i=1; AL+hErHw5tvdCj205T656n3sz0Je6wNhJwRNROZN0tbF6zITZSww/FQKEYhL12FFdI33cxXWnyMEcDt1WfjIFss=@vger.kernel.org
X-Gm-Message-State: APuU4Z92OWpGduSoACE1tFyzyn26FP0V7S1MCqtlsgGmjcqeoHRyCPCO
	ywZS+GcBMTAX0J/MsHD02aGsT2b9+d1XMvCEZZoaBASJZtTYUkEU0UT72pSdDih7x05XdcHGMmw
	UAeHLArsZoz+3iT5U4CRT2Pb233rF7VfP24WIiKSE+YU=
X-Gm-Gg: AZFdTZcNsyTvGbacFJ91AK96ob9Ieyn4CZd9AnNn5X0qlI3uquW9CCQkbXJcW593jch
	s4CqhsBkpnIL387oPz914SZ6G8O4cKSH3zHEBGNpHAhyZajmuLVBAHRtnGwrel0V442fQC6pngk
	ny0kTwBRpbTq0WnANssmHbtwlQpXgBZobeIwd0y60DZaOXWD5s2lUgpspkXekd3i+gOQCkl4Hn6
	Ex4EeNLIYOHB221uOnYFmNfZlVBJGiQTsngNm+3rJSUWuHtyytY4piAWi/HIh3DY2E+/m9jg1hI
	W4Yfydwwb+8DRxc5i44wPTEs3As3OUSzwmjx37mRIXmVYGcWt7QHreTs47mGdXx8Zcm5BDoBw/W
	YUr06fvXqb6sGrFD1wENtG0WH8eZqSLwodq+FHVjbftOilSZ7z/DtxQKpJ3GA/IWBnCNdu/JSsv
	RHw7aQtyWNrh9KY0jm
X-Received: by 2002:a05:7300:f789:b0:386:abe8:32b0 with SMTP id
 5a478bee46e88-386abe835b7mr2204957eec.8.1795379166697; Sun, 22 Nov 2026
 12:26:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921192157.102738-1-giulia@bynar.io>
In-Reply-To: <20260921192157.102738-1-giulia@bynar.io>
From: Giulia Aloia <giulia@bynar.io>
Date: Sun, 22 Nov 2026 21:25:52 +0100
X-Gm-Features: Aa3M54rOmMhwAvSgkjb5fv7qpYvYexK8dK-gFzayc0_5cgFNHRWVFllEYMSHLpo
Message-ID: <CAJzojTgYzOMHfTxWbQe0raaeFsyjSd7W-qHUkFUd7bg3Ppksmw@mail.gmail.com>
Subject: Re: [PATCH 0/4] fs/ntfs3: tighten restart-table offset validation
To: almaz.alexandrovich@paragon-software.com, gregkh@linuxfoundation.org
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	cenzhang@linux.microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Just a ping on this series.
Would you have a chance to review these patches when you have some time?
Thanks, Giulia

On Mon, Sep 21, 2026 at 9:22=E2=80=AFPM Giulia Aloia <giulia@bynar.io> wrot=
e:
>
> This series makes NTFS3 journal replay safer when the on-disk restart
> tables contain inconsistent offsets.
>
> Patch 1 checks open attribute offsets in the dirty-page walk. Patch 2
> checks transaction and attribute offsets in check_log_rec(), including
> nonzero attribute offsets in records without LCNs, and validates
> allocator offsets against the on-disk open-attribute table entry size.
> Patch 3 rejects restart-table dumps without a complete header, rejects
> short open-attribute entries, and requires the transaction-table entry
> size to match TRANSACTION_ENTRY.
> Patch 4 bounds the free-list walk used when allocating a specific
> restart table entry.
>
> Cen Zhang's earlier patch [1] checks target_attr at the redo and undo
> lookups. This series adds checks in the dirty-page walk, in log record
> validation, and in the restart table allocator. It can be applied
> independently of [1], but [1] is still needed for the additional
> validation at the redo and undo lookups.
>
> Greg KH asked on that thread why this should be fixed in the kernel
> rather than in userspace fsck. Checking and repairing a filesystem
> before mounting it remains the administrator's responsibility. These
> patches serve a narrower purpose: if journal replay encounters an
> invalid offset, it should return an error instead of accessing invalid
> memory. They do not repair the filesystem or replace fsck. I am
> proposing them as robustness improvements, consistent with the kernel
> threat model [2].
>
> Each patch includes a KASAN trace captured using a crafted image before
> the fix. With the series applied, those images were re-mounted on the
> same x86-64 KASAN build with no reports. The series builds clean with
> W=3D1 after each patch and passes checkpatch.pl --strict with
> GIT_COMMIT_ID ignored for the KASAN addresses.
>
> [1] https://lore.kernel.org/all/20260901174934.6275-1-cenzhang@linux.micr=
osoft.com/
> [2] https://docs.kernel.org/process/threat-model.html
>
> Giulia Aloia (4):
>   fs/ntfs3: validate dirty page open attribute offsets
>   fs/ntfs3: validate restart table offsets in log records
>   fs/ntfs3: validate on-disk restart tables before use
>   fs/ntfs3: fix out-of-bounds access in alloc_rsttbl_from_idx()
>
>  fs/ntfs3/fslog.c | 110 +++++++++++++++++++++++++++++++++++--------------=
------
>  1 file changed, 70 insertions(+), 40 deletions(-)
>
>
> base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
> --
> 2.55.0
