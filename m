Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672336;
	b=dPeWNkePnwBrPNZRznBR8vb7mSj7djeqwA+ksXuOJTgf2YIu9Zs4eR8oAmIEx28cjlxg
	 1R0g5jiGjUC7mt8W3MHE/TNz/75w5fiJVgB8RxZLwAYD7QXGHuQW3lOfbRXHTKGqwhFQM
	 8IZUqqQSzv/2q03JX/fcPTj+8KFvkTiR/8RrTB/iU4TpHbx/3SlGSsKUIuipy1K7Iv9bT
	 lZwqpWyoPmFIvE/WXKK2Wt4FpBXuA5aG7EyHXJs6dPV0Kp2kY+Wa9jyb/y+ZxN1RweBZg
	 gGFUly4VjdFAwDc+qx6yrdCOby/5wPR+NvgfmghV+6RKoeVmgBqxLKCVYDZMSUdgO5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CZPWEk037QWIcnrjW4FwU0aU2BDmAlHR+95YsRtbxp0=;
	b=3lA239BQ7I3KOD78w0oIZNyvv7nLNBsZtaBM6cb7NqLcoLi2giGaHxupaD9w65Jjbpdz
	 5JD5ALpynV3U/W4MOuiSAy/PgiyOG43AXJ94D274LcjicdfK6JRU9H9d15Zew8QK1Th0u
	 PxnoqxO/ZZFNmfhUlbnFAjxPWr+7gcOPekpf1YCrXobYs+qQDAtfqLEjRUgQYCtj+EMmI
	 RMYqfEbEaGfklLsDq4M43kb5KMwQuK9TpIzFfmLBzZOx0tGMt2zQE/jMk9acU5N3JSKTi
	 YtRe35AOyHrcHYIH7grkKJpioL/c9bR7S42FNSO3m7fNC7/+7rzEFnceJ4bU0auc8gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vp6h4G7h;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAAB606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFAAB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vp6h4G7h
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c00b0866b0so381303e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795672334; x=1796277134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CZPWEk037QWIcnrjW4FwU0aU2BDmAlHR+95YsRtbxp0=;
        b=Vp6h4G7hpleX+FTb7fdJNRAUYd9jz4lCrh33wMt0Ysn5Nb2Xo1Zb1+kzJAUVK7M5YB
         tzwbvxW6rKNBTKwTsrFX6mUrY9wdUCBJPrDzpBluNzFfe+x0SzxpDd7g2z+1OUc7Osxz
         uEIu5Xt+UxUDEqs5lNqsReLPF3kyI+cUNMjCtVEpEL3TvMV5sjx43V662aDloiIrM26H
         TxMW/fWmkaBqAlyrH0tDhiQQ6TXOAv0/7qWniaGnVMQPuWrv2jbIZ1+opl8j3/zzSJ7d
         R+f8ajGcN4IcmH5VH5PoeMz8OGFMF3xInqI+yNfUC/EWj2pL7DZx/tLkPlZXPn23Ic/6
         qjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672334; x=1796277134;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZPWEk037QWIcnrjW4FwU0aU2BDmAlHR+95YsRtbxp0=;
        b=KfcY1LsvbZIpi66VF03wbJppvGMSBF3w5P1LlrbrP00OIB6D8xN/sMedJdxxAvli8Y
         mm3OyHwvpWJw+JpDF0qgdh2cexcMzXI6gD0L36kS4eLan93+zQnV+jq6DTd6fTUf99ME
         WOqb0SPjRVG6Xfwx5y1VMpvh12PMd6iJreq7cpGL0XwdBlL2H2vZMgYssNdoKIFq0tUo
         SoAP7d5aW6iFtB3qLfJjP4qmOuxXECXXHFIrxoPc26ugBg7GiPu/UIGYbYRqwjlL4aZc
         zDoyRb7XCMsfZKtPt6JohVF5H3A+l/M7XxRIi0BLCyGjFroj7ueVlvHrE075AvicRmiE
         4gdg==
