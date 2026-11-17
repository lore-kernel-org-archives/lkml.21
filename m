Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953878;
	b=yjFU55sdHXu6rRthk/5x3NRub3MmGenUTSTpFrnfgVNn70P+usMTHzweUju/cQQhbfRQ
	 B6JI1I0qMna3cMLS+mTTBt5uN2u3PR4KrBvvc7Yhn7z3jsNtRTCVgBrNwAmO7BTPKfA8D
	 HxskHgYcGezJRTaGhXN2MMlomTcJoy8inZbWqDPPRzIotWbL2wvBwiAYkawkzfzqyeAhT
	 jjrMj2YqgPQZUyA27eUE3BRHiLyj1AHjaEdT+VvIRcaKdP0qw7u0bDHZhlc7kGvVj25JS
	 ezr0SGoMo8nl5w2TtEmjThjw6csfVUYBFiQN3J9eR6uKKarjBTheGge5VQxYYjXjVyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=IjjsahCYIJUHZbHsxd03sCHundy4Xa36e/V5rB3U47I=;
	b=yS0ZfnIrq6yRfwNFnoX8UuZdfis5Ybm/RqY34cyyB8ONd92pRgwWlHfAYWcDkRlUCw+I
	 ADlm73+DAwKzfEv8sjP3OMEeoUjgAL1jwDEUCLEAhCJKJiNmsoeUjEVi+OjVvwHYll2dq
	 kiakO7gVL27dd45C7I5D2wEaqbrX9Hq83i6NdWrJxpabIiMqZ7rhEHdmowq00w2W2LEif
	 5Ix7gZ5cjH12BvjrHKotfl9co+DPWru+ZPKxYsXUFvAfevUcHG2QJ2y7UbU35XMk/iiDE
	 I/wTG8vMC6un3Z6Z2meLkGtI4j5DDFeWm1Bdi0qjuL26WBwDcO2jv9+KuGC5MZRQUJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=vAydZqIF;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C04606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C04606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=vAydZqIF
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36dbde64409so731082eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794953877; x=1795558677; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IjjsahCYIJUHZbHsxd03sCHundy4Xa36e/V5rB3U47I=;
        b=vAydZqIFP/9rlDRfkh7lLpdcKlXJwK4WQj7ppIcnljq6+mFmRKvyCgleijxuGji2yA
         Rt/up5m4ZjEM9kq4DunuqjOBuhYfWfGNQe4zXdst99NlYP9sOB2qfNFtshRwgldZeles
         q4Ic+Gdrj8IjiyAEaBxFVaVRzJuKTgMZdiXuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953877; x=1795558677;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjjsahCYIJUHZbHsxd03sCHundy4Xa36e/V5rB3U47I=;
        b=NwhMhokDZrZO9F9PAv8pTw995gcdl2uWwQJ7kWEvh/HnsTqld9vw5aIt7osgBUGRD2
         tpmEJBZlRF4E6aA4YFelS6Ys5YhR4hVmShN8IEVQp+UH1PncXJ6sSnSYnrowMG8iYtAa
         PwllPJyMDAYVnY0X4i6e9RhIbABsAnDnSmTh9M9y+p3b8sTmy8Y88fmN33IsZstZHV/y
         oMXl1nNkBvNtkDVswZf74Jo+hTXoHxP+laOP5t/XrGC8Hcsj556TX1+pSshRwEV/uUlO
         dFQpVC8OPKd1+wJhRJ61IEpX/IEkac59t6PqiJy3Svdj4eX9oXNbJOUS0XsHZjIeVEkW
         Cs1Q==
X-Forwarded-Encrypted: i=1; AL+hErF4UUSOY3AuGQTiV+a8QfT+vSnrB9KXsq5+KP2Bu8pHsWxCfE78RXHe9QrOrheYxSotO/ii9e0jjk62hIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Lu2u6htARJzbEL4obC++MAYrCqsHJ1vQMjD8bNEntRdeSav+6
	0vy8naJ6xGzqFqXFbnDvJjMW90iEX6th/d98sJlWiQ8+iT4iEsBu4YTnRYTy6t7E/kY=
X-Gm-Gg: AZFdTZe9oeloSMIGoSWJ+6HSeL4zrVkWiTe8M0uDJqmW5CBd7cD6L2j2aMtWP7oSvZW
	P6vUCvHOCNTwcyz8t43DkZXxmayjoRHH3kuBcxyk9MxcFa5Qmq8jKV/hYezcltB3l1009++D/+2
	iGa8952kCmQyfuiqCvKU2fPCr+lxXOdxD3jToMl54GpAAZzckAWDO1nkDbSNLX2O35MvwcuSSxE
	xw8Yhhw1YSqcEYfHaNzsG7hnU4G5yBf4lVksEAQM0bLQoeC/7ocvwrhvaQpgVDwUjSVh4QIubc9
	PCrSFHDkUHFr/SElcCW06B6q3DW9ncMtuxlxqALTO7QqB7bkmz5YvqywqjoN4xJH39mnMqoCGru
	Wuyh5Vz5+O54HvjCBNa2dLq+hbXA0A8vmWErCtBqDp7jcqIHnpa19UiSRLKoHbWJXHz0kBO6sIf
	z/Y9iTPknA6wqqJc8cQ2LHN19HuV2CMbXNIsqJyQnCcr+UlO0Jdh3kaS2mpudp23Ql2QaxZS2IF
	zA0waz8Tk3WBfCVTFEYd9aNU7OT1Y6v/k6yhuglYZ0YdwmuPdUq7+gI6HlcPUtkz8Z5e7sH4M0S
	GZhrpJoxiRIQiIJuZoWdk8p2qaaaHFyqmVfQe3I+YWgl66OuRcgSuTVRB0cnL5VVk6nViuR/Oli
	vFneXsu4ObEyAxMjQdxgDYg05by6VRyfiGf7bviVoFaGrh2M2qal1hjNfhtIoMO8HhElMwapWWy
	+qzfqobepQMQxrVTciq4rIhbjBh+I2ZteHkb0+nA55LUZinliQf6yu921g+UeQViy1
X-Received: by 2002:a05:7300:8a9f:b0:36c:9fa4:dc5b with SMTP id 5a478bee46e88-38280b39afdmr671672eec.23.1794953876891;
        Tue, 17 Nov 2026 14:17:56 -0800 (PST)
Received: from [172.20.0.2] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72e52easm810151eec.17.2026.11.17.14.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:17:56 -0800 (PST)
Date: Tue, 17 Nov 2026 14:17:53 -0800
From: Chris Down <chris@chrisdown.name>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH 0/2] mm: memcg: fix memory.high allocator throttling
In-Reply-To: <cover.1794902513.git.zhuhui@kylinos.cn>
References: <cover.1794902513.git.zhuhui@kylinos.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avzSkT9-jsCrMoeX@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Hui,

Thanks for fixing these, I've verified that these fix the issues
reported.

That said, Zhang Jiao sent a fix for the same two problems a few weeks
ago, and Johannes thought the overage cap there was a bit of a magic
value, which we have plenty of in mm already, and I agree we shouldn't
add more [1].

Could you please coordinate so we don't have two patchsets doing the
same thing?

Chris

[1] https://lore.kernel.org/all/auNrakxaET8qkuAn@cmpxchg.org/
