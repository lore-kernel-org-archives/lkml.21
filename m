Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018543;
	b=WX8yxTw0DMjbpJmrUn7MqX4NUyKob8q3HJolYchwdsLbR/crkT170QnwEeKDN7aztsv/
	 G8ljQFVaJ5QaLVHHDNcgFlJPzSuUrzKFfYazLeJJ8atMqge1he/oMj5VgRI1NSbWwc4aC
	 UARotVkLgsSpseFli7G09gYv6r2lHsFaidDqVDqaj/fUtMgtn964TBidYZ/8Yew69sFyc
	 spMxcyZwIH55woF44vXOBH3v6iRHj1RJ6x3xeAwaMEuqFY/DIS2vN01rtzvvJh0jnTyrX
	 CnX6wcD555vFeqmJsamRMKMLPqMvpYppz5mATZbu31uptCQGDh7eVhiroluER31LXXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PtaUSzwjrD11B5B9a8gnRbixfst3fcr+VZgafM92sW4=;
	b=qNudbaHMGZd7SrmPYg2leZcCtyolD7eGW0iuoTePzH4SvPEFAEfh5kyc0/CJU/7k4v2m
	 10ejlsSd4hXf8NIa1Gz/IOhBxoHLjXH6ZvDGFKIlmegFPZGCXIz19o6AOrYK8xZxkfAmf
	 +k2K85k2E2wexpxuBtSpPtQkrThu8s7pxQ/5auT4duM/MV2A+Qc2tHUCr0/sKHAs7Gnl1
	 v7P6qL79ciXJ9CUQ/J7jrXnldg3NV0sXuf33WnnO9uXD3BTCw3cN2vhTkqwR3W5verSeF
	 cCPAi4B2rpATx80h4hcbEc0CdVM9Vqcc/LxSOCmYAK2Sw2LoD0EFvZLYpvNDrOq1PPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=gOtPPGZ2;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8900606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8900606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=gOtPPGZ2
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-862b090e41eso658391a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795018541; x=1795623341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtaUSzwjrD11B5B9a8gnRbixfst3fcr+VZgafM92sW4=;
        b=gOtPPGZ2bHmtTKeYCy4EAz7T/pFGWFi6gsfTd7EE5Acfd52wwtbSj7q3qXRGzYuYpa
         FKq3J6b0XhWnKKflE4CYhyuuPijwHI3URihDUxLOX76XV0LdsWgC+xOOPnPpzOpYQfnr
         t6K4qRawk1bSr8pE9S2Z3OXGZMb6d3pleGuxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018541; x=1795623341;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PtaUSzwjrD11B5B9a8gnRbixfst3fcr+VZgafM92sW4=;
        b=xMdMVzTOhHoOibt1olxxmMQXbytABv7G+R4sdmr5802N3sB923akTg8IYO7YZWxrcL
         GbLtGBtD6zTe570PQuX+eoPnrC0gMQRKNmr9f80eNz1vkKVeeCv6734ChSiTIjO3XnTJ
         UjrDtVu7fK8EXo/IIBnqTf1TNsvg6IMqeTLRzIHHgUqzlR02yDPzO2IwDEdSpAt9Sh/B
         9U8pSuiE5pBykRPNVFCLPGfVDOJr4jKjY89b27z5GOEgc/977fK8gYX8SrXiu26cOBG1
         RiY3XEgyK5lyUiln13XoVNiT00+YPLXNemBpVZhiRQdyprMxE4VpZRj8sdV0IAY2ywol
         t0UQ==
X-Forwarded-Encrypted: i=1; AL+hErH63hYXu0LlNxzFt/jt+EboNpNO07h6C5mzYL8wYiN0jbBDmh9VF8DIQKDgsCVEpYnlJwXRlr9M2lAb0fc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MvStRmWLKgYkusiae+X6zapkRZiZHMuLFV9xMMF2QPdmuk6cY
	XDVoWBHeXBUGbF1AiwBwrEffBNP8Xu477o6xbNpdDzSOD5ZwuGNksZ3rqZyqXhqKyx6nco2JP4+
	hJqHUMFc=
