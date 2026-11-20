Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144505;
	b=oLFM9P1bWEXGIBFIsuOxzxEj/3FdE03EIr+gFkmJnB170Qfg7NEdroekW3v5WTP1KyHd
	 2ugdyt9yjVZ6FBjtSClB6H45Uu72H5Qe7E2YknrXbJmz0v3+gxX6K/gaFD2klpUYkO5kI
	 W1sxwfdPRpotb25ooXBtS/qK1NeitUX/vRXbYGYIiLznhp/D5toKLHm7ai2+xvwG0Y7qJ
	 sRqVMU7jO0bAEjFs/fqDCVq73pV7riJlZ3xjtzeyZjMi80SKX2idEhdgnkVgrNxT8fwXP
	 k+sEariDQEYD4BrpF/Trwqd5EsjAO+2Kn6Ic6lx/GkZCIkA6Nk+XG3HBiuvFrNN/xiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144505;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=sIt34kRTlhv3m0e1Tfl7/Dz6yo53/Myg2aIV0V/BzPY=;
	b=4rGwFkhbbtGXBfwEsgb3DFjXJsrFqTp+bzSYe4P/ekRANFBB9/bdH6tlOnWEtFHIvZl0
	 1KIL/tIBmotoULajjOLkmPtUnDaO0B9RV5ufdkUC5fzxQSVfe51lJwoXgZS+Hmq7Z/Fin
	 fxzbF59WNATywqCytbnP6fjSJmVVOxkEKnxkkBpBrtRBcE5P9BYKLx1W3//MzAT+6t1Pv
	 vESUZmOtMbRxB8GWeTpQcvGRg8qsMXPf1j/Wxsy2bhNv1cJvniegrDxZXtTfPgJbN70o7
	 aEDisjeV4XUy8WilT2Lhr556UI85Y5k7RuSDo0oftYZaviMcu7DinhwroLlsLvZt/Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=w6rz.net;
	spf=pass smtp.mailfrom=w6rz.net;
	dkim=pass header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=PvRNqu+x;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F210606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F210606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=PvRNqu+x
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id U4YPxeem04vCDUF5VxnGtN; Fri, 20 Nov 2026 03:14:57 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id UF5VxTbos0288UF5Vx4laB; Fri, 20 Nov 2026 03:14:57 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6affbb31
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=B9BhxveEpzRwE-jvybsA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sIt34kRTlhv3m0e1Tfl7/Dz6yo53/Myg2aIV0V/BzPY=; b=PvRNqu+xHfCL0FXt+aqRysimgk
	/HrN+J2kBb0T/hM8BKSOpZgCg2Z7Yw8CoDHLXVGH0xNsNJHOIFacu1G2Hw4v+1NiLhXTmdz38yuZR
	dRiFI9PVQtOjpHw1JUnwN3SMJXZzEXbvavhc+fkEtXx5FzFHS8pj55+t5jnf4qSzaZ9vzs7I9IVQK
	tqY4vfQDv1Q43ukfFo8Jvi3XEsetX0mAjgiH3SVpjVcLgV4K/ns6i7DICLYuxcMF1J7DlEcWgAej0
	kpPjw9cWY3xZwzQTbHB8Yg+/Bc739Wf12fsAUV9AFqJaNRiUTB+5zoB0IeGEWM0TL4D4hZUO9nNiD
	RdmL0GaA==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:50260 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xUF5U-000000010vg-1CBA;
	Thu, 19 Nov 2026 20:14:56 -0700
Message-ID: <91bdf95e-74aa-4911-b874-cff75d92224d@w6rz.net>
Date: Thu, 19 Nov 2026 19:14:54 -0800
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
Subject: Re: [PATCH 7.3 0000/2651] 7.3.6-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261118150247.972732815@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261118150247.972732815@linuxfoundation.org>
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
X-Exim-ID: 1xUF5U-000000010vg-1CBA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:50260
X-Source-Auth: re@w6rz.net
X-Email-Count: 17
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBgxx1WEuLkCCFYbcq3UuM9rrBioQuNJpfGL5qIpXMqXb7UXwT0VqTSGE6O07G0bk7bTlcMhZtX0jghDTJ98lAvJoiOa6vLXwDW4OFT8FQusjNAetfN0
 5Hk4IxJQllTEhkoNo6T1x+PiIYhdh3vEqt/c4gBR3GTMRRw+pjSzwQ3wbn71lsUpvjLQWsAxKLXAx7quhGAFl9PWImR48Xqb2iM=

On 11/18/26 06:20, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.6 release.
> There are 2651 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 20 Nov 2026 14:55:47 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.6-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

