Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600045;
	b=5B9l3+rsJ4hKc/Oj6Otx1kMIw10ek+taA2bxsmriwfCKNbbEiapc5t97GWRVm99oXlwW
	 hB9JN7RHX8ClHumiIy+yOM31BM8yTAnm/4fv/seR8JcTeUuGSgLJmSuuLf3PmT694mWNZ
	 DRHOboalmJylnB2xmpB091d6eVRbE+RubM4m+yyuhZLJvSOrYLA09R5dl8QFYIIlp+BNk
	 9+HUnCfSdL0PMVZXn5Nb5D8xregwvy4yBLJqNAdp7v7rcqUbHy4ZR3vgho68/YCmbADu3
	 un/z88w9MyZNjCrBU9zrRD7GMMQwiG+VZi0bGDHcIYPNmICpKOqmnMUV4WkTeTi3aQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600045;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WkQtg4o+HEohpzTCn9QEYPwbpcKVcB7YKdwlB0VCIcs=;
	b=o54lBAVylfUNgouwwKyEyebUVWlNrAkUzgZ9/vIEK2yos+GZ0ZmSmIyd44suw2ieUZsO
	 VSH4GWnH2HOUMAwxFgxMsSrXuNQ6FkrVEGvqR5A0NN2sw/e5bJy8De2k5c2R9zgCOzTLH
	 pB+uSIQ3GUFXmfRK9wWGDRvEQEolA46yivf5fJTzzNg8Pntxcx+/DQQIw+iHXynyuJRj/
	 Nuc0e9XE0frWoOZlH/AhgfEtnD187OzrtW5m+bqkeugiQC4e6VgHTYeUKhOZrw729ODUL
	 3jxzz8krL0JThJkgIvhct+0g54HdxzbbIe9xe9nImMxiU5k+miDAlQutqK0NfE4SFig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z5qpcrjy;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SbV+VjzN;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70AE606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D70AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z5qpcrjy;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SbV+VjzN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795600044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WkQtg4o+HEohpzTCn9QEYPwbpcKVcB7YKdwlB0VCIcs=;
	b=Z5qpcrjy4vNSY2GGB568YNneQzNKrrPCb6fAF5YqwQ5udfNoI9hLryFirVPe2rAbIKlmR3
	yYiaVzHcV9hOpY9JXOdSPrYP6fopeBKaKlOokid5PrJCSyyKdhIjwFbS1JdQ1W7p+BegeR
	MXm6oeDUjvQBKN6/jUiQmhePsFlU0kI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-BL33V4UdNVeFeA53N4x_Wg-1; Wed, 25 Nov 2026 09:47:21 +0000
X-MC-Unique: BL33V4UdNVeFeA53N4x_Wg-1
X-Mimecast-MFC-AGG-ID: BL33V4UdNVeFeA53N4x_Wg_1795600041
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-49090fde23aso3413473f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795600040; x=1796204840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkQtg4o+HEohpzTCn9QEYPwbpcKVcB7YKdwlB0VCIcs=;
        b=SbV+VjzNyPZ7gYbuTVl5EMIW/ZYyAW0LO3nHpvbnYlnPlYbZCZ7FoBbrc8v4fZ1LNy
         w6SIg5rKpiZgjz0EulivS6ZSMHRpwlmULB7yjmV5qgoIVneCjM67fuER2QgVllKbKgzz
         YEq4nj07m+SutXXKm11TPB5PGymKiK6ydZ3JmIbijDk3IkvLvfRjX/FQ6LERsiGbQ5z3
         vXjg7FmQ3BUM3ICySAkC9PvUz7fWTFLccJ/HLrf6C1+5CB4YnGGr/XRoqodkNy9co2H/
         ah0bw/x9LIxSZaFudklZF3MWcvlazTumu8HGGposVKkEPFy0BcNfrllpxfc5hHh8QC9r
         GuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600040; x=1796204840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkQtg4o+HEohpzTCn9QEYPwbpcKVcB7YKdwlB0VCIcs=;
        b=gKkzNdxr/2ELTcs0rrZKzO25IPr0CitNGsnC8nsuH5YFVNpOizX82vX3hs9S1tiZYp
         usBA9htC3vKv7FU1TIqe0LLXYmp7In7ThwViknV033qQW7LzN+hIcDOH0TpewmHymUoU
         M1BbUgq94+5bB47sdzHop5B/5fx4mKGQZYOyBD/s59acb5A/w+QAFOcyT0AzJ9BMBmK3
         fbsDQHxZmWbS4/Wfzsq8svzrbG5ZWWOAnH7na4bzlfwKOuzv3NBlUg7d6qPF0d2GxWhN
         YDXsmoKOZgqNaCRGRL/AcylFsKHr2oxZk2Salb2YM7svd5/kTrae5EZPRlOrVEEZMShn
         whbQ==
