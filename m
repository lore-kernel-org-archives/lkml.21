Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795046737;
	b=xcriaMWz7KMstiN/OnsMgqfSBPgegaLibKeK7HkJ9OmUSZbGQnXjWA7mcBNqysWqEEpz
	 GkQyAwiaZGJ65vJpVy534CL1Tcc/2+QTROZUe5Kzv8irK17E8Cz2RKJt6JqFSQdf7vq2K
	 yYcsyVKlB6lNigJ4d9PH9+bYXvMjKTnxxvYupF/8c3QoSL0ia0PSzn9cxNzWEpAfFMk4b
	 BdhReWfoDvQ4/azWcqR5FTVZRWC8UF20XDzP70QvPGYuSKufZjQ/xy2Irr45iw4CF4S79
	 vBkhHCeUexcu/AzrfzLZ9mRMJbHLfqeykUEZJ0ZkiJJCHYWKcWHWxD4RMLgvjCow2fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jSTBRQUn7y72ovG0FX2LVSDBSceycnY1ZcY8M/uPhmk=;
	b=rKCpmLuA+HK8V0vT2zsvItUZopBgTHMRFLuWi7q1RuvpzUM28/8X5GZekDlI6j6auFXh
	 JXLtg7jsNETzt4EhdAkipuPSJ526lFrwdVTNby7Tj82NkQ2RNvHY+o0URDW+RL0TUx/pC
	 2i3k32J/74kVLU/PHN5eFRtfz5+jchU5eDr2HchKeWjqFv2Udi3fMzjGy2QGC8cljyJLM
	 N7vxLK7QFBZofWOYVhZDuqu/OV8Ix0y3TBJLRSK7zht5VGGoWjID2xzzLIIhW2J6XUpCU
	 XE6SWuTULKCaumy/YMNlujuH3XMZ916EuQ7olXopRxp9SwcUeXcxBCkNQQ41b+FbSpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlSNUh+q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BC3606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2BC3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlSNUh+q
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492f563d1c6so617965f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:05:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795046735; cv=none;
        d=google.com; s=arc-20260327;
        b=P4g3Durl5zu9mKMMUY2Hn/5vXM6YY8amn1g5gTF5hs1ftr++3K83ZUmfvntz6EKRMd
         6edKM8UgMEk1kiFXbM+EUGx313g8cH0k3d7xVKpt/W6UvnrF02Pv3/V0TNrAEYFwV2v2
         6Q/DxK9SYBx8SeOORAKQSXO61BVKxjtn2Ii+cY1PGwIsBfKYkSAGM/DDfz5nWXggJlET
         bq7cTPtittfvxHQlwGWOpti/j0vycj6WC7YCtXaJTt19K4XCZyswmQ75pCLBmAsH4BCI
         w/LmNQkRfiPl/TbuLtP1zOV87H9NPw5uGIs3c981aYZREkYmTHLJDpdvWJHPC39Z2cgx
         /Yjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jSTBRQUn7y72ovG0FX2LVSDBSceycnY1ZcY8M/uPhmk=;
        fh=4TukisgtE/r2Xd/kb3I9oqWIQtvYdVE/7ZvDmL44YNQ=;
        b=A/X+X8QMxPg67sptBMgyBGKPOysMeHZIcOZtMyGays30U6QGM8uWMPJui2+Pn4DlgZ
         alwYjstOhiLK7a3Dweu6n7D47yen9lDaMgIiR3WxycNk5ajDTZrEzePPdodwFq3hul/q
         FEWPCwQD3NkLieF+VTgYBZ1qLvDTeRW2eV7oZeTHO8CX99I1HxuHU1nF58YR5B52SR5S
         RXI9AUh1csAe+08NUAgZdBlxNIECm9ye8Do0qyRaB/zSCWKYcakeukplwa6XeSXpmfRF
         NHTMjncXgzwXALISaxXbhJb7QScqLhYopjO6HOwjA5WSq4vaX30TTAJTbPRh8OIcp/tw
         M3Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046735; x=1795651535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jSTBRQUn7y72ovG0FX2LVSDBSceycnY1ZcY8M/uPhmk=;
        b=mlSNUh+qEThAmoYBnCSmjXkVGJip1b+KHtYsv1hZIFRn5g9lNUkXJziQ+IsrvZxDOm
         JC0nrs2S0LMH8+dx2n9zDizIoiSJHl/FgAYMzWxJGWzf8mE2E7TLY6V/Q8SLaw2zj1mV
         nyr8A/meIcjalPfDET3aMXgPigz7hzKg3vuVNXqnCkVXJAAeCCwQGT+x6VJ9AgXvS86l
         tno3FVEaAG2Om8RNJ6R3u041ds5tE/rhmvHZnoxDOn7ysC5ni2gII0dw9gihu7BkzRb4
         mFAgp7MU/t/nzAMNLtrlteobV8x57UJ7rG0WYyiapt6ac0h1jbaCEmVhXqxfK+5T1YJ4
         CwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046735; x=1795651535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSTBRQUn7y72ovG0FX2LVSDBSceycnY1ZcY8M/uPhmk=;
        b=Nil3qqAn4bpiIRlZI6UQ5uOFNvdQT/TIcH+yLoHcR1rnsDr2gyhTtJZNxTQ24eQ5F5
         XSzi1IFJuegeuJFemFinAdPfhXE0/wvf8w/S1F5pgivfoAanusagqbewA1qalsIg9ZZ6
         B+6rY1YZDygiakwj3ZzKrur28JBtX2/3JW0DYXVWpl959EPiULp/pAqpSlJwaBGDv82j
         +DatY8qegIpjqA0glU70lEcx2717nMhem2KbnqyXesva7UxRWwxMRpgWhldd4EDDzxH/
         tSLOzfpbr2vBdXmYEQQo1XMdP5l8b7VwG32eebfG2knFmPP0q1ZKQiTZx0qkBXKn6qUX
         hDPg==
