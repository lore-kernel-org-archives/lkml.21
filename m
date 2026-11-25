Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611537;
	b=EtJa6iqTpW2fa7N2pF5koGOx1csUp4Oy90M4/p1TM23kc5alu3mXJ0XM4nzjPMaFkrBg
	 8iGi9P3o7ywK7mKVEXGHWGNe1fBC9eJ+UDFbA4ZMsEuFr/Im88nfdZhM2auR/Au2ZI+A2
	 KXjFFbVlpDlGSSEMV8YLR5XPNiEXeYvQaoRShnoNNdMYb78wIkoLlvSDJEeOEfQXhsZyu
	 BHqY1nlQdfvzPNr3fVLfaxjETBl2938wofcDUU9wTArBEHJDlmf/X04b/GliEm5zdY7Z/
	 CxWEfJyjRkTE3t1XflYu+N/r9+6NAEjIQORruP/qg2+1Rc9F30JST4cMoAYIhIS1fCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=u6oxRIu4SdFQBMsaAB9eGVbDqvQ/rHbglgjh0h20EkM=;
	b=1CLfty54rpXyUMhcHy8qYqDiqkSXXiaeB4kujNHZzJg8oqS6QZTVgZYpXKVPV7L6YmO/
	 85Br+bv5lDqaiJQRo19uNQYCCpIs17hi1Q/sQo/p7y5ZEYAigvs0aBtGFlGlnQWwwtlh0
	 kO6twqtdSsVOAMPaWwpotkVcBwa2zOIxuWBkPTcKqL6BFtKkRA4jNxC2oToWstJ0VPu4g
	 +L7NMk3fk54K1qVmKjLhEj53y6bPs/4t9tcmrNeVpmSmtOnHTtUPPD/nOvwHyOxOPpXFw
	 dpm/ac8vUcWRboDp2aMxav9McvH/wVEDK2RdRtur+J5BOaG7aFRwA7LXUMXgp4bNM6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="p/DI/Nj4";
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814C1606A339
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 814C1606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p/DI/Nj4
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab1e5a01a1so4518581fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795611535; x=1796216335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u6oxRIu4SdFQBMsaAB9eGVbDqvQ/rHbglgjh0h20EkM=;
        b=p/DI/Nj41CvRYVlg9y550Y0THmM1nyk8wmWmigoBB+no6LIx/8W+/VK5+p+oIzIxAV
         eFHUc07Hrx+FpwgNuFpWhO4Ju0QZT7jUf5PVOoTG54+Buo8ByjNf9BCMoAt19CwDkCSt
         Y3fcyPH9dmUmWj5j8c7JyZD8BwuSv9ul+tt8PyFloswbKfmoHFQCUfUlLFNtBtCo4/Re
         rup0AXGG8sR6XOufLrnxiZ/vWv+Y8nMO72jcepwtKCfnraOwNDFg7mzf9ORl5OtVlNk9
         cOpKycv0rYpHdwHEhOIepEKfsDDkWPUwiiklPFa5VKVzFglw3f4bzE/08DR3MkmZ5916
         FOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611535; x=1796216335;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6oxRIu4SdFQBMsaAB9eGVbDqvQ/rHbglgjh0h20EkM=;
        b=Sfa7gVwl6Q4q0xqIMbJDUlz2YScr++qDu/2x0YYTzi1NnzmQdQ5XuLERewM6hwHSKz
         Aa+h4bfcQzK4JodKZaejgAPwMe6vBOfhe8oAMj5QYryCB2nfP24eEzQe2CWU0caPjdaZ
         vYK8yxjV88RiW11i3J7eCehc5bKV+goW5GGtIrc1dd/2S8mQ5Ayp+C97+STrShx0MYuq
         hHLVBzl4/h9otCCppWJvAJ4qYOVgyYi6usdWxcB6WXvEGOgl1CfIkMVOb6Xo5dR1cSao
         7GPwtUIh760N2MSjFoxYf7vfdwilKeEeRZ5Do67BmaxccpAeDkMN+f4JyYRp1o3LMAuN
         knrg==
X-Forwarded-Encrypted: i=1; AL+hErHbqWYrL0gjknML4gzP8tFgoWQumk8mtXCbSO7XAqztYcdrqDN4bGtcDD26rc4E2HxdHHgYgQcFY3Sq+oQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pD7CbndyTnpWvph7E+VMXJrty4EROMXzvjPZoPRQNUFmtchSJ
	UFqWBTQO/p7BXuSV297IXz7cfWEkkICaZLembR02mi2/hekPsJN8BpaXALyBjFF2ZqFrqkciXXe
	7EATlADM=
