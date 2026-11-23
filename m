Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470716;
	b=Z65VAVa5kWAcDCWy6tIJdM0MmI9FtRgexLfOT3C07SGu566//4b3PwshS4oQlT/wwW2/
	 l0ZBZ+pZRCK16vd8OH3EePClPpOftWiZ+y4SCxhFsOndeh6wZDG87DY7pUf3OBBl/dlQp
	 bTO3xJy2s4mP5qnoy7Jc0wBcir14MISN75nV20ga12LUCvlfYcDagP1ldynp/s58cqGlW
	 YmL6R2S2Cw7xedwko6g9DhOeAwYLkcmTKGDghDppafyTAKhAzt5cUvyOrkb5UokcBjfLU
	 acPQ98stpeMipXqCeoteFA3SagzWSMV9XKXV5ZDf9mxO9+4Pxq/GfSc09UZMGi2x4IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2UGY/oTHLWmVAYjT8YaGDfb9jGbAf2o4kEDKWYab9wc=;
	b=cdRxyp3PePRXKm9NwoCvRz4nBR4RYc/6oFV22jwI9X/c6HIV6TU0GfTwkLhi9Vke1c4l
	 94TZiCvCMSwP4fcFY0qbOiyOQol9DLDj/0nNVq1Ym0KQG6qvBVWRnXelAgLSRQoBFpQG4
	 pvazsVWqNNi2YJ/f000HRp93rlqq4y3zAxCrUVWGBeNtze05Crn9+OL3T6UrbFPRxE5F9
	 Ib2IqD3PYsyrfDx2tUKYN4a2U5zG7Jbid10xL/5wkbygPWzGT1ktezIf6OTtHjWLvlJ9F
	 0kAUpfHOjBnO4555I9ssTHcCOEcBkhOfTTlyX/AoQvXxejttFGxSspY9LVPq3GBLWWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFcsjKfv;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F55606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F55606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFcsjKfv
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb609d9bf4so8623465e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795470715; x=1796075515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UGY/oTHLWmVAYjT8YaGDfb9jGbAf2o4kEDKWYab9wc=;
        b=cFcsjKfv6H9NbIuMZZX7vTjnybJSP55lQ/PxodsxbdsBN7EPPVCukPjsOdQG1y5Swm
         vAt3OTEuzeSgbrg+4u27MnR93ucW+/AsaF7XAUJ0T8kgemKdrcLcuuY5cvAo+1YDCNMq
         Ho1TaYJg+Mue/Ykk64koPLvfAbnj1cR34lR0Da3uT6qj+mhmN0w74T4kGfo8TKGzZhaS
         wxTVUnkDXAPBQVc1MT9D/fe2LNwWGNJIOlVeWwKhYTu4CHNOTRGuM/FJJ3nFEA7Ml/Hg
         Mdm/efETk1APSp/NObZwp8Vqw09UFOiB5SUcMAQ6JJo5sapV+Q4cR/Ojg7DrgwUJxqkL
         D7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470715; x=1796075515;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UGY/oTHLWmVAYjT8YaGDfb9jGbAf2o4kEDKWYab9wc=;
        b=1s0eDPagBYpd1b29kFLhWB4m0xkQG7QLGjgGOz5jAjBv9czuzTTalV25ZAd8nw2yya
         vj159QNavM5TBWT3manMpT6xDJJyePEImUpL3yd/YwpQ5WPiSpJ/3s0TP+tpzoetP0n/
         +49dzH1mP3hhPD1ELMHIZbdBqO+5YxyNnEL+FrScHgbq2BGuAb9J08AbOUJ4n+EOGExy
         IYAnqmRH/cAkWIchMoq3qDSGfEz1FLagVyedRqoEg3ephMq9tz+ve9n19nZaWxIPOmm8
         aPDAHBNDXfVMQqOymLxgZQb9BAO/W8B9yklbwhe+zOoAqHgxzcoCBXTOEj/gYgXKZpgI
         cZig==
X-Forwarded-Encrypted: i=1; AL+hErG31MmXiFhwEcyZySI+ipeQNgbphThTcA2iKebvher8WHDyxM3DsRZ4jLlfwWP/l0+jCwK62AluQqOotR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fzKApwcd7NhZlOUHoOClkVDz/l4frCM16lZWdYevfNJeb7opZ
	zSMlVBS3VASULOFSm0xefNoPiGWbDC9Mi++yn+clPLsPdTFO1w7Y4UCwpqH+EkRONrukFA==
