Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035145;
	b=hlSiR+NIknQ6ORQzZVYFoA2Ru/A9WvpcbVvjMXY1y4813Y3UEwTBlIlI84vC4pK+1R2+
	 FIUT+ObvrQbSkDa/HVr6RfdENAqEa5W+G/bawaADuF9gtaxVGc/o1gOIV3vqA2x+7jWOZ
	 k0wx4IcrDAECpIoavrhW/6ziU+1j6CkcDlUc9xz/2ysrkiNziEXw5ats7rmxxUSq7gKID
	 UwHnU4Lmr/yOkEMDHjPS0tnbJm0cUenNKufCtQRgCm+FBohdvjryO7yiMTA67N9YrfmWh
	 ro8YNxZOnR54sPpASa2O9gIlw5UBQW2zCRkzL89pm+FcuZspFUa+Z1nI/T1OwVkx55g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=dxmySTmEZ3hib+9H5pqVDEDQRI3wIZljNjzSSTwZn7w=;
	b=eJo+1XhZcBg65Bgi0watj7yZI/Jq/8bGPxI+MNFp1oz+BPMAnu3Jw1evxvWaT3+XcE1b
	 aVMOsgOnQCSalBN/zswY0iN2QOVbmxvy1COLtzuwKfukxBVINrZvUbSzO1S68AoLx85s5
	 SSZFwI/kj7CC+uMDZGZlrVUpFOo4vfuPPWXUDMsvG8OIA78V2kTqK6C3EZPeevePyzuyG
	 jwWMW5bl0Zu+vu7/dwXqkrsvJdx8FgZPKXs4S3hhnjhVWQFtf9e8HYjHK8O04J9hnJCZW
	 5IsxdCJnl8UIRaesoaZuQL0NBqf0z6r57VXL6nLr8lkH4XgyjQXFQNoWxszjuY2czNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SqHUcWGu;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A3E606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43A3E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SqHUcWGu
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso868555a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035144; x=1795639944; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxmySTmEZ3hib+9H5pqVDEDQRI3wIZljNjzSSTwZn7w=;
        b=SqHUcWGuBJ5iPjwuoExkJaVT/UVpfdPBxDUFOXh6mpiQuWiJKjjQrPeuXpWMmMwI/u
         soWYK+E2+ktGyN0Mz0Y/0hREtps/a3j0GpYhuBoacNC49w4L3fbdbfPmwLRrhgBUxom/
         zsFLmibB8/aUwOgVfsoKnxJ48Wg/ZX8wwMZkIxFkXgN/13l5erXTN1NQchLap+467x4c
         LCR3snF+qsFzpxzJx547CpICfIsqqVjRXbemsyTJ97tlHu3vMXz0w3VotAin2HXQMLVk
         F9I4XGQ2sfHYLYsTlk2h/KNSgRqNnjIIIS8lmZtgsWecH4GG6FpElOb4rFYA1+uwN4pm
         irLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035144; x=1795639944;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxmySTmEZ3hib+9H5pqVDEDQRI3wIZljNjzSSTwZn7w=;
        b=XyOazaNIvuezOWWaqHePmANOuPkDJ0jQZfeYKmUZUoNMOBV37kGagWJDc7eTa0yUhs
         VnddeZm9eRnzQWXqvlb/hKew82faj7S6zU5fBtb2OZ44ciepnDEFGrUOffWnh/nGyjqv
         Bw1i01pIQQGUnBVsn2+uFCPcHUUBpniy3VaGpKQIavOE8/fTE4ON9meIZ5poPqRvW1qu
         Z587XBGwq17HDBZu7vl+emMIG77RgaiQifJuXyMt40MaBSmh3NU2taiCTK2vD5ttn/ka
         JfmMoqBOboTN60xC9s+khWEGv7PdPfpA9B89oQq3hWWUIibh46FDdbNOWnUuhBGAx08p
         21QA==
