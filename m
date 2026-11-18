Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028987;
	b=cCJNc+VDLNhTIJAfbfwUzdJdvJU+xk58tQ7BDJ69CGwmf1xNsICaUx6VVf1pn++ESQM3
	 /Ud9LjS1aB82F1Lq9Ju0L/IHWGc6A45Knntc6FUuzArjfGuXoW6IXCFu5QEYr4//EUewF
	 tb6ku5GOsT0K0tLiHrDFHT4h2fKU2CYgVPsj4vS25Bnx/yRAg5kLpRo1RE2taOnBbidk2
	 7PexwU1Wf8cMyFmwoobHxHht7FpIOhCpI7887ALtnbQEzn3UiKuDeXoYxRUq0nNkBAcKo
	 nfvywdFhgllkyE9GLt0GQ0Q5iYRWm18FUqHuTi808xL0J4/kVeOUEu8wi5Qd6uCewKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=brrMobb22TVB7XAlElAFp7KL45XZpi3Q5Uug9IjkUY8=;
	b=elFFEKNU1OFqwnjPCICdqdw+D2RDKI0NPLpHu6sky2HzmQZjQl8IWX8lBbghKRDMFRU4
	 LHcLadhOtXjCVgMCqAGOVIF+I2VtWFyuYwYTFjJ8FY50T6TgucGgF726RrvXBqYcYbJt4
	 LVByxJwoqNn2MwlS9I6i9wM18rNNwVXjtOsCuGR1BPqpP48zJ803jtmBqOfQ6plCopvl8
	 EPX017XqP2QfRF6S1XgYQXcypSmHJXuJui9Pfa67mTwkuFhShgySdXOSMFE+Swh5IwzPc
	 TEtZ6qw4j76l7aVV1S4naPn0XgN6yxLfO2emQtrUh4biqFemzTFb2Ow5vIs4Y0rPiAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gT+EETXY;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A09606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A09606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gT+EETXY
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so867853b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795028986; x=1795633786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brrMobb22TVB7XAlElAFp7KL45XZpi3Q5Uug9IjkUY8=;
        b=gT+EETXYIE010bwxKo6vWpa7kf0l4yi8HQnH7m1lMN7Wh5ilMCZOoPC27ui0OnQ6Xq
         DlitK6G2tGPyXdSNdFI0wnxICAsHb/JS8TjVu3Aw6bj7BBNBC//kSvugcV2q8Jrd64p4
         WSn2DmTbPXAS7YD3xc2YD8VanB7KJNp9ejN73TQqKDP+rQcHgM6j0J9fIsNywpuL+FuN
         N0dcbf5Hd7CVxYc5E7sJ8m6hFfD6tNKuSWuTnzuwdyI9LV6B6mFJSQCqPcQRzDck5yOQ
         hWuDfjTk0B9zyfiEftR3Ev28PCj06NZbVIWjwvSJjhFtREKz+r6PM6h8k5VncprWhpGd
         aNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028986; x=1795633786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brrMobb22TVB7XAlElAFp7KL45XZpi3Q5Uug9IjkUY8=;
        b=huWx+bERv2fhygg386uOoaRYM6wAUwJezcGHAzxdtQG5Fj6raZdZJgHd2dh7tiNCR9
         dRIVC/h2r9eLHrJISpLOcTHj3EH/gvXnMkT7Nt0c9ae6xYcSkQTnDj7H/Jge2kXm/mso
         c/aj3qp7eodngDbEB9pQZyvibz7SWvDgMJQmh0gmQdnv1ZrI0quajO3BxM8TGA6nCSlR
         8amHDhosOHKTSYdVSuOLSj8YTqjpT1qSVnYTcDT7PZmC+LvOAAGEjctYKAw6oWt6OqK6
         FFAS3J+/LyumIaHuCR7NH/xNhl2sxHgpfEf+yz327opaXBqcxWFHkCwq5yAyghzeIcaI
         gL+Q==
X-Forwarded-Encrypted: i=1; AL+hErHKntvOmePdkhcB+F4SNHW6+rgpPLBJgymSp/F8p2+lxh0xgK/ivWB7vYt6Hw4yegeue0Owf7aNlEilLI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z88hYmKA/EoWoPPtwCauv81SJgT13711w0dypi4iVTiGcSwmonI
	DaTlk38VqlbQ6E5w5xN7Hv3opPKZC1qkWwc2QY8s6KUCv+G20mBEkYXm
X-Gm-Gg: AYBFou0qMcARbnZ//6/3bqiRRO/GoMdb6WvIrmMhdWQUWoEm0XrTTsaxur7VtdAVlno
	arS+vw1X7iZ96V9WuZtj2NJsZhFQEFQdiTYo7xR3WZpGfyKpW4gkD/aOEJLAIj9hOB7m0/7aoww
	OgDR+geUE8TKtw0PMOBtWsob1uvbAdshSnNSBD1slVmKFs3Ei7Pd45HciKsRxA1FaZD2iL8qtHz
	7oiF+G62SA8eEK3BLbqFBCN358TkQ83cb4BHFbDYl2FbccKfZ2nKu11Lwdh/pz5gLB4kXUBXVx7
	UNeRuamniM0TnqYpEeO3sQjKA3xNSb9G5udGbHbhk2AY+0qJXRcwpos38JQ741Hou0eZDP+h7uS
	GMlLGyyIxt9tRYj6fTqaE0hKD9XYj1uI30Z4sziTYt77tmB6fvGeJIM0BqnHnUe7HGeyahp6xXw
	3HfTdSR0bCZ/V9D/wVUMnd3vxllcwWg5cT2v1fn8tQWzzNkwyarEp5tjj62k31id1zENcbSurIg
	NBRjjkCmu5Jr2el7ZUQ9leev5rf4jAgQ1WCDp/RIOtgcEiXNVHcW9tqPXJETYh4hd4LGryvPlfS
	AMER0tnyemvyH2Y/N2ogJgP08GULwtyhl83zibESgWbuS7QCmyrEm69M
X-Received: by 2002:a05:6a21:32a0:b0:3f5:ef59:3aaa with SMTP id adf61e73a8af0-3fe970fafc7mr3891623637.16.1795028985604;
        Wed, 18 Nov 2026 11:09:45 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde53462820sm453966a12.10.2026.11.18.11.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:09:44 -0800 (PST)
Message-ID: <42cce255-f459-4386-a763-ff46e77d5f6f@gmail.com>
Date: Wed, 18 Nov 2026 11:09:42 -0800
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
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261118145911.150052362@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261118145911.150052362@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 06:33, Greg Kroah-Hartman wrote:
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

perf fails to build with:

util/jitdump.c: In function 'jr_entry_pid':
util/jitdump.c:416:31: error: 'struct nsinfo' has no member named 'in_pidns'
   416 |         if (jd->nsi && jd->nsi->in_pidns)
       |                               ^~
util/jitdump.c: In function 'jr_entry_tid':
util/jitdump.c:423:31: error: 'struct nsinfo' has no member named 'in_pidns'
   423 |         if (jd->nsi && jd->nsi->in_pidns)
       |                               ^~

which is coming from 428d7a722786 ("perf inject jit: Add namespaces 
support") we need to also back port 2b51c71be599 ("perf namespaces: Add 
'in_pidns' to nsinfo struct") as a dependency.
-- 
Florian
