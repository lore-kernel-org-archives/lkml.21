Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021095;
	b=lXxsYu77hLU1OT0cB5QjHrY47RDCvyTTr0pJ/o1fQLiKh6MqJ6fhWAiklO9VkaFlpEOQ
	 wIdRgHBNvJK1tyiqB0cf4KKBGoV0ZttU4zmjKKkjC2/8lAvweOoMz0QxYttMWFXq2nRt2
	 yeEsWVm1KhrudLE5JwxUDNqA4Iy9hvqoIrAalDzQeysIMu2CztUZiZS2qN1wRqSKt9uOE
	 RMEdGUYkN+vRU5TKayaC/jLJPed0O3aKO4duJIX5+xufXN9n39ySpXI60MZ1xnjRaBv5v
	 H00jabwK2+LeRqQPsEEpa06uY+wOLSBADwY5iLvHj8vgb9kqDc19j59SwAP/03Zo4FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=km9GD978uRX5/nYQ4zVMWd8Czd4GQb3wZwOd+NOixeM=;
	b=P+dcHMs0G6LwB+SIImSP6eJ+6/7w1pbU/xhBMiX12x7E4tuPdQtqDsEPux2cZi/MgIw0
	 G9VY5SQQ/uJv6+ijkaVTl642IsZ+x5nqomnnPgFNn1mzzizX6quiWtCFhVmLrk7s7L11h
	 CGSaQlUPrdaQKxj0GhM6jAL/xmZ7COOQZi2ZAdnRvV/lX9qk6CSbHAywpcgZ8QxDYj3oV
	 VXm5EdHTXcNL0uLvND3BtAUu8uzbmg6aIC5f5hYAbz8TEueZ3AAH3wFEi4iRGCiYG3APd
	 ZIEUrDSqAdq9wPGb3SMcq7aciikZWFhJqALEVG2EmQ6VgF7vzpn+ifvPGjjpgM05hug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fgg5oEHb;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31BD606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fgg5oEHb
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so12086675e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795021093; x=1795625893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=km9GD978uRX5/nYQ4zVMWd8Czd4GQb3wZwOd+NOixeM=;
        b=fgg5oEHbQteCLHBjs8y8bjfuTOdBPDekfVS1nPHxm3IIDAA7nRIwboP3j19dmk7oSv
         BpzwQtolBDUsqXKFSG0URKNb+1+0Trh4lAhDwFXIpPg1rkzB2F0GXGlmDVkUU8DZBaYB
         CWs85V5tWAKxcXJnpwNK1MMOzdj6A65HpJipuVBwiqM0R21DokAo4Iqp0t5gjCy6Q/dG
         lZENBAQvSADE2rdiKdE98iVs4EdqjnchQWmBg1XiGzjzpYdVzQ16cav9UoVhb0YyX7T0
         QYAVthuFx2IgFFrIUy+uJHuqaioNtGiFW8UDGjPYSnLaE5Ox9drBAVJbnqAMLJvO2/5S
         uCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021093; x=1795625893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=km9GD978uRX5/nYQ4zVMWd8Czd4GQb3wZwOd+NOixeM=;
        b=I1aOXB7v9vE9i+NDyQyjqZ9825ufanegW9KohZbFVYzgtwapfLUrELdjuB6Dw8d1YQ
         VxtmEYOJzk9rH9JZuG3zEBQ7JlcTMNguUoD2TcKSgVgOojqcJWClrTjI7g1lNiMxJHJY
         ckidKgoAED2cdgbNNtjL52Kp9Q+cIabIpKtCL2mPeeCjzx1fg5PEdoUD8i/osdCEurpM
         ubj3qvkXtC/Fiwr631MV7sfiZ+QhSOXoH0WCJR92J6JAV1x1Ma87bNCWE9tfW+za2qKl
         RIUXqw+xmwhZlvhPjBSNH5TxOG38D79fPYuo+9nT+pED91xy8Vu7zC6K4BV60YKTHWbJ
         x/7g==
