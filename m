Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784528;
	b=CRoDpD94pAaQ4yymGfKvlPuthUwsNXoeHHtqp6rh8tCFf8/O3tVZDQm2+IK3xFtfr1jp
	 T8GNu47qJAzQMGZwZK4SX9x+A0y2GOTHz+lfMKfGHKrFZ68MioCO7bhsbKQjH5pFIxdm4
	 snxxZp7tHIb2xyBJwxcPQVhZR7hnC7FFR0VcHjAle4D5D2Kpc4sepTaV2wQaiJtBUQpKZ
	 CiHhFt6WGmc5Wv1rmLnrS4DDjI1q+Us3ycUZV2A0wEhMkCmoWTFvshwMOnYW19T8QAuux
	 jFIc2mUXtsTJ3pvZtIXUVEQl0SGxAuL1sooJyhh4reUDhQniQC1M/3DSkPmK8xBhtCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BcOyV54Y0ZxOXVrr+d2Y34XvpFaNr1/jWLBvtU0HutQ=;
	b=OPpEpT300Uy0sRZxQrBUGXJ6g2fcDECPifTvCYspgaOsVLnKd03gw4ygNKY6btWVzqge
	 e4To+tyPNayxZL58YVyMqu5zy3N/0xrXkK3mpQ5jqe+9tRYcv5YB1IDMONK+/Ktg6gRTs
	 l+O4K2JDGWc7HznSY1frP+Wu/4CzLvVPpktdJYvbr9gCCxEi/ASToVV7t1Rxz5cdm4cJo
	 9ZuMxt4b8qTpsLpYSd+v8QwC+hSL8+r2Lt9BOQGClffEnjvzPMAwHx7TiOAf/61ZgIMKw
	 LvB5MxbkczV61nkWu+R8wYlMG6/1lKn+CaT2AIczZXpoQgZB1tjCgBn1ZOqLardO9Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ihqwa+7f;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AB0606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11AB0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ihqwa+7f
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so81936165e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795784526; x=1796389326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcOyV54Y0ZxOXVrr+d2Y34XvpFaNr1/jWLBvtU0HutQ=;
        b=ihqwa+7fyCGXzDUdIzyrEGaIBEOfVSMAf7/3Y3g3JhDfR5FyPmZFQJ8TieHrg3YXVp
         t6MnFkean73QB1e/BVD253hK3GI/f41wa7qZxcAYKL4/nBSum17XIzV4qncSOM4RcCEf
         YDp9+i6KMPBQoyKvuV17rTK0zIb3KihvuMmJvGnBeltYWqsVX32D++VrWc8RqEu4F7IN
         6RkLNuNli1Ip4qvINyGqW9kdF/ArC1klLjAvcgXio/UY+ITcmxkXPVt39KyN9ydU0lcw
         gr3/es7pXFA2c4wuiituRM5WGPlfD86RsUGj021oDxOeu35b4dBxrGjaL1isAQfkYvX3
         RswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784526; x=1796389326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcOyV54Y0ZxOXVrr+d2Y34XvpFaNr1/jWLBvtU0HutQ=;
        b=XT9OQNq2CsZ+8ck8sBlx1C4bRuK64Dx0pR1PSvmHe++wyKBTHehHDwjD0yLzYTz1+A
         VU7zBSBRKNiSD0IfW4AsQiewYAJRRSslSXJo6D76dop8ijCbD6hllFQ6foU3DftGvMD5
         FvhkFtVBHNkTV84UEjjbh541e+eThoAv8qq3AJoU/BVBsV+jTvZxIp3JhYENw77Vs9qo
         2O5DB4g+uTJ3SPf8nmaG0vdoVBHDsf4mUESqBpHI/xTR7cY308EuUIFk7r/xCu8LaK37
         pKzPnC252LLFn/DCseCAaJ2tN+NHmeb4hm7Kmb92bduCevzwpMlszN6NN/iVIvlhFBdp
         9E7w==
X-Forwarded-Encrypted: i=1; AL+hErETpwniLvR7F6jvkMbFctSp3ydTsz7uEpI1XnSr7571L3QOVsq/tCcwxvmlMh/ihKyUSrwUrfHu8a91s8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PUCtv++mI9f/pvTI8IZeq0OOfw3SQ7H3gFtPFPG3HtZake/t5
	Fyc2e3OboJ8Lg8gz1YdZAw39ATo1U4Tr7jFmSG1fMwvXPMWRt2fE+dW+T0b+OHnH/k8=
