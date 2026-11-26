Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795668789;
	b=C/BeUzl4zpetTWKtrF2ZW81EjJAid7n/ji1pnYuyaHAqzJ6opqOcW2BcmR1d0Tb+ZbBj
	 mjlh00J6Mb+ELReNNY1AdgLuS9OWOQzaNeGv9uF5YRXCNEa3yDilQox2TJeIP9fMqhoaG
	 uLwXuUxRT9kot9egrEoaHyWi4g8/GKGCOkjdZi4e9fsfp4pWLDXsAk67ISW92mzUVVy9s
	 tN+ZZXYGPKGluW0z+B+GLCuSFM8dQG9SgtWUiebjaKaL0xmXqtzWXbthzKaeRczTdgJV0
	 AQybZ1uKHB6+Rxd3zrJo/G6gzTzF0D95vOrI3pIdq4bTf9i2zEGqBWGwBeMrLelXFKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795668789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
	b=cOyLrtRVtkFfl8QtiwlRRrjjVJahVHBJ6qkt69MDzjGwzKh2gqBYUQ5Mxb5c/LNeC2ei
	 a6feSBOPQHQjsCTyjTsrNL4LsWsvmGN68hxLcOGjvxgk1KwMaQbLVDorivlSlGvOZf/lq
	 fSNYza+spsKejTzUy2oWjaydtt6nCZrkD9SRUyRgaSW8si4BZojh8ftI8oyTDrjfypmlc
	 Kmp+mSt4QiQYIv4gOTGO/Ab4IHKJmBD7TGMJrZYri+IGLLUYjpL2wEyroi5ZEX8WiZfgR
	 IuNx9zPyBL/2OLYM5LU08Xmxgus1Xsz9x6d3NOXkUsYKePbxMxcU1uwc+rTYBn/yttw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Wt/H8uEX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4682C606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4682C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wt/H8uEX
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55c7445cf85so1380921cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795668788; cv=none;
        d=google.com; s=arc-20260327;
        b=G34Y2KrVkfipsNrF9ZuyfINGdLBGcvZ0EkQ6f0t+A1wF0esACsdrNWgXKUt/jdhBWz
         gyvPKZYPpf3iTENn5IPUQRu3NFPEZKclxqtVnMHaz3QKFjNUavDCoO2+pL3HeChpor9n
         fOCdMmMhwiSnJsTO7tonB43pFz4sUei6c++kXwoprjqEgLa/6dUTRtY/vh0kQ0W4Ln97
         4t3REG9axoJsMnsfgtvkQEh7wZFjlr6VhgVAPXgFtb828BhnYPLXlVj9JbHltKutXCQE
         kvJzoNG1iS2KEOH6DXCR3lsCmLoF2uT88IncyBgh0f0uxVXA1cfi+BbPZOzbZOv5KAb6
         nZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        fh=tmihlMgGMelI22mRaL6yrezfRrkIeFSBOmOUam/ztpY=;
        b=OSUgOx9n5TYJYdtt6S80JOR0GaD4J5jtvtIbpbYVrkfeDtl/iudM0b3i8bxJLtxeKI
         fcmdVmG3T5HXgsrCmfJ+87gPERFEEH6k4RXBgQsi0lth7ywECaWZAANcS75+dTA4U419
         swGt3+YCLP251gAUVJYusNJOefOiITvOllyuN8C8xnM5q4XPqm1S5NKEs8MApb5QU7mG
         qbcdFHZX4NLt17DbHMpFY33T/yA7bgyxa0CgUnALaCM4SiZwCtkblBEbpHbEDS1cOJa8
         B+ZlXAlWAVc7hfqz9XGE+cw14YoErH4ybogOzIZYJZAwIOd9e9T+aJVS5FIFQGrV1/F4
         Blpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795668788; x=1796273588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        b=Wt/H8uEXeygfnRJXsnha4ogYR4WFdKKtucv0h74Hl9SvZ7ZVOZ8pyveIu/m+bbBuqU
         7pLEkyr5FS02oSIkkEdcPGP7aMYZHs2eR8ZbSslwbXiv4nig66Yw9zXIl5pT+EHlNoMU
         cQHBNyntCt6+GiY4hESZ00/HEKXKxMOneQnWVqwJdquEVsZ01fF3oKFb+IYLDHDd97P1
         5iwuBre8QUjJjwbIhiuIlmYLUamd902f2vsDR98ELoNLHrtAN91EmUr8k1YyhoPYh3J/
         v+aNlL3NNgtJeSDZE4JVJM46ZiSMrhfEMHEAp3euRyiB3I6N1f0aZKatBbawmZwgSrYV
         rmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795668788; x=1796273588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        b=n+370A2HV06tMa/KI1LoiFEh4D2yoisQkaSrFEoI+0DCgRH19ZoSFwGvd67eMe/yKf
         H1hcyC3dkxu83g5DC2d+oY2pNBK+A04IFNJ41yPVt8EVJUp4e5YXITY2xvGZRnNkuspF
         et0rTuGBVtICv8JFoJbuDGzA0ZIALe69zvbjVKGTStLuQaGy+oBRyWQYj2ZDjbGPtv18
         gCsOJRj3AcfZdgCEQ7cuujgg4alZ+C5RfbWC97Wg3/eg+c8/X6pehbZCKGCt1WLRo8Pd
         qDSWgG4oorPFuu6ZnNpPd+87H7gGHd9r1nZgkZ6HC9sWCE4iJi05y5/sIt9v8d9kgn3X
         VmMQ==
