Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641432;
	b=XPqGhRt1Oy0jVuFbsKRBRYxEnlyjyF1g9xrpgipOv+rZ376L6h9IEp5yHQWat4PcXVfg
	 DQLVTGOwGt5HolxV3bFYwirAu1oz+OVjEsFILm6X25v8f/g6LkSHIXfHDHgK6ohJ5jQPK
	 5ge6cLeLSt14re75N06dFFG+JMilnr/jGLMIQmFT1rtNrkiSoh23AGQY/39OfxyeqYYVF
	 QLP720YZ5iaHjLUkbh3PuR496ImIJbt/n2G+ZnN76DIlhRqorEYhFLK+lxc6X8sYZTe+s
	 V77n6MwxeMJPXHxuorXFRtOJcD5ZsgedsArQQX5gfkU3aRQ38wex4peFzsABJI0tjoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
	b=Z7F08lbtaawbU9WvviuFbVBAFbnMUmHYMRvfeAQWKZGtjPqFuDx44VVEIxLNzegdmdMv
	 cgn6ZjM4l6JXqOazyL5R7a5g60Gsp88tKDTJOXTPwgKTZWGoT36lO3PDVfHS9WcMYxCux
	 m05qXj9lLPxHTkCyaAEvkUzVDXkX8kcIM4zJ4kZSd7eYMhN0lyY+j9dy8mN0avX5r+Bul
	 2AWp+nhc8+umUXCLME4WT/gPpA87U53HIXQtEUt/a9ET4wmQRRpipMPhpKMFPGI2A1V+0
	 2/p4v7fT3t+OSUPtBRjr+EJND7dAaiaqBXJ6dSpO12QaxPMwNHew62z1De5K0G2wUKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="ikCqdo/J";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0147606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0147606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ikCqdo/J
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b4d07494b0so72957557b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795641430; cv=none;
        d=google.com; s=arc-20260327;
        b=LwhgC/cEtupA7UytC2h7XY0bG56dgE0xYQV+pgxiheH0PegFVh/K7kYQZgxhuoM3Ft
         Icfvmkcg4XKVZmAmioHCMXuTWBOSRy+nw84iJC/t8oL2CH7Jy8xACkMMSIUAZbPxe+/x
         5GHlD1tmYL1b5vi7LA5FcCE9N0+JtfjV8SI+pG+rSNNnGdduxfRtCqBFpJd7R8jAPQKo
         O1bDw6VL/K8IC5rahMwf51Med+ZAjVmMeT/koiI6uOXZr1brXPCId5/CPR+2fgAwj4Xt
         UrYFuLmJ1F0f0JWY4eNnylIRc3CAsT5WUPJlfRbDtp8+dw+Yfa8BMAcBhXSVBuzfxYPz
         Q78g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
        fh=aPKPIVdABbTwZ6qV/TOMc/OXiz74RgFVQyjG+omu398=;
        b=KskVqIA2TgJ5KDjXyPytzrmcRwMO/kK/MbUBWuAyvJ8Ttrom783nuX9dshBwpRLeg5
         Q/bn4HJHhQ4KGQCgiFDczGfmJCSbOhK8SLHGf5m5QGcyRGWHeXy+nV40Yz45GVbvsm6Z
         xmxZIvZHfpLVvrvHLjJDmP9WUrVt9VDkiDIlPfXI/Gs3R/qNQBjiv5OPVDK0zh1zcP8v
         b+JwF2h87CAGxfgSPEu4Xs3yzViiIsMLw5iZcHni3QqgRETxa/StKCRyKhvaiZ5aDwnj
         3AqyyXSiFUuZBdrxPna3dXysiGRHuWJi0L8jOjN699Cmj9c6RfxdhpX5FihMLzczwhFy
         4t1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795641430; x=1796246230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
        b=ikCqdo/Js06OZnjno0W+kIv1CiD0oR8ObGMHXOscIUzGqP28wgQViOHE7omuITw0BX
         0k6cs0KjS+RXzmw6xE3ijiInaPQr2YTNUkoruz+Xsr5SXXKxLYZsAHzv/bm/il9q5gD7
         hd+2fQw+XlkJZL1mT+6udr4PlowS0oxRoTFtBpOFHp5ZCTuFSxpI9tH1kYrhjWRUC+Op
         LsBmuYcllItowU4p2kLnw+34e7kDcgDwdlGhTL+r2AIPOoNm25DfC5QaHYR6/00Dke38
         oh3XTh0v2gEbor9gNFvPrq4rZGrpFqfZH+KDVveZM2Mj4dQB27ephNT789CrGGk0cooX
         LjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641430; x=1796246230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
        b=zc7MRObLhOnYjPFXuiqeHTBv8FbaJPKzNpo4HWt/KmcJbAZ96zL+6rIz0HmkDtvKvs
         lXuS8/1rWb/BPlGbpWu12GlZSth0eg1dRtCKxUJbLNgjIIuYUGL+t0tV45Sig7akEH5r
         UP0EozLtpK1FExoULyzVZt+co09oAp1ZS4kXP7St+wus8EYQNd/17OHvbrIP2FX0MQhB
         rbjRiLgYLyZmkAHECAyNabDstwmwWecl1ihGWNwcOSFkzM4AQM2UTVDx4ZZ6LJavSe9V
         CaOFGg23PmXyttz1PpEJszzuSmtwwRYQXSS/y9kU04siEFX1h0mKucirP0OLyb45ERJN
         tMpw==
