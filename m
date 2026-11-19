Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103073;
	b=fkCELOqF4LcB7WxiVcLDhBUWuN3NOeYkOkCHmdV8BvvXTbKKUsQe349IMxca3CVhdctt
	 TXYwsyEI9yoPg5gc+smm0e1hNqW5wU0xBJdxLh9OP7Tr6ad34zmqJwk8lOsSIEK4/k/4d
	 tEQ3m0/oRSBiGsQHJiCqTpS/obTQM9e3VswcSK7jB6BjnL/gGSpJ1MZZSAYj7tQ/PnZBH
	 HxcpVnU3wk4KOBvNQiaZkK/jKdKdOqvN2BFvi3Dgy3tLeEI4frK3o1OxqUCvoocAybKB3
	 TVMnvay4zpuditZp+pXLqKQBEpKrZsoAIsvUym2kF11DTSGWLnF78e3OV8CGMACqNbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8zz110iQMhXJ1p3ftg+9uhn6MYhCBFktVfT0q9rAKSU=;
	b=vwc3AyFIuhdR0Fqict0FkkuF8Os/Zr1ta8hEnSiZqXrf8uW/pSruubEu2Ww50vxKS6Ot
	 KoGcHgHPopFHJ8T/6yYIdh5z0OGGx1lA4Gwnv4H6qlyHPQBhLBBDeG1oGrCo3CEBMXMKX
	 +DBETuQvSVp4ro3sKbZv5RhLWHCUA770Ij/E0QdErp78gyj3ZFRUvjkBG33BidOxlJpL1
	 SUfVncj+/qWZsx6mkEvfNxMTD6VfTNEUtEBTRdAJR0R2bV7A9cqHE+PIytUgz1571VoBo
	 SSeb2AOY57aGS4QN1qRYcfunsf0nFMq/T4nMQ7l1oSUMXmZrYDnGgzyPLjmDGqnbRpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b="ZziUpL/f";
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23CD606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E23CD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=ZziUpL/f
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71b0d330acfso768602eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795103072; x=1795707872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zz110iQMhXJ1p3ftg+9uhn6MYhCBFktVfT0q9rAKSU=;
        b=ZziUpL/fkvYzYVKzWdoT6ZitQMrIeuxLlz91Ydw9nkpOjAnw8PsULeLhO4RUIk28ak
         YtmISQsJxLR+g8/kMYpQyCsyKAJKdDWjHcSmjgyrhZKwpiur5SUbFd6OP3t31+O51pCo
         fqBWtGKz2zY6f/XFBHkMsf5b+F+Xkgsoz3sG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795103072; x=1795707872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8zz110iQMhXJ1p3ftg+9uhn6MYhCBFktVfT0q9rAKSU=;
        b=nJww021Dubw6i5ecaxKaKNfyX9zxzI9lWbKeeXqO6JcKChKS4obQMBqjh959Sx/har
         6MYn9IRkB2Tq4fUHFzbgB20u+Nai1QhFpyPjLjByUhSd3MtvAiWaXtpjISQkGrAMaJtM
         hxcc0BOgXNi2K0IkcgnPaSrDNPtF7u4ll2qL1kgDxrn+RDeu4FjkKNjcj0xl0/EPqJZQ
         zSOe/AsQKC2nAnqy+RBaJzyccstUGsk1oBFFaXE/sgCFljNNtIVe5xDbUkeSkw4nhPK7
         QMFGv0Bj4CqCQ8pqbc/Q1C++Qy2C5IUIIYeL88RRGRxHRsVeo4RZ8XqjE9U8H9/8nmFS
         v9bQ==
X-Forwarded-Encrypted: i=1; AL+hErEtPtbTYgvE28O7Hhc1JdZHIHnxoD670iHMfLcIqsM5Iqejyc76NEjbRJJd2JR/TIR/hjxCFS93eXNNiQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z89sSLTmWkpiJhmoLqW5Fe0wSVhSS4WdlxnlpRWImIjZN6sWfBf
	X1QCPClHAMwsUhxoPO7RADW5moN5pdU2OWbKeaXRMSWGJfFlVzcZc+8DPlmFFUHM+JOv0sjc+dI
	hEEaHVqk=
X-Gm-Gg: AYBFou2GA7NNtJXKIVqNxSUEH3HsWzC5tYouZldifJ0XmP0T6TN5MDPBH4uZFKdiV46
	uk6Ysv8I9W3viHmW/wPXCaRVPF4giD2RW1//ayKMAVwqo4YWHcgRi2KkRR6eiO3xk0jW4nIHx9g
	/08zUM6PT1JDez6z+pCDMNionKRI1wJW+ttVJ/Ku4+/6VuOA49CQjSgQxlYrC47vAZgcE/fs8H2
	/LFuqCcbzvyhOWSxGn2A7tHUIEkY+Iy7H+opMv7JYKb4dxvd25/iNkq4wWcvSScpqRQzZXhKiY7
	4pYIEgwXOUPts3TEo7XL7Nyotv+oyyUyNVtKPYIjKfshiJIDKG7Tmsztg6OWLz9lUyMzlQTg9ti
	P+fS89RPw8KinrOaZM0vdl1raGorX2y8mD9qF2pM3ioEXCNknFiue/x39r3mpYNqhg2Zou6J728
	Bm41La/C0b6P1dqksoG3jNLi8GkjEq9r3coipS2gblMIXnnEzKTfoXRawHL0ISqZ7iQeMvl7G9L
	1HhoPjOQRJDNousgPRGWzpXxxyJnVNp17CJVr8Da8mbhlCkP1breGOwIE+T7SmSwqNvuWd9/LDH
	BfZaMeck4UrCJ3GQPAmmshUUgssgBYPcyoVcVMQ=
X-Received: by 2002:a05:6820:55d0:20b0:71a:f98b:3be7 with SMTP id 006d021491bc7-71b325f7287mr642104eaf.26.1795103071796;
        Thu, 19 Nov 2026 07:44:31 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm182937eaf.10.2026.11.19.07.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 07:44:31 -0800 (PST)
Message-ID: <7d2bb21c-f8a1-45c4-91ac-55c77112a8ee@linuxfoundation.org>
Date: Thu, 19 Nov 2026 08:44:27 -0700
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
Subject: Re: [PATCH 6.12 0000/1756] 6.12.119-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261118150007.957976754@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261118150007.957976754@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 07:35, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.119 release.
> There are 1756 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 20 Nov 2026 14:55:44 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.119-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 
Compiled and booted on my test system. No dmesg regressions.

Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
