Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579340;
	b=QRadyqPH4K4i7ISwoXaVj7nq4DZ90S9F8zsgcc0/r2H5oI1fQ6W3RZR6gi5TCUU2xqh8
	 iLXYPTjqZ0osuMEPJ3ps0NxOc0MqrN6EZXZZn3c5rR0/rJA5Gsu4k3vAF+3bcFG8eaoOY
	 KZCtJq3LUzgS281vQ4eQD9t4o1eZCxU6hwpFsl2Q58N63Se4UzyIlv6J4pO2ZdXqImZPT
	 eBIIcS5APwzd9rOlt3lRmbYZ+2v40Hpc04c5gJCd7Kg70s9sKF1TPR1gLHEwnIzW30r9s
	 eYjmhKwgs7Cr3dDtaO0J9fR+cpOQ6I/29fKUQcZfApBxDvjMBtjkA1WcuLuSjDVA5gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=b5t7kT/F/kUHuHqqdf7OGhwe+jg/XQAt4FVRvgQFTFM=;
	b=zI96JLsQzwUhWIY9pWbmDMand8ttJ9+J2lJSoC7QQXll/tj0y7PYxcL5nzP0SW8zLg2d
	 /G8Po30quxsazQbeuAxXK9e00R0X7UC+Go0ZGFec3LCcHcYFMhNviVu4xNfZyRfaOwTPM
	 D01DInhCa8bwJBQrMfjZi38mZbaiLtem/HLL3LIgfLn/MFoJzNebiIkGw/upeli6TNt13
	 yNzawzQri4ZGIfH0liF8831KvaWrVu7x//wOoIGuS/iIHCcvwdPFc0k91FYUd9U8Y3LQE
	 E6CnkvksMkuaDq4kAqdun+eDFvQ0GC+7D19Qt2dC1evNXTL+QNz7nrdwxZBK5UinTBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qmUGcFTr;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56533606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56533606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qmUGcFTr
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso2534128a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795579340; x=1796184140; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b5t7kT/F/kUHuHqqdf7OGhwe+jg/XQAt4FVRvgQFTFM=;
        b=qmUGcFTrSFIX5w53DMBY9t5NDLbT2ffVFUIqR9e8b+NYuBntScGuFsq6u03S0Cj9yL
         zAoke3NBJsIg0FUTzu/6hCvixZqaN3uZarKeAPeG1hnMVEDQ2jQQ8pq9oI4AkjLBd2Xs
         vwVj1E2c7rh89Qic3KEQk/m7YiDLYLk4tA6BGapSLVa9KhQ85oZVCQoxq9BCyHPHCS/q
         oUYtbqGO4nT1PtgxTiec2U/CaZRTLhp9HAN7lYtDu7gm+YNqou7O+IICYK2Qu0jRbgLP
         xCQtkWU8trttJFbcLUPjsWoelPhSR6imrKeqEYwDPLLFa9eiPnoPMBuDSA+wXdvnHi8T
         lTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795579340; x=1796184140;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5t7kT/F/kUHuHqqdf7OGhwe+jg/XQAt4FVRvgQFTFM=;
        b=kKJ+APD3jVek1gOQijL+3gwU1y0O4l1ze7kgooPwQqY1DGAUYYZkCLd8sF2kX86OEx
         TAmQidlwL3u5L+giOoemubYQ8IfleOOInp4M9hyGwYWEcZdQDRegK4V3dA/2gvNjMgGZ
         6yUyZxYNxfjyJP5jF5OnUxvXODnAc/caWBP7Q5HTPupEu85z6yvW/Gfo564PdPfoIbm2
         Dt+GO/xz7as6EitPpS/5AYugvEFZlt8oqZWJxhfjLE+H6al30YxRivn83LZMzmuX0+pY
         viEgKn6Ym2d8dmtE5SP6DPFoYjEZaVVaz22BGeE1aZrrH7V3VKWA8JQxRQoVeIjVM5WU
         15MA==
