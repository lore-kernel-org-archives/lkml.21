Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203452;
	b=GY0sxjkvtsSgPtbbrmxsjmWrNEhDTFucLSH3tvrBuO/ifvtdPHcn6uCS1JpRSsEbE+Sn
	 /s4AZZqgmLxbKauD0i4YDrPwZQ/tOgO2l1t+wuOiS1z+wiYLifZ0Fcu26sBkZwmNnByQS
	 r5NKuM5CgK7tCQvHivGYW2ONOu1avBoJiVr7yPToubEo6Y2yfRQPVQ32crnR3jvEMebtc
	 cA7HgEp9S3T4+mJHngHPt04gOpffA53JBAuKd5YtAh41UWtK0RasT8z9slo6COJ8cK/vB
	 iZVgXLmFIvjP2QnJAWrUh9mP6m5P81VtF6csmrRfgxHpDft+A/TivG6x86+p30EyKyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=HLU92PpOXK+Ktbjntwj6K/wKzrqD7ZTq4i89OR79Z88=;
	b=JLpizN39pESAidZpzzbiY1YRE/ub+OMVhgHs40C9DeFFx0ykABATKbrymp5oxFHUedgj
	 D22Mrjp1RiDGWddzSMyKRyRIp5OBpYLE7QisfXS4cTwMESmC0eV4NDFlVfa06IxA3zABY
	 NnPvxGtDJ3x4PsUKTEA4WFbwq+LN+a+fRi9YUcUeVQOmHIWoSNEglqJgOx4l36jxmurv2
	 vlBNG5x/xJduDZF0aFuqD7EnfsZEqunf1YYg/AYZ82Szox3mic3c77RufHc91qqY7bqOz
	 jHnT5Kqz3SuiomJ2zrvXhOLPbF3KXnozX+yF97C/l7/pVhbFV1ljogAKIn+2YOiEeew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejUUxyfM;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5670606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5670606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejUUxyfM
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b413d04c93so848735a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203451; x=1795808251; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HLU92PpOXK+Ktbjntwj6K/wKzrqD7ZTq4i89OR79Z88=;
        b=ejUUxyfMijObmR/uk71uc7wEiWG63666i4kANiVWLKS7e/TPrrDFRbh/lojYHlKQwM
         HNgjBk6ieOzaG6ss2SQE4W8DWwsk3WblsgjSaxY7Qp7+nfp9DTkAonaPZOp8sbG+q54y
         c5TDKfV+9GA/zeJBnGq8yYq5jZ33RdGlI/AJtHE9SD+ABUzjhinTq5mb8CvP767E2jOz
         LfvKnL2r3Xm3oE23U5QMjMHdqNNcpz5TOnNcNbSBqx9IS1ZJjS16NX8ZCGX6PC640YBt
         wH/V9z4epp7jQSKsNe+VwJpqiItaoWSEEIkjebRHiGz9eoJ65r7GO5uf9y1CWJ2PBXvZ
         L12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203451; x=1795808251;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLU92PpOXK+Ktbjntwj6K/wKzrqD7ZTq4i89OR79Z88=;
        b=glotTxvzHb4a0QI7cj969aj6I+G7RJA4Wkk382sUpMjzFfZlzIHP383cGUELm0jktX
         xryZeZ0KXR7YoBnEgEt5Kud0HpJRL1RhLOf2pSlDtufCZLQwckmovfQeNX2MA6xq1FjF
         xm1/JH0YR/6pLDWgVVavRFUAiNZNp0Ucmt/hJvsTTA75NKONORNmVfoUQjlnOy30Cbfb
         zyS/2FGf4IOLoFO0xqtTIDodcFVkk5KoLURVEmcrqI5VA3OwMPH5m5zPbDkPP4Z9S+sQ
         V0xlIsupVBinlr/lrWRKKTM0j7TRYraA5MrMr0PVvV/uLOcJuS3wZ5rkoyPVHLdxQ4Rv
         ciRQ==
