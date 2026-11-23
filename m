Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.216.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795459307;
	b=rgja8Ojdb7OLfiryyyfOF31KmxpW61gXvJv0HSJ24+WkrguPYG+Ro4KPmsjQyW9fq3Z1
	 VXo1EuMjOM/w2TPy7F5m4Xc5GtjEP/P6BGycYjWhh/BlJdL34QvemKOYj/IacXy65br9d
	 xz6B/Z80dKNsL8wPwe7vGrW2Del7QKgx4qLDBS9+cNPLjqymT2JMGCLKX2ij7E/nKdEzA
	 d8vHIDy0ScwL+H5SLlMGJW8OQYY4pAkeuDvHI8IAzDWstqV4cwEGmDXgRHC/J0bDzJhl9
	 /+FWXxniTh8DjBPda85jQ4mbK+MJqW/UV5zllS74cnuT0RRYTL8300YbQ5sj2Zc6oDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
	b=pqlLNwua0mUT/K8BTs3kSdqLgi2w1/nUhtJuUVyos/YooyqG1ZjPM2NcfQya379gApdY
	 XjJ6oer5xXOx/ome6mnaAG/7dQcpY2iVEsBRBM+q4gqPtLIYI/aFmTzym0XsE7NoYczOB
	 +8JE5FLjPTejzLEO0h42s5Fo6nHPHX9C+QpWjbhm6E9J6s5CSHawcW526yWWwz0AZrFlU
	 oFTC5Z2CFXaBvqimqNYyuVTfbnVBAdTHZpRVqukAdNH/zJRN0QeoMTKMrB3DCTvPDCL1S
	 yml3Pg5MINqs7MJepvsIBP8+iyDpRgzJOBThPg6i6WmlDKRp1yCB+hjwFGXJClt4iCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rjiVRAas;
	arc=fail smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E400A606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E400A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rjiVRAas
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b41e627cadso2187122a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459306; cv=none;
        d=google.com; s=arc-20260327;
        b=rzvtJrojcekhRhTi4EG/BkGbz4jKsmaHznGkE116uIHhMTMOxEBtHKuAvI69tHMfDk
         ylEEnVD7xdd82e7JwVqMLw49i48QNg5LODHn5ntOK1u6t1YIU4fIB2Rv1gVK77DULxf3
         Ota0S6geOS33ZzAx3Zvdn1kvoaa9UFTUmbTbkoWKXmmNvjROQy79zW4umonYIwdRjFTT
         DoZg77dnPVNTChV+TT4bGanPxmgi0zG8EQoLjsUvA0aRdPph4MDEWBpwIHnkc1lZ7Ssi
         L13dBWPgoLmOX//heme6ephBwUoO2AMTDUhE4bLITJHoxKkCUtMVPiOEdLw+kPFHTfKq
         TaWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
        fh=zU1FHIkr+CuLAoBDS5tk6CCYyHf1pmPH358c4cqcpkg=;
        b=OpMlNrXSJxMmYx9zHnr6j/blXtLQo7FQiIj1/fihqNgHSYru3y1iO3jigRkgkNmCcz
         CHV3f4+1aLu2RhBWEB2ammh5UcHdyQPhKgg77qprh3VvwN+WHij8/KM09Q1cuAKGycqL
         EoTVp4BgmZoq1If8jMV+Y0ZZTGsfshs28G1l1QICJiWMr/c6DXyQNijJPDbXTDwJBMt1
         6wg3qe80CwsEeoq+sidjOpXn8N7k4J/D63MQhgeTMh5DzgRHL/rgGqJRqNM6aOtur72L
         O+Coas9r+xUq2dHILDwZqHgD1hg97WW6x0/9XEIrxBDmtXlJNJeQjksvZcWEuDpZEhLt
         ERfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795459306; x=1796064106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
        b=rjiVRAas43i+JWsmqDO2xHPvuZ8jYgiEFFguUXxTZ4mN9wumtCVo7sINa0uEhMrAPg
         5KDVpas3kj0cqn4ubJTHczSggRGc+2oZnlyhoFO9xYGG9Kvdm5C1cZIKnued+BbWIxjA
         GhA42IZUkfffIopjA6J765vebjE9N+UOt1tDU+DIYX4b65lP8sPDAH/at8/LQ7V1HYRJ
         DX5YQDjbhvgQOywaF6NYUtWGKIpuvNhwQWTthT6Ocieu6ZKe9ubXPHWTMoQQQm0fA/eJ
         I1td2fdcwa+RmFBXT/PqT/cxaNjxrlEcb9elz0SuQPNezhMbhGZAmYSDrncLjMQl4juv
         AQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459306; x=1796064106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
        b=Ig5NomgPzYMDFWTJHoLNWn1cU1galYoaJg+1jOohsd4/Ot1uOLeFkbVoW72Os0z2Zo
         czl9c6MvI0LMv//hIJhxwdlar0/LBt2/TdL4SFTV2PFBO5jZrggieXJLlgud1mDqKmOf
         wMNnDYImtswmGo1z13WyCTByrRsNb2jKqHeINCSMoAfwCHs4wmILZ0tmE7Lt7hWWL0fj
         Su4WYuCdVjYkGzeUXhhCBPQYwXErqtYjPzAHQyD5QX4t+RHxrNh+drdBUu3y2MLvUS60
         F3ZtJqW1DLoLhVtYsjNHsZO87bsAzpfGr0B2m258r97ah5yBSGJ2QbKl4tXXfw5BDDx3
         7Bhg==
