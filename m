Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514384;
	b=nNfsaAJzJqZ5sDxr76k6kxWAd9YI1FajiELl1diJYGMoNCYMIfRypnlSLeIm4uLD4V1m
	 W7q9uYMtWmaClNX9tVbnI59nU4RgQn98EO8jt7yiqIk+dxG8nK+tA1gtFqFn7LvtoNjgO
	 jGpbg2mLwmudo7TM6rhelHfARwMJE4tjgLjPkwa2WczDjRhrf4rZHQzIpK8ncB8hazVaE
	 NFc0w4NvBwSkYEmxCFpsP0+NXcDjRFUK6O2H+a/uHosL0AWLosaTHL3v3sDaY5/FUxOUo
	 DvIPik7xoORfuJQGaTBWpJMjBLP59sx2Af9zY7VdqHdmQNaB+oGMTVvAURMZso+mWjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ah64LIQIXLTGPjDibRLYcaK6G0Dc/ReEzo5Y2FlN3Us=;
	b=BMmlOtRxIS74txw78DhsDDIMUSrW+ttftLjYMY4uApX/ONQFoNjUpBQIdwFEJGUE0M6p
	 SBo4x7EsliMwwLRU6S2KZ/h2BvCLGlpd28mO8g5HDFyc2gpGnKWjUILZ7pfgTwiH4M5BM
	 WmOJ4an56U3eg3ZfRcpb4ao/N3OaJiZ3f7zfMPgA7kj8YVNsdf3AYI8fEfrSAF8tzjAzF
	 46ShvII4wRpOC5j7zycYXfIjfzWAsjzO3xi5+y/UOb0PpXDO/107y+meN5Z1qX4T/G8WN
	 eqVBeJ4TDZlyIaGhkI0+J4fG4Ia2k9gboCqscETnxmqgOCQO/lhR9gSaiNueTZmv4tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hSmIepVb;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542C5606A689
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 542C5606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hSmIepVb
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4395d31228so723471666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795514382; x=1796119182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ah64LIQIXLTGPjDibRLYcaK6G0Dc/ReEzo5Y2FlN3Us=;
        b=hSmIepVbK9PWjrJBE1AprzX2N4p1wm7x2m2I4anFjoKv2cxG0XLVrsBXe5NIFEkEyS
         N1kijXpvpVAN1QOMPlyRqhgOTpbYI2dzHaqAoJgWxpAkkhtP/f5iWwn9TTl7wD24X3EB
         WxlV6AcGpKBEp2UfKtKPv5cEG83EaXrPouH3HCq1HYm8dq+s0DeWeySHJUhux/lzsOQU
         968QwsVS4eWoqKrOqBrwPqrEZ0Qn1jTJPqZWc1wPIH36W6qEAhXYEFtpPDLNxQ1aVfiF
         CbjZJRD7nsJlM5HtssYnsr/+Dt2Z9ZMa016YK5pVeoA31McodNBQihAv70Dw6snjGmXN
         dLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514382; x=1796119182;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ah64LIQIXLTGPjDibRLYcaK6G0Dc/ReEzo5Y2FlN3Us=;
        b=R6nYflHTPbQPCaFMJorVWdywvwYdxc1DhV5r62bIfAzKKO4f7nW9XHCVy4CFoJFRBk
         lrjKtuyrhN7TBu8alsDDVPyx1mtYCv4W/9dspNNbSgRtDFOxSZSAHCK8L8oymSaKNRo9
         TOyVZqzIGAT2/R32PB/MZo6EC865TQoE46t/TqEokqdEKxW0XSzCVSxuRJjz5qB+eBe9
         WrlrrJXA/bDMzdSt5wEYkhI3apQ6CzWaKImDr5w8dayMvW3ehadrdCNwlidSjV73UZ5e
         lp1T4vkaeXWmLMH355qXL0rvWUOIasCZV7nM5wDuCkjt/9PXyicdP0NJ527Q96qiciB4
         JVxQ==
