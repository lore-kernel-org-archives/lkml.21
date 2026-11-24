Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520877;
	b=2Ve9ma/bKb6Jz72PL/DZYcO4SrYhgTfYE2H1si4gyfg/ywNFQC7oZh1jRlra0S52khKY
	 mxlYvMlNmsJwaOnCaRQNy5eotI1FhUlIrSfP1gUk+am8Fzc5Gn2CKJ3hDTiIC0jp18CAC
	 cXvCmI+vctnUIHjtuSyPardqI8Y+xGTfKP9DqymtKIxi9QgawTVKyPCUlFov8Wk5RlI8R
	 T+wr1si5Qbsq6xfQGm5mZnRbhRG7562W5VGMfzvvsdFJSzFE5pvEKyMrW1/HwhIUYiWZk
	 GEuB0H9P7jKPxbnV7fMDPcdP3zfTqMnOtxZWQ3wfLmq/sagT9woRll8Pwai1alYeL8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GY4X2427yKwcvmSccJzJO+cyNWHTwTN9g9RJkbIPSls=;
	b=NtxGrJxNIIKC01Nxe+YTFh8Kt+NUwCeiEf3HcIxzt4AUZPXVHuG7ixWmAnDp01ARtqpI
	 26R260li9STmG2N3ngQ0cNzglKxNoEY1tWHqPpCCt6W6+mcpZyMsNkcROAqDL/JshnQ7f
	 TOtElnN/Y4OSWt8w3pC9wmKWPboNP1udMeQZgR8gJ4nc25dHAfxJi2Y56h2j/TifD9XeT
	 1tXcg7QP8RXw3XTFNSq3+VQ3Br0LMgjNhg+eVBvetTq5P9FXsuv9o1dSMNxBZ4XAuDnIk
	 Bhj7PUkJ4wdmfH3OmC9S03W8GNNbbAY87qSwdFgP9HxRL9chaWv2JeS1HPBpXDYK2CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mek0rg0H;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F663606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F663606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mek0rg0H
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so3644638f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795520874; x=1796125674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GY4X2427yKwcvmSccJzJO+cyNWHTwTN9g9RJkbIPSls=;
        b=mek0rg0HoMDQQWqq3r+W+sp1S6saVIYENtmuVRsWObbg6ISEyXh7jzBRMYFADOwxT6
         uZhHPGi2/jy225RsceAaiHdW2kehAopL5/4UNRFFtcWVAZZ73SIKlUYpCoujjBoaLg2z
         2E10xdXgjgvnkA3mjDmbVEGQ1n5euxXYgZn5ikrml2L7HY0wYm63dVT7HIITxkGFNMSu
         tbceSaVfgNMvO/btjSHL5ZaIiP9CBj0wtxDutWgeVQO4LPxUPnabrztcBuPD07NP/uHk
         D2ZUnWrLl0Ne+RwfXmUH3JQb+whItJoxQY9K1jEjgguj6blAkvEtdNvS+pfrxxUQNRUB
         kbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795520874; x=1796125674;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GY4X2427yKwcvmSccJzJO+cyNWHTwTN9g9RJkbIPSls=;
        b=K6zEpeQurKUa5WDnPKSYHbMs4J8A+cBjhtUBmJzlVwGxDiUFsDENVSBAW6BAsvUuUN
         A0abmbP7tAMzUki0JAnf58FMEL77Xe4UuF9HzOMjuCaP5AnoGuK5Crb/LjOsuuIfrJFC
         a0XVY5arVZKSiJMdfNc87STRwNeUNF7mSWogkCblaPFD5q/yQpiB9rXsXOkWWfygG3wj
         GvMZpT2QWCZ/vDRiZA282ek/3Dm2kfzmZe4Y3ISA4ZUjaerG1N9fXkboYTJ1Px71FYLa
         csSOMyLPEGboeq360O8ncsW2muXuFVwJ5Ln7+1YNCDlE+Nxc9xN6QEBtza9UMgETlaH/
         PDhA==
X-Forwarded-Encrypted: i=1; AL+hErFv+uNP5+UQ7MWzghgNNwjcre1CW2P7YxZxf1/yZaMla7goJjUrTYeTqpQCxlKZJtPcCm5iuav062Vlacw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LdYV8Ww5DdJpKdzwfvCA3of2uBoXFQlZlF0dInKCSOajRbEFD
	RHqgkQDQsCGNdVkltrnt8sicGh2+8fwivINEt0OqGouwN/v8KihJ3tJryzHamMR0YcE=
