Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704880;
	b=Kdrz61fGnMI8YXXs3QD77RRLbVK77LBzTe9AD8f+SooFkdGUhE5fA/lo4L0EpwNMNdDR
	 iU82o/5SCbiDBhMrXI/UtATXjVPtESJt418lXMwkYr4Rmg3bfH+2d1dxTZR+mC1CoOqK5
	 8eEYB7jV1sgJ7ulSMN6feXdH9JoXipr22qQSYC+lzB6rKdEKERBXOnzcMdLpFPiMrtbGw
	 jJcQeNY8YzeTkMySME4/14jAKww5ddnHBBPuJA4NIbZPa4juvPyr6gnZFY08s65DUVNXu
	 t6VFnd2t6B7ObyDMsaADiD/eem8GrPjxhRQvLGp3YaZUC9Z9uUazrhCxnMupqPjhwbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rlNHTb2A+Df4Ai4PVth3K4qeSMAoWDzm/JvQFvKYsXg=;
	b=YooQw0jZX/0TGz2t3gxmtqnf0YVI0l87pREtG/mXJoWCRWT5txv/nIMwQSUacDe4YF7v
	 rsgAK8cpAqb3xJSyOjKNjY+07a/7tKHXLkMC0UniMOyzw3shzIK865uVLuRxHhBMUY1Hy
	 0364sgO3fe2suSpiCQGTJ8lKtnj0tZ4CvOr3xQsas5RtMahIGzsnFa+uzYoe+T+CdQSq+
	 9okcRw3I/dEvdiVT3D3sFoYz82ExPKJ99+HOV06uD4MMdjXIUaSwnTwjTmIJ0PHXuU6fy
	 lCL5ygEKRG7En5UZHzKSzJfPQeOs2E7F6E5LaCSqail45L2AFjsh8x1va+K7rcLpuRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b="SM7E3ag/";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864B9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 864B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=SM7E3ag/
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso16062355e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1795704878; x=1796309678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rlNHTb2A+Df4Ai4PVth3K4qeSMAoWDzm/JvQFvKYsXg=;
        b=SM7E3ag/3x127cFqc7DpKUc9ADbIquT3KF97GfD16f8xWT1uVpjkUsyUS7EJDgQe+a
         eYv9+umM2fBqZqPdYRz3zqwTbA9LzTEyDNZkpFYI5JwvJLgjSv3lpWI2E4zKLT2SPcWQ
         4ZXN8tGIALusmbGXS3V2ZRRR5Ubt/VPtub0vbsaxDO5HOrpoZFHPakKgkL/ixM3ZAPTk
         do1OzRAXk3Ljzre0oXRu2i4dOSgXB1cl6UxZbcNu4Qb4z3ZdBJaIolXpzLfLjuhb3XKd
         d6S1svNMwqVs4w776PmvDSRRmUtlaBtJKCAMxFKWLEkTkggXRqIq5/9JOnFzs2GK9+Nm
         QmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704878; x=1796309678;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rlNHTb2A+Df4Ai4PVth3K4qeSMAoWDzm/JvQFvKYsXg=;
        b=dkmiNg/xWR3mSm0h2K6l9/h7IBJgFiTL/Tbrq9VtDbhNVseEWSuSP7V+TsucyNlhYk
         k7cq3HsdMYj9BjhCDhXi400ViwQuepGuYRWjkfiZrRsUij1LdXJNK6hTl6gOoutY8z1j
         fwPh2S5NhLJSUONzdExNq/DSodQtOIMHJ4SVcow/zNFa8WuOn6+h/uRQgqLt2t+lDhwM
         JCPKv7gVd3SbwE+236uJIoZpTL9q25K6yiZaFFjvNsdm2mmUl4A2Ni9+y4o0KQ4LeVGR
         SApTqDqYzoRY0tDyhJqwFLq9b+vOp4hVTrN0bE5VIgGnJV1w9U3YZkyrsIckEW6y3p0J
         LmEw==
X-Forwarded-Encrypted: i=1; AL+hErGiIRRBfKnTvSMrvw9Yncs1wo1GEjI+P50cBKto3rKolZhvdwucIjkFbI55W1uzDPOkrMzB12geFeiNDWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mRNEAzrmFX29uDMwuKmDR6mLjUfjrbfd1HzgWmSW+aXLKKwIF
	MP04WbKsrlui/q2ds/Q95DpyPK+x/EUHo0boLNLXVZGRLbQncwPA+Jv2a++MUVdXXX0=
