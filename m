Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050149;
	b=LuHTvgQ1nSXDK85VPgIEeV8GwUrDzPvyEEo6qGYes0t5+fDDVviu/eRVfkgKEsOHU1pF
	 Y02RiO39DZiqjZSzrkBJ9gkaVS0I62C75B4ucfUWZla+Z40ESD0xxjAl26Gg/SLIrj7ph
	 a1In0K4iEADGD+9Wz5KbujFL4Nw0MmOzl2NrJYl2uF3pUzc9PNUq5gQvGFm6Ps9h5WjEq
	 9YpGhrJgKdsBooADwTQ6Rub2ZPS7V3Meiqjxrvx/SlXZ6rw8V6O2PRGkU3sxCWxQ8wllE
	 ydc7IDGfjcxhaAI4zfcSt8YDp4vyUYJ3IRDIZ1l/RSPxgKqdr3jPV2gAXEsknkJGVtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0C8lnJ2RZbzuiNletdGOfX0PhTEr69qDL1g+/y+UTJw=;
	b=RZxXTo9ksxDcVyoliDUiLgXlvJ/8McAhQWtCusvf+8PBL2egEQdGn4UWEOvM3HHSLr0c
	 MH8CYfKCwmwg7E9+7ta/yqKMCL2KNg3FLAXv66VfuEF2Nwz4+fiwz0sZfqTcG/O9H5Vvg
	 Or9EdieoeAkec9p6S8hD78Qke/p2DNC8orqwHzQQKxr4YtrHISqheVhnGhWIAPLU2Vw21
	 ABgDNc+66aVPUgneAem+ClV1wvgSOL297Qg4Z1do1KnCpLlnEPrzljbvHfegwKayxOBDv
	 zAgSPiqQrtBp4ve3JXzS7saUbRtZ2JIAZx6AJxHtiCMbiEIdKWxJ9mRWrg8U2MAQpkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=AcFLliy0;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5FE606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A5FE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=AcFLliy0
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-57728d87699so635106b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795050147; x=1795654947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0C8lnJ2RZbzuiNletdGOfX0PhTEr69qDL1g+/y+UTJw=;
        b=AcFLliy0vMdVeba/L83H2MqHW0vnU1dM/bLcGD0emfOrWQWAl5jE38IMhh2T6Ih93Y
         +YplPcD2gxewyt682rx5QIfBDSyh23R7xgnFVtPELtJUuBMC5MSFdtLhFrRA8umcU9DZ
         b0j+JfgmRkZ0jrUG4/ghl4dVWDZyfPBkZfMZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050147; x=1795654947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0C8lnJ2RZbzuiNletdGOfX0PhTEr69qDL1g+/y+UTJw=;
        b=wHPB1m45dbQfyF5zLtBQC0HAsYBQNfeKgjVxywAsa9c0XXtstavZAbe8CJXhHw61Y4
         eDjTgblRbbB7Ebtiy236L5qXcR26d1hoiiZ/NpKfPNnVLS2HVTWIOr+QortY4bUcd18V
         UXftxW2jGFKPE8mCwh0DsuK0T0h2oxxOmynestkvj3Ke2wqZ9p5vyY7q0aLtjES9rT7V
         YaueCv3vctBKJDZdKr/qs8ZcsG771/JMYYZ7+/wKEUJo9DXiWG4m1v0xIOrYsiZerKp0
         Rpw2ckPEXLeRw3UCeBxNKmlzf8yYZF1LksuTMgQ6AHLcMGRkNNYgQskT9z3ztLiHEkzq
         MviA==
X-Forwarded-Encrypted: i=1; AL+hErFB1AU/+1dxvDC2pcM0glPcdBTAQwfYj1TihJ6urOwR7Tt33jTKLWZUQ3Ds4wC3kxwDr20komg5IO3yOmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iKMDzCFNpIjbDYvQGcuwtmO0Kj+Wi/zwYMLKzVOGN0R/L4bfW
	zrM1YQYAv0gUwYemXoz8ulvDbpfVmxpi+rpD5Y9mB/cSi1GWPFltJl5qxRCBkyvMsek=
X-Gm-Gg: AYBFou13CwH9QhJJS17/9cZ0BPAtu5yF37Ee2SOnDjILjDYDxOOMhgysTPSxI0kZ8WJ
	umQXZp3o2GYAV9txRmExiXdjdkUgYMK4ycaXtyRxK+6Ta6FcxeMFodZv0TTPvprXuvEMcR0njTq
	xjckf5fGcxje+26IxNfzzL7qh3hkGtW2JDOGbiwNcQC7fzrMizZKs1vwE609xCvy2D8xeVN2swU
	TWycj4KQl1ESmi1DJ3ouPnIpvQRRyY8bm/Kphk2iRfhFxkboWuoZgKqtROvA7G1FmHTXbP430mS
	lSrCDLmtXyLSs+Ov4793yov0pMZ/ygq0Yz8lYLvkB4L2BxFwxPHBLWunttMhcJp15HwHTgUnQHM
	5pwdy3HcKr+TFVaNEbTZoiCk1kKfbihOhvTWP2vgbk26vCJreEUbBCcSUmNbRfLlTLRs9SqGIKy
	eOT24Gf0nrc/YtQR7myJNK823KQGpq1DFDOO+Bat9sz+w3e8r5pFXWssnA3sCmNfiln+sYdOLlW
	Vl6TVMR+RbnvLrAK4eQ21bvnrqcFrSdaR57a0HUvJkIiwzj9eX0DQT9SS9MXbPVGgY4K74HlPL6
	iL2XG5TsRFlXX4qlCkUtsC+cj4873bbxxKnjQFs=
X-Received: by 2002:a05:6808:4fc9:b0:567:cac4:f1c3 with SMTP id 5614622812f47-5773c12b74cmr6176202b6e.23.1795050147505;
        Wed, 18 Nov 2026 17:02:27 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777a8a5b72sm2705076b6e.7.2026.11.18.17.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:02:26 -0800 (PST)
Message-ID: <2cc4e958-33bc-45f7-bbd9-c6763fa3a8d0@linuxfoundation.org>
Date: Wed, 18 Nov 2026 18:02:21 -0700
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
Subject: Re: [PATCH 5.10 0000/1848] 5.10.275-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261118145911.150052362@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261118145911.150052362@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/18/26 07:33, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.10.275 release.
> There are 1848 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 20 Nov 2026 14:55:32 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.275-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 
Build failed on my system.


net/core/filter.c: In function ‘bpf_update_srh_state’:
net/core/filter.c:5867:26: error: implicit declaration of function ‘seg6_get_srh
’ [-Werror=implicit-function-declaration]
  5867 |         srh_state->srh = seg6_get_srh(skb, 0);
       |                          ^~~~~~~~~~~~

I haven't isolated the commit yet.

thanks,
-- Shuah
