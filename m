Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657172;
	b=dDAFzJO0OUFdYNJCNHIkTyeQAJAQKtuq9E8e6fssIvGSLCIKqYB7ymcuD2U8skB+eNqA
	 032g6Fyvmr908VvROaLUTKdCbIZgGIvJ4J8AVARjRFgfqjkYS0ZVZKGMWF7na507wa/x7
	 LwdhtP5bNHfDVwWtuPoJl3gs/v6PFiutEUvr9vfF4eli3PQHq9PcVuwl0BS1eWVMg4k5A
	 PD0ZsBqm5CQbpHEt+sYVN+UWGm7cORIHf8eNxyEuknOy+FIVgwWM2UJM+Q9D8lwVqHuEa
	 A7Sh+euUkyUD6jdojR6SrbGjxGsK85U4SkfSdERW/hAj2dB414FAh/GGC2UdNkETWKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657172;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PYvbuZCxMqyZlK3phM3rr7DPshNcBzk1sd7nqfu7sVE=;
	b=qSCrGwEkcTLoc8uPF1UGiVm4LXFHH3nfQUoyGF86ZfSvr3h/9yqFm1+d6cAa6tPrS8c4
	 r9XnxZM0860Jqxyxoyss7Ii4sD/Z4t/x+qHxalM+qkNQOqb5e8gt5kSdYTLOlof5uqW3i
	 lzpDndyh9lB3fuQqajL791Sv4I1SGQFWnnO+AhEmI/n0wlfj+Xo5WK9HHOQbo1gbYledp
	 tWE4WoajXW3dUzg60M04LqhW46d8Y/91y4HnIkySuTf/C5CzVq/AMCWbFvX/s/dvNr2LP
	 +IKURTyht3zwoCXlQJxxKW4VTJaOuEgOzvvnSKMrdFeSIaxR3c8fMdl8b1kO+Nctiyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JB2Nt+tB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE8A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JB2Nt+tB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831701F000CA
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795657171;
	bh=PYvbuZCxMqyZlK3phM3rr7DPshNcBzk1sd7nqfu7sVE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JB2Nt+tB0czG+5/PQpa0sJruN9/Ka/8BGjCAmCCqyhuX3ReKBC7YJblJv4jDUECZ3
	 5MQnRJmn8YynusPaY+URYJlgowI1QgkdsIJIhsR30zVkK8M1cxUhc1MD6wZPWT/Dup
	 f5R69MkRNVBOKkb/x6iSW5CtGamLyQQo351wxrxO7JevZK8SNILikySTM4KX0nBzua
	 VuxkTI7kUhInfHKkP2Te/wX054GRUYSZJPy2LGYOFzwH+rp8BSYI0lCQW/sBLB0RgX
	 zhS4R/5tR/dQ3A97a9E+FvIKYj0YiSo0PmB4IsiJr/CjoAbeNRruR7tE3qIJSnzvsB
	 q88qNZ2U1LF/w==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c5126505cb3so837464966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:39:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGpLwbA5cdSpHS1VgO323NBvpDmQ+lBiLggOMeVF5hYjotf4/TnHVHYf/1y48IQFg/l65uHdem/kncuw0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OcNK1mKAdJcyHGjaiFn+PCv2M9qlR+Ty/GH3DBQr8aVrgTtbl
	zxZNbOYkTyUzn3ibmmklyeuqKu7YekI2sgW5rTXPBALxnfm9uoyKCNq6rCetO7Pr0Ksojzs2qPS
	biDOOXjI42UoLWU2y0pqxA8v8pKZMsJM=
X-Received: by 2002:a17:906:5593:b0:c40:91fb:b76 with SMTP id
 a640c23a62f3a-c513ab48008mr1257751066b.33.1795657170126; Wed, 25 Nov 2026
 17:39:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124132554.1185817-1-huiwen.he@linux.dev> <CAKYAXd_GDhds=X8OgLCU6f6MqtF4A-7fZiQz-829SWSdUKJbdA@mail.gmail.com>
 <ec609ac9-c250-4e38-a0d1-9f7ff5252436@linux.dev>
In-Reply-To: <ec609ac9-c250-4e38-a0d1-9f7ff5252436@linux.dev>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 26 Nov 2026 10:39:17 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8u3-nbvuqmW+dvawKH3+X2tosOt2h7nCdNKri5yVmC-w@mail.gmail.com>
X-Gm-Features: Aa3M54qSuU4vAj3EVDVo8NLRaYmL4pgXbdqloHBaguimbD5mhS-g5J95k-tMqoM
Message-ID: <CAKYAXd8u3-nbvuqmW+dvawKH3+X2tosOt2h7nCdNKri5yVmC-w@mail.gmail.com>
Subject: Re: [PATCH 0/2] ksmbd: splice READ payloads over TCP
To: hehuiwen <huiwen.he@linux.dev>
Cc: linux-cifs@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Tom Talpey <tom@talpey.com>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 5:58=E2=80=AFPM hehuiwen <huiwen.he@linux.dev> wrot=
e:
>
> Hi Namjae,
Hi Huiwen,
>
> On a single TCP connection, pure per-CPU makes the RX thread and workers
> fight for the same core.
>
> Pure unbound fixes that, but causes other problems: parallel workers
> still contend on srv_mutex and send small replies one by one, cross-CPU
> execution hurts locality, and under schedutil spreading the load can
> drop workers onto lower-frequency CPUs (on the 64 KiB READ send path we
> saw ~1.97 GHz with per-CPU vs. ~0.9 GHz with unbound). For serial 1-job
> QD=3D1 writes, there is no overlap to benefit from either.
>
> For example=EF=BC=88Throughput=EF=BC=9AMiB/s=EF=BC=89=EF=BC=9A
>
> Workload           jobs/QD   PERCPU  UNBOUND   Change
> -----------------  -------  -------  -------  -------
> 1ch, 64 KiB READ     16/32  2051.38  1387.34  -32.37%
> 1ch,  4 KiB WRITE    16/32   215.82   182.71  -15.34%
> 1ch,  1 MiB WRITE      1/1  1948.84  1109.46  -43.07%
> 4ch, 64 KiB WRITE    16/32  2788.42  2497.57  -10.43%
> 4ch,  1 MiB WRITE    16/32  3482.73  3291.34   -5.50%
>
> So I tried sending only WRITE requests to an unbound workqueue, batching
> completed WRITE replies, and only using the unbound queue when WRITEs
> actually overlap (keeping serial WRITEs per-CPU). So far, across
> low/high QD, small/large blocks, READ/WRITE/mixed, and multichannel, it
> performs better than per-CPU without introducing the unbound regressions.
>
> However, given how complex the overlap-detection logic is, I'm not
> confident enough in its reliability yet and want to see if there's a
> simpler way. Right now I'm thinking of keeping a few switchable modes in
> ksmbd and picking the one that works best in most cases as the default.
> What do you think?
Okay, understood. Could you share the patch for your approach, along
with the benchmark setup and results? I=E2=80=99ll review the implementatio=
n,
especially the WRITE-overlap detection, to check its correctness and
see whether the logic can be simplified.
Thanks.