X-Forwarded-Encrypted: i=1; AL+hErFZe06pYsx5yeV16CR/bwAtG6x3XLxsJB0wyp1hWqInOLQY1IfNEcmBcF0XV9zC/QZLUKBZcEdl92QGDa4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SshJv3gb5qASclU6Lz0pi9zDG/Mn6SUju4Zc7jtyn3Tn3th2k
	XE44yowPdZ/XKwICkXpk2cYYHTzvyOYUKk7yXzT5JJ8c0U6ga1sLmUjh
X-Gm-Gg: AZFdTZc7+3utWa7kAQev+nnx4fLKGaeU6HdUIRZCjUAx9FaiptCqr46M3kXXV58Hk1S
	NujEuolVoIdc1APQUg7jDgYLFtk+Sjkg6PuTRpmxxH/aWxHX5AetIFKZPmuJ2vS9+7c0bWnLc+V
	uf9k0A5v0Kq0Y7Do8dcPpI0Kw6bOzJBuLJPei5O4UQh4yOmYUeHcYaLwjQq1kIlLdsFSf9DtHP+
	3k9+jZx6NbVhFdo1XtmkloqnqJkBb8AQ36tB5wZEbLCr8o9SqsmSSz8QuGdfQdQFMFBGaijeHlQ
	l9nIjrtvod/wWU1k6/yM6aCtBAbQd51RXxS6hDgV0mJNeOSasYSei611jYtC4Dc/f8Ee/Wnzs18
	oDO+VjtQSqZrOmUxFh7a1ka0dffKAo6jIAj3loslh0SzrPWPfnFn37e2CM/JE+/oqRfVAWgd/y3
	6vPnJAhaUp+YjuLBUilHczZ3yJL/vdtGr8PDp84o26tsLyW4yf2QA+CXgJlDOHCdQWrCn21g1j6
	q8Z4ptmff1Y9aj9bEPkxVwZxI5j5GBJ0Ad/ns1E8+iLMFBpCGp4tl3ciNxORie1xN9eBWNE3GjB
	/pmV1aTroEVIO6Lo01HnIR3Ed3Z5wtexJX1n1Be/ASzTSMku7ZXJ0Ag5r2wQL7mGKfk1ZMR/Yrl
	QBM4VYUHChlwRXJKFoYzCksHMc3r01UY52OQ=
X-Received: by 2002:a17:90b:288e:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b41c907e21mr15006021a91.26.1795579339396;
        Tue, 24 Nov 2026 20:02:19 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm28765330a91.2.2026.11.24.20.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 20:02:19 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 04:02:18 +0000
Message-Id: <DN3ZR4IBQUKK.2KZHQUDH3ZRAC@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "JP Kobryn (CrowdStrike)" <jp.kobryn@linux.dev>,
 <mikeba@sentinelone.com>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, <linux-trace-kernel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>, "Martin Kelly"
 <martin.kelly@crowdstrike.com>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, <tyler.wilson@crowdstrike.com>
Subject: Re: [PATCH bpf-next v3 0/4] bpf: Check recursion per task for
 preemptible programs
In-Reply-To: <44034fa7-91ab-4777-ba72-0037a6932b56@linux.dev>
References: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com> <44034fa7-91ab-4777-ba72-0037a6932b56@linux.dev>
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

On Tue, Nov 24, 2026 at 06:06 PM JP Kobryn (CrowdStrike) <jp.kobryn@linux.dev> wrote:
> The patch below is a proof of concept scoped only to x86_64 trampolines.
> It was validated with the bpftrace prog that precedes the patch, along
> with jited assembly dump to inspect the new private frame API calls.
> Overhead measured was roughly 60ns, but this was just a first take and I
> believe it can be optimized especially in the JIT area. If it makes
> sense, this could be integrated into the series or sent as a follow-up.

If you want to redesign private stack please take inspiration
from insert_arena_stack_get(). Much lower overhead and no artificial limits.