X-Gm-Message-State: APuU4Z83cuLmw6MvqPDFZexLgK/TzubLPA2VuBHQrqqFN6s3SS6Si+p9
	56OYO6YnST/7J7TxxJ8MD3TmDdv5Iw1vEqaflVodNuDT5xaU02QrCnxWT/c5wTGpvPf6bq5U3+Y
	degYhbgDVDVlfyCpr0UpXYkjogtX+wpGdfKAa7D3P
X-Gm-Gg: AZFdTZeRIo1E+LpvqNIOv8HRtciIefO2NmF67ud5JxfSmO76shFZPOz/QIfHuK47WGk
	VSB5Xo70hBH7/FR8n+KRli2qXBmTeCEcjcRYM0zMJHQ1qPUFypB/se01liwdvScbcwaXv0dt9Kc
	O+Bmk6BAKfO9Kte5LxTSit5yetX5XEvSxzF6ihCgcoX1aZGskdp4pQM3SBC5lDfzoiCBxk0hMnK
	nQWEtKLBJOboVPzYQ5JrKdYEdtRw9doKH1LCk8yL1BVPXRKfvFXnaVQA1KQHTueWBBwGXMSFosN
	v1xSuGmttG0iELRsg0qx2ucfATiK0A4kGSrIOpYyPYBGqYZjFvjzgP0eIQJ3Ro4ZzryQus4BkW1
	f4jeORmRFdeQjtEIyrQ9w+c94pXvuhw8OTEj/udYoaCnJJ7eqyMaHxG0Cuw==
X-Received: by 2002:a05:622a:1e86:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-55d88127bafmr101738501cf.4.1795668787640; Wed, 25 Nov 2026
 20:53:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com> <DN4FM3TBOJ9T.2QOOL77P5HETO@garyguo.net>
 <20261125132225.00254c37@gandalf.local.home>
In-Reply-To: <20261125132225.00254c37@gandalf.local.home>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Nov 2026 20:52:56 -0800
X-Gm-Features: Aa3M54pMQmXw5Cgtc0EakW9NOiIZs8STgUuBigJfJMSZlzejGTE6XZMetCnzc-8
Message-ID: <CAP-5=fWkUW787c4dGx9rccucqD67dfRgwBB_SoCxFnfZXtXP-w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/30] unwind: Minimal DWARF CFI unwinding for user
 and kernel space
To: Steven Rostedt <rostedt@goodmis.org>, Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, jpoimboe@kernel.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 10:22=E2=80=AFAM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
> On Wed, 25 Nov 2026 16:28:02 +0000
> "Gary Guo" <gary@garyguo.net> wrote:
>
> > A quick question: how do you plan to get this working on 32-bit ARM whi=
ch has
> > its own EHABI?
>
> Do we care? Isn't ARM 32 mostly deprecated at this moment? Or at least no=
t
> adding new features.

There has been recent work on both MIPS and Alpha for perf events, so
supporting ARM32 EHABI doesn't seem unreasonable. Devices like the
Raspberry Pi Zero W/WH, which use a 32-bit CPU are end-of-life in 2030
(according to https://endoflife.date/raspberry-pi ). It is
out-of-scope here, but extending the kernel and verification
infrastructure shouldn't be hard.

Thanks,
Ian

> -- Steve
