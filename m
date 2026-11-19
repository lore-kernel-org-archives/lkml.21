Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795090429;
	b=lA6sZ80cbHW05IPhccr4ft3l95r1qgL76HDdtF2DIjG5Dw1XtQV5jwjjRecX9VLNaErW
	 AHkz9gRjPBJ22z6xWaX1rcomvQwGhz9mIKwQhJ+LI8wKB5p7denotenc6EgXrM18Fih0L
	 o+wv+cdOseF9S475VaL7hhdeKhC+f8bNq2zEtHSVhSiIAVMvKwmkiY0LCZrOjPY1kgsPc
	 tEehz49JqN0p2dWqDlZabTgkCukGOt6iJLOZrZvQI90MIOCMhfzAR4DcHmeFDEb3BhCzZ
	 v+mj8EnAsrvIQVygR/QlvhxrEXXE5BTlZUhi4vJFlKTTd6BoVpbuUOsV30ApmdzAc3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JbT2l0hVPosruCtl/bxiI9ZT4pAz+/Pr6yTWwpIv1+Q=;
	b=45uVYb7YruYaXf0Ivasyd2x2ueXp132Knj9dOuBUjO6E9vaKnZo3VpOcDVzWGBv8mRFq
	 FIRYpIAYopeccVRywoMkpkwYqkyJgk+Eup46ID15ePuAe1uMS1GB0sdblBW0z7a2EIav0
	 KXCvMlX6bOdVrdrdO/b8TTI7Wg1Bi8p8Lhwr6xnWImPinX3G+f2eARECPGkPJczpSHynt
	 Ta7RpJlLmYIB3kbutc41gHXKPmJy+TQYnpd6K5E7WdRxk7tiniZsABBsrR3M/Kv+vJnbQ
	 VT0TfAYdmaAfl+2PBNlfmpDsY6qqs2GgvdRVShnTXIBw5yHV1YsxaectPS2rCK/Hp5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=inLLQQN6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F26606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F26606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=inLLQQN6
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b083afebe4so282679a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:13:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795090428; cv=none;
        d=google.com; s=arc-20260327;
        b=Xqr1RNJ7X+0ZqqWYs2qg+ck15yvJyFVnI2EQqMlsC1C6IhZC9BgrT8MWMt9LxknpHE
         5rWf6oKg1C/RU0GvAyGLcDyt4fz/8hSAg7pzeXULA+HdImTnDy43TN79XJ/sBFfQ8IFV
         Esqa0/EQTa8MLD3pDyjH6JO+Qz/R9uINWyooRqfGCx15NjfZHCYh/7eLTyCHlf5k/xbw
         o05E6lCktuUdHudiOQvO6IDOJ2mpv+DVr22dH0pUpLr8jKlyrgO/vPXK1blvU/YUKPTF
         ykDEuQCLnNvXLWcqErxjuYEjEQQ3txPNq57V3RrhuwWcVf7S9bx+Zn0h36LpnT/bnAdB
         eEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JbT2l0hVPosruCtl/bxiI9ZT4pAz+/Pr6yTWwpIv1+Q=;
        fh=dCaMcLJnH5xbXtYT2+XUbnJnH/qgowOQxsZklhNkgkU=;
        b=KTLL24bVsiwMn6si9tvY8Bg0hv3GCxQlGjlyEUHMmo5uHSaJZRLjj6HPYaC4GLyf6B
         xKrh+N0kpbxqDtL6fWnmaP37V7VVQqZneRldg+XW2N3HBcruHmFktyRM54ze2fUNdpp2
         0gATdK0B+lMvvkFD38W5ZQFEko7megyp2HBjQW2t1AMxW9MjVCSOuI3zjHE6knGMeOsu
         Lcu3bUbsfAKvyAi3sAs/ICpXGABFJ0tUE8WVCDTshpMaPxQL6Q0HJGRKhn4K4zBjeCiL
         q/8TEHgUQX78N/o1Uo/GZnYPyCJ0VaPwgHXeaNAzoEoDvjPINOgvbA7uMmtxbl3g5cqY
         AC5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1795090428; x=1795695228; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbT2l0hVPosruCtl/bxiI9ZT4pAz+/Pr6yTWwpIv1+Q=;
        b=inLLQQN6+oyuRpEFmArfNCzpH2ozMRZGx89k/DACqwt11IvxS2uk9OtFmBLo4Vhr4J
         V04tDyjCtChQCMDg+Z0yurrLdLqxBvdkqoQ4yirXWIDrydA7i5COBE+0solb87kLt7dQ
         BamkEF9vbM8R8qAwhkfuZZHMK4QC397FjZQQNAjNa0eDoqfTF1Ax7RC8Fp6GjNu4oSx7
         1mc8awM26ZHak6n8f0rMVtyqMPKhGdWnJypjWZJXKS5VQd17VjONQ0CQfcoxeddyjYmf
         boLx2SRKNBMM/GjEMeYOtSlqhrOcgCl4AV4k7HzYNmibRCx9/H+XYfT1eASGaNsK57GH
         BwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090428; x=1795695228;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JbT2l0hVPosruCtl/bxiI9ZT4pAz+/Pr6yTWwpIv1+Q=;
        b=dFXV9mqcenYQcVsOFqoGh47iBfee/6OaKQCmDinttP9NPCOTzvzNN1+oVcB5sJ41z1
         oRzGKPUZA+w9uM6pDMheOSS2aDJdvQ+X17Pqo2urcJZW4ZYP9PvYOi/TqX6kazm4bW96
         jnSlPPKviPFX2412NnJBrJXhvBGF+omv7Lszoq7cDo3pS7SilXi6xo9qjolNEmEWz93F
         OzwHWV01DwnCEUaiCVhGu39pcskP+7GFS2qycm6o6Nx7J8vE9YfDgqwoZ9NNqSjAzJpG
         KlpGDd+VQlezFljA1QaMoGlN95nvneGgm4H1lwOlodMUL5LAWIBeJkvCAoVJh5CAuv26
         Kj2w==
