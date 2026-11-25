Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795601006;
	b=DvKQnNWtuIzPgw29z/mC7BfSGgo8vMlgM6B63nnEZFe013HpSTIaWtT9gz3mSuiSUX4U
	 79E30wAA0JK1tJkaFtzydWgtIgCZ0Cyi2QJ5yVrPlyCBuGn+UpD78DZEnwHIzsx4tydW7
	 MaxTGU0EF7wVFZJFsCVJr6ut90VnlexMwkkIqFZro+SSp2jymWGbT3oido/6/dbXhI0OV
	 SOVtVmiL6E58uUwdnliUVoWcUbwpADzwt7BPtu+cMaybbTi4VyzKDQ32720wPt+ASuce0
	 9ZvBZ0mNbsb+MI/SHVbd6xFCkThfQGKn+L0e/cI6Z7UDWt1kCNwLKODO4bh8LM4X4WA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4yqmOnJX29DOBy6vmcdiSt8m4vhrVknvos21mrTZvSw=;
	b=47JQaXnf1xOIwWRzS1JvY49LNonNilmk8ZqGqtEL/SvV/CBg1b652qjYZ2WUcjxGco8y
	 CEfr6rCFTyoVvMpiBA7vVnNbkn+Rz5pz5S1OcZeGPUn/hnN4feIBC51W8l9arxRlh2HUv
	 +elPOFRFEeVaFCKq+iKVGfzoiM+nUwhTdiyPCqWHmRBtcFndvYNUMjO8R8xdEg1F2mPsY
	 EXw/22jsInonkLiSnjfL0Gf/0b464ShX9qI+4mSieSgQ3hq5a3qOigJCsj9dAu/iTITbZ
	 1vK5hKJzPpmcTjOyVI6iknwAb/UgJMd4xxj/14AgriYvonLC5WEqVHTYAFjwJIwQ2GA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ay9+Ssce;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FD5606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24FD5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ay9+Ssce
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso5559075e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:03:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795601004; cv=none;
        d=google.com; s=arc-20260327;
        b=ljBKWZrJEGrzT6Iv0Fskf+V9izFo1V9Ud5SZAI3e98dbmn9AP7QoIjsj47lOJJtpyJ
         9BVsYq2xgoWv64lI6iHmN//yX5S4U/0cDPCaH8QHM5W0VgvthC4cw7h9G1kcwfvlstb1
         cK6EhkgkWmLHSODf0aNvSJx72zilJdIdbb4Qsu+UaKPD7FKZlhwrd8LrwTuBlkR6ulgJ
         ZHiA9sZT+K25xwDu6EfrvrJF9N0tuJK/aYB58KqT1KAlguYSXW+W8c0Dc3X5Jxwd6eYA
         zD4/ZuKurbeZOrHFL8zCInxmG66bhEir0V4g+KfwhEuOhx5H3XOCbsj0Qzqa9oN8hqpZ
         3niQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4yqmOnJX29DOBy6vmcdiSt8m4vhrVknvos21mrTZvSw=;
        fh=lAFFH6SqvW8ihX7KwKDEjr7Qvw+zHYVNE/mHKwgJfgc=;
        b=bomHuSi3FsNMwqT+TldoORflhrgC7OcYyukr2XKcmdy2nIMSKeZsVj3xhKqleTBD8+
         Nthnk57ykd3R+KKh8YZU6m8xpW4DPpzAU+76vBZU/IrWUwo6HBvLaLlj3WRlZsCtMx/+
         CY9ej3YD/K6dCLlmJjbiihqAOiScpwhWLR1xVKDTR5tEChBQOUc85iu4gm4utdRRKg10
         WnQstxZNRrx1STTsyI2z6qtoutrHWLdrBNe4/Ec12qSQJsp1poGQy3Yqq4wY9bad43ox
         HfHYQvWuS9haxoln6nWosP+vx4nE72oN9vWQM2dPyB3ZTSoS0vGm36u6bzZIVlzDrETW
         Ilxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795601004; x=1796205804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4yqmOnJX29DOBy6vmcdiSt8m4vhrVknvos21mrTZvSw=;
        b=ay9+SsceQ9jHRcRMslrgmqdSOnvnudmMflbs1Avejl0zkOGZBGKpQA0dM6CYQutGwW
         9u/N0BGvFt06XERIVFzmv4f8jyisegG59kaO0/P/YagT9iWpfEJl3Wf045T5K5BD0Wqj
         cN+C1EROJW8WQY6Cp0ymeeN5pYoJaLNeCZX51EE0u5xJn7ueHxNNF+nAIR0PU/I5JwVU
         NOfZiH71ylqVnQzKUTYh137Au31crg7ZjGvYhf3PprVQE1EgZuXk2WwnUJdmY1e5WSYH
         EfQWhIwdnuBi26YrBLsUTA0hislhvKWy11bUZD1WXBQXYCxf5Nww4/Mu0LX3sbnOistz
         FpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601004; x=1796205804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yqmOnJX29DOBy6vmcdiSt8m4vhrVknvos21mrTZvSw=;
        b=vDnz1Ov35yRHey+d7e4iKMlwu2Xg5plk09hz0zyL2vgtR2K51njNR3LwfzQfbNoRME
         VwGufoDLS8zkTiutNrShAxx6odQ/4yfr3sLo6SoiLmoY2aaov3rqDGSuu02LPB+3nZO8
         f69RchE+lN4q3+rx+jmmRJDv2nhosdg63Tk1n+dwse/WctXmE6bQQI0zvIaw07FLz0bY
         lVui24s+/uZx9z5ZpJnYai0WEyYAmLZuiQOM95DBarK+2Eev6TICBpIJ1Q2C6wxb3uHi
         N5GqXKVp7QOnt4DnUGf0e3wHohypt974EJJFa1iFbW9emu5oAdgTGdL69p/fBC1hLEgr
         na5w==
