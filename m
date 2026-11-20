Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795148488;
	b=O+BtMOGkebFN5/y39nGZt4eH4jFl/3W7JAuVBng3eBxSv0endcv5MqbdmPTSeemgKK3V
	 I3bAtGyF1agggirYM3abm115UZn8gY8veEp7eIMUO3BUJVu0Om6NENDl6pg0DW3CUyjv+
	 ZWLmXL9xu+iY+vI3KGGHGiccdWsrkLSw6l4o5e+9aSoiXffByWLEWX7k6Q5Ke9M2HCTEB
	 fVeXpRfodB3fcHklZ829AaDTMWjMtxqV4m2iCCNZFSW4IseoIMe5utWYSRk9fPRBqKysi
	 cXaEMx8asa9MoxkfwYx6J0ydiwVRFrJDn/CtdnFwI4Zz6YBJYm18YssxmJiSR7Pd73Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MZofWyob445pWeNhb7OktaRwpuZ/DPW8FberUsxg9WQ=;
	b=eqqxWpOjUL57pLO3DxvwjYmr31Tu9PEeKViH4OShmYMx/T/NsUYQnIzC9gOm+ICVS5l/
	 6S9lyb8va3yJmPD/z03v1e2xUwyCfbmdMXF9npGEe9MeLdiH3ZWm71m/eGf7FeReSc9OO
	 1v12Tz8x7DVGwAOnjr0dv+ML6qWEpueTy53hiWeM4yg+SOvD/YDuKcDIAROruhqJd+eUX
	 DN/+mpKXtVF0K6HLeUxB9hTPx3anU0YfgHTLOyaB06nQ9hMFMMgBmX5rEOKGGKV5GCDND
	 ol8n4hiScfR3k2cCgA+7rSQCR4nXmyO/10TleIK4xdbLiZJ5FX9xyCCt1m/3Df8ToGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m7KbAn/Q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBAE606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EBAE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m7KbAn/Q
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4ea3c5afaso3625877b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:21:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795148487; cv=none;
        d=google.com; s=arc-20260327;
        b=QB2vCjyxttne/914OIjkNf2j4mJXdVay7iDhnoD1H8gLArazeaSU/gqbOk9Uwgqm5/
         LTJCXEJpKRUmlBQLSfhXC8FUVF6rfopiroXkoQaj9x8uD8R9u54ae85VpPcF2rW4CfIp
         fxkWTC4pGN9lmzSF4hCZ89cceAmp6k35jyBvKfc1WaVBKN5sJzrbMgmh6B/bvrVTHjKh
         OV3tjANrAPz5Ssb+0ay8wLwivTkKi0gmmSUJOMSicP+JKjIfkpyfbtZry0TOzZgDpf79
         Do4jnmwObyKTYlsrYjfFzuxhnbcqeRDw6zLxzEMRez3ZorevySZpQQzDlTeZa2vAUYNf
         zZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MZofWyob445pWeNhb7OktaRwpuZ/DPW8FberUsxg9WQ=;
        fh=NdHEFSi/zQG6OpAXMChDH7VM5ODoaykJlfsafyl6S6s=;
        b=T/6We9e1sHfhJwTb6DG+fXA63/TqmD5Ng76ah+RyzGj/fLY555GZQ0nW/wuubabq2H
         JRtJGDddaisnevc5jqpb+sIB1HTiakwqB99m0Q9hmk5NmdAQAcz9lnL4tP/yVWMpqWJA
         2IJ/j6mnOdaCM4Tbd6FHsZGcT2PcDJiFJQL0RXuLYS9VVWswf9NvsN1q3Ga2vJt1D8WR
         ZXROtDGSlvnghxOWX6XBPfr0HaXU/GyWh/+6TpWwop4XJTisLxZC0hEo+pvERv6o2Q8m
         6a5VLlI5v23cq8Kb58Ne0UACp/8B8sjKhLh8L8byfrB0ryIkotdbb4fW0r/wwVMS/PG4
         PjjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795148487; x=1795753287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MZofWyob445pWeNhb7OktaRwpuZ/DPW8FberUsxg9WQ=;
        b=m7KbAn/QahZZpXv6AsQstBYyezUuRZ0MMUpSvJx8jKA/AnfmAcZ18/NUS/gOVxkGQA
         2gFO0/HHTpffY4/Uz5lm7bv2PcQs0frk0CFN9tdoU9gcGqPZkNBD4yTqOF6tPkyoiwVL
         TBE33zXViz3FMnYrcdLOJ6bcqXgt756cd56KonJsW9TbR0WTFz0D96JzAcmK7he4oXB5
         vgi5V8AFBGt7rfe2UkbN2T/EUOVfW9eX833iHKFuipK1O6R4oW7BDCjP/jriMxuQqUiG
         c+Yr5+sESgJHp7qj3rvwPA97+Wz6VAOP1T/LTKF6FBMEUjVH8D6aja3scYZrAZYpaTaH
         K/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795148487; x=1795753287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZofWyob445pWeNhb7OktaRwpuZ/DPW8FberUsxg9WQ=;
        b=X9p5s5dnzPoitDaym62Anz6tTgBVOsaQbaRSW+DiTxymQW0MNVAWr/v+jcrrFyvdyF
         8Df3l0QK6LkcfhJCOSNgo8TQoF71TNhOL4kNKamDHIt6fhbwwK+DeyCbBfA0/eJ+VpnW
         hdnFopObpqgvdn+J4uC9J2aJyYzvYWpe8I8FBUDBr44UdWKrr4oEZCwNxZ95eCBu2ZJ7
         O59mK16Xb7OuHsNopEL1dq+agaD1k+ToW/JYMgRS6Iel2S/8BW7nMcm38Eb+ARrCkoO+
         VTRQKks4ogo3likr7IuykaKKXflo9HZEqrVp/hPvyU4tUhULDAoxrvTc4nikr/XGwi1k
         mzuQ==