X-Forwarded-Encrypted: i=1; AL+hErGHI/FJh91peVTsCjlN0b5zn8ZaPe/7werSmT6M1Rkxv0GE4F22PTIjHvd5/5xVqWEV8S4Msav4hdQVBfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z82yKuqNQVENXVhyn1XO9LG1IKdhlXu6/m1R2igBS6Ub+WlkLXb
	qjaonMXNgQnIaro0kZeY5IIcyJO+CHprmoI0dsxg04Ldui6W2SijYDHXRkxUMor/XDOFqgDXuvi
	/9OuU3+NADvqVpLWLgMgbg7fQs11FLuY=
X-Gm-Gg: AZFdTZci3CWW8KIox/Sj6uyyHSJR3CVqEQNFMXOM4dNK3DSsg1GNxLi4mRLOqbqSMl7
	79UocYvoet4HgyUh6hulm0uDwjr0MbEPIt3HrVFhP/4SnBbe4cJramqASvGjeYBlIEgPaFDELJ3
	MoRMHvOcBZKyRTbFOK0SfWmKthilUbIvy7uucBBczYiklNWZB6pZ6vCZIlPY/lP12dIFpZOOOIj
	I8oTIwLujKVho9DULUhwC4T0yqb5cdvRgYpjYGiuufDV57v9M8rS3T/5CztB3PTnS77HvKcDZRe
	W7Ragd83hou3DQGM2KqHZbP1EKO6HsA9P0Bhj/PECEzoVwFFl+6+gyGvQG5rvq5cQURewgav5uQ
	6sNpEcBxxD4wKixUnEzHzvkJTLEFkbyZdSCBsXw==
X-Received: by 2002:a17:90b:17cd:b0:3ac:6fcf:91d2 with SMTP id
 98e67ed59e1d1-3b41c8fe3d1mr11633543a91.19.1795459306227; Mon, 23 Nov 2026
 10:41:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com> <20261122184434.545341-1-frederic.mahe@cirad.fr>
In-Reply-To: <20261122184434.545341-1-frederic.mahe@cirad.fr>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Nov 2026 19:41:00 +0100
X-Gm-Features: Aa3M54rYymnQncJINmj7PXylw19m9Q_Z0b_H3MvffZyCzTJDH31b-Bzjr4MRK-U
Message-ID: <CABdCQ=PnfXRd2=b6_yEN94RCRvPnWx-WFfHZDC+jhHv_UFZ1ZQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device node
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYWjDqQ==?= <frederic.mahe@cirad.fr>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Baihui Liang <liangbaihui@linux.spacemit.com>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fr=C3=A9d=C3=A9ric,

Thanks for testing this on the BPI-F3!

> Two notes:
>
> - On v7.4-rc1 the driver refuses the GPU ("Unknown GPU! Set
>   'exp_hw_support' to bypass this check"); with
>   powervr.exp_hw_support=3D1 it works as above. Is a driver patch
>   adding the K1 GPU pending somewhere?

You're right. I forgot to mention in the cover letter that I was loading
the module with:
sudo modprobe powervr exp_hw_support=3D1

I plan to send a separate patch to add K1 GPU support directly in
Imagination's driver.

> - The GPU never runtime-suspends: after 160 s idle,
>   runtime_suspended_time is still 0 and the power domain stays on
>   (autosuspend 50 ms). That looks like what Baihui's "drm/imagination:
>   re-check firmware idle state before runtime suspend" fixes.

I hadn't tested runtime suspend for the driver before, but after you
mentioned it I gave it a try and can confirm it doesn't work properly.
Hopefully Baihui's patch [1] will fix this issue.

[1] https://lore.kernel.org/linux-riscv/20261111-img-pm-autosuspend-v2-1-42=
7689f6f2f9@linux.spacemit.com/
