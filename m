Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523760;
	b=By2t6JOr+fB9Po6XliIus/6cPjnehHjkKURMTzH4kbpfowSHHHdChtfotJbDQIKEbA0O
	 HgIsUa/303dAwabIWU17NJRfJf/1pt6IHjpIZuRyTMfjvLiiUBgxvBbISWsFTi0z757Bm
	 0Rwc1tF9BiO0/YnQAfRt/kvV1luUWtfSSANqcbPp7SxfvNHp0Nc+bSXkus8UGXKHYIxze
	 Rgaj8u9OO2H0yf8b5YbVxLsateZgrIW2R4LifV+Oc4qy1RVCTbB2tDbORIQY++qbarmHw
	 IC6uwhWvTkw8RO96DsVKhSFMFAhWFIF81kkooyiCPzB/XyeSHAWj6MKLZ/xwe0kKwnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=A0JZ8rpuLBAnmoXP2EXMjipyYHstvEtP1ShZXzsUQ1o=;
	b=WL+p/WQU5BMFQT7wIs3sZaLC0Mz6SMaxRYQmr3ItBxBgSQY4K2jT8dIU6cKLKglaHZWl
	 mGfaoSwFbMEzgEsrd0nxP4cVRmVHzyjF6fajBdAWVilNpHt9dm7yOGm2oLK5xubeeGnx6
	 RZR1ZUOa70xtbgrHbAMysA16iuQauCpcl0H1GAtiFJcEtyeBMF1VxobdeBnapl37onFMP
	 RUaKacyY74Mo1C4ISh+g5sHqYXnoAwMjiZJp0zBqeL1ZOleLZJr9GkhFsA0OGI1jf7WZ8
	 h2mlYE45vvdI20+pjPCgLRZ6Ga0r/SA3Ee6Qdkk4hAF2whLGdg6FPt/K3UlFGL2H6ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oGH5MxDT;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E630C606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E630C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oGH5MxDT
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c513a854320so727339566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795523758; x=1796128558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A0JZ8rpuLBAnmoXP2EXMjipyYHstvEtP1ShZXzsUQ1o=;
        b=oGH5MxDTn+d8EiD6of2XuA66WykMNo9n4h4Uhdx54Kkx1dFVHhUULXYgtpoF0BnCRm
         TZUkYi/GO+ktBWCOSerzr6XrHk0LVdCMqIe3OdtCnkeq3z9NKCaO4djuexke7K5p0Ed2
         1lhkV+ggicW+lB48KjNL865PrjwbpXuvgbAGdkR8xo5X1z7ZmiR3klPJLknVc/uW9x+T
         +Zc4Y0z/DVdFQPg+aRynpcBYKhu1Bc93iRLPBefei4XLwR2GnBKMkkA5jmGtpyzA5xlJ
         vStQJobCc31gcwxhJp+unl3iwmKyEpMNxL02QreicRUNs+WoQ84k+Tvg++TluZaOvLmZ
         ZiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523758; x=1796128558;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0JZ8rpuLBAnmoXP2EXMjipyYHstvEtP1ShZXzsUQ1o=;
        b=JaMGjWIkFcYvb+s5smIFty5b3xttWRBbLCA/6HJ3Kl2Dq6pjIMJuElAul3u2oEb6Za
         7us9KDWheo6rMWIY2g6smua2t/Efxoj2cWPuvY2XYs7DozehNwdPGip48iNrM1paPYRQ
         jeMkZvL2U/jnm0vYGH77sTp08M+fKh0PKGKd1E0uFdH0ECu3cizFvXnqUy/mKCU3KQA5
         t77S3RwcsecskweWjUEGArSF8JKkRr2b3Sl+usOEPd+6aNjSyzIFfCFDq/jGfGDzxZzJ
         T6K6EO326XWe4b5sXHzRMXV3VIdVhGM5wC8cPG8w33tid2HR0uvAKIQQM8+9GJCy42x8
         Ub8w==
X-Forwarded-Encrypted: i=1; AL+hErFRKScOyhSpKZHuPEHdCAjwtmzBSARk/vwoYQHyrYTDlOD0DCTcgYhZVT+vM2/13HpQ3Hp3XNZsHPvWiRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AIc5qgbST5UgYoOxpymy/Gm8E9YKBdVYHgWi9xxUDrgm0Dpv9
	nieLjD1dokMUBkAAiLcB9/xu7gKlapJyedUQW5pQZ1mpO26uSYwm4T1RSVsYdTSh4lU=
