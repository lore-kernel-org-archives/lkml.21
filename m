Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795536612;
	b=TCsSXy2xm5F/sPhjp5LHGUF4RL6XB9XoEbByXFDXDE2rNj2ZM6MK/DTqvi1AR5+i6E0I
	 pLd4Krnfc3yyQB/2o9oKeiK9kACkBJpZNk3+zNn+dN6RxjeYLk65gm/ahCEZLsiwuVlkR
	 KDGEGLnH5CfFKFeHL+1SUIg1mo+4hyA5HLnV+xwlQEAomsi/77y/EXfkHP1IaNThyn6tR
	 ArbEdQBIE36hy2U/GxIeNdunx4XUFgeNXD7JQrbaA6vzceuA7HFBurhCzQOMU0noYJ+x1
	 L0xK3Zxo95btrOhzINaNk7R+rU3qlP6QIO6aVYROjpUNhqPja27YgVp+Iqt73J9Y7Xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=pECHgTEWdmkP4oll75I2OEsbM2jKiS8QbJcrj5sLeos=;
	b=vsJhFgz8F4qixvoEAlDTbBaFziDxND2YaI4ONhZmB/cLm+KE3N438CBoZ0TaTu+H8iVE
	 myBnNZ600zltEeceem9iZFSyB1zmWxBKw9/o/7ZenNBE//xtLOzeLXSR4vpdbAbTaB58z
	 rR+KVyjSfXZOhIvCRx/yKUFPxEMRGGAx8uuhA0q+I7W3QKCtUJGb977Hn98/PweZ17T/f
	 Ov+VsEzWyiJ2/MQEGE0N+N22IdRMHwwW603/QaP3PRgnk3/nEO9xvtm+anJYOw/AoHbcY
	 dk4+lGgRRsC8SdXgQRrZBRbV1t1qO0R+RK+y45TE8ZIsv5VznbiEf76WOvyKeb6oRww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=S1yI3LI9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09962606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09962606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=S1yI3LI9
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f05e191b2fso2164475ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:10:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795536611; cv=none;
        d=google.com; s=arc-20260327;
        b=LWRV+Mv+ohXMKcQv6HtqcqXjRNxOZR9pPvUsjDUKyGRpDOyKXgoEYB98eYNoDXp484
         zoGEMfXPZohid5FJgHXLfIpOLYU6unRlqjF+7iYriRh190SoINowQA2RPUKi9NKarChY
         s3jKBA32c3H9ltFmeG2Xc0TiTICKaiaivmE90WdvpDXx9Si1R6DJPYjDr/8U0CZjTf3F
         pgHzvdy+hXZEKzXkmNSylWtRDjj424SOXiGOJE1wBsG91IYtEUVWoDPz40iJm6BycFpK
         8MTE79PvEHKFyBIcmz85JvUOH10pLZJ6ZLsi5DeuWNzR83vtAnHbGlCGwibiXiyvHqP4
         4ohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pECHgTEWdmkP4oll75I2OEsbM2jKiS8QbJcrj5sLeos=;
        fh=vgwI36THYFg5skqnlxp3ZIKbe6qAWU30CLF1w4v1ofk=;
        b=Qdyfk0WMzNTA8foRImS5Dv/clAnWNGzFcib12mFaeeJtRSaJjrjEZUgS5waYK+tpcA
         Qui+iFkqvj/DytTMPb6d1PXo4zie/nF/mo+LqIvj3BgOt36eCbXSmr7qBbqU4fNG+2yU
         vrRwqk+j4gFNToW7dLEcCfZlwjv0pwtTgjLMDGUz+9in2KNoX7GwcOgfOj9tOu5Uvl8R
         DL4WHwK9X5q2P12+MeQ0wBnaHzkd2qdjtPH2k2GxJveepg6SzLx9q030TSZBaRabMJrX
         S9OzEKbbqy52UQ7o0yW0d6s4kJM1l4z0+JdTw/1MqIRVjxKbSik5X0EBWJXHCGUpaXjR
         wtSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1795536611; x=1796141411; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pECHgTEWdmkP4oll75I2OEsbM2jKiS8QbJcrj5sLeos=;
        b=S1yI3LI9vJyy+J/lqhmAi/pLCfOkD65WagY1iQb4FqSa9/NQOUQhUC3zXRx2dS0G0a
         j4D6YPfXYa8sQH14m9VdQn+hM9sNDg/nLHQkAwrc6figbutf1C9kToy4FvmxIIZD0zsr
         cm8CZZc7881CCSw+A8DXVSiRKbxJkMPmRa6NRYx6yOLUo1EhsfLvN8qQcBPlIbNFo5Z8
         z4U2YckqEaEffaLTBHFBmQmGuzMbVz/wm+gXCWS4vu5immdXYfMFMiMMqZ+62+upsskT
         Efum+Cj2AWlAyCBJEJZHE2JzKpCBngcJzUFQXSAOKfj854Ev5KdeSdNFCk0bEQPqpgc5
         lu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536611; x=1796141411;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pECHgTEWdmkP4oll75I2OEsbM2jKiS8QbJcrj5sLeos=;
        b=Y7dvhwn1qzET/1/dNsbHFN7K0/ZnUL9jqjcNsx3RMzdn5/cNWQHFTTKlM/n0o0DFxk
         EFgMXq0AjoaspLrbKkzz0pBkV5Mtda9ciNNej6plop0DIYRWqvCmADLCGYdyN8FFdVS2
         XvqoYbGaO2n1Etj4hFZN9j+w9Ne1qE3fvB8oBfyqz8mSzfymkse3e8SzkyfLg1+Wj71d
         lqGs0izstHgSMnHqfj8kpqbn5Btbl0X3rwBkUr58/wg6RSxtBUFEEB/mdIOOcByS2xVz
         GmQ+4cDSUXWvKpbfux2j/tFqIxBhKRPM9yQ0sN2DUCkioc9cOQN3lyDbMb6jgieoHPeq
         YY1A==
