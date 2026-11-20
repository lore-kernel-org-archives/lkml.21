Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210439;
	b=w9wN/B4fBUDyQR+5tqpTzgzPK2X8RByc/B59arlz6xCqfT+S6EErFXjcYDDwMjWnskRI
	 VgfLZ30dvUQZ0YjcLUfF4t6/oaLmKLcrG7ig7dWkSePT8eKAhqis3UAR+rFCM+gG9GGc/
	 O06ZOTE8cglW4Q7/GiFVuk2LkvnQmuljfIIfpbpVeWdlyNWMJ5+qOPiNc+SNlO3EKeEhH
	 PVAUMGgfoGXKixTg9wvWb1cAHIkbXRlfPfuqDkiswJepSAD4DWvUF4av0XDkCVleJw7Bx
	 8hVoYjyLMvCxCwrojG663JMIoSlYLQXeLPhI2RB14QIfNfgbPcYKp5m0zCXZRsU3Veg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1djv/Cl6L7baYP2BjEGAGN5zEhkHq4i1i3oynSbuzoc=;
	b=SVfuh7WUddvRGapv5ijD93rt/EapTe4ne43SM4RrVtBSlZ6J9AdRIjSB3cJx6UGDPJQY
	 gJJzHNWhxUjYss3US4LU3bIhxYV6kz/uljYddgj116GNHQl14VHJ4iJfvGQqnL3RkLah9
	 4h73M6lORq5c3hZJzopg8HQOsVwJEk9mBDuBdIlIXyCzTWX4I6WzqIXEZy+3G1j5gwUA0
	 CQq2kYbhw8z7WhctCf6alckrQfz9slqtvQePfqF5tFAlQkhMvTdtsxCUmR0hA+fNcrloS
	 yj6pZCJMMo34KvkoQR/D3FirOCi8D8+nhSiocZ6QI1Ha21J9vIPA5PDbqoXXqslKarA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUB+PJgB;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A142E606A6A3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A142E606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUB+PJgB
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49083b985d2so98840f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210437; x=1795815237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1djv/Cl6L7baYP2BjEGAGN5zEhkHq4i1i3oynSbuzoc=;
        b=gUB+PJgBk5EWk8aijV5j/yAhsI2yNEPiSKzIncNEtmM8AuULD6wSLdCxWTZluOzYFW
         uMFO4LFK9m4DGsLfrlAV1N9MtucGgmQaD4xDooVpWWCh6GZyjLdspa9ffjXHaGRYRlCe
         pyPzFeLQ28QT8ViL7ugWtlHkjrurLJTH4gZRCHMx1NUJfV+YjHkPgcn9wNVvD5sRJ2Hu
         SPjIU1SJ8gT8z3ofkYvh7UNm+0ziT7trdpgkXfPVt3IVr2UTuLY/nrHEgvnyhRnN570w
         GReUoSeziXHP+Q+MEcQjBCFdNhxryBtaUFnFs/V4G4besK5wwbPodpKZw5KrEyt7FJYP
         7mGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210437; x=1795815237;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1djv/Cl6L7baYP2BjEGAGN5zEhkHq4i1i3oynSbuzoc=;
        b=FnLGsmYlPa5hvNo0j2IsCipQoU/Itsbbt+ACIrZbIiETl4MlexVXQq/9vslRWswn/x
         dGfxadWxE+Id4ptNP48Hf09ULZW/Fw0+dPjw0R0+6CQIGZOcxgnz+pXbzGn6HOejQFuh
         huDJB2opag5Qh66VB7RtqEaKubRc6590P5H+5L2aO5bldxa6gGBEPG9y2fdifd73Ff5H
         d5ENAtTEFqPYUUbgcGqBAC8rYrzpBnuQc4e0r05KH0dFQbv62DMGhtZD948yaQ70q2qJ
         cyWDv+9bq5xbgE8/btuBqFAlDcBli+uFAdXQoUJiR4A9lZ2hR1lGwUXz93z93fa6qlRu
         tq1A==
