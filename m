Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665536;
	b=TuF62HPJGauvUuxxyeMKecvwdHMYcWTetQ2Ass+PU8M1q3dmp6I6kVjwjkJks6LgseKN
	 trhUpfmPd/aHJJklSsh8h7D9vCSDwdOJbfHkvAabj/1w2CIvxqRXfxs/yh4KjtezJmVHv
	 N2dXEYFrjvSq9U7seJS7acM9qrAZUAuHTOLMZnInTPZl3SYp7eDQOROINLbpg3hA25SWq
	 Cu8296M9DVA6I+QnsQ6nbgo0n1PdERG3IDBdRb7I1B5ivEnGEUPQRYXHqIczN8oYl78fD
	 0wkUxBhRNS81pJT7FdMY0GQFtkIYZr4MGryb1IvCiESHYjju+MOL8vV6vMszg54OdrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JukNCv19tRLo1eRg8w/7wwr8tQYsc+7QS+KjL2U2X3g=;
	b=WgDY1o/ytkO+lihrDO2FAagfD0jWUxFS2dAvBRjHvnrCMWBFk7PgAjiVdvrLYEV91aN+
	 jTe3Dn2D4YVHsoWRDhUfaQv9IseTO8PkaMw2ABkKBcLbLO6OncnpaBSs3oViRW2uXuKXN
	 7qnL5UPLyJPHfKAvQf7UKEy08CoRnE5kjwW37iJ9pEaAD4kz+TLg1PdudpTRdi0S818De
	 vIFazSizPvrI2I+3GLb0IaoPhhvLZdyolXdMa/cZpPb5IobDDWfL6V3z6C4mhlTyckCPg
	 E7WbiQNITAkAhphfYjQbDFQ9pO0BC2/9BR8ipUWkKzNZHaDZDS7MMFs7dA3ta1GG8Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vkq3p6G9;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13193606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13193606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vkq3p6G9
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-385c497bf94so4512348eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795665535; x=1796270335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JukNCv19tRLo1eRg8w/7wwr8tQYsc+7QS+KjL2U2X3g=;
        b=Vkq3p6G9Ih+soPdA9g2L4Ao2q3l/fvd28otdHxXQv4kMssxkLPAvKgZRXDJyyQOLmC
         AXpMY5ckG5atNY8lfIRMpAJU9nNscG2Ky4dkWlPX+lOGXfrdPux1Ts8GOB2UQTYlukQc
         41x9wo8QDndovSJXbxxPxZcjLoZHc9fwAruDpD3XmdrFMbh0SkSbKc5tOHg5MsHHfMbB
         7pkIhSrt6jyjX4qGtR5ZoHN+2dKgM9y8SeaUpDUtksq5lIYeT2yy4itDV8JjHhT561OW
         BAnnZYYUl9bUynoz8ALSj1eYNcNiSPljfTtu3A2Z4PoGLeaGWEkXYxfECziSB5rxvNxo
         DXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795665535; x=1796270335;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JukNCv19tRLo1eRg8w/7wwr8tQYsc+7QS+KjL2U2X3g=;
        b=dmLFWzrjUOuXUEqcfsbnRzvXqjls4RBrewbbEXx/PpEEXgj6XrCNwbpAVrK9FHmEUn
         3mfalx47Ryd/KuHWS1LYg1XOMpZQm0ye5ZCQkvJHIW0w94bLZq4+ODz0iV1Xp6ZTdcbW
         kLEA9BvP63ycQhZLrh9wei+26yvF2M1aVyfrQekm7Lu2Xw/ec1rCNRd4A8Jha912wcPC
         c3gQbixggaEIgEr5HxYsEmgltA93lytO+YZlkGiZlTkC5Tj/Y4WWjkOuVVBX+lxqnrI4
         8mqWEHxi9Bhi8vgskRec0ADlNmCQn2NzTyRtlrmFXyqgo2EV4zF1KfGnBAnrp7CnY8IZ
         ihEQ==
X-Forwarded-Encrypted: i=1; AL+hErFHYt+LIxZgJqz8oyMDEThWTWHseJSs+j0DIpu0RIhvLF8C36gINcpPnlLQJkwtWJIo7ClfihmJsOmguJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vYkhC0AoMv01VuS6SE2cm4uIv4ksL3lqaPaAHC1B4+U7gTJVF
	I00oHjCF1FZpsbLDEKCO8JG+lfvz83HCKDr3MwgiGnh5y6wbcyKBg2g6
X-Gm-Gg: AZFdTZdcwp+tWqiiDr3/AJFNZp8JDbX1a88hUNeCueUoe9renXcCD+boOMtQX1l/NUY
	dP7y6+Y8Oc4DM+on/7Zq0J7OwovuFuQpdpL43GOuKg4vQhLMSzUm5nsypGR+0MBzydB+AMZ4K9h
	Ki0EQ6G6TFxu8cl9gIoEzW/QaSBPOw6vZ3fPBe5fT0MY9NTPGBCEL2cJI1PzWiDy6sG3qg0RNdN
	LAUnGm9NT56To44L32btA/pmT4rSTFWowe5aDi4OuzUZoMBo17YDy/zE9ajOY9focYUm/DVFnZA
	NFJl33MawpEIOFHn5cTt16lyvvaEKcNpL25J6DPIpeEQ2p9/7Hob1FUSdZShWsLgxQKEXvxoqwk
	dFPpVUAuqkkhZtSx0LkbdfjMNCqnl9T0pO2aJupy5tQwkcTTdUlLtSkV8KrWqPlyRq34OSfEJ72
	bOHcGUbBiUYkawc74ZhTYKJ6I9mw+PFWUjJf3j03eFWhYqtEFYNO9Su8DLQSlrrZn+gmpbhj5sS
	x6SIULoYcV064O1iDnckgE0rBSm7nUmOtWBz077OimYV7uqVQtwIYRvLMLHcKGh1UoAELIllP5r
	Us5f4KT8pMKKSieST2tVAqfr6xKpD+KsjdDBEeE703wWO3XasXlRTykSgsO7wSfkozLSvyAMMX7
	Q
X-Received: by 2002:a05:7300:1899:b0:386:b6e2:9fa1 with SMTP id 5a478bee46e88-386b6e2a02fmr14756733eec.34.1795665535054;
        Wed, 25 Nov 2026 19:58:55 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm27050486eec.27.2026.11.25.19.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 19:58:53 -0800 (PST)
Message-ID: <57b6b3b2-a7af-4b8f-999b-9e646ca7fab0@gmail.com>
Date: Wed, 25 Nov 2026 19:58:54 -0800
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
Subject: Re: [PATCH 6.12 000/816] 6.12.120-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261125143849.205329330@linuxfoundation.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261125143849.205329330@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/25/2026 6:25 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.120 release.
> There are 816 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 27 Nov 2026 14:37:39 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.120-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
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