X-Gm-Gg: AZFdTZej/TiRkVsnooPY/HocKdoVWuvITR9NzMBIEtE2e3JazGTYsf1QFUZZk8YSJl4
	/3iqCNilh0A0qsk2bBo2Ce9QK2d3nOj6ftDdrLGoCDpoQ4EIfGNxPa7RFJCB07LuH+tcSLk+mup
	fVyGPZP+P84PsGBw2BPbjXB85jFEKCrPf+PKXJJucg2qyeO6LfR1vVYaaq15CL6Q3Vdf9T3yy0S
	6dlhv2BwfGyRWYb9idGpqAZmkKuX6XbdK845nLSERX8UFjvyialHBgO0WOofNh8QIsASnVwmF/m
	qggT9uNs7D9aXRAcZlBfXN+czeWR+WdXRlAElx4nc4mCk8q1ikwVQh8pC2mlzIlTf1Nr+XFOfa4
	k7GVCdbKHnLIeowI/cnGLqAIwF4lRAd3nun74auLS613EcedlylpTiPEqeUC8pQClaKR3CpBPbU
	6HPTRRL7OWGBmvT/WKO4wbTsevHER9jbbXt4dFX9rcS5cSHG/VQloKQf+j5RuLVqBShdBBxBxcl
	3orRBN2Rvs9q4xRKrUypcW9lFX3U5gdSuilZQ5ZWQC18k9XRRxAE2L3Z6qyBIij0RyM/pTf9izS
	w9XehoYtKrsSXwwdXVKbER5/8F++/lGu000uvebDNPFphezMWaSkBp91KbYw4Tr66nvPK0jPx4g
	hPhIiiADJ80tc4jJFUh4yuJZgyO5Uv+bU1GqoqgTTWqeMrHNbFGP6p7rjjXJgemKTbVkZ
X-Received: by 2002:a05:600c:8a18:b0:4bb:7ad9:301f with SMTP id 5b1f17b1804b1-4bb88806505mr189200245e9.2.1795470714642;
        Mon, 23 Nov 2026 13:51:54 -0800 (PST)