X-Forwarded-Encrypted: i=1; AL+hErEi7ChkwlStVKjRIpusopNl42o54ewkpo3bEIu5Gqqk+yXxFm+GUk8wEirKCZ4hyT7q8ROZzA2TqO6UT/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pFGD9UBVuU/OXz1eqAeoOCtgNwHf2FlMo5LPTe/KmvPdsYEhJ
	LPxBhwEc5GE/3Ri53PvuPx7Dh+lckvTGGxxqxOHgvFh2KhmbmruVYho/2T31OK1kH5fSGXWbOkI
	38D+4lDb9/4wEhp9+o3JSyuGoHlCnyhA=
X-Gm-Gg: AZFdTZeVEjpuTA54EX8RpJlKL6wQYkI6osHv+mlRm4tfBvYe+1O+Svoe45MolUrlqYe
	fW0wSGo1nCss30aCtUpefLxbU038PSiDwZ68HxTJvgd252thyP/jJMVaN7xCjgcFGnpBixuJXkK
	ZZjKOg3Izqya7blDmlkPPkskokDuCrJF2kUCPUPOB1cGLJrgwY7r/g01n3mysliCWhVYWGTIPOf
	r/zmAlzCiNNt9WjPIvPBXgNBXos6mS6ZqkOFBErQk+eg9YTQiZ3JNUaM1Zd0jR49EdsywFpYOib
	5rcszlyKa817FM9VzNL9XLCWVhHQ3X5gk8R1qxoqjcoBAzvHg8eTklVxP5d8pYCRW+JZ29KbkDb
	Hhnp7xDr96hIqHw5vi8q/1C1erQrfzo3qTYfIYsazRz/66iKYWOixy0fiNSzPUqPrdsZHbTVGjd
	J5h9V2uuAZXfQVKoqScDE=
X-Received: by 2002:a05:6000:1a8d:b0:4a4:f86e:d97 with SMTP id
 ffacd0b85a97d-4a6337865c9mr9535095f8f.1.1795046735028; Wed, 18 Nov 2026
 16:05:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023124157.75524-1-puranjay@kernel.org> <0f97689d-fdec-4cf4-b6ca-4365aced16d6@amd.com>
In-Reply-To: <0f97689d-fdec-4cf4-b6ca-4365aced16d6@amd.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 18 Nov 2026 16:05:24 -0800
X-Gm-Features: Aa3M54psv0NDDiF9QLJFrAAgoAs2e4Ba4LlnjZXH_a2-VlxejVTzfB_OynEoxK0
Message-ID: <CAEf4BzaPDnopvSoS=AwN-gNPdzD0Bs4PvVPP+qCrdBFQ8CyJsg@mail.gmail.com>
Subject: Re: [PATCH] perf/x86/amd/lbr: Freeze LBR on PMI only when kernel
 branches are recorded
To: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Puranjay Mohan <puranjay@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 7:48=E2=80=AFPM Ravi Bangoria <ravi.bangoria@amd.co=
m> wrote:
>
> On 23-Oct-26 6:11 PM, Puranjay Mohan wrote:
> > On CPUs with X86_FEATURE_AMD_LBR_PMC_FREEZE the LBR is always frozen on
> > PMI, so the branch stack ends before the IP and callchain, which are
> > taken when the NMI is delivered. IBS rejects branch-stack events, so
> > there is no precise alternative.
> >
> > The freeze only keeps the PMI handler's branches out of the stack, whic=
h
> > matters only when branches into the kernel are recorded; without it the
> > stack fills with the handler's own branches. A user-only filter does no=
t
> > record them, and parts without the feature are never frozen (see commit
> > 598c2fafc06f ("perf/x86/amd/lbr: Use freeze based on availability")).
> >
> > Freeze unless the value written to LBR_SELECT, which is shared by all
> > events on the CPU, suppresses branches into the kernel.
> >
> > With perf record -e ex_ret_brn_tkn:u -j any,u on a Zen 5 part running
> > CPython, the function of the sampled IP differs from the function of
> > LBR[0].to in 84.3% of samples with the freeze and in 0.1% without it.
> >
> > Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
>
> Reviewed-by: Ravi Bangoria <ravi.bangoria@amd.com>
>

Thanks, Ravi!

Do I understand correctly (from [0]) that we'll just stick to this
patch and there is nothing from Puranjay's side to follow up on?
Thanks!

  [0] https://lore.kernel.org/all/5cf60aaf-2ee4-482f-9054-dff823710431@amd.=
com/

> Thanks,
> Ravi
>