X-Gm-Gg: AYBFou1838rAyoFu5VzmBVAKruCCkJcmj+myZMWIIlKh2UOxga5auwL92OngUBQXc0x
	u1FAhs/emr6p8xZBj7Ag9RQQUomBAi+yCi7RKxRPiOgXEz4s8l27+RDYgEgz6p7g56UhGwwWRd/
	sjedpzvskkG73L65WzA5QcUFnT8Q/sYpoes43EzzcWIFIBNF8E4h9OJxaqkz2vDbBmJ7qXbGUtn
	zBwzRVSaBdOGkEE4uJWwK0K7QNWc2Nqw+YncC442ee1ZeLHGO/4BDyce1US46iKvpevDjne34JD
	XBuBgLSqo2qTW77RpY4ZSgzQcriKVpW9TLMFAO14udlsoIqvYBVyMhLUDiCQp1+ULNEYR2p01Tj
	+ussYZAiEWHYTJ0AtHu56oq5EoaU2y+eqKkoA4mapY2eFJHKwAgKbCgjly/1ttwPdv82s0oqJBf
	KPqUGDcl9bCOwg8TlFKqnUypdSjy1yMe/EdUsj2ozX3rERW2uxK2xvbXCip1QD5nRRqmnuOXSXU
	VOIfShBa1vaEeqNX+9ESPW895NM3JcaNV3pj+AGvNbTSgIAtmQ947qcRNfuKBvVoBKQIY6r0pAs
	kkSdBvyh2JoBILYnHTVarW4Oga3LM4YnHmcVaBU=
X-Received: by 2002:a05:6830:4390:b0:81a:9522:f00f with SMTP id 46e09a7af769-862f08ed4ecmr2929188a34.6.1795018541594;
        Wed, 18 Nov 2026 08:15:41 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01facf7sm2346292a34.13.2026.11.18.08.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:15:40 -0800 (PST)
Message-ID: <13c6ec9c-c4ea-4471-b5e8-77d1a786796b@linuxfoundation.org>
Date: Wed, 18 Nov 2026 09:15:39 -0700
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
Subject: Re: [PATCH 0/3] selftests: add option to print the time spent per
 test
To: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>, Shuah Khan
 <shuah@kernel.org>, David Ahern <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Hangbin Liu
 <hangbin.liu@linux.dev>, =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?=
 <ricardo@marliere.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 06:40, Jori Koolstra (CIQ) wrote:
> For CI/CD purposes it is useful to know how much time each selftest
> took to complete, for instance, to know which suites to run for a
> quick-fail diagnostic, or what percentage of tests you can expect to
> complete on a paricular --override-timeout value.
> 
> Add a -T/--timed option to run_kselftest.sh. When it is set, run_one()
> prints a KTAP diagnostic line with the elapsed wall-clock time just
> before the result line of each test that is actually run, e.g.:
> 
>        # selftests: timers: nanosleep
>        # time: 12.34s
>        ok 3 selftests: timers: nanosleep
> 
> The other two patches clean up the use of 'local' in runner.sh and fix a
> bug when using --netns in run_kselftest.sh. Strictly these could be sent
> as separate patches, but "selftests: add option to print the time spent
> per test" builds on these, and it would otherwise require needless
> rebasing for two small fixes.
> 
> Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
> ---
> Jori Koolstra (CIQ) (3):
>        selftests: use local variables consistently in runner.sh

Please spilt the convention related changes and real changes.

>        selftests: pass the timeout override to tests run in a netns
>        selftests: add option to print the time spent per test

These two look good to me. I will pull them all as a series once you
fix the problem with patch 1/3

> 
>   tools/testing/selftests/kselftest/runner.sh | 50 ++++++++++++++++++++++-------
>   tools/testing/selftests/run_kselftest.sh    |  8 +++++
>   2 files changed, 47 insertions(+), 11 deletions(-)
> ---
> base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
> change-id: 20261117-kselftest-run-timer-df3ac531652e
> 
> Best regards,

thanks,
-- Shuah
