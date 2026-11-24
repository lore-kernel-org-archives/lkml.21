Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795560437;
	b=cfvde8/otOqU1NKnqmeS+MGaYVtaT2na/2X4V+h/VHtGxUtTCWXTOyY7TRn/u6ij5VKD
	 mbnarskU8V78bAQXTCRscY/COtpz7tGewV1Il3PINLctlwzg8z5gPjUQHOwXqs7AoZ00J
	 UGzHBOHgXc43cvDRoZRhtRkdl9n6FcougPbtQNlobXy5a2nh/0x08mfUjZGmS5tOX6lQg
	 Z7ApV0kZs4YPo3otMO56BIq1AHyjXH46p8wpkI2m8RxsL6iG12QC//yb33EckzqPQDycA
	 ampgKt5057Pj1yCHBZjTryAjIqEs1tJLFENzeDWRZoOWsPTa7Awg/fzJQ4Py8XHOvhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GF9UzmSOZxINPRRDMCQdqLyqXkvSltKB8TQCTr+wUgg=;
	b=dkAmjm2I4AcPqpAuh/sS+DIcRHZE0JFIYoigSJu0grZPzlRU0S04yjIZLej084k0pBu1
	 odDhtEFtsKELm1ki0JckGNBEcwLhrnh4LKt6fgPW0STFBgwzj910W9pu3tbPfjGkFTm2M
	 d7ecbOiFmmh7p/9KajkEDVqI+0mNkraZ3Bzk1NAZ7LPtoTAMUX6jL2fxbkA/64JSocn07
	 dO4lvRsCjMAEeXKOBHhLWuL+XBYVA27J1lC6JSJ8P6N7+ReVpzKpPl6zJaqQA7ss1OHwV
	 Eq+pSqXNDeN+0f4xYuB5cXSp4wbisjuD7ICSxa/X3oe3PkSHKDlFK3s/fTVZU4qgtZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDVYfjGl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957BA606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 957BA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDVYfjGl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso36561065e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795560436; cv=none;
        d=google.com; s=arc-20260327;
        b=Txwia7wTYrbkyOuoJlxRUwZqiN3QM2lbJxN0+S8giQLzInta6A3n5XPMO1r7lwlbfX
         DTAKvwmCxewG867YEnW0PoybLH6sXuzrFIaMdjFyjzuaw80SOmPbeVPTIo2Eeen4XPnF
         RZyP7vXd3CcSRNEDXOE5qe10qHFNkOVLCvfNPeJmJH912PSnPphB5z4cSUaqOddjRyLT
         Hq08hpjI88d9jYJxYxp1os/N0ckJqWe+S7VMCYWTO+BFJR3qHIuA7WsAjPj87f1GmGSq
         6ExEfgyGbNWZm/T3pdS0jpSzsab/idIkzUbu094xNBAUassT/eizpexuv3zCm1Mhgqb3
         aN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GF9UzmSOZxINPRRDMCQdqLyqXkvSltKB8TQCTr+wUgg=;
        fh=T+WI082oh+6gISqurZdaudU6rE8/Tt9H2D1mnqtMlRM=;
        b=CjTcXmNHRQz1xnYt3auL14HcBsHjwEK97z/l/454AGFFShZDWMohDDlr8/m+KC0/w9
         qOLD/+5Evpoa0htnd1j9R6QMWDji9QGBhmnrUiTooHRUYl8SLvInzLxl/vdPJzhnNtix
         g7IEETbRr9upwHHykGWPvFs6Azuo4oUx81AOai7QTfkT3/Nm8zmYvB3jU+ZOyXjfprMo
         hIQ9o8UyOg8MO+74zmDYZxcluPwSZ0VmDyk42nVZFXFWvJKY3vw+IxhPgzLhUpVa2XGs
         PGAUTlePmjZUIGEPj61QubhYMNODKs/ccCy8/L/oFwus4+gdlLUIuGuQvWdKVsSh4X4l
         SFYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560436; x=1796165236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GF9UzmSOZxINPRRDMCQdqLyqXkvSltKB8TQCTr+wUgg=;
        b=IDVYfjGlC847MomvevIBogV0vwwH2yd2UbYY5Cdba1WMU1IFjTL1zOVYezv7JfLPaL
         PEoqyv72xKtn6m6/PpgG3HD+F597WR+Lk4Kw6Ao5dbhfcgN/qOa0pF3ohOj+ju6tcKWv
         xmHbpuErkFM1Td9TuAkjzXq7scwkjlT3tecreogkpIBZirKgRy0UaJ5J+6ZZ0xG/H6tb
         h69dlYSWiOgugkyOJj7SlhGoDA6PBXqhF8NFuL4NgSD4uID64PVSpoTq8Z57tph/rQP6
         /YsFIn26b+AhrcnUJdzvD5gRy3rhZvce1QEXJTon3HeB81IlADuKdmg3HsiYIai6Y9Fu
         A9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560436; x=1796165236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GF9UzmSOZxINPRRDMCQdqLyqXkvSltKB8TQCTr+wUgg=;
        b=wG4enXO1Ptv314l6XjV8YlB9dnPLruIR/QvGq+9JtsbZlUmWSG4n63hLmbL0/Cnaam
         5FLOAJGwpIQuDi1ZwETFuKSr4Yt9fcXA57tSgFkbTZzAmykNWtBzO8876ugDXRjBcf6r
         wfCuKTcIjIR0UEBqMNm+DQdroO5EklJ0l6hTb+ay4fQLCukjfB8TwUfdxThAlU9/gUk5
         lPfftH53GbGllFD2gtCw3cW6pOGilXOwP3yUSRYjw9bOJXKPWKhMRn/BcFtxo1OMqV1b
         /ezVn6tf4lHK9Yjmhfb26FPQFdiOWFU/Bf0OQkWaAzTO7RulK3Pnu6obYVbCFdxPCSw1
         +Vdg==
