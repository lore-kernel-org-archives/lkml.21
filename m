Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772661;
	b=DLU6pBWEMnt+A30aHSPJe0Q2olZSIfxbC7LJ2Q0qouzOpuInAKUkz8mgQpFLA/Pjczez
	 dxG0vCBgW0INc6NPlRXCweyLbIVq4PKUFrdu6kqU19XAsfmiaL38GoxBzRIwt1ZYQlPxU
	 M4QJFGTr2uRYiSzuVHxo9F+6kaebmneVVfoUPN4EYbGZtmvXiKrTvk+s5Rhe+mbOmkU+A
	 RFFg0X6pa2fFG9tqvgz/cOuUDTZ96pcuffGwyZIB8NEwP4afoAMlK8fj0horo7mXTafE8
	 DwKTrsrTRpeNg7thad0bXcjgoPhUszI2XXPC570TjTy2vzV2HdhyXNECLEaPT5yAzOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772661;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=+9+B4NgeHP976IS9q9jOuz9OR60GxoPPYSVbjQZz/cQ=;
	b=N6BZfWJ5uu9eNVzpQ5t1fiBHDO8e3ZsEGt0R7xqG8im9PdihiDxZ8VB36F3Gsf3tJAdh
	 E9Axt0MkaIAJeZY9mom/pky2S0tVn7vv1NxX/eCRC8+rjP3UBBMTNhw5qoDk9WnUoNJIu
	 owkKQS/TigFRXFomXzPW8nbUmydgud5j+KRaMXrA6BqZrWhyUE3fxsETO+f/P2OVikDhO
	 aBRnKNciVfFUgo+ZrC+t5+M6ynNZjMqkTKP88xKKyLndnohscQ+jwkmeh4rnwWFEafmRd
	 wxANDbDBuXaUr755cCxxgHJ2xppJt/h+RblupwQfDOfdgsmKK4Q/dxH1I5LeFPfS0bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=pCqHfHXL;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F81A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F81A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=pCqHfHXL
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id WdlKxBx884vCDWsV4xkp8A; Fri, 27 Nov 2026 09:44:14 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id WsV3xBq5FdRrRWsV3xYXDc; Fri, 27 Nov 2026 09:44:13 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6b0950ee
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=vOf806ianDT3JLFn31AA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+9+B4NgeHP976IS9q9jOuz9OR60GxoPPYSVbjQZz/cQ=; b=pCqHfHXL+VIHsrUZJZjyoKv2pc
	YjHD+Ncm7dq7sfckIHh3NkM0MERTEdtFsiPuv7tnIuruMpPyF7Sb7dTbEcU5aS4Ipm3JD5+VTQvTS
	Usy19NByHxOgWy3c/CrTEY/bwV9DgyG/23SqdY1XNxC+3iMi9DqNtGKWxgmy1zK/21JcZ2EgAcGqh
	aIoKwTLexgIekze506P82wUQwq/pOCdryvQsAWLJVYINpeoCpbTWegCAIGZw1uU53Lf+p7020MuKM
	VPJK/AZfwOoMoxyPP6dO45Q6BGkMGooMgsCAQsC4tUcItXU1Qorz2eCdPQmIgLzMY8w++LiFqjvq6
	SKZ4kdLg==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:57234 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xWsV2-00000000Gc5-2VJR;
	Fri, 27 Nov 2026 02:44:12 -0700
Message-ID: <5841dfdc-36a7-416b-9839-56f83db286d4@w6rz.net>
Date: Fri, 27 Nov 2026 01:44:10 -0800
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
Subject: Re: [PATCH 6.12 000/815] 6.12.120-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261126105709.009001842@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261126105709.009001842@linuxfoundation.org>
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
X-Exim-ID: 1xWsV2-00000000Gc5-2VJR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:57234
X-Source-Auth: re@w6rz.net
X-Email-Count: 57
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfISvFNYAGLDWEFussFZYrcnsY7M6nA43m7G4hj4SdRPwZyYhU8/FyZCvzIWmYLacOdRTplK8dsoYfyEfOHZsLogLrEQdUZHUOhQCtwFn3vK9r5SCtlJW
 ZMfqjj5Qs5tMRezTLh8pvUaEKj2shk55XdAxoTknbtJK+DZAtPzPQ33JK4HRHFvC1dAs1Re4Rm94KE2ejOUvAQGyaF+Mkt1Q3cc=

On 11/26/26 02:58, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.120 release.
> There are 815 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 28 Nov 2026 10:55:59 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.120-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

