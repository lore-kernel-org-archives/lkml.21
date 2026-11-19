Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126693;
	b=38hNFjnjg7kdTQj9cc5S2xfCDoAm6iNem+nT1S46rkNd+VAxm5/SPrlGSYWCykCCwKzx
	 75FFAL9Po8CnGa9Gfx/qv3v+JqHQh3mhg5MIwppzjnz/oyd5VPWhCtjOnvzhfm/tjK0gj
	 SD07EfJYBm4g7/nzHYxDTHY40MBILMZonTpf2akaCAAp8T/3jWIB0I6P5dHqgOMMr2B04
	 U8fEcoEcet/e6K2uSMweP//BUebyxKV29sMeaeE6JEdIj5MlzFQKhLkcsEYO/VYNfJk+e
	 uPvhIyLRbRdFf9grL0OfkB2i4pJqdzn01TUUUbu6TmNmkq21fdjx2Cf6uJLGqwPgOJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gA/aemZzQ9sPBTs414mU1ORatQGaaPpP3nEzIpSAJk4=;
	b=MnM+meOAlNUj42+OuEBy/VwWeMxQr9dR+2Hpl0h6Xm2GuZVp/J8+I5TqUeBNA74bAW2Y
	 nbGWvqzJBrulhmudjia9IZagIAOQ8fEzUWydc1V4pH8BGI6mEA5kUvaGNFAIKtZEaGIIE
	 uHxGytZBd4ojJxTL89wnhbDJXm2M5HX4eowL7JMTycUaz2Nj3644iQ7RegpwsuqFQrNm9
	 5v8XmDU5zSwLvW/05xuzOhXwnXjz2aW1jUOEKjyRHQNB4LWG29mBLxQE5ZFF09Bk5drNa
	 11TVhEfZUg+5R55Ee3YOUiC5LZQE400LvU9skPJ1du7edl25okop2GgSgATf+HQx+LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ZldscqM+;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19088606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19088606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ZldscqM+
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4cdc606b47so54153966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795126690; x=1795731490; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gA/aemZzQ9sPBTs414mU1ORatQGaaPpP3nEzIpSAJk4=;
        b=ZldscqM+w6KlyLRO82OGvVKpcNkMDSlzQnlKm1Jy7mLtXSui+gU2v6CYgiVnnKXTdn
         9fzbQjkCRQyAbCXyKCWlAVC5b4UoUNY01GgGaQatwW0espx4lbEMhEWhqL1PnAv0TRlJ
         yWN4IxNrJApTOAM6TRrnJ4nhKUWJhJH42cXCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795126690; x=1795731490;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gA/aemZzQ9sPBTs414mU1ORatQGaaPpP3nEzIpSAJk4=;
        b=b60jtKanN2qHIjcPI1iQyJ2WqIdTJDdJzWtloH7Iut69aLIkGCzlNzmV7id+inE/k4
         KMJvu93+w9Q0LWBBLgjXGuO4/iMuN5i0SRfMyPJI+gBFt//7ChTeo396lrhVpthhaJA/
         0hyE/VLg3CKVAsrHMADaD6xoUDW21A/6HcjB22tXs0rxGWG5dZ8JTLcdH2JZMXUKoRp8
         TowTPl1jXVi1N5CRL56g8tieYfiBsKYxb309O8cf3Zotn4HWVdFMU3qHa5pagUevoCGA
         GgCtrXWnFiM1NdxpDgsuMt6nwY6JNO0On0XOF6/5uKCsO+8CCyyFqW2Ch1X4Mfrs/R5+
         7FIA==
X-Forwarded-Encrypted: i=1; AL+hErEefVm8AfHECeIcsjSedZZb96uJk52uoxyLpLIMOH27s32Xdff+QyILiU2hIfGAyH+mPra0q/6Ev16FpWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vt/BEtZBrpBH5Xe5j5Vw4OTlpKerfBmAKnXw9vjI+dKws6MwZ
	LcMUQ2AZN4Zt6uLRY9atdn3Ryvw1MhewpXb4YO538ZY5rBviL6BeFsXbkWPnN7AcQTpMGI16PFl
	KvjVOfOE=