X-Gm-Gg: AZFdTZexzDoiBhn5Y/+cyHopdfiUiN8EPDOkrznu+o7TWT5RO7SOq7Pt1HhM6seSCZX
	FLl8Bt8eJ2ga1QaZUsvJYEbDjfaPaRb5s2/fChkyD9G8VNGu/2/s8oalBB8pHFoFlZyqZwpqGW5
	q8AoCk2avqY9tuJtBMvZpGFVKAeUJhxAi/xmbkN545NocnCtxsdU/m4JkRRqdl/pevlvzktfSjQ
	KIU7oYchYPCQtglWMMgFE0kh1ll1ld7FNsthiyRGZmBSK455IxB1l+LJkqn6Z5nBqFoHZuZ330c
	ox0PZ9oonSYegZEJVDq1o0UlAqdJw+n5VscteKVH1PZLjNOd9EmU607EkZtQQQSg06zIdwtsvkZ
	/37xg0BXuC2zV9c2dnYpMgGbMDRA+Dj+0sDjQZzxPGPodIRaXcxzLGBqlIBObZUBndWhZs6+fjL
	GTDPvIYEMvwUsGLW13mk7z4g1cpO0KsI9V1cRDHSc9jOJHTKMGVCP8ceR46zg5IF1a5CnCANyQr
	FuHvyc4TpxPqQbFgMnd8NeWqE4jN5iD2DmRMb9Fcf2rrf8KJPdKD9XQdzDMQ4TRe4DqB1uP0/YP
	Cf/Zkf2R5/rn0/kIF2vpopXDcHaQKj3H66hPRh2g1YvkC9zsC5s2QFHF+WNyFYRyho3D6BIwEaN
	bMoIFtw==
X-Received: by 2002:a05:600c:828e:b0:4bb:7ad9:2f22 with SMTP id 5b1f17b1804b1-4bb887853e1mr398806885e9.0.1795704877858;
        Thu, 26 Nov 2026 06:54:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm356519055e9.1.2026.11.26.06.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:54:37 -0800 (PST)
Message-ID: <f707be46-5332-4196-a9e0-5e6fb5ae8353@6wind.com>
Date: Thu, 26 Nov 2026 15:54:36 +0100
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
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH ipsec] xfrm: advance the route generation when policies
 are removed
To: Ralf Lici <ralf@mandelbit.com>, netdev-bot+sinfo@kernel.org
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261126111516.317545-1-ralf@mandelbit.com>
 <179569192472.3294.16207945676550617931@kernel.org>
 <20261126113216.337964-1-ralf@mandelbit.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261126113216.337964-1-ralf@mandelbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 26/11/2026 à 12:32, Ralf Lici a écrit :> On Thu, 26 Nov 2026 11:18:44 +0000,
netdev-bot+sinfo@kernel.org wrote:
>> Hi!
>>
>> This is an automated message. This series looks like a fix, but its
>> commit messages seem to be missing some information:
>>
>>  - Whether the issue was actually triggered, or is only theoretical
>>    (e.g. found by LLM and not proven at runtime). If it was triggered
>>    please include the symptoms, like the stack trace or kernel messages.
>>
> 
> Yes, the policy removal cases were triggered at runtime, in a VM test
> setup (not observed in production AFAIK).
> 
> There is no kernel message, the symptom is plaintext on the wire. A
> connected UDP socket keeps sending unencrypted datagrams after the allow
> policy that exempted its flow is removed, although the ESP policy below
> it now matches.
> 
> This is roughly the setup, in a netns with a veth pair (IPv4 is the
> same):
> 
>   ip xfrm state add src fd00::1 dst fd01::2 proto esp spi 0x1001 \
>   	reqid 1 mode transport aead 'rfc4106(gcm(aes))' <key> 128
>   ip xfrm policy add src fd00::1 dst fd01::2 dir out priority 100 \
> 	tmpl src fd00::1 dst fd01::2 proto esp reqid 1 mode transport
>   ip xfrm policy add src fd00::1 dst fd01::2 proto udp dport 5002 \
> 	dir out priority 10 action allow
> 
> A UDP socket connected to [fd01::2]:5002 sends one datagram, the allow
> policy is removed, then the socket sends 10 more, captured on the veth:
> 
>   removal               net-next             ipsec + this patch
>   delete by selector    10 plain, 0 ESP      0 plain, 10 ESP
>   delete by index       10 plain, 0 ESP      0 plain, 10 ESP
>   hard time expiry      10 plain, 0 ESP      0 plain, 10 ESP
>   flush                 10 plain             nothing sent
> 
> The flush case replaces the ESP policy with "ip xfrm policy setdefault
> out block", so that nothing may be sent once the policies are flushed.
> 
> The xfrm_policy_insert ordering is a race between the insert and a
> concurrent lookup, found by code reading. That I did not reproduce at
> runtime.
> 
> I can share the reproducer script if useful.
Maybe adding a selftest would be useful.

Regards,
Nicolas