X-Forwarded-Encrypted: i=1; AL+hErGTedm5KRKuT7ithIH+mWUsomWSNUt/vJ7JMF4V3iFszn8Z7a+R1WNozkYg7thcj1xn6V1rw2vUYgYmvWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v0ZWofDMCoMln/nCyS/DTkT3wH3yD327A+Wn3QhMoTqnMF6NO
	DgJVBfXxxrnM1BEJxyMZazkVKXcFYuwITpzit+BxwCSkYEf6Nt3R5kA8NY2oOIkyz+Bpgw8Y4HI
	0C1uqyl9X+vrwqFqJgpnjuoYhQ6wdAQM=
X-Gm-Gg: AZFdTZeWEXf5X1iPV7paQf/eSjbdKXANElQD/NV6mXYdJSE1CvGpfBBD+YlILMd58Ax
	MwViKcOiOBpw/Ls9qFx5sOlCuRgU53V//jBCiJIZ+wM/qAo6SpZIRxjcOlHzKWXf2pX/5i9VTYg
	IwKXoHp3yzDN7wjnM+q248imJ4jcrq4pSvhoeIUtl2R9x7KMnjj1ol6NQBYxB/qE/4odaUMeBJ9
	+NWv4NogGCORAOnPSB2aeK97N9uaD1WLCD5HzaumbSYvQX97Bw+rM5S+vZeeCF+fxAxpmUUJVaY
	CCpGqnUaM/jZv789caTOam3puBcuafmRYBth8GW2DQV5vMDqNNlsk47kMhSpkfkaB3DLnD+Q5LT
	jjDvxhfKprlaNLzjA9aW6/wX4z82qHexSc+pttK2ZJHNOQT8JDssDoksjykB7XuHXathpTg4yYR
	Tl3QuybD5zkFRB1PGFQM8=
X-Received: by 2002:a05:600c:6748:b0:4bb:6a2d:b42d with SMTP id
 5b1f17b1804b1-4bb88824e64mr318116355e9.31.1795560435685; Tue, 24 Nov 2026
 14:47:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121003403.2928928-1-ihor.solodrai@linux.dev>
 <20261121003403.2928928-2-ihor.solodrai@linux.dev> <adf5a84b-5d80-4c02-91f5-12def2c37304@kernel.org>
 <faecfef3-ac9f-41be-8bc3-83a66572066a@linux.dev>
In-Reply-To: <faecfef3-ac9f-41be-8bc3-83a66572066a@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 24 Nov 2026 14:47:04 -0800
X-Gm-Features: Aa3M54oiG4dsSQL3PSHqOX4KocU7vtpa91-MEZLJQ-xarDHbD7m4NESmq_n90Qo
Message-ID: <CAEf4Bza6oDkY=mfa4PedrQYtjYnkefTs2m-wVatK9BGoNLd-wA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] libbpf: Separate interfaces shared with
 in-tree tools
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>, Song Liu <song@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:44=E2=80=AFAM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> On 2026-11-23 7:55 a.m., Quentin Monnet wrote:
> > 2026-11-20 17:33 UTC-0700 ~ Ihor Solodrai <ihor.solodrai@linux.dev>
> >> resolve_btfids links libbpf statically and uses its BTF header
> >> accessor, field iterator and SHA-256 helper. libbpf_internal.h
> >> also defines logging macros and poisons kernel integer typedefs,
> >> so resolve_btfids wraps the hash helper in a separate source file.
> >>
> >> Move the shared declarations to libbpf_tools.h and use them
> >> directly in resolve_btfids. The header is for in-tree tools and
> >> stays uninstalled. No shared-library symbols change.
> >
> >
> > Hi Ihor, the change in bpftool's Makefile looks OK and I understand the
> > motivation for libbpf_tools.h for resolve_btfids. But I find it a bit
> > confusing to move away from libbpf_internal.h only partially for
> > bpftool, and to have a split dependency on both libbpf_internal.h and
> > libbpf_tools.h. Have you considered moving the other objects that
> > bpftool requires from libbpf_internal.h to libbpf_tools.h as well?
>
> Hi Quentin, thank you for taking a look.
>
> I haven't considered that, and it seems like a good idea to me.
>
> The way I thought about this is that in practice libbpf has at least
> three levels of (userspace, non-BPF) API:
>    - public API defined in the symbols map
>    - internal API, shared helpers and such
>    - API for the in-tree users, that doesn't make sense to make
>      public

well, I don't think encouraging this with extra "libbpf_tools.h" is a
good thing. I'd prefer to keep stuff like that in libbpf_internal.h
(because it is meant to be internal to libbpf, with bpftool and
resolve_btfids being a special case)

Do I understand correctly that the problem is mostly in poisoning?
should we just guard those pragmas with #ifdef check and let
resolve_btfids disable that, if desired?

>
> I felt like the last one needs a header to reduce the amount of
> copy-paste. I don't like "libbpf_tools.h", it gives me "10k loc
> utils file" vibes, but I couldn't come up with a better name. Open
> to suggestions.
>
> I need to look into bots' feedback, and I expect there will be a v3,
> so I'll see what bpftool parts can be moved to the new header as well.
>
> Thanks!
>
> >
> > Thanks,
> > Quentin
>
>
