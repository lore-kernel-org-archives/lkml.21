Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514173;
	b=FQvxsMzfNNBLw3DlVoJErYXsm9ZC0BQo9/P15sxACAeyDh/ShtrhwAMmYHtYwBSZuW2P
	 X+wetL1qQZ4TTRFG1NC+b0Vvbg++cynJ9pMvwur+/+P7uJEYDhO8q5y5HbOEQYbU2rtzg
	 iq5YElaShsvLGytmbpgg+KPCodzL1fzESMpJEcCkjzLAa1lWTEGG+Y06mBiS68lp5FJ90
	 BkYka/pSgeQvyK1r1xFg2Fv9QLI9XJjAeFHnF4RoP2SwMn8zhGWWJdyJHC9DTDYTe7KAE
	 SCA9wz1gmat1DdgAtzXdptmewzuIZltZ08g2dUpcxtjg0Okk9PD2Mw57L2dDDmPyEow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=idxfymof9qrD80mDCSy8sLfMw7IHnfMauze7irnybMM=;
	b=D7NP5AU2POnakdTPKvQolFpGnafq5snQJjtQCvoIkdLI/KqwGq9/+oXFvaQU5B4O021c
	 nmNQPC69AXz9Zm7r4v4od8u3ANiPGqbvtfjiW/aK/LoHsU1wf6I4rhtNe2KVtPKOGutF/
	 2pmyPcvSS82fZ7N7GWJJqTQoDzB0pWGp6UljwewGO2FTZ0eZOgPt1In6anTcIK/OOyAB6
	 GDh4R7i9+Y27K9LKl8fES51hdk1bElwAB0P1L2+YO6nHPOiwmKOTywz0KqeIgI0/V1/Wz
	 AUSMzeCtFJmmLSOQ3wmEvZM8/PbKzeMaQteO1JOx8F7RWWclIm5A+2ZvdpQ5beWgAZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="O/Q2gBA+";
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E2460A260D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16E2460A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O/Q2gBA+
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so5084472a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795514170; x=1796118970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=idxfymof9qrD80mDCSy8sLfMw7IHnfMauze7irnybMM=;
        b=O/Q2gBA+rhMwstg5y938RN+PNof+guIwVSXQ2D4BlGB6ChOpIcCDqP+l9UIfXKeJgG
         X4fK/+LjSo6q/p0914sAQTtkD29Y9wgXVqSVhqSWRcglLQ/7IeDtZUBQWXhLV170fpPY
         wlxPU3lxc2pP9OK6kJAogOFqVCd0iao8JypNWp8uRjII3h55+FSskq9S+6svO2ShtI2E
         gFbpSlFvoBiT6elxWr61tvu/S5XY/Cs0ZdXr9twWCFEBcMfhTI9frUVO2LSOqBLKjnoR
         F5lEs/Hk9H4N+zaf8Oh2qDN2nwsEb3/dP9dOy/J4T2Mle2FskgZwW8R9YgBpC1AKUNf5
         1ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514170; x=1796118970;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idxfymof9qrD80mDCSy8sLfMw7IHnfMauze7irnybMM=;
        b=deyf8pvF7ZgKgCiUr3rerewWEdJv52pRp6w8u9aLEPIKwl0uigyyjn10GxIn5w/0f3
         2560ochPd6Auc9Wdb7ucsOA8DZuJY8lPqFy/hi3/wCjnYb2kIaf4yF9HVChK9WZIiDck
         KZH+cRQLRuF9ATyEpMEowTXuFC8ItgPoRIvrJsUK8+oK41PO40kvibzaHTeC7GdgE3CS
         C+7gVMY/wIKNiVr7v208Cdsic88wYNQvEy8Q/NA1sQmb6irtuVXJXbV7hn+HIf6Zt9he
         t2Z9gjOo2J3uXGS0eN/Vq17xVhAxhPFkf6fXiDmsbFZ+SnTLifjS/FYZL/xOX+ti0aO9
         x8aA==
X-Forwarded-Encrypted: i=1; AL+hErF7J54LCh6bQGNOPeVV8miphf8uJQIKdq9x0n21NLlA6LHu59t02ErOh1+umptlE695D9Rf8GLcwVQoxvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XXZ4ukZrhl9m8P2qhV46KqnvUNsuO7rv04mZXCkKmebjqvuXV
	MMJM66NUEze568iTWrzbeFlqcf/FAc4ZngnviRpJQJpVTCWm+ghXeTYxWmgEc3Br0xE=
X-Gm-Gg: AZFdTZf0DsffjxWyBwsLxg00ctZByJT2utmprn7NmTCb8gzdz+SrjLM2jUwj5oUzodF
	yEvog4gfBMNvBEhZ02Evg3fIBerTr01sRIeiZPG1qFkIidhRVFfTSpWufnQg+8tqEh1NFMjxW+v
	9kfOoTdpjQr7gdvViwg6/4zhzUnNs81QXa76RKkaF2+kx05MoaOWyEgBHACusAxtpWe4dx5WiBI
	ZMMgc0wfLdfIYcowMuBQMG+XLlxIhfls1D6Qrj+5bn0P8hCNPk1mR4lEwzMQNM0riMde3E6FR9Z
	fEHIz1BEEKFsn7QgNXbhQWWxYzD6v32kT2O6CKaFLICFmpr77ypGZEVVJoZfEGQzV9705GlDx4Z
	19ePceqvESnbyXv/5MQB1IIFtP+yoS2nvYr/BZKWevs0/zeGdqjK9TXgRSiCA/qk2BSGjVoXyHM
	3EzgVmgSvsh8JYMH8/8McC6UCz3t2+Ol2Ad6ci2+ZfOss3Fd1WhOcY1IDr5eqH6Bg2UVYtfLBeN
	yzrkS9hf/rFuiDDckcVET4GkPcNTN/AxDCL74D/8wfHLUo3SQ3wWL7n8NXSPVTljLBGZg7V/K/X
	80AVbla07XSTpuBk5DhZl+0waUcjUjz1ubKAFA3HVdk=
X-Received: by 2002:a05:6402:400d:b0:6b3:f891:c2d4 with SMTP id 4fb4d7f45d1cf-6ba37ea5360mr9116423a12.29.1795514170370;
        Tue, 24 Nov 2026 01:56:10 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710601esm6563505a12.27.2026.11.24.01.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:56:09 -0800 (PST)
Message-ID: <089ec1af-b6ef-4a7e-846d-3f8ac5e72ef1@linaro.org>
Date: Tue, 24 Nov 2026 09:56:08 +0000
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
Subject: Re: [PATCH 2/6] media: qcom: camss: csid: Pass the SOF time to
 csid_sof_event()
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <20261123-camss-hw-ts-v1-2-7b62dda6d7a9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261123-camss-hw-ts-v1-2-7b62dda6d7a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 17:16, Loic Poulain wrote:
> csid_sof_event() queues the frame sync event with no notion of when the
> start-of-frame it reports actually happened, leaving the V4L2 core to
> timestamp it at the moment the event is queued. Some CSID revisions latch
> that time in hardware and can do considerably better, so take it as a
> parameter and let it reach the event.
> 
> Every caller passes 0 for now, which keeps the existing behaviour of
> timestamping at queue time.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
