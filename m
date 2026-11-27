Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781615;
	b=vChW2ZnRHvTgdup3kCmlU4KwuO3anzUCUESDVc5SJSFcfg0OJL0AtSaAttsrYj1qvYEZ
	 mBVFzm396KgjUc3HAS+APNnkLbDjZtNE70gA7fmfQ+rw6NbyWhWKmA3BZrOT8e6Nt/mIz
	 opdeWLjtBMJioEbsGBr1rSHROQgdD+WYhFc/SgjxJBjpo3AaP9gXbBQNQDr8eNU019PQn
	 cy9RRuRqA36t61fET5fpjH1YxBZ818+wB6kaePgkkn/hXAoYVwwL3DhQncxDDMQLS6Lgv
	 uAtfSxiSXeevuSb7Wc8NNx181sL1Upt6deYgKlfXgtHZ7doPH+ZEHKxYLO2KBOWt/hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mjC6FgNIVsXbCg4Aumv/+ieJ0D89Y+p0kgQ3j3ncaCE=;
	b=g2borzzNydAiwkPyKhlvCG4hgYQtimivjLKP0Dcv5QY9jcLqTvbQCT2HnsuuHlFMtkt+
	 eGcp5HnOtPmaacpe3zCpAeKnZ/jxh5Iv5jcD0uUflc1otEHrwcMcfCbQ4vy4hSEkOwHZY
	 XqTsGEfQSYK9jud7qheptCVY0PRDnf4sF5gr5Mg+tdWS/cwbdPpz4U1+NLTJZVGa+6CsY
	 o4v0PQD2alsUS7LASL55CrtLpnaVO6o21ti0UncwMCmLam3K+h7RroQ4PeUqZwnAWaQEU
	 kyBr2uXIAKn+AkbRhqTXr7Fn8Rg9FqU1HaozAAvNyRrYc7tQ+20SlCr19A+1QKUwo8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DDtrKGHS;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE67606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFE67606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DDtrKGHS
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-498f5fa5103so4775183f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795781613; x=1796386413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjC6FgNIVsXbCg4Aumv/+ieJ0D89Y+p0kgQ3j3ncaCE=;
        b=DDtrKGHS6tTqnBkHJtDIsUNqxeCUOPQ/MUtdxid6v4umieY7WgS+aDrpHFEFhI4hAN
         8rtrMSpbv7iUlW6Cw/nfs2AS+2WDcdfgVf6Sfoo+NsRs6IcgpJAMQmlYDmQpiZU/6vY7
         JRUzKJcWQs7X85oOPaYxkrjxE7nxhsvDWhchTTjkIGZ0j+DzBOH/Z4M+HMxq7fwTQzRJ
         KzFgThhPRBTlH+UUEJp14xU1zRYkR3ZX9YGzrauCGla7R+uvrW34OEnXamprJDgtsn1i
         EAAky3lnEuVWdjVIf7vfrmLXJTZETw6P5iKNpKAmfN+WRkT33Mnu/lqIsf/CsTBJda2W
         HXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781613; x=1796386413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjC6FgNIVsXbCg4Aumv/+ieJ0D89Y+p0kgQ3j3ncaCE=;
        b=PxgNw52IrAOHX1LrV88rWQqbL5gDWqWQOEyBLvm0fEIrdlKs8Xd9ZRMCvHdCCXfN1x
         y8RdjP/g2lYHNr3LDLcZ+pEzG5Z7p/BZ1BOKIf5JJcjDGeKRWeBg9Byj7umVsZqcSIDR
         tUp2I2jducXt/rmxrFk1LYmLwFDu3smurGx2UzA1WfKtznnxlN5diiAK493wXQSFzuJn
         v/OiRJ4PG687umtClWZkdSxar6QjZj88/N+o9FyO7QbHT/pTPel0CgdhSN6yt7InVAto
         cMTiBV9NXP5nIW6hDbQnbCAxmU4BveQpUTzxK4YHIy/g/NWpvfcCtPaUcxM2asmfQ69F
         STlQ==
X-Forwarded-Encrypted: i=1; AL+hErFo3rLtArL+j8yzCdAzddS0UMugr5kLdlngNBFJe/zoH6/kkZ7SFvRjnWmkhY+1EY2TsOzOOu1jGgluN/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JEWX5m07B//TikDXdBhFzzpwrV1uf+C6AkSp0eme3xn0p1tp7
	i1eQAMyXBz215FQcfio6KhLVt5IEW/bwkWdD2SeU59djtBbwSEoCkwmP
X-Gm-Gg: AZFdTZdMMa0ZAfCMbPE18H0pJqSsqEWiZJ6vEj7Kyj0p74ybMxjmzpiWZJIEL6cGqiU
	irBA8VwWpWT1qcVXMNbtA+o0ONEolrJd78EDJ+a5vM2GL3p1s5Q1dWD4OPvwalw1JY0v0eGkjL8
	zxWQspy3z4n/+4LTzUMS6KJGNhJvsVUzExpgtoMk3iw3YtUrQV7UoC07Gv6aSxghLTL2qNr7H4T
	fh+A9NbWbCnYq/AbNr9Ry+CnKkcm4e8k3+O1WaqZZyBLOZMP35fZ0pC0RPmk3sTqfRvX899pI53
	PW67RysNZye9MwXQUbHaV4Fl13EOu7qcLc3NSvy3RnymVjfwWYL0QSyGn97XZRItxUJxW13ZhRE
	OWYo1dGjIamoajGvIlUEsHt/re9/xfYVRZerJAEdBslOD2ROBAfCiqF7gLFRE9utnQ4oeE9hA0D
	nnXl2TBGbD94WNbDma4vHkGReP580JpWn0Xn4vdjsa4QvexCPAKr27nPgKSscDD9SL0JFpJNnvA
	8yiSQPULkGGVX4vjsGdXggqLFLBCGt0ddJ8nQpFaW4tIFAVW9Lh+BaC/OQV0DXN9JI8ruDYrKxI
	fUB1R8g7JdH3ZQwuvPGr43oDpbQSngGk5VvymGWAH6nrUMhoXwxzhlPrX7PFPIwIEEEH2bd5pKy
	OuZsZTwEayMEFCGfZhEOnlofjtttd