X-Gm-Gg: AZFdTZc8rF2yvEx0pxI1Z/kAEqXUWYm5LRRamm1IzPQtrhdG1qO8ISc6WtXUQ4VHZN8
	ujOQmcmABL5w9tz9QNCUKtgpE9R0LIH1kRYxshqDEbTLBfv/iLbxq5GGwTDKjQrVOelGAhfwZFN
	gSqnqWTihFMc5w3osq2OSgbF/6LN2SJyuLk5hvu1nCR1LQ23QxwbsdXBbSzKGYrLnYWum7qyzW0
	wQbhWt+EdK0ex+nOQrMpE8BAYiI3sK7cwtb0qdAUK4tcc7qkWh1SM/U55pS1DGreployGBnxqJU
	WEq+ySPhgXmn63nVxy0L2fn5L8mR3fRAGYSeMW/rKPRgoMjXtMOedJEz/nQPcNWcrPtCpRizrrR
	oHcCKNr6Q3h6L0um+rsrfkGzRt71J3+h0csnge+Lc7u666gqKa2nObzbvtFCnCXoxxIeIVWPu2J
	Xy6Mhk+F0tkoIp38YP5rX+j/xrAxdNnNamqXpQ0G9BPdcAK/d4baK11iW34EjfwwGr3r7AC1/c2
	37oIVJenuLagLjZClRFjVZ1uP6VuiMx2NFaPOvtc1IN/kUZtiEL4goi4XTHQFkc5naV+9kOobXY
	XA8rML/3qQYp5xFevshguU+hSQ1cabb1ZmHVTO0j9mwo
X-Received: by 2002:a05:6000:2c05:b0:48e:870:7791 with SMTP id ffacd0b85a97d-4abb18cbe21mr28231125f8f.26.1795520874481;
        Tue, 24 Nov 2026 03:47:54 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm3362842f8f.54.2026.11.24.03.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:47:54 -0800 (PST)
Message-ID: <d695ccb6-f8f3-40fb-8bb5-ba138bdd0814@linaro.org>
Date: Tue, 24 Nov 2026 11:47:53 +0000
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
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <68bf8d15-8ebe-4d19-8f77-f49ca0cb5488@linaro.org>
 <CAFEp6-3U+X3gE_AMqn5G0MFFsdqxRGHV+u04iiBJ0RLA_Sb8Mg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-3U+X3gE_AMqn5G0MFFsdqxRGHV+u04iiBJ0RLA_Sb8Mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/11/2026 10:21, Loic Poulain wrote:
> On Tue, Nov 24, 2026 at 10:59 AM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> On 23/11/2026 17:16, Loic Poulain wrote:
>>> The CAMSS CSID latches the ARM architected counter on every start of
>>> frame. This series exposes that time to userspace, both through the
>>> V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
>>>
>>> Until now both were taken when the interrupt was handled, or worse, when
>>> the frame had finished being written out to memory, which is about a
>>> frame period late. The hardware value is free of interrupt latency and
>>> is directly comparable with CLOCK_MONOTONIC, so it can be correlated
>>> with other timestamped data such as IMU samples.
>>>
>>> Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
>>> having the core take it. Patch 2 passes the SOF time down to the common
>>> CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
>>> Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
>>> uses the same time to stamp the captured buffers.
>>>
>>> Patches 4 and 5 are picked from the timestamp support Bryan shared
>>> earlier, with patch 5 adapted to use the conversion helper added in
>>> patch 2 rather than its own.
>>>
>>> Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>> Bryan O'Donoghue (2):
>>>         media: camss: Define timestamp registers for csid-gen2
>>>         media: camss: csid-gen2: Report the hardware SOF timestamp
>>>
>>> Loic Poulain (4):
>>>         media: v4l2-event: Allow drivers to provide the event timestamp
>>>         media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
>>>         media: qcom: camss: csid-340: Report the hardware SOF timestamp
>>>         media: qcom: camss: Timestamp buffers at start of frame
>> So I was offlining this change and kind of left it at comments I
>> received to make the type of timestamp selectable on a per-buffer basis.
>>
>> IDK if that's really required for a first pass but, its where my own
>> reviews were left at that time.
> 
> I can imagine this being useful in some scenarios, but today the
> timestamp source is configured per queue, and there is no userspace
> API to select or switch between timestamp source flags AFIK. So I
> would consider support for that to be out of scope for this series.
> 
>>
>> ---
>> bod

It's on at least one branch I have its not finished but on the way

git://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git 
linux-next-23-04-03-sm8250-typec-camss-qtimer

That's where the other two commits you've picked up come from.

Please have a look.

---
bod