X-Forwarded-Encrypted: i=1; AL+hErGxE2N2XTCNpzXSlC0XlA4huWTJbsilT0qzpyY4ofk5xn8xsjWj/sizrczzwOirL9lprCo+fGznGL43Y/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P31sIAynWsXBZuCDTsUApCGpqrCRuvTDD97dkH5SMjCWY7bac
	oB2QeogwYDj8vtxzzsZ4YQItnfqvjdtRvDkKpNLvTcK2pgFVpVondHuQj71bFyXOKbs=
X-Gm-Gg: AZFdTZcIFEJ6Ol2gelOeYeGB5MoW4A/7UvOW5TJ+cqkmDefwXEUA68fm7rIY+yoahE/
	PcIdvopdJospooABwAtC55OTZ6xGNAfPQmH7zNtLd90dqMobVN8Zm1s/Zz4WDuZiMs9UlZ+EWkF
	Ur+QHLiFzqgnWTVznbPtM7hh/Eoo4MatSd48wueB8XeMzQrWttMJkFBOc25Iq4aNIpSxrQHePXa
	Uv3fV23nKhGPBo4ssinhoKY7wZdAGecRx/FOQsGbBKa0xRcWLGaUGVAHWRY/VlzYA9mMqUiy6LI
	sZ0/MSmg+HFp9obIXmG61tAbwua+NR8N1G0UebobVub1vYkZmT90jeO/K7SEr8t3073aaQUEJQQ
	BNtqb3+sL3QWpShScbw3hQhj+qBTSBj11aJr0Evl6GTQjWSC2h0Uw1X1EeIEDKH1nJjgTQd4/X+
	z+kV+22DgWOyOCpeSfyrfUxRujjK52aTa//HwuecgkPvV/59AqaIImr+WTKg2HBjkhAQs85SE14
	T31QF+LgPG+h0x4MFLWT9X33mMLmxtzyo65NqnQ8z8wkK/5L8LBESC2wb2PR2fVcpk2xP/ao9zK
	K8CQ9GYoUutaAPdHY2tlp/GE8+ynRG8SoWKQze6/s3+FZ3+fm4W9czUmBC4yrphozIn62sOcJOy
	3Hk+GnsM=
X-Received: by 2002:a05:6512:12c7:b0:5bf:a48b:7827 with SMTP id 2adb3069b0e04-5c1bc6bf385mr6657518e87.2.1795672333627;
        Wed, 25 Nov 2026 21:52:13 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33a96sm5147700e87.11.2026.11.25.21.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:52:13 -0800 (PST)
Message-ID: <044783f4-29f2-4a73-8b2f-d06fe4a5ebbd@linaro.org>
Date: Thu, 26 Nov 2026 07:52:12 +0200
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
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, bod@kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
 <179561294019.462348.12092000419789488599.b4-reply@b4>
 <238a552a-ca4b-4997-aecb-fdaa278ca1c4@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <238a552a-ca4b-4997-aecb-fdaa278ca1c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 07:41, Nihal Kumar Gupta wrote:
> Hi Bryan, Vladimir,
> 
> On 25-11-2026 18:52, bod@kernel.org wrote:
>>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> @@ -16,7 +16,11 @@ description:
>>>   
>>>   properties:
>>>     compatible:
>>> -    const: qcom,x1e80100-csi2-phy
>>> +    oneOf:
>>> +      - const: qcom,x1e80100-csi2-phy
>>> +      - items:
>>> +          - const: qcom,glymur-csi2-phy
>>> +          - const: qcom,x1e80100-csi2-phy
>>>   
>>>     reg:
>>>       maxItems: 1
>>>
>>> -- 
>>> 2.34.1
>>>
>>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> This series is already present in the mainline tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml

Likely I've picked up an old series for my review.

> I am not sure why it appeared in your review queue again.
> Can you please review the follow-up changes instead?
> 
> https://lore.kernel.org/all/20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com/

Sure, will do.

-- 
Best wishes,
Vladimir
