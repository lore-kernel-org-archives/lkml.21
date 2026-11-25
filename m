Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616455;
	b=2IFVJsxMExw7lu9p43vuQxjTf92zsWU/RN8N/R8QYni8jC1eAhAjLrpqtklmZqu6V879
	 B5ThQ56Di++cumdUpLkCJMZprkj5B8dxF2TOnqXfRVFz7sim02KyWvjDIAeWeC6qXsdWd
	 zmKVcmOnBkl49YbW/cUDL4ntT+7L2v1UAeGiDQqXlijW57FQL2MxPovKPuzVvNKyhjT8p
	 l6Gf4TVHvDHIVLsSDXk40B+Zv46AOoeVjMm7r/GPVFDEDcCHgq2Sj1w/7UbfM8qH5euq0
	 vmmJbUjs2tgF4NlpvDidiZ0gTWtJoyFbe0Qj6Bna3UlW9DdrkF92dg/ScZzgOrFdVfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=w6I+ryhKUHBU8/ypdPULznpg2ekJDRBrE8QNL0EUam4=;
	b=CfT2HN8bptHOVZkDN7aebGW/OkgEJHfgAewUUmX6N6hZxeiNs/NDAd7a6y/cGmB3V9Z5
	 SNjkkLG4NqXuUirHvWmyGbCYClOHYj4KrTqYcSQu1WxqrqgfHjr0s2XVWeyNyWH+qDEb9
	 CtGhtFjYpLDCZp+Wq6RAZZKnLl5tl3xqxeBoBaf9EYSGnJqVQJqEbYcb6uxkRLnY94nJg
	 D0ChxEC7gL1k5I7BUKrWMQxn6kXXNp4BGyy7n+tMSjnZ+UwloTBYKbmnHj7+ay9DbDv85
	 z4vq+m/08/3VZA9ATIPYHR6vHnnOD87e3MQXJTaehbbHJuhC4ARvpepdmKUXxVL5oog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uGl8+q2+;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3256F606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3256F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uGl8+q2+
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab3cb83f54so4277061fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616453; x=1796221253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w6I+ryhKUHBU8/ypdPULznpg2ekJDRBrE8QNL0EUam4=;
        b=uGl8+q2+W4FLFqzK94rJ0xx8KjdkJPZX2a/BebrK8El6t7BmHdxAKcVXgxwcW1nRdt
         QaDP5T7P3uqBgih6parY7BRxsPbdJVw802NP7Gemiraa/Np6gnLKQF05xoUOx1QO5MTd
         iXoyIX/MAsm4dgMdBxlD8orfF15XV8WYNeU7zRmZg1vABFE+6eCqXZPgxaPE0TxHJHwN
         e96tkwkdFYRSOzX0hVuRIdJRorRZALa/qkpg3x3l/kbrdH4UiWuxpGgy16ZbHfEv1bUd
         KnO1yO8xY7OVPSOlafW9vxu96xbVdpSfm+8lwp/NfkBrKZvX+fUIC3TE3oAeApXuh/Bg
         Ef0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616453; x=1796221253;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6I+ryhKUHBU8/ypdPULznpg2ekJDRBrE8QNL0EUam4=;
        b=sQ91nwNsPVBnz41EyBdw67EvdGfRCpU4MDNxf6oXXUIAPO7nKlXQyxDtS/yFILE2ET
         Skr2if6hsXCsL2qmBi6NfCyg3V5PjM1gGUq+rCm29XanJdaK/5MTHRgbEoZ9bLSoiEdm
         CougnTc7rDyAj0kmxqYcZPbzo28JDs7dyE8a5p559Oat0fToHZBlecFtUc/xiH3ChEaj
         9vhECbgy5aj1nwxVnuBzsbvit7MVYP0EPfaGNRmqLCn86G0XZ866md8D6XKtghgxfgCZ
         U8hq/JQDroR5+nl5G2FmMk/eWz9kCpWfo5DYbhQ53n0zlRMsnGLf8YlHJlE1VomLSXio
         +p8A==
X-Forwarded-Encrypted: i=1; AL+hErEWQYtzUMveltSUG6UeqG7HJj6XIdLScn0xJgZVy7Aw3CSULlhhlytzdKY1BRlcmXXAm5m90zcx/GSMm1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yic+d7INugXw8xb+/kx5Y/xqQhfLawGFwFfRLCFIL2faxDb/s
	248WJEpgK/AxS3XuJFvXJT1B9sEYGSh45PfVKfkFlmB4MmI9RDPFxCKN/t0/EPXraOk=
X-Gm-Gg: AZFdTZccl1U8TvGKLdTPDzWwuig86cVXd1H06ObKWLW9VV1124ydw5jGE3qacpyZvvv
	QUXlt53eurvb5ChBAcyVYSk0OsDdpoRwfxEUDHwPY0BpU5t3OKQGRzxDEM6vLZrjEnxCVsd6fzq
	sm3uZWbGtLjAA+FKdCdSTL1JeUtMB6zjSRH1Z3w5HddD5Nx+cM49yVQPHMbz2p3Lkymd0ARzedk
	BA8NlwsmbPQJuduIvyQPWnbysBOBwPGDJ2tXojgYy2F3B4CkF6SuNE8eYdWk1j61E5p+LkdU1xx
	n7Is6OMH10xAmOSML4iQ/cCzdPTrWUSMANFR1cnGfP2uckKq32XSrLuvkEb8pym51iV04hrY0GX
	uJ60esp7P20d2cnsPyBRxqDw/T4KYUnSmJyPOjiJZMMarEn8ZrbNw9o9fO33SgeYJmURkzfseB3
	zrzj+Wc/pUpV7lYUgbhjhbF5dsypgw4Pj+Jv1+EZ9cdNn5RG+lMQBJ1s41mrMKARuMq1hjAfdCM
	WqkXgI+yxHakBtskLwyKb62tl9e5qFlGqcyL034l7qqluD9LSqrXOAc+tKJGz7uq1vXaHut1q2k
	lxek6bhyKkQ+910tnrWTxmx3fDZNSf+F1JrXrrBaXMFbcdsHRHOnx+FbAI39E7YuQi057YUA0XT
	v0gKBa5Y=
X-Received: by 2002:a05:651c:a110:20b0:3ac:e540:987a with SMTP id 38308e7fff4ca-3ae7f7ccbccmr42593531fa.0.1795616453477;
        Wed, 25 Nov 2026 06:20:53 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80537021sm43974421fa.28.2026.11.25.06.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:20:53 -0800 (PST)
Message-ID: <8510bd96-fbb1-4d40-ab90-6e337ed501a8@linaro.org>
Date: Wed, 25 Nov 2026 16:20:52 +0200
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

On 9/25/26 08:48, Nihal Kumar Gupta wrote:
> Glymur's camera subsystem hardware is a functional subset of X1E80100.
> TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
> three CSIPHY instances versus X1E80100's four.
> 
> qcom,x1e80100-camss is not used as a fallback compatible since it is
> already claimed by its own binding schema, causing a duplicate
> compatible warning in the DT schema checker.
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

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