X-Forwarded-Encrypted: i=1; AL+hErH9onR1RlofpM545M/NLt+8mjwGcHTT7tMIqArPKQDkt1Jo9X+Oo5MfjPBI41qdd60goWODokOgRHHSwek=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Wj/WwuNDN+9+6yWZs3a/dloHscFlXEVtNwHFxhs84s9awcjrv
	ShQYolvpTF/aS/xG1XRY6M89XYk0fhYYLZTuqI6s7+cqS4o6BRYJHJ32rz+vOZf0kbPXaJEMp/j
	nfWCEeikmIJoA2rsKJQr0VvjlRqWbY9ACmmv4dik=
X-Gm-Gg: AZFdTZcmqxfWdwn/GzVtBXdmwJmJor8gMLdTpQgfOcgmpSxazFwcwcRYeU5Ue9myPJL
	GTCdG4lUfmlHyqhjIS/d0SUaQbQWAXSQjeKMAw/ilVbL/KLx9c2UTVBFeJPWuHJekJVWgLFqtj8
	sWpE+nar6u7Cl0srPAxpI85kFXZA1L4+VR1Wyv48VJwV+Snu64MLLPM+lqzbnDd3Ux70xLI/FwR
	e35Wmv7v0OTZ64ZoM9QOfDotlSkEWBLBcDAUlPpGCuP7E63D6KivWaj+Ha8lg/B6nQ5iZ0ozjff
	ZBmGuIpXsO5xc4lL5KtB+OZImxTpScs37iENkbrAxqMpLhJx6DYkUDkdYWIURtQKbaURiGv2s7m
	QPhZLck81OhimJUBKpbcQp+LDMGQWYDu0kT/Bng==
X-Received: by 2002:a05:6512:3e26:b0:5bf:dfb9:33db with SMTP id
 2adb3069b0e04-5c1bc894b28mr5679079e87.38.1795601004108; Wed, 25 Nov 2026
 02:03:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124230228.3868519-1-graypanda.inzag@gmail.com> <DN3TX43KWXO5.JWLJ9HO1C9K7@gmail.com>
In-Reply-To: <DN3TX43KWXO5.JWLJ9HO1C9K7@gmail.com>
From: Junyoung Jang <graypanda.inzag@gmail.com>
Date: Wed, 25 Nov 2026 19:03:12 +0900
X-Gm-Features: Aa3M54r5upvGV8Qfv_TsLuVCjrNe6583K5J-EQlsL_l6e_r1ayLjtruktTOLARY
Message-ID: <CAO7ntTSjpH337UucxpxSCTXud3yYi0MqfRELHFcER_enhu9fAg@mail.gmail.com>
Subject: Re: [PATCH net] tcp: avoid NULL skb dereference in zerocopy receive
 with sockmap
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review and for pointing out the other paths affected
by a stale copied_seq.

I agree that this should be fixed on the sockmap side. I will look into
e5c6de5fa025 later today and prepare a v2. In the meantime, if the
sockmap maintainers have a preferred approach in mind, please let me
know.

On Wed, Nov 25, 2026 at 8:28=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Nov 24, 2026 at 03:02 PM Junyoung Jang <graypanda.inzag@gmail.com=
> wrote:
> > Check tcp_recv_skb() before using its result in both paths. Also stop
> > before advancing beyond the last skb in sk_receive_queue. Neither
> > check consumes data in the sockmap ingress queue.
>
> This should be fixed on bpf side. Other readers trust copied_seq too:
>
>   reader                             with stale copied_seq
>   ---------------------------------  ----------------------------
>   tcp_recvmsg_locked()               WARN "TCP recvmsg seq # bug"
>   tcp_read_sock()                    frees new skbs
>   tcp_collapse()                     BUG_ON(offset < 0)
>   tls_strp_load_anchor_with_queue()  WARN_ON_ONCE(!first)
>
>
> pw-bot: cr