X-Forwarded-Encrypted: i=1; AL+hErHxLgIpIOZmx6u4BIe+jf6r/CA3Y0JCNJtIcmCofck+buptCAocg5ERMeCTHUQ0HNFQDRrm5n7I/24oFJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UB0tLYjamkOjQXCrFPuZ0aiVarDim6D14hXZYPC10V+o2kqSa
	PySgxXClsgrqTyzooNKY7ZdIxc0A9sRTTjBT63oQwzh2f51jH2PQRVgdSwME0WUqEN17ZbmVWew
	oumuLAlNUdnz9E8LInt7bWqkjD+hjqWI=
X-Gm-Gg: AZFdTZfXWjzzsWg8DP34t4Lc+VM3mS2cvXcuMMm8qmDoVAo2R9xMKtuNpd6Mi41G+os
	0DD3QfCE+A/sv6YOgAe9sfdmo+lRYIzXxMCaqITZrbFMKsR44gZt35Pa/bl4V/M5oXPqQFaWqcZ
	ueZUUtmoN97oPijrCd57mWZjgc1sWeQPI97dSbBkcbaWG+uQDtI/pHpHTRp1Tl8G6lT4R90Ft7w
	JzBK03weudLLI9h6IaAie7JUfhPPEEjfphNMgUZ7yHf5lsvDD0qBWTQSQrfePQgMRkke9aeg/fV
	d50IL9gB37zQRIv2N9m6AA9DiSFO91fnnszyNXwgvmkGk72oP6nzBuYzlbTfEh8q9Tjuj+IHaI+
	Rlc6M0Ystf3SGZh9AVf76JajXuAUmLVzE1vemJP8HjXQ6oM4e8Nhnk2NIzieycnWEE1BvxUB7YM
	T8mhApP7WzNKM5U09dErBmpEwH
X-Received: by 2002:a05:690c:3603:b0:8b4:d8c6:4d9a with SMTP id
 00721157ae682-8b52049684amr7423927b3.48.1795148487000; Thu, 19 Nov 2026
 20:21:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119180015.933433-1-thnkslprpt@gmail.com> <av88TW3GQRvXJDwA@gremlin>
 <CA+jvY9E3XD5mJZ7V-+6HFxEkY1FHNGom42F-nxMZNGtOy9POqA@mail.gmail.com> <8e56f690-7031-4a57-abdd-a02c1c94782a@kernel.org>
In-Reply-To: <8e56f690-7031-4a57-abdd-a02c1c94782a@kernel.org>
From: Avi <thnkslprpt@gmail.com>
Date: Fri, 20 Nov 2026 06:20:49 +0200
X-Gm-Features: AclHuK_Fg9tRjIVo2CnJsvvToGmImP00awTc_YDWrnuAnE7j5TJSQHgt_xSP3vg
Message-ID: <CA+jvY9HQp6iDPGDTuVqrQNnw0ENDDq46_AwZqzcjXNcyFWqPsA@mail.gmail.com>
Subject: Re: [PATCH] mm: skip temporary folio allocation for anonymous UFFD
 missing faults
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, akpm@linux-foundation.org, rppt@kernel.org, 
	peterx@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	liam@infradead.org, mhocko@suse.com, surenb@google.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David - the real motivation is very simple - avoiding the wasted
allocation (if possible).
That's it.

On Fri, Nov 20, 2026 at 12:35=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 11/19/26 20:31, Avi wrote:
> > Hi Lorenzo - I don't think you are in charge of all of Linux and can
> > decide who can and cannot submit contributions.
> > This is a legitimate improvement in my opinion - if you disagree that's=
 fine.
>
> May I ask which workloads you are running (for customers? etc) where you =
would
> care about this improvements? IOW, the real motivation.
>
> --
> Cheers,
>
> David