X-Forwarded-Encrypted: i=1; AL+hErGYwJM/mQj9uUE6SUKP2yC6MBM4jq0iX0zj2umTOxe83qcPmwUwbxik2LW198FB5px3U0al9KmtzsusPYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a3QoeKC+CaxZB9V19clmekDIXkX5AfoulES0t60aWBRNHk3y6
	3xlMdAesKf648gnX13PHIXOp2nPriGSyy2XOk319QHdXiQ7O71vDrSmeFW808pPWIzGGBkFq3Bb
	8AqCfqe8i1hyUtDA4jwX3+JX5/Kbqsmt9Tfxvw9+8eYxtUJFD1PW7BAN3vhf2xY5IZQ==
X-Gm-Gg: AZFdTZdQvt/M486FB04vjqmKv46OBM8XVlfBtJ0m8W++wFGBzEJAFGvr6PBbjN6JCqt
	uCwQBWoo7reLAnYf0tz/ZS0vafh3yQ8kCbT0rIdmZ8qCBHt8ZDPQgtdsf0pKvi2LNiOSajcv/Cd
	2syCCnA8FzrawwfKQcniS/srfAqKfXoFgQAUF2Jx5pXmWERbkLogiP1Ycbs+8NGCLa1nz05zNgE
	IjkAA8XuVRrqkUGIx8sRvYl0aMsJxmdUSg/HO/DDPmYB1uuQm9Quhzmlf+Di9wmUWtCKhabnM3t
	1aE62zUmp+vWVL5BTR4dhhYvbVCbQ5clEHNLccJA8OsfSiLYlbb+DIIgt3yymDzxkOaXTiL2GBr
	XepBOytfhWYwsw/OlTKrA8aaYRxdRE4XkbGd7bcv/SJiPlIo/lTR/SnENCGDL7xrYurX1E+Zr07
	of6qbvR+K5OsUkQi+L3v6+QN0twCrGQm0jJ7EsFk/gQL5E
X-Received: by 2002:a05:6000:29d6:b0:491:fd47:5e02 with SMTP id ffacd0b85a97d-4abb2ce4db9mr21688031f8f.22.1795600040533;
        Wed, 25 Nov 2026 01:47:20 -0800 (PST)
X-Received: by 2002:a05:6000:29d6:b0:491:fd47:5e02 with SMTP id ffacd0b85a97d-4abb2ce4db9mr21687997f8f.22.1795600039986;
        Wed, 25 Nov 2026 01:47:19 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm32143693f8f.36.2026.11.25.01.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:47:19 -0800 (PST)
Message-ID: <3e2585ec-00dc-4884-84be-51162a4d782a@redhat.com>
Date: Wed, 25 Nov 2026 10:47:17 +0100
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
Subject: Re: [PATCH net v4 0/2] ipv6: Honor suppress_prefixlength in
 fib6_lookup()
To: Ido Schimmel <idosch@nvidia.com>, Leonard Lausen <leonard@lausen.nl>,
 kuba@kernel.org
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 Shuah Khan <shuah@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261117110813.9894-2-leonard@lausen.nl>
 <20261124162628.GA3992049@shredder>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261124162628.GA3992049@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 17:26, Ido Schimmel wrote:
> On Tue, Nov 17, 2026 at 11:08:10AM +0000, Leonard Lausen wrote:
>> This revision removes the cached-exception patch and its PMTU test, as
>> requested. The series fixes the nftables regression introduced by
>> 1c32b24c234b and leaves dst-based prefix suppression unchanged. The
>> cached-exception work is deferred to net-next after the fib6_lookup()
>> fix is present there. Interface-group suppression also remains deferred.
>>
>> Patch 1 makes fib6_lookup() honor suppress_prefixlength while preserving
>> terminal reject results, including blackhole nexthop objects. Patch 2
>> adds six checks to nft_fib.sh using its existing fixture.
> 
> Paolo / Jakub, do you know why this is marked as "Rejected" in
> patchwork? What changes are requested?
Thanks for the head-up.

I think Jakub changed the state, I'm unsure why. I'll re-evaluate
this series ASAP (nowadays can't be very soon).

/P