X-Forwarded-Encrypted: i=1; AL+hErExNu48qtnKrz3n6WtDfhYo99NzAKMJ6Cn0W/STPnq1RaPn/WLvvnXEUAXgkZakjT1lYW+YClE4hHZo2T4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AuikPwG6fenoGhgOF4Xf2LsSJpjubg19nPPpkwbfxHpgDyBsu
	grYd2JCMaYnfNAt+qkX56XB/tKKqwd80ehYNvRYJvcHP/+PAPvM/yTkLp4VjqofoOgkNPyftfeG
	ig92h0wg=
X-Gm-Gg: AYBFou1RJAFefvmQiK+GXz+YwFd1LSi3tUo9FqurlZ/OIdKNlyw777vevyfQSITZ7sP
	W/cU51Q8y9BmuxzZoKqE+MdtuZYlQIbt8m69tWM39S3l2xVn1yhR5cRH8kUsx/GRF34poK0rtd+
	Il7MyF6TxUuP8BqoqjS3DfotXoDHewklWcUUIKqCOkpkA6XnUS83DgiS3kBSbHqWuAMYJkEbvje
	aYAbbnaAklI4ohwOi8vucAszBRfZcxUi8NI7BWeE1BeOpMCz7Doy2dYy/QqjvxL8AMaZuUWUUER
	+Om6TWdynyiWrFHmUsxMSEtfCbXtqLpnx/YKf/Jg8zBUP9vZSZBQ9FsMKeF3R92w1r++EM2xm1L
	DDd8izmwVLevq4Jvysjcn6BNy9AYQOpJ0bHTdQ6J7CYqwJVK8Dh4jSFpD21I9sN3bPoV7I5l1YH
	7/kZcmTi3BxMBBMWLR1kSUqK+CeBEwqaxgXgerabyAaXhATrOZEJr7X48dMomo75Ursak2iX1Gz
	VOhz3BNlFUa1LmfYDtrC9BiwW0Z3+aeDfAff2X2sl9kMT00TESRWpstBL+GQmbJ0d2XYk11Mf0q
	WXumi4qNFPlIASsNmvePAcQ8C3p4PYvvvg==
X-Received: by 2002:a05:600c:4fc6:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb7da26333mr64023955e9.18.1795021093075;
        Wed, 18 Nov 2026 08:58:13 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8327c2e8sm1881025e9.3.2026.11.18.08.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:58:12 -0800 (PST)
Message-ID: <43e1d316-bed5-4ec0-8287-44663b359e11@linaro.org>
Date: Wed, 18 Nov 2026 16:58:11 +0000
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
Subject: Re: [PATCH v4 01/10] coresight: configfs: Don't assume active until
 cscfg_mgr is set
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qi Liu
 <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
 <20261016-james-cs-multiple-per-threads-v4-1-dedf961aca0e@linaro.org>
 <20261112171043.GK9176@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261112171043.GK9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/11/2026 17:10, Leo Yan wrote:
> On Fri, Oct 16, 2026 at 11:46:11AM +0100, James Clark wrote:
> 
>> +static enum cscfg_load_ops cscfg_get_state(void)
>> +{
>> +	return cscfg_mgr ? cscfg_mgr->load_state : CSCFG_UNLOAD;
>> +}
> 
> Could we check !cscfg_mgr explicitly in the three functions instead?
> 

Didn't I do that in the original version and you said to add a helper? 
Maybe I misunderstood your comment?

> Using CSCFG_UNLOAD to represent both "not initialized" and
> "cfg unloading" is a bit confusing.

Is that not just a naming issue now? It could be CSCFG_BUSY or something?

Problem is one of the users looks for == CSCFG_UNLOAD and another looks 
for != CSCFG_NONE so I don't think adding a third value is straightforward.

> 
> Thanks,
> Leo

