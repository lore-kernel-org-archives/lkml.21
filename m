Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204188;
	b=lvyjHo/7WZR8r1r3qjcYAh2779Cxwx+n++SfhPAuDgOuykKiNAmSxeEPD2ti6w6gKfUN
	 DSXAJtk/IWujO4LorHokvQhD+fgR4Fv7QvbVyYX4Iklj8pJLRskZ1NQXwWl3NbayjZ9t8
	 BjBMpY3Re0QDD733r/kvfDnBLM2nbkErREqb6vj4LQGEm52FLx+/6TaJ8vf4AuDlk5BbR
	 /iLGKp0wU0wMqvIxQej+WPNMUK1aFfCAYsZgH51XNbt79aZCFh8WxGa0I0WyJ3Waf+k39
	 KKtUw2TXbxSQiBBn5Jr3j1aiDqJFj5YJH/HZPK+Ilm2gAzuRQY0AyksU8PxXMURWBZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qmrspoDYekLGdhjXLm1nbvWqmbjAVLQNUEcJXmCtCSg=;
	b=EzyE0FHIwCatYJkZZoxnew9vcTH3PvrLHMq4wg5xPTqPVLszxUQRayI9xTxGKXD8kFZ3
	 Ed4EU+lSlFS6DMVExgwYPJCH0OhQzOxR4WVyc7YIUpP2UQpauGE3Y1uj6XhnrNUvi8N+5
	 9o6VKLk4pMRqdZFDHcocF95sIMyc7+e1L4WB/xLUhS+QpIQRYudMZSILycc3AWBQjAtk7
	 hV/qqRtLSgTDDKt2QYikplpfUYCgDCZ+Xl02Rj52htcGmJBN3ep7miaINS2FL4Luk0hy+
	 ytEtoI7Mv5Rqpnk9GAiaBYMpy0B5VWsN09p6mZbFBH0uZqEmHVmKTUFULhyIBwB5R5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JDctpr3V;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDDB606A6E5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BDDB606A6E5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JDctpr3V
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-921342fae7eso14157686d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204186; x=1795808986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmrspoDYekLGdhjXLm1nbvWqmbjAVLQNUEcJXmCtCSg=;
        b=JDctpr3V3nwQPzlpYzkU7srT/vZyTxiucugbB64tnhNzLkNdo09f/Lw7hEycEE0geV
         +TFj9MJ1jyanEwy9ASLwHHfSB4TB17SKeD8HZeIAT2WCP+9ijt1JGxC/vkEJTAvCNK08
         L7IEyWdOELJ4b6iQawPZd4m6A4jDcCPzHDBRgrx9zSA7CgHW465xOIYQ5oWyLswUUDJi
         w7VUZaeTDj/IL8cJluZJShJgMEPmWMJ4oZj7M4a2+SiWF9vkT5cAJ/tZJDqSooBA5rSI
         uuihWcwTbJ3TyIbmAKsGguJd0NMTcW2BibpAksQ1N+p+FaVbGER9/3akpioktfizqmoV
         E+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204186; x=1795808986;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmrspoDYekLGdhjXLm1nbvWqmbjAVLQNUEcJXmCtCSg=;
        b=QWWrigg5Zzk5MCD0pbt2ykahT+wGMXLBP2p+zOzI+/5NQTIHLCKES3dSrxzxuBtT50
         KpV18SZq+MvjdxUJhPowvveUVkwIRiB83lUcdDzh/Ai3Hzz5zGtCF3olL+Mls76wIDeq
         ElZrROq2mu+B37m0S/sDVc9HgmoY8BRNZG9nA1CsvpY/zkMQxzCZsQw77niGlJGUZMXN
         loHBrlHOyLyUxzgyGPQBOyI8BzCT8pDPjxF+y7dLY7Bft5y9UD0U1e9PVMa2DoXm+bQ+
         /2tR0N5Rdz2cUrT2b2izhzxZuIa+hA6xuvqGBgS9eDDiU9vj5CtWf45YxUTM+qDAkZsc
         aSRQ==
X-Forwarded-Encrypted: i=1; AL+hErEnccGm8/sBxQFNqRqPWX/jOE36YO5h/IUl8lYbhZEzMmz6DLfkUhuWPl1dcMmWWok1T2/H3Pe8Pacdvg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DExaIkRgqa/wp8a6TMt14U7xIQpDzC5h2+YWa0BKkebytN39o
	CeofFiZgkMS3U2vxlJ1B57lzKAdK9QPd11cdyYTi1IuNfs++1IOqj+vK
X-Gm-Gg: AZFdTZeQIsJbK8/xtwPDweGjs/M/omIX2/XHOxLgnnE5lhnD2tLCQsEWMiHfGzcQ6dO
	4c8a0W7IpWFHustPI8R1FLE4UAiHAbn4Xs9uhja2+oETEctGo9jPG1CTZRFVOqUGayuEJ3hUzre
	7XJwfVHvRDTTYKmN2+nmBaJxGbH41RihzVGodnuL2+hBKtnhNdzSCe47/QYZqxCiG5bkwuNNCgR
	fH3QpHRJkI6kw7CwD1CWIGMfgWFWjQC+/flp6ZzdocuMSOrk6Gs7GS4RkxmRNZR7C6eKK5mYUi6
	cpAtg8osv75Ndz/LG39GOIyD1xqN7PHTz1X+kvjMlTDLMd7/b4KRBm0uDHZbnP87Nx9Sc6orS3+
	AcXrJIv4ixrRfb8sMSE47PkIG1LTd0dfOeZDwh7XQYMVXbLTW17Y9dcSi8Q+EndSvTHNZkR8kMB
	kDwSuV9xQpOQOaVI3HJEJ8ud+HD21v0VEclkUEa6pc/X76bnM54G4mhPfhuPJxhBeyMGTgtETMZ
	6+wHU8k8SB8Yd6MnBAkexkFCbT7/Rb4fchYQXL2NGwJ+NunLjq8UaGfx4ek2rfssFKaUFvRcqdo
	RrCHF00z2wvLgIBKNLK/Cb6RGPC/gnHfYLboUacN50DBvQEZxKomqaSIoA==
X-Received: by 2002:a05:6214:5c81:b0:921:10b4:48cf with SMTP id 6a1803df08f44-92134ab9b6dmr64832756d6.46.1795204186213;
        Fri, 20 Nov 2026 11:49:46 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b081csm33351676d6.7.2026.11.20.11.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:49:45 -0800 (PST)
Message-ID: <16b5699a-69c8-4d57-ac71-e61b50846415@gmail.com>
Date: Fri, 20 Nov 2026 11:49:42 -0800
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
Subject: Re: [PATCH 5.10 0000/1811] 5.10.275-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261120054906.397973290@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261120054906.397973290@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 21:56, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.10.275 release.
> There are 1811 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 22 Nov 2026 05:44:39 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.275-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
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
