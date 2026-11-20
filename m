Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166449;
	b=HS1aK4alRQt5TcAeXgEdbN5lMSOyKJ6FAUc4kSjmPKdI/CVJVIqlPLUOi2R/+DdeOwFu
	 8XLDau3RJvVNT3c8ZHRq734thKsjgmnlflegr+QrgLg3HrqytqHNE2Mgy0eaj1QSDc6/a
	 Om47C6KbOFgZSo2ueMahlmSCw07GBKQCspDMKgGNHJwTuIpRbfFtjj/8H1d3WQF103dRw
	 lhfL3fbADLtwqniI0h8VZq14IA5CkRXBnYLiDQT/4nM7ENrRnpDVdjwdeKBmAj5EjjxP/
	 tlm+9/XGeb7s6JqtBSNj7JFH3Dq+2evWksxdIoC41sgm0Pr+/5xfK3FxTKiC0N9MaHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=czHZiY+9BKHvkt45mR1YoRXSRAiRq1bqN0SePSnojIE=;
	b=XQgI80+E9fL/pOeerAi5kSpxK5K6Ux7PgvCG60Nk1e5+KML6Of2cPNkBqmI/D7xhfMfb
	 fn78Hb0wGga1GhdKIk5XYaSaEqIUwytpyFLj8n9+18rt1XAT2G+u9CSMSbgu/SY0pF4JE
	 G4zvl84w0mkjr9apVbO0twhHf/TUpMPxG3REOKCt5N58NXxWUK88NjTdY5zmpljEH/n7P
	 lQEBqfSLgQ0/gQbWOv2Vv0Q4bL66DvSnNEMU8XYUNKOIL15f5SuUBA43cMQ/+DpjClQhA
	 dMFbnAGmG7ez6mb2Y22+Ej/8Jlx4cfg5Kb+shS9CEmIYup+YPSaW3zZem8dmBkupssA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yvTUcfOC;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E527060A2608
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E527060A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yvTUcfOC
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f0414c1062so3724415ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795166448; x=1795771248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czHZiY+9BKHvkt45mR1YoRXSRAiRq1bqN0SePSnojIE=;
        b=yvTUcfOC31qicbyqDhv4SOlQIQxOgg7X9RJyqWyAV/bQbKf5F6FZuOl8Etrri3HAXc
         2gNp9QqurRA+4hLJrZRM+9T3tH+et6DikIwDxsAhpTVh5pVTus4HQAutTZTMrnZ4Op+c
         kwPEbYxRE3LVCCMglC79plzpZXLqnEAfG8pF04T/Ks3eoumGVIZwUHVweH6Wk8FtyPLO
         5seqfm4T/InhIyzG6c7aVWea8xamYXwwzW3ahz1ASojxVu7z/EBBDbgybqwkc4u1LRg/
         MOfQOti+EEC443RVfXTVRo9+e40lo3shGkjzTe08iXODBELU8g1l3r9BkSIUyC/RdUVT
         yybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166448; x=1795771248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czHZiY+9BKHvkt45mR1YoRXSRAiRq1bqN0SePSnojIE=;
        b=LNOorEMjZLlZjPm0ry6GYpf+qBud5YZm1j5VSMfRWMqxY/XG0X/4Qk8kEdrCosCoGB
         oVdIya6ouZES3+/bXJ+nshyzlexcIOFs0B+g0Da+jv923HOZfLQVVsBK50vSNHSy/xW0
         9wNUSZMfDa3AUC7bhXxAEC/wxNnVE3SH6bGKyYi3sUMdFTs6mW4ICDs2acnjb2Sstpva
         mxCgNJ45rZkJ1/27iq7xItJLpY659W//hKRRcqAopHSRpvUhzNOS3OT1buLKihABu+Og
         sNI4c68HVOeYhKLyHL6yizY4LRqfS6pa855tME56ZtqnQjamWlr/e6ptKDuaUbBgFQHH
         2wkA==
X-Forwarded-Encrypted: i=1; AL+hErF3JO6+dl+j8FiL7TGMLZdPqKOj3ytgsWYyPuvcKHiLqzqEl6YzaacexdkL3AG0xT7IvBNycrixNBPdnTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jktu3h/bfFCahnIFqXd1al5I2+7dqj587BUwiToFLXK9PMUyW
	IqNJgsL0I5IinJ3xUhTJh+gC9yZ8/1e/c0j8fIGQD6Kw1xg2bftTid0o
X-Gm-Gg: AZFdTZfEzlCCVUwCTmbkIWL5thbDBeYjY0naIY2gxapsVFhXWWXdJPDbTSa0yDNWNkK
	a6ppW1ovAqM2fyDNm54ErcKh9hJyS/XVaXvwfLDZcLbLLz7+I1b9SDkBdITogtB+0rpSwYSGT/S
	bIGxIqvpl3UMQIjUsoJvXEMBDidUlZFYOpNySMrjHtSiSnnv3hf8ZnEdrjA3vLSaDXIF4sO1T2/
	OsMKlnmj8l4zlQEys1H4y/U+V5g4hOiUf56WYnZQ0/sfrNgbLyKvBqjLX6PDc4HKbSxLPFtd3hI
	DBip68HdbD0oShF1PpuG5nJ7YurVq8CKBL6tCok2EHrxWCAch9+Ji/Ms7/FiRiqFmrwz1drLsrR
	WqHCHZoRjLhlTDSeqD5x8Bdedlzk5V+yZDen3MX12sq7mPlUViXjgZmOqli1AdO/BnWL6/ZWUH9
	nCGaG3wVv+HNZNFNOd7L7+YyQlmzIeJ8LXF6Gs/Ad/fl2Z3dnSN81M2QwgylvhSf5XedKk7Ew3h
	Adl65rO86jAqiNuvso5ZyfgS/7may1E3VUbr5NqrBhOqsO6rLVmssbp53Xwi7rJnHmkAVBSo8+U
	89CcwyqzEdMbI00KauXVX0VfIkaHypyrM//JUMTyGzb64l0dVA==
X-Received: by 2002:a17:902:d54f:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2f03f118afdmr24187105ad.12.1795166448218;
        Fri, 20 Nov 2026 01:20:48 -0800 (PST)
Received: from [10.222.1.82] ([59.20.222.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dbe86sm11689635ad.32.2026.11.20.01.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 01:20:47 -0800 (PST)
Message-ID: <6c7d8900-2b68-4431-8599-527fabfef882@gmail.com>
Date: Fri, 20 Nov 2026 18:20:43 +0900
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
Subject: Re: [PATCH 6.18 0000/2144] 6.18.65-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261120055114.182757740@linuxfoundation.org>
Content-Language: en-US
From: Joungmin Lee <leejm516@gmail.com>
In-Reply-To: <20261120055114.182757740@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/26 2:58 PM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.65 release.
> There are 2144 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 22 Nov 2026 05:44:39 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.65-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h


Hi, Greg:

6.18.65-rc2 successfully built and booted in my system without any
notable regressions.

Distribution: Gentoo Linux
Architecture: x86_64 (ASUS Zenbook UM3504DA)
CPU: AMD Ryzen 7 7735U
iGPU: AMD Radeon 680M

[    0.000000] Linux version 6.18.65-rc2-myllvm-g7e0638af5322
(user1@gentoo-zenbook) (clang version 23.1.6, LLD 23.1.6) #2 SMP
PREEMPT_DYNAMIC Fri Nov 20 18:08:46 KST 2026

Tested-by: Joungmin Lee <leejm516@gmail.com>

Best,
Joungmin