X-Forwarded-Encrypted: i=1; AL+hErFM3EFwbqDpHhQHQnyuqcnDGjZnWXTKnvxc+1LmzRbg3jJqStfxVObvKu4QdC52W/xUOp4xdptLBdEhhSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sf+DybOVzuyzxzeXixQNKmg3s5oqiTBl8RLUUpuMz6Hkh515W
	u87XN60Q7wp12tlFT6UHJAv7tyyZ/RUAiAaBRf+6Bmas6RYH2AVwk/GBi/SEu3DysU0=
X-Gm-Gg: AZFdTZdr6tj+Xh/7cX9GDRhGe0uO8gGe3BPCladg1XwBSr5rt+lK30OHkEihQoj3jEV
	owC6iVEGXPd+fcXYLZGNapJKmFU0GUqr7ZPD07Jq3ji3U19waCdoNe7A+/t2wGZAgDiAyEYHWgS
	6Am7Gz4kfj03/MolVwPXt3GRE9sn5BMr/T7tvwoaS2IM59u2t2YfVnWqYc4gBqN3WSgIofKFhTi
	27PchwC7rpG4cSQltKganA4OF6SnCoaCtXndNdtx25qj0aSi5qaQXjfX6gj9vIMIcfn4szCh7NW
	GGA5c0DstkaX7iS5EB41gr21WUwdnkDFj0DfUYAq6g1YhBAXxFQdZ6F1ohUG0TVeXy32QvLyNwe
	zqjoNpVczFm3hJymUd9GsPUICw+DJ1w+oCJinI2d69U5nBD3KW/PqMLyD+jqLEKwj/4C6QXMu4m
	PY6HI8Z3/hz5MQYgz0+UoRDE5khYrSASShFsLVz8OEbZyEjczsdr1R657A0Q1ACL7PSlxxGO1Yc
	CWa4uQDWIYRckQq2HcNDR+5dKSBxLe6zUs/Bv2RQmS1DpayEmNEPWuA1Q+7/GQvtfq2h4zcTePX
	abD4lLX9sg+Yp2oSz5e6gmajFz8BQ3BLAIJiPcwaf74=
X-Received: by 2002:a17:906:f10a:b0:c49:b8ec:a9e3 with SMTP id a640c23a62f3a-c513aad202amr993480966b.43.1795514381642;
        Tue, 24 Nov 2026 01:59:41 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad01b0bsm493902266b.10.2026.11.24.01.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:59:41 -0800 (PST)
Message-ID: <68bf8d15-8ebe-4d19-8f77-f49ca0cb5488@linaro.org>
Date: Tue, 24 Nov 2026 09:59:40 +0000
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
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 17:16, Loic Poulain wrote:
> The CAMSS CSID latches the ARM architected counter on every start of
> frame. This series exposes that time to userspace, both through the
> V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
> 
> Until now both were taken when the interrupt was handled, or worse, when
> the frame had finished being written out to memory, which is about a
> frame period late. The hardware value is free of interrupt latency and
> is directly comparable with CLOCK_MONOTONIC, so it can be correlated
> with other timestamped data such as IMU samples.
> 
> Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
> having the core take it. Patch 2 passes the SOF time down to the common
> CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
> Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
> uses the same time to stamp the captured buffers.
> 
> Patches 4 and 5 are picked from the timestamp support Bryan shared
> earlier, with patch 5 adapted to use the conversion helper added in
> patch 2 rather than its own.
> 
> Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
> Bryan O'Donoghue (2):
>        media: camss: Define timestamp registers for csid-gen2
>        media: camss: csid-gen2: Report the hardware SOF timestamp
> 
> Loic Poulain (4):
>        media: v4l2-event: Allow drivers to provide the event timestamp
>        media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
>        media: qcom: camss: csid-340: Report the hardware SOF timestamp
>        media: qcom: camss: Timestamp buffers at start of frame
So I was offlining this change and kind of left it at comments I 
received to make the type of timestamp selectable on a per-buffer basis.

IDK if that's really required for a first pass but, its where my own 
reviews were left at that time.

---
bod
