Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795830910;
	b=rKw8fp5wOWuqoU9GTS8C9WdL9xD1NjtAuM2K0xNmwI+LCEnZPkw9lm5OUZVOZkDdbwO1
	 ECAtxRn2NrnTdbfgmKY0ksm9upNG+HS/vFCAXaZdV1OTGkqIkG7b/sBIpaLj/v7gRC0DD
	 B3croF6jDrwGEMrpl96Bz40evar5HCiPrm1j3xEGmjotOV1X71Cm6sMDD9FfhEP1xP3rF
	 e+oeAvSxg99mXm6kkZyl0VteOkxxvQ9h9xq6a1KrU+HwEPN9A3ej4DnD5a+J26NVNgQoF
	 MK8WuFi9c77rXmezMwR6GZZJKwulESCAj+Bz5ig/pd5Ew49M+TNycs3kzzoPNH9B7nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795830910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=yg+nF3/DHZWeCaclfzP17sLUa502E0ljh1IjEbDb6aA=;
	b=VpoGXuDkGfwCCc6P02XIXuDV3MoCoT6Qi4HFMYjddhzd/t05i3zxSvqfmGYf/4zuhfWV
	 ZIRb4Rj+CZEOiZOPSj+AdRdprzKYKIBAwgfFenf+5pC0D8nEdSnspk+N22ir2Lm2BBNj4
	 hKOdwP/Wn2wR+tuvoVKgowhljlnE6IV9ScnFFot+qKSHbTnXW7ZsBEpBFhSQkCfaYjmT/
	 e6U9jiXSrtcLHDq0zMzrSASS4E0EXx2mtDQgTyC75OIbtU92JXxaDbQLMz1rZdYefLJMI
	 FH+DRqiZCZ8txLbW02OKqFmjruhrCPsqk+OkUMP5EkgsfA36IKNBtaf6p8zH0yA6VFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRbNcXqq;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CB2606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92CB2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRbNcXqq
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so5868839a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795830910; x=1796435710; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yg+nF3/DHZWeCaclfzP17sLUa502E0ljh1IjEbDb6aA=;
        b=aRbNcXqquXrzlHDhQ/WiHF1nWVm7wRVifH0QKrfHvm4lRbtM0U8Dd7uXsDC7/eU8XP
         paZjJ192mFNh+jFDIHeh6MpMtFXXHw63KsgsAI2aMQ3DQ0uMnb/2jieMB24cRQi+wY/v
         d8qk+NW/uO0jfWpzoSPD7lAkj6DWWYWhcgPMXfdS9rAaZH47o7mfBoednZPfRWx0J+a9
         2MDQVqHcqgqhhwfCN4lSuLJYoyDQ1x4HK+QwiLY5FxUjOw+bQ0fQSeryHhxY5x9qxJwP
         6khDFa7yZQQ3F0wKgBb5ju4qWXKxGVb5Kx7p9Inv+s35Dijngb6wUYitDGyFSA+A/Be6
         uX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795830910; x=1796435710;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg+nF3/DHZWeCaclfzP17sLUa502E0ljh1IjEbDb6aA=;
        b=QnAnCPJ9OccHdcAkfOE0XEsyG6K7j5OYw8dyjuNTodE5dts/+KtVgYqfV3pMrbgMST
         DKKdo+/Bd95QRCz5mdIYQFbPXbXmoZXJRjLXQnMf/Epq2+CN5QN/kC4mHIx4uEzDTFVh
         Y5VgBKdo6BfWbAHRl+us7aRfG9FWa1Hz0zWRPO/wfrvPRQFKq0Hn+1y1hlVdjuvSv/O2
         8LdQLAg5KXuF1o5cI1q55MSMj8ftxEI4+A7ILqyc+mKWPf5af4HBS+1BwHsDRbNO5Oy9
         A0Bbhh9xoE60yP43fu+a78gLPNkG8HP3pP2VOzTaFxLHJZA3whX8PW9pkiIL+Y1G7auD
         cPhQ==
X-Forwarded-Encrypted: i=1; AL+hErGpBv7eegKWYzXLx4+Vib2vX96ztblPWdPYPwmK6JCVoGXBjqrW51MADo2Trm8pz3kDAZ53dtmF8sGJM/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BjBs2a62H14U2mh+CCGJablnETbbHA0LyoJd6frfHQMglSOS8
	UD7t2JplFDiuqBDWdaB8t4o/JgBl7iBijyefKFm2QfGHixelLJajA+Jq
