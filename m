Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616252;
	b=2Y1h+89vCraMm3DvdL4IMBKEiGHYAHb8aKBgy5pkVt4RFNPHmfbSEjl7ojIVnQTg519z
	 mJ6QjgDfBv8uaXiYmx7v45OKxRKE0AaOH8ABzcYT/4rhc0juxDPksxXIQK5Wt/Z8lkVLl
	 brnI/UYUEO5FU4efu+S8SjovfzP5Btk6HpbhECQcI8YsGpkKQZ5V6z3nK59C4DTJTHtk0
	 vkW8cfI+4sVp6msHGALwl1C+Qm6EDnlXR2z6zRD9m1zZPnnAGtqAW7tUnnxFCxYIPvnfC
	 r84FQpnJJpAuUNDjr2+HxcWCpfCiHvEYbCNQuV8WtLEit3SRCpjjLiRQjRZ9ihGWnlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aAjT/juoIc9zz5suBwAKIoZ37zYZ6TKZoBm98/nn904=;
	b=iaiwYetPtXxmwjydMC7LmhwIowdTTXguIgEyEldfO5Z6XYK07517wcV/ruHnzg2P8w8u
	 3BReKpgBGi2JPegsH/Q6JS0PtrmfC/olBUwqtYgxmTdcN9Qu+gq5csGaVPP82kOMNlpFc
	 TU1cmRflzce6jAkuwKoRjyeN6jBWz8DCbFj8OPWjKLsqcnwhV655FmhQIl/AAv12dHQPg
	 F/QgnwieJWxi4zodVqVOc+xBv431nKSvYV1pUF0/u8sfOKw6Gtvd6Um4VCFThj7nln+K4
	 8fvnrOAN8zhfGH9DZVrBokt8soZ3fA2eX2n10Oi2T38iLAIheKp+OVY81gt/NfgaMow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A1uGbcBK;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F8D606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36F8D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A1uGbcBK
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso4793981fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616249; x=1796221049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aAjT/juoIc9zz5suBwAKIoZ37zYZ6TKZoBm98/nn904=;
        b=A1uGbcBKfncw0Tc0tLr4lyu6d9hbYldzQ35IkDT/oie+1W9Oj7OT/fRppeExQukyJX
         i6DBLiUHi782agsruQuGjA0zcuVTluaD4d95YNsXDOIY62phyVNZIZzGpg82u5r9TBTL
         KP5Evba48Ci3NeR5K4gC5Uo3yVTh53n/yPMCAOudo/k3OR2XuCO5snmihk21L2FljI41
         0267N09LyKKKG7mcN2RHMuSjHGZu2U6xwNZnP9qKjd0uVbBnDo/sDu5pII8SHH9DCC2j
         WMIS/qGAl0H+vQPvMGsMHjv4INCcwDqN1xDPefrteQIKQutbbRcoOa3ky4Wz8GjXsAph
         mzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616249; x=1796221049;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAjT/juoIc9zz5suBwAKIoZ37zYZ6TKZoBm98/nn904=;
        b=evJiDus6Qz+DKwmyBhnQXrkgdQzakqcOaigQvCcaQrxyGxSXh83vPw7tqtAt8Jb//V
         Gqkqz26Oh1k5YrA9CzAFCWhtQ6rmRQGDfjx9czCkcrmpc2VMjBBzvshK5h07o9lAPTDR
         e0+KJ4XDjbW97XaTIXETQ/Z2/1UoAYlXFekQclvqdZhqEuGNZ3PNda30YH4N4Jx1guKw
         BgxbSBo6ohTByiYazk+qWx+hTwLUbOfv7mUXQp6Jx5WD5b2OLlTDi+zQd6x1Q93TN43f
         y980u6X86fw9KzQO6yw73RyVRhx8ums2UWhPbSaUIhOqzUsu6AXa79LAnlFUAwhg3uY4
         kJrA==