Received: from [172.172.2.5] (host-188-174-207-233.customer.m-online.net. [188.174.207.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm170594995e9.1.2026.11.23.13.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:51:54 -0800 (PST)
Message-ID: <f5984b2d-6886-458b-baca-43c76669d2fa@gmail.com>
Date: Mon, 23 Nov 2026 22:51:52 +0100
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
Subject: Re: [PATCH net v10 2/4] net: hsr: refuse forwarding devices as
 HSR/PRP ports
To: Paolo Abeni <pabeni@redhat.com>, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org,
 kees@kernel.org, petr.wozniak@gmail.com, qingfang.deng@linux.dev,
 fmaurer@redhat.com, luka.gejak@linux.dev, bigeasy@linutronix.de,
 xiaoliang.yang_1@nxp.com, skhawaja@google.com, liuhangbin@gmail.com,
 stable@vger.kernel.org, sdf.kernel@gmail.com, lukma@denx.de,
 fmancera@suse.de, danishanwar@ti.com
References: <20261117141922.20-3-xiexinet@gmail.com>
 <179514132185.3136.17085396682149520983@kernel.org>
 <1f2ccb87-9017-4053-b8c8-5b31a211bd21@gmail.com>
 <923664db-2b04-4440-8b07-2965c1e97aa0@redhat.com>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 xsDNBGpiHugBDADJ5KuJaOYfUx7TGbRw0UE1km4dLnJomCSNtgq2T9BqgZ6TRPEy37soAmW3
 XxCPvhfL6CPLldzy6O6EkUD7/8zlbQP1DM6gUIQUyKxxkb8uR+oCogDKjsxt0QPycP/dR9fk
 SL4qKReprnkOOcGeLahLHzofVdn46mc5igCBsAA/PPSpo1GqsfGk+zYV97rSVa8zhnSXsqZ/
 9DbUfQynZKVqYN4tm1B30JE5SEWDCko95Qw9fAORX2W356MOQJGr05z9qMSy7CkF7bAUkziG
 d6ZSPsGEsel5jYByP8ZvwQ2A8kdKpRy8+zQCaC+vEotTH7Fs7SIzE/Z5mEVIi1xQqEzN1rqG
 BW7KgzRDWjw8lKsoBbxv20nfhUzuZLan2HzUJ+LxZ18Os4zkWg9sxHgMi+AGqn/+0ppbDcOH
 9Jm072/xA7O1MCXLgr4FOP+4PJH1vcqU+0EZVz7KCjrwkdz+l5Ojso2FLXq2MGoqWGShIsDV
 bF1JYpgm4spdPbnISkidUC0AEQEAAc0cWGluIFhpZSA8eGlleGluZXRAZ21haWwuY29tPsLB
 DQQTAQgANxYhBAHOahKZFnMu2n/CxrTrSufyPi3LBQJqYh7oBQkFo5qAAhsDBAsJCAcFFQgJ
 CgsFFgIDAQAACgkQtOtK5/I+LctmngwAlmrGPWnWxDW6PSJeR9SM0faqwuY33TWAE35nshm/
 EEkBgpVVhG4z4Cdy7L+6TG6NHVDnvl+IHLyyOZlL3LQPQIpiKVgo6jHmm9TF6mK+Vo3nsXAA
 uSJYu9iY9Aywmy2JVQ15ttQ0NfcoZ0sV14bT7pSr9zXB6D8p3XA4AQI6IBeLvj993Z1+tPyC
 6BJ+2aWWLBx7xGpFo3X8dhjS/Lm8QoietKbI+ACefKKCDNiM2KG53P76wdXJp52u4dqP6eFc
 +Qv35QefnALoPkOGQEdd1qvUycyZhuaCj8h0AxDu7bL3G/IM8G2K8qsbSJuui8zCSZ9b/QZf
 H7u1nevPOgxyWC1Pep/TbRZ62ktn8lrmWA8PZjuaJJQGjahuK1GgTQZNG+7DB7NwjLr6aXIm
 JirtT4FeR+IUovvL/ll+VHzpGpFbgXz4GTsWsikQkT1huFSB8MRLlWMXdAKblL96L754j8Z5
 p/YV26YTppXI56uJ3XyOwZSrfrK1pfqNIp2Yr9vUzsDNBGpiHukBDACePM1YZ1FvAiFay/2v
 KVDNpuazmpVb1CBFy+rqM9HcuHe+5CuxLd4RI4hb0qmjlm5Vi5M8+AuNB/wi/f8oDuhJwlMn
 v9L0lfgpRRdShnB26hnt2wWwWFgOU3BwymSruxhEYq+eIjjxCAo6yW7Qm+ArZ+riETMI67sy
 ZyLx6o4yRiWxOrh1nhwV/f6PIOl+Iv4yLAG3eFXpU7/EZpim610bKMwcXEpiRkf3NjiflIha
 adoKHV0LCiVNrU7r8TICjjnugpl1tXAR2RlaRcSxmvOzrXY2O/xBLpwPr5erbdk8RCaxUzS0
 kK0hw+/On3Sr4Z4gtLl2xtDkjRh3KQ9ZqMPrFD/5XOs842ueNivwIyAf2kQJjKfJGWc771EM
 0ZWo1r1AthbuM+IeN5QM74rMJxaf5WyDX3ZeqBA55fCJGJ3zrp7Tqeoq8DYufiNkppE9S71z
 Cvxva2f8mUWTlTUf8s33sRD7C87XpT0whKpn1I9/nJB9Kb0dKyRCdcsT4o1ynxUAEQEAAcLA
 /AQYAQgAJhYhBAHOahKZFnMu2n/CxrTrSufyPi3LBQJqYh7pBQkFo5qAAhsMAAoJELTrSufy
 Pi3L/iwL/3aoCeq19Pog3fqisRyEZeX8pXw2GYlrJWYoM0mQ1USaTpdsMwCXaoFMoSBqid0F
 VPrqlH4bSIEEAzVmFPX0NjGhREDMrQ9eR5S9yqSpBvX+hz+xgpt4NOPhbVQmV+9f4lX9TJT7
 GOO3EX2eeokg6ZAISycCAx7srXuc8oyRTJtnUQziH9GXrEeon88LHf1QHg0Z0sL/c7DfDqvW
 9924M4ngQAZ8RgCBGZocoWuXCemSPkfQVLt5DzycSgSQODhbNSEmr+jb1V9Svf9D9k0CQfEY
 cB3uwOHWb6Z/yaEARbGZPSPn89YjXBncQTpgSvUM578b5x3pKi6PjZB/hwtUsRgrWGWoIwRi
 +ZmcHnCzsuo6uuNYX8VvmWqYsVajykjnpjdCGmU89QUsVmrtnDPBrfr8VVJcZPnCJhE595Pk
 LO29Oj0au9kr7kMW5Q+fBeHj5zz6VggAaRRU74/sgtwLODBWESPZ9LqUUdB5L/XbrSq2VDlD
 sNySbH3veZ/55EtlXA==
In-Reply-To: <923664db-2b04-4440-8b07-2965c1e97aa0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/11/2026 14:47, Paolo Abeni wrote:
> What about explicitly detecting the AA deadlock maintaining a per cpu
> status?

Thank you for the suggestion. I will add this check in v11. It catches
a frame that comes back to the same HSR master, and the locking can
stay as it is.

Interlink input and the supervision frames also send to the ports
while seqnr_lock is held, so I will put the check there as well, not
only in hsr_dev_xmit().

A tc redirect back to the HSR device is enough to hit this, so it can
be triggered from user space. For that reason I plan to use a
rate-limited message instead of WARN_ON_ONCE(), like __dev_queue_xmit()
does for "Dead loop on virtual device". Please let me know if you see
it differently.

I also plan to keep the port type check from this patch.

-- 
Xin