X-Forwarded-Encrypted: i=1; AL+hErEwvRlpsTfiy+lxr2seVwgFeHJSFhoShz1jgOLdkIl4QM1ZCB8O7ogNEgNk/hLkOePDIYhGxuOsXWo91KI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zbaEVUimDcOmI2PZGTZCAim1bZq7nyBOXeCp5oXA6E+tj3ArC
	CiDkrUP1K/sVtMd6qxm/ShW9LMBawCEvVRk0kc0lYYvuJFz3ATGjiIiR
X-Gm-Gg: AYBFou0WJ1EedLIkSJWqd+g56fxzin6diX/p19H0rwXD6I/mm3iDEVniTbYpScKmw2D
	wn7lbhCMl9GrLPQGhTlGVJ8KIkvaitv4VlQzwQT+JDu7SKMWmfWFUOUmcqnYeZM+q4Y8oJ0dApm
	w3ebwwYOc2EtQL9+FfbmLaYTYtORg53gBbDMMsG+p5lYOqXw7QxXDuQuiQBXRHRi33+aDomSRNC
	0w3/zOQKqbd1zSPlFgGy1flE2PxkfX0D9fGzkm+zUr35d5mqNG1UUWZm29zBIN7B2BBeF/5jNNq
	P/xW/EES6iu1qbjGv1GstA5OW62WVYuxVYZ3G+TFa5iqRziCFeV8DNFo5lxEogKTt2PL6s6UKFi
	RkIm/bSkS2fkbLhK9RZKmc+hb2WrjqTZb8owykOXnOYg5TOhWVJdMGfi+pMNXYjKgRxMA0+2ZAZ
	a9MpfgY6FTS6ypVY9LgrhpClky2wPmlvVi9ZOh65YQrMQe8ko/DuRs0w5GCM26QWau2ttm1xGX+
	FcgTxlfKnGIZTHGI/j1fYMbBA//i0rrEuAnYHXHtNdrIOWgLFyWD3pHoesloDv6Lmsxs/0guUvb
	7+LBQP87cEsdeafocmdQwbgxsWcQeOgEvG3UE+5E5ACxLlnMpVm/XqBj8OzD3PmUXe7NykuZibQ
	944xKJ5Yti+H4jM79deaCnDx8fMbenVkfLCQ/+m2JUj3qKcZDqOwgIHdKVaNwN/hQrPCGKCYKe4
	tE10re2AS+EmSezNb0R7YVPXi12y+FW4kqe+qprCx9dhY9ykE=
X-Received: by 2002:a05:600c:8210:b0:4bb:7ad8:99f2 with SMTP id 5b1f17b1804b1-4bb88785da4mr97653945e9.0.1795210436926;
        Fri, 20 Nov 2026 13:33:56 -0800 (PST)
Received: from ?IPV6:2a02:3100:65ed:8fc:216e:bbeb:a7f9:ea1d? (dynamic-2a02-3100-65ed-08fc-216e-bbeb-a7f9-ea1d.310.pool.telefonica.de. [2a02:3100:65ed:8fc:216e:bbeb:a7f9:ea1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm116032335e9.5.2026.11.20.13.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 13:33:56 -0800 (PST)
Message-ID: <b4307a19-acaf-4fb6-ba3f-91f029cb30f0@gmail.com>
Date: Fri, 20 Nov 2026 22:33:55 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v10 4/4] selftests: net: hsr: verify GRO policy and
 ordered forwarding
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 bigeasy@linutronix.de, xiaoliang.yang_1@nxp.com, skhawaja@google.com,
 liuhangbin@gmail.com, stable@vger.kernel.org, sdf.kernel@gmail.com,
 lukma@denx.de, fmancera@suse.de, danishanwar@ti.com
References: <20261117141922.20-5-xiexinet@gmail.com>
 <179514132547.3136.13495496804508264681@kernel.org>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <179514132547.3136.13495496804508264681@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/11/2026 03:22, netdev-bot+sashiko@kernel.org wrote:
> Can the single-producer ordered cases fail on a correct kernel because
> this sender is not pinned to a CPU?

The single-producer cases send from the unpinned main thread, so with
threaded backlogs a migration during the loop could deliver the frames
that enter through veth out of order. That would be a spurious failure
of the test on such a kernel; the forwarding code is not involved. No
change to the series for this.

-- 
Xin