X-Received: by 2002:a5d:5c89:0:b0:4b8:6c3e:95e9 with SMTP id ffacd0b85a97d-4b86c3e97a1mr21394747f8f.28.1795781612726;
        Fri, 27 Nov 2026 04:13:32 -0800 (PST)
Received: from [192.168.68.89] (host-87-4-46-207.retail.telecomitalia.it. [87.4.46.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680355sm38572390f8f.27.2026.11.27.04.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:13:32 -0800 (PST)
Message-ID: <9e86f015-0f0e-4897-80b2-9662b96a98f8@gmail.com>
Date: Fri, 27 Nov 2026 13:13:31 +0100
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
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: sungbyeongchan <tjdqudcks0424@naver.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, stable@vger.kernel.org,
 patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261125143822.072087159@linuxfoundation.org>
 <20261126173920.GA180459@francesco-nb> <20261126174236.GA183126@francesco-nb>
 <2026112702-donator-rebuff-16b2@gregkh>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <2026112702-donator-rebuff-16b2@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/27/26 10:02, Greg Kroah-Hartman wrote:
> On Thu, Nov 26, 2026 at 06:42:36PM +0100, Francesco Dolcini wrote:
>> On Thu, Nov 26, 2026 at 06:39:33PM +0100, Francesco Dolcini wrote:
>>> +Nishanth, Vignesh, Michael and sungbyeongchan
>>>
>>> Hello Greg,
>>>
>>> On Wed, Nov 25, 2026 at 03:22:47PM +0100, Greg Kroah-Hartman wrote:
>>>> This is the start of the stable review cycle for the 6.18.66 release.
>>>> There are 990 patches in this series, all will be posted as a response
>>>> to this one.  If anyone has any issues with these being applied, please
>>>> let me know.
>>>
>>> Failure on various TI K3 boards (AM62, AM62P and AM69), during our CI/CD tests
>>>
>>> [  477.440292] rtc-ds1307 0-0032: write error -110
>>> [  478.374406] wm8904 1-001a: ASoC error (-110): at snd_soc_component_update_bits() on wm8904.1-001a for register: [0x00000043]
>>> [  478.464258] rtc-ds1307 0-0032: read error -110
>>> [  479.520264] rtc-ds1307 0-0032: write error -110
>>> [  480.342404] wm8904 1-001a: ASoC error (-110): at snd_soc_component_update_bits() on wm8904.1-001a for register: [0x0000005a]
>>> [  480.576282] rtc-ds1307 0-0032: read error -110
>>> [  481.600274] rtc-ds1307 0-0032: write error -110
>>> [  482.310409] wm8904 1-001a: ASoC error (-110): at snd_soc_component_update_bits() on wm8904.1-001a for register: [0x0000000e]
>>> [  482.624288] rtc-ds1307 0-0032: read error -110
>>> [  483.680291] rtc-ds1307 0-0032: write error -110
>>> [  484.278402] wm8904 1-001a: ASoC error (-110): at soc_component_read_no_lock() on wm8904.1-001a for register: [0x0000004a]
>>> [  484.320383] INFO: task kworker/1:5:66 blocked for more than 362 seconds.
>>> [  484.330368]       Not tainted 6.18.66-rc2-8.1-devel #1
>>> [  484.338741] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>> [  484.350050] INFO: task weston-simple-e:783 blocked for more than 241 seconds.
>>> [  484.360452]       Not tainted 6.18.66-rc2-8.1-devel #1
>>>
>>> According to claude the issue is
>>>
>>> commit e498eb93f961 ("virtio_ring: use shadow flags when detaching split descriptors")
>>>
>>> and those commits should be dropped
>>>
>>>   e498eb93f961 ("virtio_ring: use shadow flags when detaching split descriptors") [22944d517ff8]
>>>   9dc6b944f16c ("virtio_ring: factor out split indirect detaching logic") [44b6e54e4a0a]
>>>   4b7bf8d55032 ("virtio_ring: code cleanup in detach_buf_split") [032159f85f3f]
>>>
>>> I am not able to do any test now or tomorrow, unfortunately. And the
>>> above analysis is just claude. Might be correct, might be wrong.
>>
>> 2 more cents on this, it seems that the issue is the communication with
>> the device manager. 
> 
> What do you mean by this?  What "device manager" and why does virtio
> have anything to do with that?
> 
> confused,
> 
> greg k-h
Hello Greg,

Reverting e498eb93f961 ("virtio_ring: use shadow flags when detaching
split descriptors") on top of 6.18.66-rc2 fixes the issue. The tree at
e498eb93f961 itself works fine, so it seems to break only in combination
with a later patch in the queue. Still investigating.

The "Device Manager" is TI firmware on an R5F core that serves Linux's
TI-SCI power/clock requests. Linux talks to it via remoteproc/rpmsg,
which runs on virtio_ring. With rc2 the rpmsg channels to it are never
created, and I2C transfers start timing out.

Kind regards,
Emanuele