X-Gm-Gg: AZFdTZc6wVTSovfb/4HFLCAoTXOiQtURPFSR2dJIHwy64jIapXDvMvmHvJjiuAFiZal
	OBs+uXwJlnl1j2x8ncxqx3ACSnTwbNuxwYHphx/asG2VSI0tq5WotYWKSNcL5xPE35raqYwjgvg
	xVjVqo92Yw9Mdju5ZLh8C4Ym46GCUZFZmpObLKRy4hr0ojjVsV+yK06sckSiJw9K6LUAqXMVB/I
	9UqoI4w22cjbWX2p4mvQ6c/WFB2gYdEsX3BURpOcte4mHIKgbpCc0LC7TJav6x9V81r8SlMwNzK
	LXmY3IDpXGqQtWgp9djj+axO3cC+6+JIQV7f+Dp6vloyfy4Yd4ElqK59TZIYQX7emvB7RTgvQx3
	k6nIvX6/BjR3FWbGwYBQZfHGeOsvhEt90jNAyXXcBGmL7+iJQxI1N7fI4uTRvI6ZQY6QkObM/Kx
	Kc+hIIr7RtMH8VdqkCmm/NQAL7AYcsY25TgoKuC+WUfQ4sWOL7gEt7UiS0CUw1viXJghOcYML/O
	oCCQyl40qxgPsCVFIcEZZUqykResEtgvsceVS5NjsYfb0IHmx5Eq51YxGGjRuGcwIG84drQtYv4
	1zbDSy5HyDzSD9FoyjuhyQyam6XNG6GrM8dWjcZcsONSldVDI2gQajG0ygJuiUXkdWrdYCJbas6
	d3W6OK3O72WIj+2haGCMZDJRfroIz5Uq1lQ==
X-Received: by 2002:a17:90b:1a92:b0:3b5:32db:124 with SMTP id 98e67ed59e1d1-3b532db04e4mr5148880a91.9.1795830909886;
        Fri, 27 Nov 2026 17:55:09 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b559644e16sm116344a91.12.2026.11.27.17.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 17:55:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 01:55:08 +0000
Message-Id: <DN6GXEDDDMGG.16VXQP61BMM2P@gmail.com>
Subject: Re: [PATCH bpf-next v1 1/3] x86/mm: Resolve BPF exception fixups
 for user address faults under SMAP
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Andy Lutomirski"
 <luto@kernel.org>, <bpf@vger.kernel.org>
Cc: "Puranjay Mohan" <puranjay@kernel.org>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Emil Tsalapatis" <emil@etsalapatis.com>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, <kkd@meta.com>,
 <kernel-team@meta.com>, "the arch/x86 maintainers" <x86@kernel.org>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261009024925.3169077-1-memxor@gmail.com>
 <20261009024925.3169077-2-memxor@gmail.com>
 <df69ab5d-bc97-4651-8668-a2b3e4bb272a@app.fastmail.com>
 <DN437OYZ5FGP.20VLV7ZEXQ5YY@gmail.com>
 <5f46d1c1-fdce-4f3b-9d56-675a822b2d65@app.fastmail.com>
 <DN4X9KVYMONH.VHKD1QED1BUQ@gmail.com>
 <03275761-8de2-41be-92fd-8e3012a87eeb@app.fastmail.com>
 <DN5K8Y9824AE.3GPOE0WP9ELFN@gmail.com>
 <DN6GS9V7A3HS.1COD0JUQQDHQ@gmail.com>
In-Reply-To: <DN6GS9V7A3HS.1COD0JUQQDHQ@gmail.com>

On Sat Nov 28, 2026 at 1:48 AM UTC, Kumar Kartikeya Dwivedi wrote:
> On Fri Nov 27, 2026 at 1:18 AM CET, Alexei Starovoitov wrote:
>> On Thu, Nov 26, 2026 at 09:30 AM Andy Lutomirski <luto@kernel.org> wrote=
:
>>> Okay.  So maybe there should be a nice patch set to *fix* it.
>>
>> [[...]
>>
>> The main point that it's orgonal to this patchset.
>>
>
> I was wondering whether one concrete improvement could be to emit BTF typ=
e tags
> for __iomem annotations in the kernel, then reject accesses on BTF pointe=
rs
> formed using such walks in the verifier, so such programs would fail to l=
oad.
>
> I think in practice, at least for BPF users, this will close the issue.

That's a great idea. Much better than Andy's 1-3 options.