X-Forwarded-Encrypted: i=1; AL+hErEtypwjDJpBIcM0Z8oU96WwMTVW2QvTvCXQij+tP4bLWxU21qD9S9ASyx49ZJJAwuuHJbVA9+q7pSeolKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OEkmEzeIdT3lr+Gf5Ax/SHABUFcaGuacLWK+wqPfoiYudvAN0
	FyAgfqtL444p3wmfF8bO5uFlWo7VRGbzc9eONbaj7ua8tCAjR7RGYVcHv+jw1jPZhC/c8TWuqbj
	J2PnjUpOunuITpnXbzPqhXX9CITB5oG9ZkzOO7YSwVw==
X-Gm-Gg: AZFdTZeMXo5XrpgSteyiqYjIl5W2RwdShYMrUnFrXLxf4NUop7Ky3/Oj6k/ZRR2YyFB
	2Z+lkeC06Oz1T2AMfxRT7NMWoDmYPnBBqE+aieKpMJMGpQtKcS6doTd+P02Zj31eyLb5LOBog75
	7UIP5TMPhYOn+tT5CLUjcaqmNHxhumvEFHZ/u9xSdKKLNMFxRrnCYizjbNPTo5Sz1TqWzURr3Lw
	UYtz/IGsuNjXKHPiHMcU/e16yfEPgFXUK1Lete4bB//wfjBCK8ABuT0bRcfmzNQJMPzGwwEnI/o
	2b+fgZK+T1jel5XfYeOqlnPitKnMAB3dgNUQcH6ABtt2L9SK77zj2wA0Ar7N5BVlil4e82LKVIo
	CVX0Qi8g4VDmQ3mCtazpWhzGdsiTPBrWkKtazno6NnDqBYyPqXZoyOguWd6meN7pBB3gU
X-Received: by 2002:a05:690c:6e8b:b0:8b4:c69d:17e3 with SMTP id
 00721157ae682-8b520501322mr76798817b3.32.1795641430719; Wed, 25 Nov 2026
 13:17:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-tcp-l3mdev-exempt-ports-v1-2-ccc2a3a6cd09@nexthop.ai> <179556272812.3135.6671930746959900620@kernel.org>
In-Reply-To: <179556272812.3135.6671930746959900620@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Wed, 25 Nov 2026 14:17:00 -0700
X-Gm-Features: Aa3M54qAjb6VOUA_FXJBwfwYAI4hdIT50Z_FnPsv-oL5ve_wAb0briVt4LVCUPY
Message-ID: <CAAv61uR_cfj-tcqjf2q1KYDVxENmwJmjfR0M08Jk65iiQaj2Mw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] selftests: net: add tcp_l3mdev_exempt_ports test
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 4:25=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 3
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] vrf_and_unbound_listeners() in
>   tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh waits for the=E2=
=80=A6
> - [Medium] selftests: net: missing VRF and l3mdev prerequisite checks in
>   setup()
> - [Low] The negative checks treat any non-zero exit from nettest as the
>   expected 'did not get the connection' result.
> - [Low] In unbound_listener()'s 'exempt, VRF conn to unbound listener
>   rejected' subtest (lines 117-125), the server is started in the=E2=80=
=A6
> - [Low] selftests: net: tcp_l3mdev_exempt_ports.sh bypasses lib.sh
>   helpers
>

Thanks. All of these are fixed in v2: the test waits for the listeners
with ss, skips when VRF is not supported, fails if setup fails, requires
a timeout from the listener that must not get the connection, and uses
ALL_TESTS and check_gen_prog.