X-Forwarded-Encrypted: i=1; AL+hErGH6H4Xbe3wgmQnXmwqow6f/A7hf0r0Wlu/GVXAgYUCED9bXZ2/1yUEz1bnMvlVIApZavMHB27xndJG0II=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tQNGD9sAqCKhAIIIBLNdiLXA8KlVYmh/7R4aqXcethZFcigm6
	nPRPNyRH4Q++OmwKyLT4SIxHgua4P36+KLF7sCyA+RKc70Ht6+hPU6zOg3kBHa62Weo=
X-Gm-Gg: AZFdTZf5vJbWx/oAuRdbB1nrcBphi238P5b+CHP+Jqaaf/xQQgh2Iy4Lz3iI9O6uGYI
	bN5dyRSw50A2E5RkhWEfFj7R2mWf6h6z3Inbf/B42bAl48yUu5CA0qNIL49hU2eUalBK42PXgrv
	bkcaxOrd+L0ohPdqp60tefPWMJ4TktO5YUe4Z7TeUsPSEmnKdTYx3BikGXttEhYgyQ8zrPAGHQN
	lFs64I0SytgBwfOt4c1J736y9Bdmv64kkgwCv/pP4FzuRFsZRJfoy9a38YzqM/P0u6/UPxRHPz3
	jgM9zHcd4gC7gO/cawy2ei/Fzv5te4giVyTvcCtRm3afRCJELfCcBrT9wj5lbnzshz8aj+wP/gM
	CxnvcrPu2sf+wTRdmgN1yjhBem+DhaeGNkcqCVG/1DZAZukfDSHjw45IGWJjuHXPzRimbyhvQ5+
	A+fMkuwKQvWwtI7ZqmaBJeGnzbWFvn0i/hQCpID008GYV7sBRXJW/JqjtL6wPw0021/Ub/X7DGf
	ZtHEpitQpcIW24salOKP1lIa/A1MKkvUbxsatdrfm97tWl2jAXnSSj0CLexRNnN9MufF2g4mRVC
	g6hx+WE+DTSpYiV5J7KsWVeNblfrozvqj4E9TWx3oflDhnadFbULjCqGENO9iXhGs1CBYW4sX+7
	VdIVCtqc=
X-Received: by 2002:a05:6512:6c3:b0:5c1:4a47:b86b with SMTP id 2adb3069b0e04-5c1bc785b7amr6120129e87.3.1795616249240;
        Wed, 25 Nov 2026 06:17:29 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff993csm4633339e87.23.2026.11.25.06.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:17:28 -0800 (PST)
Message-ID: <a1b367f1-a65b-437c-a9b7-92b29750597b@linaro.org>
Date: Wed, 25 Nov 2026 16:17:27 +0200
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
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
 <a2010032-8750-4289-b443-3afb57d656e6@linaro.org>
In-Reply-To: <a2010032-8750-4289-b443-3afb57d656e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nihal.

On 11/25/26 15:28, Vladimir Zapolskiy wrote:
> Hi Nihal.
> 
> On 9/25/26 08:48, Nihal Kumar Gupta wrote:
>> Glymur's camera subsystem hardware is a functional subset of X1E80100.
>> TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
>> three CSIPHY instances versus X1E80100's four.
>>
>> qcom,x1e80100-camss is not used as a fallback compatible since it is
>> already claimed by its own binding schema, causing a duplicate
>> compatible warning in the DT schema checker.
> 
> This sounds like the DT binding documentation shall be fixed instead.
> 
> It makes no sense to add a large number of new compatibles to the driver
> code.
> 

Please ignore this my comment, I believe it will be simpler to move
forward with the current code. Sorry for the noise.

>>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>>    drivers/media/platform/qcom/camss/camss.c | 1 +
>>    1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
>>    	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>>    	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>>    	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
>> +	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>>    	{ }
>>    };
>>    
>>
> 

-- 
Best wishes,
Vladimir
