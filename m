Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514278;
	b=dttAD9RPKsvBSp86LZYjcXpICEZFNF8LLMsyr+8ra9M0HLqW1yrwWb16kp89pocX5jF8
	 T+1TlpiYCtD2lFKqJKTluKjaVNC6PapWUx8aWGtWzQwbedA0uWWjwqb9C3LwMh5L2ha4b
	 cFz4NC1xVeA5Nf2qX3cl2E2AaRC7X2TFxQL76aGwewQRWhap4WZQYOBqvZmW6srS8+lQg
	 nzIsF/1V/MRN4uzxRkApbe7MPfw9c59KQ6kuvinbjM21CVEq+B8x5QDcd1ZU7IgtUOK2f
	 fq8eh9th453N0lKgf7aOqW3Bk4L72FWjdVhrqOVMFjyeyBTtpt1uPWxUay+nglSQeOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kXyUg3NoH8fdqsuK8DsovCC6A8tK75idYEl23ompiLQ=;
	b=mQ6K4/oGPcTsK9yB5Dvnq3ZoVvsz8128QESAzE2Rq3IxobN5EcfxdP5JzJJJPvybkmbu
	 uLIYQ+9x78ssBKjB9bOkkWlHzLDzKKgq1eVQNqKYwTnuu5mgllRLCcEo2Vd2LsEt10xww
	 J2huhZBYoiivOgSfkssVtyevmookw0M6OHQuXCVQ2Jm9W/UEHdGQOzU1K9etIcV2Cy4/O
	 WsX+s4QlXMrBKGULItShuVzIKQhDOtk4GGFSoKTbX6TUHubv/mf73aVEfCOeS4x17QZKd
	 Tn/vJ+jAjdGcHKDpzrS1efjG5/RtEgBUsl91S8EyUUlxz5CMdnPSIp8zr9giZsVup/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t5feP5FS;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88C4606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D88C4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t5feP5FS
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so3339313a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795514276; x=1796119076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kXyUg3NoH8fdqsuK8DsovCC6A8tK75idYEl23ompiLQ=;
        b=t5feP5FSqUeh4OUPpz/G2qREcYdQLeO7DmoP0KcDpNlxLW5YDVPbm/4Y+9l5pIfOLg
         VTJdJsniqfbvzKi32+gjtTylG+NLszNUoLK8grYIn7MZz/2KY/vNC4ikLKW3INcctV59
         MlDfs9WlBH8JxRd+ehnBXj6MaJ8bZhRyk38kNrlsopV9B0bit7eK6ORPlBo7IpMN8DlL
         n/qiTjcsvSQJuDp7OIdkYsVg/DnLTEg7M/S9v5ZG4wEJbXxoRaFKFfrT7EhT91u+EECX
         4wv3o1IfjbwfPggyiQFREhKZWgfch+xyo2W1f/GlGAtwzj93Gz4SVLOV52hIZtWrXdNx
         yQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514276; x=1796119076;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXyUg3NoH8fdqsuK8DsovCC6A8tK75idYEl23ompiLQ=;
        b=RWJMvhd/dhZjnsXiG9SFvGTFSyUO1UX+Jh2JjeUf9n7tQ6w/r2sJELWAYLxXlSiKed
         UVNSmnUAuFrLhYdIJwSqaDRw04SYYqRsjIx9WzL055W7j8t31viijlCUXYb4cUrsjKVA
         ZyYGi727qAXbNrPefSo387dj9B1gKk5nsZgzdXDqHOiEpzkSoMUFbZ2m7Cl/reIS2iSQ
         +2hvlWjFvK8xQNHSgY23CpoagMrvFrsMM8wvjsKbmlPYk4kVyYHPCteC7vC9Rxspmdry
         mZEuyjss/OkGbdmIEIawDKE9niNhQx6KYYzRxRb/hI8/3UBY/pKwihTByy0381W2Xjqi
         POCw==
X-Forwarded-Encrypted: i=1; AL+hErF/2UIsBfKvIjSKgKIvRqiN5X0kEm1g7YIMx1qC0CSFQJUpplkC44bjN6JU81uv+GHEM933gxuI5eFgOlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3HUAf+jdqFU9MFWr+/uyWGl77dIfSLdmdi2QHCrXSMh61Wb6E
	rx6Xqo1b1Dk3Be9qhkLUDNfWlu1mVwjFIHIpXlX2QtpYEymqVKt682n7FmJRK0u1EsA=
X-Gm-Gg: AZFdTZd+k/ElxcJypCoDBPT+r2mg2b8vh/6zbLvmP0yTeH3htG9hAyWq4I0TrUorpu5
	7MES5XHWBBfNyl9Z8G4uMYDg+ESGgRnpJlE3TY9sss4O0TluvVO9k6wZ/Z0fWQeoEz3twQz7JEN
	wDvqLg2BjQS4B1YQbrlVvNVSjnGLY/CNj5tPGWNMMroUjAjDiynYOdX1JX9EyHQ3P9ZfbmQXSQz
	qEwxyoOUu1snLQc4nX5i9dOod3xWqOQsaeB14fQY5BfIHAxOBXnQmYznsWTGRwGyoY5SsnrsByg
	jPO7PaT5mdl3ZUMlMuY+VxyDh37W0niQuYmOHbwwMAxL+S3EeHJaN2ZNZxpaHdErqNzee/HuGaA
	qP3Xk2tY/CxzabWsKFaB0vN60uKihwhq1CXHoFKS3ZcBQexrLWHmQJSh7sgxPbUV9tYegRFk3q4
	3cE2zrLn57stwuQ483FbPGrFlStpFUnG4faOuoVTg9UeoBHASCv3prvC057wvxDSSOC0F3Cn8LC
	gQfLOxcyvWHO/ElHcNQsFjeiA1mgjLFh4H+GKUgI4MtPYfiTdo4NHH5KtQtXND8ecvv+ZY9VuDa
	nTNSn665eT6EUIYQQ4gonvoYm4resze7tvP67NnpU5LJdJMJW8aajLFW9g75BjBo
X-Received: by 2002:a17:906:370b:b0:c51:34ae:dd7 with SMTP id a640c23a62f3a-c5134ae12d8mr835789566b.17.1795514276195;
        Tue, 24 Nov 2026 01:57:56 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm492806766b.80.2026.11.24.01.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:57:55 -0800 (PST)
Message-ID: <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
Date: Tue, 24 Nov 2026 09:57:54 +0000
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
Subject: Re: [PATCH 3/6] media: qcom: camss: csid-340: Report the hardware SOF
 timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 17:16, Loic Poulain wrote:
> +static u64 __csid_sof_timestamp(struct csid_device *csid, enum csid_iface iface)
> +{
> +	u32 lo, hi;
> +
> +	/*
> +	 * The pair is latched on SOF rather than counting, so it can be read
> +	 * one word at a time without tearing.
> +	 */
> +	lo = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface));
> +	hi = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface));
> +
> +	return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
> +}
> +
>   static irqreturn_t csid_isr(int irq, void *dev)
>   {
>   	struct csid_device *csid = dev;
> @@ -207,7 +234,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>   		iface_val |= status;
>   
>   		if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
> -			csid_sof_event(csid, i, 0);
> +			csid_sof_event(csid, i, __csid_sof_timestamp(csid, iface));
>   	}

I think a callback in csid_sof_event() might be cleaner or some other 
way to not have to replicate all of __csid_sof_timestamp() for each CSI 
decoder.

---
bod
