Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147030;
	b=ZcG8+UPGk7LIW9kFl9Sx6ryK2D0jR9bf+8phtu+MjpiXJN6Plt9P3qXJj9FDQvoDbE3y
	 tzIGXwUxQmHvUmFDQYnmFZv3pijn43QK7kOfndEUcUiwjVuhevvMLGqVaOUYpxYc5Fvl9
	 qMyl0rTav9Nu9LnX6YLDJycxz0rWn+YEtuTI4ryBz2fmVPPIO9KUl8W1madk8VOLoe+YJ
	 hpjWWpP6aSknMhZkWyN142NDjyIL/nbVcFfdc+PUOT88SF4FdQPpzt7AsrSRnrZQE86cq
	 Wlcxens9+f/nWtMhzG0pN2OP2ph814KWS96jomL4oqDKnZ5AT1hjCw11LNG3T2YjRPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147030;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=11okyqYHxE0IernNnQyz3EyafRRbkarCz5jl6k/WWBA=;
	b=FikwJjrNWP7HensNPxaPy9840NlusxKnzZtvsektC34WcVgXEyEy5Yda5FrRcpoQ8q8h
	 ydtF4J2ub8q4qW8SwiuhJcz11YYx4E0RYa2lYWgAzv8k3/XMeKdIrAxWvLTkOMnc8yUhT
	 7MruNg6XPTZU7YfgHB0Ka/QPQFfYrZuPKDHhoD0Vy3VBlyiOm/V3Q8f/lW2r9OMXOEecR
	 PJ6V9YktVofP20KeEFE5jQ4YKzr0yxVhZacXYve9ARhaf4E3k1T0jNjy5BEFbAYlVvkfq
	 jeJ7ePy0OJAZFzQoRR/0ZbH5+AlRcHcOgS29jkBR1bVxIuNOMKJ9aZS2WFB0CRqwRsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=JIUXM2qO;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46E4606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B46E4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=JIUXM2qO
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id UCyxxgBMZRiNxUFkLxzK3c; Fri, 20 Nov 2026 03:57:09 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id UFkKxQuwJdRrRUFkLxGdtP; Fri, 20 Nov 2026 03:57:09 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6affc515
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=UheLhBLhog78gnJQedQA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=11okyqYHxE0IernNnQyz3EyafRRbkarCz5jl6k/WWBA=; b=JIUXM2qOrIubJ6u7hVHK1jHHGD
	oNHMX6yo1YUSyEe5IJC+XlYpOcpCL1IYQkC957TCwYiCskR7Fb3anf3wCGpzsaIUwtkreEWxzHcZN
	hM+ffR/PX6CNwr9bzF2sib9pAk1gA9wJRYIebYBinVDznnbyf807AfeqqOKy7bJfmxQXO0Zp1Umch
	T9YPMvP/RgWNnaKQXaqMWKzjdPGRE0gBj9olPEdHXRUpCcHOJiH2uGpndoiM2v2r/mGrm1FGCS0eu
	JG8RG800aCw800hpyAWFYZ/qv83uyfx8WaCHKJXNuV4MfnFTUwp3bVVqsv5MCDa6jwXPbHfigF0v8
	EWjZ4N1A==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:33018 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xUFkK-00000001Pyr-14cM;
	Thu, 19 Nov 2026 20:57:08 -0700
Message-ID: <4a210c36-d99d-4a74-b94f-41f6a28d5040@w6rz.net>
Date: Thu, 19 Nov 2026 19:57:06 -0800
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
Subject: Re: [PATCH 5.15 0000/2214] 5.15.226-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261118150009.797899913@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261118150009.797899913@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.206.103
X-Source-L: No
X-Exim-ID: 1xUFkK-00000001Pyr-14cM
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:33018
X-Source-Auth: re@w6rz.net
X-Email-Count: 117
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLOuJmL++MIARGhZKduh8qgrkGJjmj4JmD6uH5DDoQ7YJop3Q/MyUKicexjEXZjcdw+GhUAc8u4/X+8rF3lSzoq2zx7QQfF5eZaI2sLbshpyBeIgTPb4
 n5e5Ok2ob3U1pp0YhPoK8dFuGKDRIIYgHCruSe/J4XyeOZUc2h8aBilPYmE5SON/TqxAvhJJlAEBKEEYlW/5m+eXTEU7v0pknGk=

On 11/18/26 06:27, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.226 release.
> There are 2214 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 20 Nov 2026 14:55:35 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.226-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