X-Forwarded-Encrypted: i=1; AL+hErEuMEBpjVPFB6UYdrJ804A511VOSKptMJ90KVAK88tTWtSSGBsOMuXgS0fs897jDW53QspFRhm4oN4al1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z93nCQyfWSV0lGdWsp3UNSqHMKuDY29iiVfzBAz0MGFJ6/MDu13
	QGOL1c+1uxw7ltYeBOt9r/cgUK0hmPqMwSYelnv+qtgKvcG9uQf6N2LcIt2eYL5YYtOg4ZISRx1
	+lfpQvGDrB/C35KFHShBYH5L6f4BPj1XnANsVv9Y2JA==
X-Gm-Gg: AZFdTZcM9BKMoEMAdjGkYqN7BriBSWgTv3UPmEFUZeGBeZACIS4QwfvNbC+qAQXO45z
	VUsH/p/uHcW+mFQAA7ykY+Ree3u/x+5CRWkCIXrTbpNkcB+GBiubENMwHFktTgAy1tLe24rVlTx
	m1l0oaqUPQ5UHz5jc20ljdNQVtiQpLUGXUY/52ViFbjImfI+nCQATUcUbqWDj2Ix67lTdQzkVrh
	wkRgPHDA+WdT2uS2q0mqm1GUzKRJyhduopScfhRT/68Bz6nmW+plj/UbMZG5aasf4VuJT1c775C
	TWYNP3B77WmppzdTOxCxaBdH7L16wWymmQa4s8ZGzX2kovG3uD5Y647fqevW8ObPc3tlVvSrdS4
	wRBUGC17uvQeYdNjOxCjViuXuhKcf0/tmGA==
X-Received: by 2002:a17:90b:4a84:b0:3b3:c107:8458 with SMTP id
 98e67ed59e1d1-3b3d07d54b3mr9810306a91.5.1795090428106; Thu, 19 Nov 2026
 04:13:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com>
 <20261117-bpf-preempt-v2-r2-v3-4-586376ec3672@sentinelone.com> <e3ed9b2d-7778-481b-ba85-2ac3ac5de877@linux.dev>
In-Reply-To: <e3ed9b2d-7778-481b-ba85-2ac3ac5de877@linux.dev>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Thu, 19 Nov 2026 14:13:50 +0200
X-Gm-Features: AclHuK-Tue_GiMxMNcBIIEZsjERmHRrqNIXs1mIZQ207vV9T_xJnd-gwW1o_iI4
Message-ID: <CAPnbwjq7TDed+f6dTDfQcdLSZtV=AwDiLVpBK2t7ke6vpngSpw@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH bpf-next v3 4/4] selftests/bpf: Add
 preemption recursion test for tracing programs
To: "JP Kobryn (CrowdStrike)" <jp.kobryn@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +   return is_jit_enabled();
>
> Any better precedent for checking this?

I found none. Unfortunately user space can't ask the kernel for it.

> > +   { "fentry_s_percpu",    "on_fentry_s",          PERCPU_MAP,     B_DROPPED },
>
> Is it worth covering fexit, fmod_ret?

They enter through the same __bpf_prog_enter_recur() as fentry, but it
is two rows each, so adding them is minor.
