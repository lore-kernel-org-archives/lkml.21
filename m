Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772362;
	b=PpFNfYYWiJar9QVwcyXIACh2EiEa5FZcwOMNZJhDcmjlbFbS4cB5Pi1StgjFhEqh/vK7
	 B/wvN/L8PA7mt3gClGa6baItfCKYc/5yWUqaMnRZvsjfMG5Dh2vHvIWGdRGkkHu/Ri6AZ
	 tZhgLm7fAb7K3q8dGAsTw9+74HE884LSPFVYEicX78GOG1h+ZBGypmyt4jtIHdjD28wCo
	 lIq0spe4fgxILxDVQAzfoGpP5qFbR3mJVgtuGY79ZorYRo6KqOEBey+5mhzbLozyuHFKc
	 +WNHIvpn5CtfcQFl0UWO7ktHlC97MUgCQHt1D3zz3xMmddWu3TZZyJoWJB4jXd+O5gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772362;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=+YSEw3E/EZX75auGiU6X7rAfJdFzzYoJpldWWxpASW4=;
	b=nF2pUSOJnX21EsEdM9+4nUZUSl8OI79cV+MY6/1LTKuEPzn8yziZ1dkSyh6n265Nay1m
	 1Y2dx6MWXKODyHkbVhtIWwLdsLVhxYijpZZ/oFntm1YynaFXlCYR6L8BwxaINHNF+CIJo
	 a/IpBFE6HkfUHyKtLLTlt3+jl4bRHd1YXgoSy8VLcLldJwnNdMavh9BnbMzq2Esh77Qcj
	 yTuDfRTvSUxYQBTwUtP9qIQNJAEs5SR9PhCAPL8aP45r88PlX4UP41iQAAjkehtDlw5pW
	 sjYMjat5DkEDUpGSZGDltZKGyg1zqaoHyEBqEJe7QE5iWwA2soCE/5QQi2/7e64jIOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b="2v42W/mr";
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B390606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B390606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=2v42W/mr
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id WfdSxEx5LVK9UWsQGxWe83; Fri, 27 Nov 2026 09:39:16 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id WsQFxjJcHSeuLWsQFxtAgi; Fri, 27 Nov 2026 09:39:15 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6b094fc4
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
	bh=+YSEw3E/EZX75auGiU6X7rAfJdFzzYoJpldWWxpASW4=; b=2v42W/mrXIJ9p0T7fzbNRh8Tzy
	WvsupYy8FFGd0laOVDEcT/5b5TEI6TkAh1SR6y/Foqp0Y4XvExUZIlwc5ooqIXNcRyoJM3q2PVUru
	CycUSI1IljJJCidYIar5rdfV7/6tky0GK323J3T01zpraMh734qudrqVMjZw3RUiO+bWMc3/ECr1b
	C2ZHvpPvq78mowhS8rdUlvyXs7NV3B1GZ38kZmZRuokko1CV7SHz8Hm/7moeQF92gu7ZjyyH2sqFS
	cHokBn/z+ITSSmmrxnFm42bKYyqnD7SVEoihu19tl+KtvPv1ua6lY5G2D1i3e5UNVyegF0rNI6hSY
	CoVXSBPw==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:42700 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xWsQE-00000000FMj-3C1J;
	Fri, 27 Nov 2026 02:39:14 -0700
Message-ID: <2f247912-7192-47b6-8273-0cf004050720@w6rz.net>
Date: Fri, 27 Nov 2026 01:39:13 -0800
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
Subject: Re: [PATCH 6.18 000/990] 6.18.66-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261126105725.767748294@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261126105725.767748294@linuxfoundation.org>
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
X-Exim-ID: 1xWsQE-00000000FMj-3C1J
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:42700
X-Source-Auth: re@w6rz.net
X-Email-Count: 37
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFxxblebp35/SkVlYBa+IpoExEfz0JfuB5KovWI2elENEMQZCuroCtoJKRd2xTkWzOdjfGY/O2oKqxBmMWNU7dcAMFuLgT98UuvO61mRRo65HrkIpe50
 gdtaOfrSOrFJfnr8PlDJvzBgE/BcQxOXPPsjbIMj97axqgIdJlyvBdUwIlHOwMGnT3fYbVzB3UpJSv8QNF9mTxFTE2KcVOARW0A=

On 11/26/26 02:58, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.66 release.
> There are 990 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 28 Nov 2026 10:55:59 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.66-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