X-Gm-Gg: AZFdTZdIHVHbJIFTBaYmtQkoJmCxEDQ9jBRHHWBv1QizcQaliRkfHRkBilYmRWYxhqw
	/1uxcFeNWbtBZWxaF9nlESAcH9QVC8vS2VDkg30bUiwUExncKI031a3V0YryuuqSa3TOArzdWMZ
	9RRXmLZQpFT0/67jpl7dy3IeNDsIq9kdW6RnsBleH+caa8y8gVFO6Iz5gVanbKgD7AM9WX2T2Lr
	oBYI7B9twoVpgHbsiKmpgsOu2PeDAWc4MtAsmUgTiMk81cpj+aA7uYg5FpQxeXDa+FsNCuZYCbr
	W4qHVR70Yu3t2ImbXvYNibbj5ayFfBrFQdHwkw7RfIAYieLi9LhGH0mZu167bnxwgsoRtwdnZSa
	R1lcm+lAzRGotAeJ2RbTqLuz+E7/IOjT8p5bgmYMjvGoIFeSRoSkHX2xc2py0KGb2fW/2m1ryX5
	9Gbgk7UsPayFsoiW2AYqNAQ/jZx5BRWxQ5pTcs/G11G/ASvZ54C+zt42677466hTbyjobhR0acc
	IazuXXUwXelUNv0vmL0X8Fie9rgNGGpl/8CCxmxzgafxUahtoKLMlSj2l20BvlpXA5B+ZxrlK1G
	8QArYhwnOOMzm/+v5JxR2YOP5b35vadtVlJCBr1WLaqw8MV+AqZAvIx8ark7ytkVRtxqJVz2Xuk
	giZOyceY=
X-Received: by 2002:a05:6512:4382:b0:5c1:57ce:d4b4 with SMTP id 2adb3069b0e04-5c1bc75212cmr4845380e87.2.1795611534560;
        Wed, 25 Nov 2026 04:58:54 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff87c8sm4512834e87.19.2026.11.25.04.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:58:54 -0800 (PST)
Message-ID: <2bac2b46-a124-4f41-8a19-7dfe1c936caf@linaro.org>
Date: Wed, 25 Nov 2026 14:58:53 +0200
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
Subject: Re: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
 <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/26 14:29, Gjorgji Rosikopulos (Consultant) wrote:
> Hello,
> 
> On 11/25/2026 12:19 PM, Loic Poulain wrote:
>> The timestamp reported to userspace for a V4L2 event is taken when the
>> event is queued, which for an event signalling a hardware occurrence is
>> only as good as the latency between the two. A CSI decoder able to latch
>> the start-of-frame against the system counter knows that time to within a
>> few microseconds, whereas the interrupt handler that gets to queue the
>> event can be hundreds of microseconds late and is not consistent about
>> it.
>>
>> Take the timestamp from the event when the driver filled it in, falling
>> back to the current time when the field is cleared. Drivers have had no
>> reason to set it so far, and every in-tree caller either uses a
>> designated initialiser or memsets the event, so the field reads as zero
>> everywhere today.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
>>   include/media/v4l2-event.h           |  9 ++++++++-
>>   2 files changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
>> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
>> --- a/drivers/media/v4l2-core/v4l2-event.c
>> +++ b/drivers/media/v4l2-core/v4l2-event.c
>> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>>   	wake_up_all(&fh->wait);
>>   }
>>   
>> +/*
>> + * Hardware able to timestamp the event itself reports that time in the event,
>> + * which is more accurate than the moment the driver gets to queue it. Fall
>> + * back to the current time for the drivers that leave the field cleared.
>> + */
>> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
>> +{
>> +	struct timespec64 ts = {
>> +		.tv_sec = ev->timestamp.tv_sec,
>> +		.tv_nsec = ev->timestamp.tv_nsec,
>> +	};
>> +	u64 ns = timespec64_to_ns(&ts);
>> +
>> +	return ns ? ns : ktime_get_ns();
>> +}
> 
> I think it makes sense to add an additional field for hardware-based timestamps.
> Converting the timestamp to the monotonic time domain introduces precision loss,
> so it's better to expose both to userspace and let userspace decide what to do with
> them.
> 

I support this.

-- 
Best wishes,
Vladimir