X-Gm-Gg: AZFdTZfq2L1fneoOK993efXK/Ik6Fw1jch/ftqUfH3OLz+f/TBxEe2lDfV8M59fhXMG
	nSqWim8ZxTpAr3tw5Tk7RmLKCxMK6m9Nf23GF/w0tvbHlc3gLME/yPBI6yVcn+u8W0jVvkYeVFd
	17NWFdvvJis28XgEljU6oBfYMvUi6NqJvp5C3jahbc2XSGGI/Up9AVTLecmBvdoWsbQluF3rmRF
	4DgxROFZwDBD4B512BHXgFrNq3uXMDRnTd0neqNIQuKp3CcBOgNG5zRdTxqq47lmBHrGtP3wypT
	vELQsckDDHYzXe+PVaLmgJT4ucYGbWFwN4RR/SnKTwuCGvBn8jGZRzO6UPKETGrRyvTwoIZPOf8
	IcV0eFoXgJHOtmPH8pjmzc68+og0TFA/P14e6YHi2VU8Uck/QsTi/o76PHXjWmdzkHMKqg71TVY
	mHK9WRLbcdAmoqBqsZ3J8XdB/EnkNXlTVJoE1/S8bVpjnuw6Y/w0Le0cZMogSGKokDRIiPDYFtK
	CZsxH6Mxpyl5xGDHJFN9NIaqeGaPmxeE98y9Pj4G0oLNuRluN6ELBf/jA61JVTLR3gQkXgaIeqi
	+IN86hxXpbdgBQH8oDKVJJNhfiRH5VSS9hVW2ukOB84=
X-Received: by 2002:a17:907:f812:b0:c50:d92b:6f40 with SMTP id a640c23a62f3a-c513a88a6b1mr1121542166b.20.1795523758207;
        Tue, 24 Nov 2026 04:35:58 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42bbsm503065066b.61.2026.11.24.04.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 04:35:57 -0800 (PST)
Message-ID: <57fed113-9f79-41d3-96d8-725be5e58918@linaro.org>
Date: Tue, 24 Nov 2026 12:35:56 +0000
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com>
 <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
 <CAFEp6-1otVCjNJgWLTiOMQpdy1t4qJUP6_NK0CuifrN+cOTTcA@mail.gmail.com>
 <08b9a714-278b-4e1c-81c8-59a60dba5916@linaro.org>
Content-Language: en-GB
In-Reply-To: <08b9a714-278b-4e1c-81c8-59a60dba5916@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/11/2026 12:28, Bryan O'Donoghue wrote:
> On 24/11/2026 12:20, Loic Poulain wrote:
>>> On 23/11/2026 17:16, Loic Poulain wrote:
>>>> +static u64 __csid_sof_timestamp(struct csid_device *csid, enum 
>>>> csid_iface iface)
>>>> +{
>>>> +     u32 lo, hi;
>>>> +
>>>> +     /*
>>>> +      * The pair is latched on SOF rather than counting, so it can 
>>>> be read
>>>> +      * one word at a time without tearing.
>>>> +      */
>>>> +     lo = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface));
>>>> +     hi = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface));
>>>> +
>>>> +     return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
>>>> +}
>>>> +
>>>>    static irqreturn_t csid_isr(int irq, void *dev)
>>>>    {
>>>>        struct csid_device *csid = dev;
>>>> @@ -207,7 +234,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>>>>                iface_val |= status;
>>>>
>>>>                if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
>>>> -                     csid_sof_event(csid, i, 0);
>>>> +                     csid_sof_event(csid, i, 
>>>> __csid_sof_timestamp(csid, iface));
>>>>        }
>>> I think a callback in csid_sof_event() might be cleaner or some other
>>> way to not have to replicate all of __csid_sof_timestamp() for each CSI
>>> decoder.
>> I added it as a parameter because it is provided in much the same way
>> as the sequence number, given that the timestamp is directly related
>> to and coupled with it. So it is not clearly obvious why the sequence
>> number should be passed as a parameter while the timestamp should not.
> 
> But pretty much every hardware implementation will have to do the above 
> function. I'm asking for more functional decomposition.
> 
> You could pass the hi/lo for example and make the sof_timestamp() 
> function common - called once from inside of csid_sof_event()
> 
> ---
> bod

Anyway yeah csid_sof_event() increments the seq_no itself so you could 
just have a ts = csid->get_sof_ts(csid, ...); and functionally decompose 
without passing hi/lo down the callstack too.

Either option really.

---
bod