X-Forwarded-Encrypted: i=1; AL+hErHw01TmLZua7gQrxweSz6aQEeY2BX9UzdoFMkmoOcyN+RMMRRq8H+5ZHynD9pGp+xGysMDcys3Fb32ESrQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y5lf5MtMUMz7iHhWRlwzwiTAppjc4Cxfr9hKbpiYgRnukdaJI
	1IL1kmJZ1BYVu0EeIgDcax6qNLsMJkRReXPnWpMHgmC5+/6C6aDST+kZ
X-Gm-Gg: AZFdTZdWRqf39YQS9FTGG0Xulg3oKiPbY8ZAtCqBYF4iZQHshMhMVDTlOzSxFnividX
	f9vStriZmDxC1DtN2MLhjYTYTRzDRzawBPXFFWoQeyCgBk2b7LkoYuuC0hPR8IEfEjQnUcFTwyq
	8eeIRzQ9yjbj9xNYl1pUEtv/OHTJIwfIJxhqeUaaLREJfk6bxsyOykRHyh+F7EAm3OTsmzDQq4B
	kcyFmKEpyixF9gNAAOqAl+22w3kdKuxtToQ6uVCRJPcu7XWtiHZH4YeesG5xsUiIdXY/8qfiSOs
	F8SV9GCchxxCFpEh5e1TLE7OBnoqCpM4clltbwzdaKK91R6F0ktVqgfGGgw4ULA0sJXJhC1dwEZ
	y72blCD8iG1ncyWfCg7xPe1GxrmPXQvOLNxbNCfxZSy9Zefg8qFlLhWsDbx136sVySyJ1XE1P+G
	YdhTIf6F+4/TvKc2ZrQkpVkAzqD5lyTTXO3GYnm0rWpMxDzBB+jaHQWgiubZCZtX3gMhAWeNUGu
	93lhrxJjM/nRwC1UPRsFxaFe3v9pjLw/Ulj/8fnXEjwV/181Q1ZQXNJBpxqDjvxM643ylTKM1EM
	bJhEDcX7SDNFxSsNwTIiZidqCXCsFwGIWBfokjtK2ebrLoMsodHn0gCg8Alg4LIjXxD+NNR+K83
	WvSqVfTTq2DU/NWWUcc9kYPFM9qLbyx9fbA==
X-Received: by 2002:a17:90b:17ca:b0:3b3:c00e:56a7 with SMTP id 98e67ed59e1d1-3b3d07d458bmr3354393a91.42.1795035144417;
        Wed, 18 Nov 2026 12:52:24 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56a3f93sm2644508a91.2.2026.11.18.12.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:52:24 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 20:52:23 +0000
Message-Id: <DMYMUOTUYZIC.3CG88B0ZSFU7E@gmail.com>
Subject: Re: [PATCH] bpf: Fix cgroup link update after a failed effective
 array rebuild
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "J4f J4f" <shlomojune6@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Tadeusz Struk" <tadeusz.struk@linaro.org>
In-Reply-To: <CAE_LbwmtogEFvk5jDUcYhjSaX7_5bsHy-OWxCKPxmiBVDcjj_w@mail.gmail.com>
References: <20261112134942.288831-1-shlomojune6@gmail.com> <DMTHXFS504S9.2BU4PDLEWG3PX@gmail.com> <CAE_LbwmtogEFvk5jDUcYhjSaX7_5bsHy-OWxCKPxmiBVDcjj_w@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 18, 2026 at 06:41 AM J4f J4f <shlomojune6@gmail.com> wrote:
> I reproduced it on f66469d9905b39 (7.4.0-rc1).
>
> [    4.307527] BUG: KASAN: vmalloc-out-of-bounds in
> cgroup_bpf_prog_query+0xdf1/0x10a0
> [    4.307589] Read of size 8 at addr ffffc90000073050 by task exp/74

That's the last step of the scenario.
How did the alloc in compute_effective_progs() fail 4 seconds after boot?
It's a small kmalloc with GFP_KERNEL.
I think it fails only for an OOM victim or with failslab.
So it's still wont-fix.