X-Forwarded-Encrypted: i=1; AL+hErHKvbgwZGsXQSG/SfMihbo5Uug0qhNxLieuVAIKUcikayjxgize1NBZn4luFj4Xmed2IqqGVGJt1gup4TY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZmfHu8jxI66su26N+pv7uOBoR/HjtqWQFjICp0fg71jnqNzS7
	ajAD9YRA07PqgPHJGTCFxoH+NgcQJkZGZAwLrum2QZlk4Qwq83e3SIsj
X-Gm-Gg: AZFdTZep2N3k8AGuq9j05NByhmh2IDVuCkK9YcX5dBceyC1PlhYLgVoxYz92621lL9d
	THxXJJsfxbihiZlRuXo6sYx6hUrWGhmPzKRAd8N1Ab84lcD4axUkrhxWEtdx+1uU14xFAXH3lQm
	Ri82vz4PdsuTYaOPpzQBjLLLf6yZ+EzPn1yvrhh59JHKI4dBd4jVFolV1gbuYvqWHv+pnyA69nP
	hK/3rVPOiu9ZSgthCjDY0KBA0dO7wF84M+TgfaY2JZml528QZqMQ0Kb+empjJXA8B9fyq2EWKBl
	rmnvS67z0NAXvpr8/GiHuT7phZ4LA9B0OgXiBxS8gq0wZzyxhbk8g3uCXayjoT+GHVfk7Kf1NLy
	jJJUppQGTp3VsglGEWF1FDciu3NT2/xtflQrA16IZ/I/7/ti/V+Z8FIibQmKwb1egcGd2QgdliX
	05lUk8fuNb3weEWMVBoFReVJQ5dxIEVhfrGFkENRVQM6hRjysk8/XFPOnaClr0fIZLpXYccPboI
	GXFdDbzZ8I/G3FmAbLjC7yKHcRCnjr35fxTipB3FK8a9IQcGk4y4vOhh/4xkjg56xTf44hHKAbu
	kWxrFexrY3xOrLIXN3Qx7QsEUY64YbTDqLhlMaqpJ3kU7SpmfL+bRyfA2OAiaLI6LQqv5xEmpCp
	Wn3sDWAY87aV3W1hPy/DRbFlSdwbpvGNjpg==
X-Received: by 2002:a17:90b:4d10:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b41c852826mr3992020a91.9.1795203450819;
        Fri, 20 Nov 2026 11:37:30 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm8290165a91.16.2026.11.20.11.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:37:30 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 19:37:29 +0000
Message-Id: <DN0AIFQ82CFP.34SDTH6ZFZC1G@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <io-uring@vger.kernel.org>,
 <netdev@vger.kernel.org>
Cc: "Kees Cook" <kees@kernel.org>, "Andy Lutomirski" <luto@amacapital.net>,
 "Will Drewry" <wad@chromium.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Jens
 Axboe" <axboe@kernel.dk>
Subject: Re: [RFC PATCH 0/3] Introduce a classic BPF filter cache for
 seccomp
In-Reply-To: <cover.1795139109.git.xukuohai@huaweicloud.com>
References: <cover.1795139109.git.xukuohai@huaweicloud.com>
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

On Thu, Nov 19, 2026 at 10:48 PM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> The kernel repeatedly translates and JIT-compiles these same cBPF
> programs, wasting CPU cycles and slowing down bulk startup of
> identically sandboxed workloads. cBPF lacks dynamic instruction patching

There is no VM startup number in the series
which makes me question the whole thing.

> features like tail calls or tracing. Its JITed instructions remain
> immutable at runtime. This makes it possible to share the same cBPF
> filter between different processes.

Immutable is not enough. The image depends on the caps of the task
that loads the filter.
Also any task can time seccomp() and learn that somebody has this filter.
seccomp_get_filter() needs CAP_SYS_ADMIN for that today.

fork() shares the filter already, see copy_seccomp().
A launcher can install the common filter once and fork the VMs.

I don't think we need this.

pw-bot: cr
