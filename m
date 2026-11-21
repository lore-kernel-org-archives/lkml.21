Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286103;
	b=IojN9gP/Ep0/zYVg0yxj5yoB56aRzNSZKDnJ+6x2RJzbHzxy+2THbZxXL8Okhx1uA0NO
	 lc8MsAHh68nsH85t4OEahoQ5+qCSZF5BB1wALg7KyDUnmUtu9e6ZXKC47zb+z9JG0GSKw
	 wiyZ74zUBajxQaT0+dIyGK2AZlE5zgRupDUnAYLl1StPomedoHCWHvgsProFATkijtjLe
	 RH/bbengEp5p5uqb2PPwi0jqcVW8JQh9OTPg7Zas1oRAjAZDmhMug1reS4ZT7Ljhku/XN
	 dihvMGDMcCvV6lLMDUWvolPD/prGtZ5wm42Fm+NRl89BOHEQFXmk9lwxkHpZZNjhaJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=4kKgSANEna6VIiJcypGE8a5TeyleL9ds1EVO6d2+m6c=;
	b=Xe6cxJ1bu7rIaRvG5lT3rBBI9kaTeVJLpAd/i+2kVihop6vX0J1mKPpwCQI82N47c/Rd
	 FzQG4L2kUQHi6LuRagoXPFRqQ4Jf4tEMnnv54Deiw1iwhiTy8WAneokVYdB6iqAZL2KZa
	 bcT49x23qrdPUbaqBbXI6fCW9/oNTDuXKkG8/xRVMxe5dkrAbaDTPGOhGhkJ33Egpxbdl
	 iEUfJ2f3LjgXwFEHR8L/t0mi74dkP/TsbELA6yzkDF6JQzYDbftbZ0vkUD+X1KDRRGY6S
	 LF2rhTBkm20iyhkxdKMOZC/0tGHDp3LUWcdoI6M9GElA8Dg0W+i726WGvuTNXu8LBDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a3zTH0VM;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA889606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA889606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a3zTH0VM
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b41e8c1ac0so2903746a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795286102; x=1795890902; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kKgSANEna6VIiJcypGE8a5TeyleL9ds1EVO6d2+m6c=;
        b=a3zTH0VMfDOtA3qASaPnyRTKrbn0QPoswlB+TwNBUhyHrMnQxSfUx6JcQY0XZK4GFv
         ddqpHhn/lT88Xod5yWmMdd0jBOfshGBd4bJ4tzLCmz4ocn+YIWEdPRuroOse/IE5dnLf
         9v00BNW7ERSQF3WDPV2odW8vWdDVHs4+bin6/Q65eue9tF+EYuIDfTYGYN4en7Ft7qEz
         vot/4Uoghuda1BQrflDK9a/770qtve9526opQe2mxjHfUoqCoiTDPH8yTroT1NFHhqDV
         9SDCNx2Uj9G7wMKvLOMjyOaMwvfec7qEh6/BWqkRX+6mLuKJpht3T2zTAgF+pI4L36/c
         RHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795286102; x=1795890902;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kKgSANEna6VIiJcypGE8a5TeyleL9ds1EVO6d2+m6c=;
        b=P2Rh84j22pAQWSPgBFH5KAqflukgDzBI6EmvxNkUwRnJlk9DSoGVahDdQ72Cr6OWvJ
         33SYF2rNQIEy0RELsReSGikodxkPK471AV+1pGMWHSYI8NxN7Xkx3naVdDosEJxr085R
         f3x+tlNZai7XTjHG4Fda0pt2941KGn8p3SJ7C4pWcByq2RuoV0SItHRHBJhfOed6WR4x
         Tzv0nK1s7obMnaxc/lD1Um8c67FXtRquSvgLslWxm/BBfx5RTjKNbt/8HPpBESYj8w5a
         2bTRDJsgUUzraD3KcSlaJpf0UKsDgyOhVZgRTwUpfyOJbBCi99vOhRbWrYebkTMkIYI8
         XlXg==
X-Forwarded-Encrypted: i=1; AL+hErES9kX+FmoLyFRQjq1DlWL+lurA7zcwzgitsK3gabzXOnLkbKtjaApdAli47Y7UC1QNobsLxT2BOPxuUQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TPcJI7c1MKdiXMDV/0UwSVBt2hXcI3QATC6i56j9J58ivEVyQ
	kvVoIWWxDK9Wl8FKz/bDSig5/kmdxHeWzioq5WMRY9UxLSZ/tD3g1sNPAz+xv5rb0SOJosWwh1Q
	++/w46A==
X-Received: from pjbrm1.prod.google.com ([2002:a17:90b:3ec1:b0:3aa:fb90:d203])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e70c:b0:3ac:9df3:6b07
 with SMTP id 98e67ed59e1d1-3b41c9234b2mr7049150a91.24.1795286101862; Sat, 21
 Nov 2026 10:35:01 -0800 (PST)
Date: Sat, 21 Nov 2026 18:35:01 +0000
In-Reply-To: <20261118-tcp-mtu-probing-doc-v1-v2-2-e795f20b8cfe@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe@gmail.com> <20261118-tcp-mtu-probing-doc-v1-v2-2-e795f20b8cfe@gmail.com>
Message-ID: <awHkTCbtUgkJoAW7@google.com>
Subject: Re: [PATCH net-next v2 2/2] selftests/net: packetdrill: test tcp_mtu_probe_floor
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: corbet@lwn.net, edumazet@kernel.org, davem@davemloft.net, kuba@kernel.org, 
	shuah@kernel.org, pabeni@redhat.com, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, horms@kernel.org, ncardwell@google.com, 
	skhan@linuxfoundation.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 18 Nov 2026 16:10:53 +0800, Yongjian Wang wrote:
> tcp_mtu_probe_floor has no selftest coverage.
> 
> Add a test where a full-sized segment keeps timing out without any ICMP
> feedback. After the first detection falls back to tcp_base_mss, check
> that each further retransmission timeout halves the MSS, and that the
> MSS stops at tcp_mtu_probe_floor.
> 
> Use tcp_retries1=1 and disable TLP, as in
> tcp_mtu_probing_blackhole_no_tlp_retries1_is_1.pkt, so that every
> retransmission comes from the RTO timer.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
