Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145002;
	b=l2RDy0YygRFJZe2EGWfmzPJP7A6rxrQq0sOLfJ3x0TY6web2fI0R1t50GLw9XuM6AiLg
	 Ol5OQQcKffNA/z8FTxZVjxaAvfspGTm4xLz8WnB++MXIubWf46KxHSPeOxRTOA+KVe2hk
	 CVoEbx8u7sCvZWWDe7nq2/MDV8krvryUd3JlWdf6wKYd9GwcdO8Pwut7jSRIakbL76szN
	 B4UC5xEZAC7JH6hxXZt14hh3E8AFboMDRSHwQ/kpwZkQchemio4cA48hc2C9nCKUOGkiF
	 MLb6emedMk0iHwIrbYmpKmKwXksiNSrRk39EHPIQOQdd98f6xbqIQR2br9NNe57llTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145002;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=QwSbqqhIeCd3lwJK3H6J77KqNCgiR19fVC1pv4z8yCg=;
	b=nQJl5im/+5PeaW41OVMRuy5V00FB9hCU3FyCGc7vMJa6VrJ7ja+dgcQREmc3+Zw4+PPO
	 e62pWxW1cxSGzf3lMPXtFQHaITp9pcvY+SXX8QxM+FYqm8yMKnUz0I8HSMlXMi9KuZf0y
	 QOeRNVb3D32Zo+zh7SZfKGwWMmCkmYpMmmIJC+iBMPNLHeOR7pthcWuafTqzeIQ9JdS6A
	 yPy8IAtaiy6NK6va7Ry+jxtYlhaSfhikLEWK0CYjkV6egXc8vs6SF5dGs21NsSfqWGD3G
	 s/c+2v8b6tkIh6kyV92pdVna7On+rKp46CjTl1bNAA9TtjaV8Xyn2HsQt2iRUuJUueQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=smRbKp0k;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3815D60A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3815D60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=smRbKp0k
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id U97XxEtLQAR1iUFDWxB4lT; Fri, 20 Nov 2026 03:23:14 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id UFDWxENuK8cn4UFDWxSqqP; Fri, 20 Nov 2026 03:23:14 +0000
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6affbd22
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=j10-6H-SaoHoQRfmf2MA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QwSbqqhIeCd3lwJK3H6J77KqNCgiR19fVC1pv4z8yCg=; b=smRbKp0keZVyrUIkaO8OdNHX1v
	XgWJGX+DNL/p+oMeAx/RJTNgqTZxQFdjupg541c8Vmp+4rPu1Q3fpZ3vwDVq6RwfQk+fvNHxdgsp2
	+T1Z2lTzVu6Vaem6BNWD+LYB6yEGg+QO6Bm3i5v40nKPvZ2uqCMKcBsnJjyIKBD3kcDzcrK8nM+bD
	zfUpQpUHOvCWN6pkvzQkh8h/L2k7pSQNsqXImU9jQtGFTSWTHSNnFz8+PX2sHPFS0udl3BODyk/Uh
	d/BQfHllzkr+IPVjbuhipJvsw0m5HXPWRO65sGZiQgN9xA9zMiPn0hjVoJFS/aSfjvQOc7RVeXIdC
	+BC/qGKg==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:55626 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xUFDV-0000000185z-2FvK;
	Thu, 19 Nov 2026 20:23:13 -0700
Message-ID: <508f60eb-3665-4aad-bb85-8180d4330898@w6rz.net>
Date: Thu, 19 Nov 2026 19:23:11 -0800
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
Subject: Re: [PATCH 6.18 0000/2151] 6.18.65-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261118150121.603863898@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261118150121.603863898@linuxfoundation.org>
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
X-Exim-ID: 1xUFDV-0000000185z-2FvK
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:55626
X-Source-Auth: re@w6rz.net
X-Email-Count: 37
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGm9eHic2ao2rP6y2eIQ2eHMPyzj8EcNSfkkkahysMWfyCG7Poyo9qBArU2CYp4QSB2dLd56SghCeo8cPWsKWckIKOx3Un/5PfdbOqT7dmlLm0hOuShM
 lRRn5uKIOyiK7fQ6o8rz01D2tEvRdTgUd0UPbUxtwy1I4ZrQLUEsCplNK7m2yiTWfP1HaUnVOikaFp9FBQuAnhie7FhMdbWRY1Q=

On 11/18/26 06:28, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.65 release.
> There are 2151 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 20 Nov 2026 14:55:45 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.65-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