X-Gm-Gg: AZFdTZdQ+Pm9awMSkkWAuRHm8jHpotIkDsWo6ufusxZMQTdUVPajjXGhqOjzLPHcBiI
	v4BDMc+HoGh2v9EI4B0XVFr94VV3Amy+De5gqB0kLLuff/rSCmoAW1C16gLT3WTUx4ddmM543AK
	87WTabHj+0XGsqXloRrzMOdH+nTXXM93n3sPyYF3f46laRVc1i9RAXk4S+JEnNPK/OefT5kkJZY
	r8uY1grGOGGXm3ZHar0L+n9hJYyEtuSI3+4dDcp57MztWPxzoTUJDUlpJY6q+eFxWAkL0TlyTsl
	YSeYxTqgbEiIa1NGjEhydDlpH3SMp68g2U4GtEuCJk9twpseHiL5Q377N6F9e51e+ub3fWMmlzg
	HRncgx33S93ejAtRQd7oMLGPMtAWvBAaWNG0u5lNhoI5E3Z6PrZyqaZChoC/WkwYJLHqcx38qpM
	Ty6Sa5GhhmixfHhhbYnv9pnYCO3qrtGH8LJYn1Lq+zfXMeSDxRR5twUpXZ2iF2PveEVdIUKoA0v
	Ci8V1ze6QmVu1b+nzwoUvHK0tLEgYlC9MdvFXc5dmhYr1neDNxk3A6rbthlti5opoAxnUBZc7Me
	hEA4iluePRNaROUVLZrTzvCyaJH2Lquaig==
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr526806065e9.21.1795784525598;
        Fri, 27 Nov 2026 05:02:05 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm22812875f8f.54.2026.11.27.05.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:02:05 -0800 (PST)
Message-ID: <6f997513-27da-47e5-83bb-18c267e930c6@linaro.org>
Date: Fri, 27 Nov 2026 13:02:03 +0000
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
Subject: Re: [PATCH 0/2] coresight: add missing MODULE_DEVICE_TABLE() for CTCU
 and TPDA
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, suzuki.poulose@arm.com
Cc: mike.leach@arm.com, leo.yan@arm.com, alexander.shishkin@linux.intel.com,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261127113137.931578-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261127113137.931578-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/11/2026 11:31, Qianhui Xu wrote:
> Hi,
> 
> both the CTCU and the TPDA driver are matched through an ID table, but
> neither exports that table, so building them as modules produces a
> module without an "of:" / "amba:" modalias.  udev cannot autoload such a
> module, and the device stays unbound until somebody loads it by hand.
> 
> This was found on an SM8750 based phone (mainline v7.3.1,
> CONFIG_CORESIGHT_CTCU=m and CONFIG_CORESIGHT_TPDA=m):
> 
>    # lsmod | grep -c coresight_ctcu
>    0
>    # modinfo -F alias coresight-ctcu
>    (empty)
>    # modprobe coresight-ctcu && readlink -f /sys/bus/platform/devices/10001000.ctcu/driver
>    .../drivers/coresight-ctcu
> 
> Five tpda devices behave the same way.  With this series applied the
> modules carry "of:N*T*Cqcom,sa8775p-ctcu" and "amba:d???F0F??" aliases,
> and on the next boot both autoload with no modules-load.d help at all:
> 
>    # lsmod | grep -E 'coresight_(ctcu|tpda)'
>    coresight_ctcu         16384  0
>    coresight_tpda         24576  0
>    # for f in /sys/bus/amba/devices/*; do [ -e $f/driver ] || n=$((n+1)); done; echo $n
>    0
> 
> There is no functional change for built-in builds; MODULE_DEVICE_TABLE()
> is only used for module aliases.
> 
> *** AI-assistance disclosure ***
> This series was prepared with the help of an LLM coding assistant.  The
> author reviewed every line, reproduced the before/after behaviour on
> hardware and is responsible for the content.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> 
> Qianhui Xu (2):
>    coresight: ctcu: add missing MODULE_DEVICE_TABLE()
>    coresight: tpda: add missing MODULE_DEVICE_TABLE()
> 
>   drivers/hwtracing/coresight/coresight-ctcu-core.c | 1 +
>   drivers/hwtracing/coresight/coresight-tpda.c      | 1 +
>   2 files changed, 2 insertions(+)
> 


Could probably do with fixes: tags for both commits, but:

Reviewed-by: James Clark <james.clark@linaro.org>
