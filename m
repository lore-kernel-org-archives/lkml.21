Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613321;
	b=LHHhe2krdZbyGJ2kR7O8WLaKjCa/h3y1UuPuSh1CgvR1/sowXYqShQEmOkIy5LfzplTT
	 ehrypwC4SSfFvrzfKXHfj8NQ7d0LefFOtrN4jDi+28DFurZQeqhoyUGDuOPrsOn8751MX
	 W/1R0vAqWb+UW6Uh5blmdHk62Hl1LViI0XaijqPBTCy0neR5Hnk0Kzjx8zjYd1KdTQR4W
	 eAM0+iq/dMcva+v30n+yoNXCfU9WyCljDO9w2llApQAXrcrNelpKJOngP4qulzs27VZ+S
	 ve1KJ383+4biSFQrtQwqByvfTjL626bBWcSfvwzNwhfdDE20Jxpyyr58Baks7OqXPTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AdBqif1XdprtG6YwyZi9UA3LL5Dre8swdPb1+TR3fvE=;
	b=LK3hBmx1dhKIcp3omyBcrpp6dXz8l9poboBYihgj1u2FNXEyKEgiTa7DBOfTKntfiYtI
	 3xb80q9MAS23M8ug2NSRv8iSsB1cW1J0dR8GZT0iXXpCa93QBFtmufr4467N6BUGSZRU3
	 kjbXytbHkPwHd2Teqdp8K+u2ivSzHaw5xeCF060D0yqzQKdh++t8PYfXEL5FBXXJ1gSMa
	 VwKhpYp4MVbgjClSsntwgSzPFhtHyRLh+7/aE6yJ4y6ju+ozAfvbvWXKww4cCJ92L9xJZ
	 zlKOQjs6TxodNrGELJUBwAtiCvq7sSpTSw7d8tMXdH7Ow+1qPt9Krjqr7y2qY9x9pyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Lc98iv8n;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC04E606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC04E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Lc98iv8n
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c14c0503dfso516732e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795613319; x=1796218119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AdBqif1XdprtG6YwyZi9UA3LL5Dre8swdPb1+TR3fvE=;
        b=Lc98iv8nhLEW6JdTzd/vHJpSezeDJHH6M/66PZ1oXpIor2ipcSI2kOuCTfZkI3fQLA
         ZGHKgfCKDJwOdC4Hs8i9o0Fn5riETmKP8hc+edIRV6EUGqW3cBmEuA77uoWleYlzLIXd
         b7iR50U/1vohH/C6Yj+7N6aTLNBvKvLLKI8mekY770Gs/3Z8IOH41zI1+2qjOzAIsb8O
         N+6RdLiQvvPVU+0p9Y5sLoDSUZgZTjJc+9H3sph8aQyVaiSurPMSS9ncOiAy3PL/ts67
         bncGENx5GHzrxq+3rVTNmlKUWUTclbJ+VOpsyi1P4MhOFI+fQs0oJ3HYa8O52Qoi36IJ
         IX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613319; x=1796218119;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdBqif1XdprtG6YwyZi9UA3LL5Dre8swdPb1+TR3fvE=;
        b=OA7H+UWK7uqIxZ1m3FQIklyNSR/ysIC/Z66KlB4wJ9kLU1m3wjJTyQL0Cb3uFJMKBI
         C8M8skdWSoxCD1WAz2WgrPHTwynhsOYnM8obHPDPvBxBeJkjb+MfVpKdSny0tkz3CJ/a
         In2hTxq8b/GACR4BapjNN5EIUSeq8XR26QJmHWW5UisBRnd0tgZI7/QjuOTzRT6YWFHc
         KEQl+/LEQQyiqNBUgJxjtz+yz9tdIvKVk0RrfBc62Z2usvXTyFYOpL2CXLtO8s2UNLE8
         dpS+rPy4SN0f+Zcyztik314UR5fQ56L+9Sivnna+yocOJltZhWmTwX3y5y0NNhHxLCff
         jVhw==
X-Forwarded-Encrypted: i=1; AL+hErEZepeRW29kL9xmBK0XSJtBu6R3TEbe5u0x83nOhXzkay5n3v7CRWIzKuCNKqgAs9WN84QNUo/auvLVvnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kOufzJuKjYwOdNs90ri0AT40oVKs/kZqR/3fSCAYNR5vS+lUs
	Jra7Txjmlc4t3y5QT7sxGR0uffB94AxX84PoF3ln4+l4hHWx2fIH4AdnTrYtKXszazw=
X-Gm-Gg: AZFdTZc4c5/e3S+UrsAGaiKdPeqOMSGg4YVfxphcgo0gR14+mMvhs5kg8lbHg2hWW1l
	oANVOHupL2FDHYs8c0hjmhyi7GNliVRiIRYPU0NAiY43gjhwDUzTOL9LUViEMPN5qaJOP8372U9
	CYLvla3e+JpMd7ch2zBJke/RL1q7FVC2fwCsZhaP6tbc2Y0cKmBpUOyeywN4JKTytoPNiM/Y7Wn
	e3EAqMlwS8Zs71hPn94ggGVNE94DdQtAE8vF/V+MosqzqmRnUqblTO8iginr5A0yyLjrOz1MyEA
	ked5v26v+d1EkBdWmafnDoht/eSpPciQWuELhCfMN88YnFw/y1sjbn08QvOQvRLa5wxPZOkX3H3
	CwOceppHNIMHHbUYNS3njUdIGcZAI7nmvu22KnUgT4NhXxbGRG8tKXGqRgUi0D0f7dU1rvC5EZD
	pDo5Kv3UFrDCpdV5td0I14/6wOJYbZe30jWg9WHAzwyjLn2ZisqFoOWrQQ0M2FNDYi2yFKKwHUE
	mzV4tLC4S6fSyP57H77uRrxuIeSdcDJc73PJDC8OvWkJUiIClApfkGsCwS2fbY6eJO33NyIHzNa
	QR7U9f8U6zIL1i0dX7K4HMzksgazeW9zRT5Mvb1H0l8phcgAsqgh+HfawUrgKgoO49RH1FgRDiH
	yngkYwh4=
X-Received: by 2002:a05:6512:2514:b0:5bf:a66f:e5e with SMTP id 2adb3069b0e04-5c1bc57989bmr6590468e87.0.1795613319090;
        Wed, 25 Nov 2026 05:28:39 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf333bcsm4683145e87.2.2026.11.25.05.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 05:28:38 -0800 (PST)
Message-ID: <a2010032-8750-4289-b443-3afb57d656e6@linaro.org>
Date: Wed, 25 Nov 2026 15:28:37 +0200
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
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nihal.

On 9/25/26 08:48, Nihal Kumar Gupta wrote:
> Glymur's camera subsystem hardware is a functional subset of X1E80100.
> TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
> three CSIPHY instances versus X1E80100's four.
> 
> qcom,x1e80100-camss is not used as a fallback compatible since it is
> already claimed by its own binding schema, causing a duplicate
> compatible warning in the DT schema checker.

This sounds like the DT binding documentation shall be fixed instead.

It makes no sense to add a large number of new compatibles to the driver
code.

> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
> +	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>   	{ }
>   };
>   
> 

-- 
Best wishes,
Vladimir
