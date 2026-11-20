Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210378;
	b=dohk922/8OhVaMayNgeDBPJ7iZggJmCaFeRVle8Yaj2ZGsyo73NXUoJ7LfStcdH9s2u/
	 Mn0x0Nyd5Zbei8kW3D5RxG+B2s887XJTkkohvXSIPf6r4vVh0sZ49uDl6UBvRoFOeZVm/
	 Yg1KhhECKQE7fDzWilbFL2ejY0asizpP/aHdtvZn3ztPNG0akePzIkDn8FJLkjdgpZAsx
	 MMtRy0V2zrD+QtbDQoNAiYNQXlI3AqqCppUXTsODndBEskDoAqYRFWAwOND6DzPL9ATX+
	 eOh/i1SrHbEkjyTqB6UDgM7a2FvyLrxIyLzLIBo1mZFJf7ZNqqSt4XsWH4mONnHw1lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yPxtvilWekrlhitAc6HbDf16H9GXc7cY0OGz5zHiX+8=;
	b=PE+uTcUhcqDzyiZw/wHWJObw1n419RHLfsT5Jaf9UMhbGusi+WN0Xm9lSoUR1HUay++8
	 V+lhJ6ZunmEIX4cPylhQ9O9eQvdZhei8FBY1DcuPX3FqG8viARgnKrkYe2LswJqA1fui5
	 8BXNPaZyJlFwH/EtSFZBISn3+TogfPiMuh+26wHB7O7b2yj/hENuz8UH9WQY0vHUZ3NaR
	 5kNeRTHYwk91vf5beCwYmI0v0f+VwiOLx/6L743OKJzR1B5LXkLBbTNyp1+Rl3zMPlCKx
	 BBRNfOFC5PUsIJgpPLofghUbeg020ImJSQVNr/t2MehVYK1FVs6mj5vwckmVNCvr6nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vbSGEmxu;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5882606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5882606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vbSGEmxu
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-385d8a00598so1592706eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210377; x=1795815177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPxtvilWekrlhitAc6HbDf16H9GXc7cY0OGz5zHiX+8=;
        b=vbSGEmxuFCB4cGAkQjKefKgfH1Oe3WXgNV4pI2zAH7KdstT03s2VfeXr+y+qO9ht1J
         QivG3vYtMS41g76Jx1lqLPnP3aAmaBBmOTthSV6/1En+ZxigF2lSU54Je9iujqQ6brUs
         q7mv7Qz+v3gTXYVkXpoi+gBNzTA8GgiH46OTkrvWa5Flr3LEWL5Pm85fSSMRcyLzFC+M
         UXjkwNv5KPplyaVkEmS6ikAdb++WzwKYoqfH2xIpqgslwFqUVgl4eoovU3TNEg+GsauS
         wvpzstwHUOyRX+Murhb9Z452TXi+qtHiZo2o9M5a6MJ7y/S7lgf+AyQa1WA8lpms5XL2
         fCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210377; x=1795815177;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPxtvilWekrlhitAc6HbDf16H9GXc7cY0OGz5zHiX+8=;
        b=wxSEydUrOMkwenTIlPiwlxxzOAkKlt1uRnQfW9bzK1JSG1J0Y7TTbn46ukwMTk2k7k
         Xk3w8v2g+SxjW8dDAxCjlsdplsSKgqw5GRS41yVopQOL7AtXhPeWU1wcIFpBlWneWgcV
         fSN0EL/zklgDzxfIm72LULDY5bb/2SeR2AnMOjqIFJTeTprIl+bTstx6KqFQamEKpQeD
         SZCVZvo8KkPtQV1+BtPplUm5oxDiLnY2qSlb7urG2nBEC9iN2wprl2U3Ksrb/LAIowv9
         QVN7pYoLBdQ/EwwV0nkHsHTtTE7F4NiCUADghm/aZen+oDL/fVNNvyOr1p2x9X6uUQi6
         wQXg==
X-Forwarded-Encrypted: i=1; AL+hErH998r5m6/Fr6yuskCEC4WPBKOjgeHyK443ncWAemyIEGJVmYbfNyHTLiNMi+oFfcCLCjL0d5A2sNCdK6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t1Cg9ymSfK0NKO4Y/W1VZaJuFunIUwy4sVVHMi2uVzQbXu5lr
	G0lS+D2yiePOQY1JKF+6JkyRuZTbvuWE61pjH5YzDxeK42aLn0k0FoQJr1+ftQ==
X-Gm-Gg: AZFdTZeoz9N2WOh4BAWEG6g+WROflD4PgMSIccXgk+wZD17tIfNlQKe22KMwbVJRTds
	SFoqfgK0yTvynCofx/k1aWTL9DmA3fIGcG4UAJSqY0HJFdVEH31BEXZtl+rKbYY79vX4UKSJ2Bg
	2OX+1NIEBs8f3uX5DgLCAs1GJHYOg+EAsaC/6qU3QYJZFdLni+voXFyS0PIneUlnzLcB1xZtOUL
	xZ93jFiex1Fe1+vmfRJhFPZ/HUFDGm0ssmb/Uw+lghZiN9RDM6ICopIulgT5TlIeY2Elj7XCLab
	BIXU0V+2Jup26twhF5O3w+y6LQfogpggSVdJaIpysqMUGXXftTyU38zof7R7UW+tbdgKgVLx38q
	6RypN7snV0ySBdG1KUr4+J4zG922VZr3XB2BHBp9/N/A1N17JYkLBZRHt1y5QwTYB2nIblOwtvu
	k8GujzDu7Rnk0k/AqEPnHrgNTVmqfOwiLWyq2kwxrrkCjaftiilFlLcamQZhCaX/oHxWRNRydUe
	6mtRkCtn0xyFxXYH41LFhA+0qBvLbW3NDIy68nvy/7EdLF7e9RuVfXtsCj+vhD2kKTgW6yHXMCH
	SUTpTiJ3vhZhXr/4ZhHqQud4XVAdg8OMvLoOLdJ4+fZD3IIJEWNBMFRx
X-Received: by 2002:a05:693c:4015:b0:383:5eb8:d284 with SMTP id 5a478bee46e88-38570845980mr4272504eec.33.1795210376751;
        Fri, 20 Nov 2026 13:32:56 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm10283664eec.7.2026.11.20.13.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 13:32:55 -0800 (PST)
Message-ID: <b4ad1591-28bb-4431-a206-de8069b30b00@gmail.com>
Date: Fri, 20 Nov 2026 13:32:53 -0800
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
Subject: Re: [PATCH 6.1 0000/2812] 6.1.193-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261120055200.707545519@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261120055200.707545519@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 21:57, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.193 release.
> There are 2812 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 22 Nov 2026 05:44:39 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.193-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, build tested on 
BMIPS_GENERIC:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