X-Forwarded-Encrypted: i=1; AL+hErFs1hGs5xW5psFOpdGqseg7vYf2zAa4y3n/escbPlwVDYVDeff4X3GZDXECV5owOdW/eZRSWskAn6kkJE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/M5+fMNBdBI59Q1SVmeaQ+xwJacwjGg+GF1/+yMgxgwNHOXUgk
	zVApoEaZKMcFWC7oscgZjx48FlpwDdGDOnqy4m770IjxRhRvGwXH9M6VaG6dlDU7ZVP1mcB7gAw
	ERIDMtb7twtqP8i0wmDsPpgNgmzdHHBJE4qzr40tkMA==
X-Gm-Gg: AZFdTZdv2KdJYZWTMGoM+/jkkNQmx/xnc6e7/oBRl15Kmfc3ban6oGGCZZqJJPXaCYU
	Fq8/exrMY7dnf/e+FjlGzRbFo+t+b24aGtub1dmKeWVPbs9fPdAMSyKfExTj/6H80nDUKazdo5Q
	M4HN9pzalo/aCC1TAmt4696eCFDNdWNIC6N594Rxg2fVL6Ygpc2+6Bjc3Qm8e16pptsfZGGMVVn
	Z8536HN/AbFFgyoZ7gxJ12eKK/fooG4ScB+D797W3dRlVWvq2GqYmkXdrZ7vzyb0c014K0gZ2Xs
	xbZsB7ns9zYxXwAeyG3VLZDrX+EhyRhv9XbcTqvOMR33cO+QUEOG/TP6nMLPmxkzwsLMHzmqbhV
	bCsfC7KOUfVB+DgRp24s+tKBIoPWigXMMf3Z1ZEIMtOsPJV/Sr0U3eh7SrQ==
X-Received: by 2002:a17:902:eccf:b0:2e9:9263:a58 with SMTP id
 d9443c01a7336-2f03f0c2295mr244472215ad.1.1795536611297; Tue, 24 Nov 2026
 08:10:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com> <DN38312WXPDJ.2KLUTCWSDFL3P@gmail.com>
In-Reply-To: <DN38312WXPDJ.2KLUTCWSDFL3P@gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Tue, 24 Nov 2026 18:10:14 +0200
X-Gm-Features: Aa3M54onkUvGne4r5q9V5OFXU9IrjVkwLVOH89IS09aAR4OuvPfNMfZg3YhBdKs
Message-ID: <CAPnbwjpP9Fin=CyD0WiA2c4sxqbfyK7AziE64PCX4w9kbz55Kw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/4] bpf: Check recursion per task for
 preemptible programs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	JP Kobryn <jp.kobryn@linux.dev>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 06:21 AM Alexei Starovoitov wrote:
> I think this should minimize the breakage and fix the issue.

Thanks, I'll do v4 that way. One question:

Timed may_goto sets the mark, so a may_goto loop would run with
preemption off for up to 250 ms, which you ruled out on v1 ("with
may_goto they can take 1/4 sec"). Move count and timestamp per
invocation, in bpf_run_ctx, so that may_goto needs no mark?

Thanks,
Mike
