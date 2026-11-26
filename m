Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795667288;
	b=vlH+QwClu6NQ/mucfHR6QEaott8Eg/17MzpLevg5Jg2E32NapjWF3cHe4BSJ4Qbst4gP
	 +D0bQbTPTZqFa4wiYmfGEkw2kX9kH5bLhz+59Nx8WSGfZ4qiU6c+0HeTcbcSiAPf3SQ/B
	 3QRilZyMP3qxL8dLPuX4S3nvckqbTcQIrlazuElC2lOn9lRWN8g4qovyyPDtwKBQiu/y4
	 J42RyWzjmvvdiSpV9tOFCeGw8DJya7JDI05V4G3Mra5X2oEKVumxnbfXj9CU9W/l+y2zs
	 6WfOblcW7MB1X3xGvQRDjmulQadynaAJ9tLA365C41mdSKUP0N1wwKVFMmMr3z4bg0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795667288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=J0c7g32Vkst5ZTZD1D3dAok+IJ411KyHzBH0wWFTswU=;
	b=VpN+sgXQ79eBPhM/DdSW+xm0pFrbJhLoVNklr8WCWFSnyh96hO57LkomAfZXcRlKuxk3
	 LeUoTakNA14hHHQDXx/Hq7QOd86fGI4Y38UN0zMe7ZQU55Ah8u11cStnVMTEr3KkCojLX
	 gwvtggviHTYbk9W+jrNgCgtq/rR1I73+ssKcvgH6rcTAVQcu6y2emINk6A/xowTelKm2I
	 qdxv6faSlSoEGo4AzNmN89ks+YFaOBrGpwLFQRav5vrosGyv4ItfL/6GevPskTHmNHsuU
	 KC4028aJlzhQ/RzeDnhtNRO/uo5RsVPnXFZmtg1od/WL6M1DJskBOwm1jnjcy/P2NHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FeiS0zcq;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423C9606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 423C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FeiS0zcq
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3b4944a0eso4990953c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795667286; x=1796272086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0c7g32Vkst5ZTZD1D3dAok+IJ411KyHzBH0wWFTswU=;
        b=FeiS0zcqgoOFmLr56DCXuVS+WPZRG48AWzZCrtrSDLlcxUGMT5sMj0I3Fo2It/PlAJ
         VjilD4Vcwo0RjJY99WdRJlzHc3ihRmA9bzkY1iVhahC2V8baUNxe8pFcR0WjTFoIOhY6
         MSnppkX+xKNYOguAEXff9gHg0y3C01/d2VbNql42xneC8VCPAlCY84JT4R7Q1nnaDJCc
         Rm3FvpKOgz2tC87Hg23eu3BEuVIpmQ2BcvxlyzraxqaQi/0oumo3lmnaDMV/wJ3OGF+c
         Rauyxf/zxC5x0lNztAIGHiWzq+BuK/tDAvAbmDN2jeQUUwqHXVWZameqraWcwPqez6j8
         apRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795667286; x=1796272086;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0c7g32Vkst5ZTZD1D3dAok+IJ411KyHzBH0wWFTswU=;
        b=uNJWbLvYO18m2Qlllr+seLhJi10Njm7eBxShG9n6TanOgoEd7vfdcMWZGzxEYrn4wi
         3rHd1paFjFAVPQA8EcH3uXLUaOhIDGAiiVncfYxx57qPWtkg6gF1aBmYn4QkoGUeRUtt
         eFWgywjMPhpv0dxzJnL/ggP2cLGYOyUMC4uTiWe/ky6cZjYTSlIoCjuitufVzyyBRyLO
         VknmlKPQnUygZbwqM90KHkqXvOW9P0DdT0Y7TMLJ9X80l0YM1MsozEDnyH4siXXbafhp
         DZhQiJGmdbzpdFZjLmjtDTVOot+5uucCwgRFNJXXp+ml0hGr3xfheAgR11Eh/1HjmdnL
         bmdQ==
X-Forwarded-Encrypted: i=1; AL+hErFXhcb7ydALb7Lcm09QKYGCuhW1JS4KUYp64v0Bn4+yWquSqShjxXN4O+Y44xEl6TWBhbSlXyCcCQGCb3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8unJapw/Pr9z84FAgoHCAh5SstnDEzNemGC4piVHweewKRvXFq
	suuTi3lwSakuXUHi8NiL2mMrBKmuxCcrvXzTVP6wcTii0IlqXh4p7oUP
X-Gm-Gg: AZFdTZePMUPqtAG8ytnyrBvmvqKeLeMexhlxz2l0JlF71j+EW3dz2mwB/nq+Ov++RSu
	RMoO0VWhWYPQcW5aPJhJQrVtqFky2MEZwSdh0YKIynQPFA7BNwd4ZOof4Qo0E8jBqvCXv/3UASi
	AzUEd4DeJphYWmQdB8uF3i4+QnmAbcdOh49O4WHWZrqypXu+UZl2iunqczN8kB36bEvIbku1ggG
	tKvYxeFGef60fRb7XyrHB1/Hzd4XbAr0x+DqY7j/Jsb8cQocsAG5PGaaIICKUJ+Sn077ia9GlCS
	7/ceq+xbpKF8sFqnr9PDcWpfdfBFXf1huaJkBrwuHMfE/Ut+nG9xf1gMQNaosKRcB/LRAoqo7SJ
	76qERauLf/EGK6oIn/GFExPHHTRR0091mpHBE+fRuHZK+u++qfcMW0NM5SDzdGKQzFeydfsx0kv
	du0R26mwWJDR5O5OqHK24U+ZGpHOz7fKr1S1ev/TN+j9aUspgpfgW00Wsp4KCG5jYSFELaGAEUO
	cfIIH9RGFDaU6/K3ITVBnVJIwbAm04SAC0MONcgRAA5/9E64lxutdrwhMOmTZdqW/rV65YMe2gx
	7tRegUWaxRVU+mvUY7io7K1o3TugXOBnPO05vgwdml6dfwYq7H8/YgFMEbC4AHLbWZi+xfYcQ5P
	Gp9mt65gXW8bzuyRcXutxAA==
X-Received: by 2002:a05:701a:cccb:10b0:179:a1d0:be39 with SMTP id a92af1059eb24-1b56b709cfbmr13685966c88.29.1795667286345;
        Wed, 25 Nov 2026 20:28:06 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm51792405c88.13.2026.11.25.20.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 20:28:05 -0800 (PST)
Message-ID: <9e9f4aa1-7823-42dc-83b5-e9776096950e@gmail.com>
Date: Wed, 25 Nov 2026 20:28:06 -0800
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
Subject: Re: [PATCH 6.18 000/990] 6.18.66-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261125143822.072087159@linuxfoundation.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261125143822.072087159@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/25/2026 6:22 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.66 release.
> There are 990 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 27 Nov 2026 14:36:57 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.66-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
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