X-Gm-Gg: AZFdTZfmZH/83Zz38I4JVpsdI1r7EgE1nMwLbl0vC2mhAmYCFco0SP/eGkJoCnOOG5k
	xLl1Z3EiavE/Wv3oRWgm4EzzmGu+yN0DD8mCj2VWkVMlsLmR2YRxvDSlMzlJmHuJF1PwSpmkgk8
	VMWiWDhhZ2nquis73aqqjDSuYo9ZEMBBVH/a/+v06jemct02HitnAV1m/Nt1UWuWM+rMOXQKkk8
	51wGQjmemw/jBjbnSgXVjzBD3dwdAWwGSOfqYlJUnPq9uSigKNImZKIlkwPzFA+jVDmWpwOaAs0
	qglldzcHeiZQ/4xOXblYUqdJKiZKqXWdGEV28CwvETBoePh8ZCYNJOID8Zk0ndUVxp9ggqaw5Wl
	tkE0mq0p8nlC1HBLDaU67W6B9GJ8EWvhv04yaNM1EJThR/CmuxOUYjSuLCQYDh9lFUXysLHeI4b
	dY7LXwjfZu6EcMHXESbhOlWMhgTbyDCqNA2mNJTAEXfvUkI/Mp3+lXzXCLJplDee0B9a95KL5pt
	8BEZtOP+2UpXYvFdjpeVpvnRwhYIZ60amC9xWU2yKU8a42ajLoomWMylWObRL1r1M+FgDc8ZpF5
	BQjVXwAJ0r1hQY2GnMQ0SZuabXVgIXWorDDOsz9Gh/iZpC+gQ1bYG39QRnOhpMLVHZ8/xWMABc3
	66Os=
X-Received: by 2002:a17:906:4fc7:b0:c51:37ec:380f with SMTP id a640c23a62f3a-c513a1df6e5mr141343666b.0.1795126690317;
        Thu, 19 Nov 2026 14:18:10 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aebe94fsm36941066b.49.2026.11.19.14.18.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 14:18:09 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c5127c7abd5so44957966b.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:18:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHAqGGLK8BRY8goUjw4VMX2d6JnGayppoIaNP2/dDsnrQws97Nb/x+E3615X0jh3Nf6N1m3s6lz+DGRWc8=@vger.kernel.org
X-Received: by 2002:a17:906:fa82:b0:c50:4b6e:329 with SMTP id
 a640c23a62f3a-c513a5eaea2mr95509666b.15.1795126689675; Thu, 19 Nov 2026
 14:18:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <d583b944b32f1a6f9bb27005d628ba9a@paul-moore.com>
In-Reply-To: <d583b944b32f1a6f9bb27005d628ba9a@paul-moore.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Nov 2026 14:17:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjUjMpcaOikkbk-p9ohKdOO0yWX5KW7LGUJmGZcKu-gug@mail.gmail.com>
X-Gm-Features: Aa3M54o9ZC0IsT5wgB2P0cNNI_yXbdHzih86Soy1GWfvNitkqUbm-kcgwt__74U
Message-ID: <CAHk-=wjUjMpcaOikkbk-p9ohKdOO0yWX5KW7LGUJmGZcKu-gug@mail.gmail.com>
Subject: Re: [GIT PULL] selinux/selinux-pr-20261119
To: Paul Moore <paul@paul-moore.com>
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 at 13:22, Paul Moore <paul@paul-moore.com> wrote:
>
> A single SELinux fix for Linux v7.4 to fix a problem where we were not
> properly handling MAP_SHARED_VALIDATE.  Please merge for the next v7.4-rcX
> release.

Bah. Horrendous, We should probably never have passed in the raw
flags, and instead passed in the flags we actually use and have
already generated (ie 'vma_flags'). There the test is just

        if (vma_flags & (VM_SHARED | VM_MAYSHARE))

because we have already decoded the odd system call arguments.

Oh well. Pulled.

              Linus
