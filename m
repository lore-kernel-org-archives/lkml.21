Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771628;
	b=Q48Mm50mEaw77f+9yZENLfsyhx1mydKIuk0RHA+YrUSVBvJs2h42suDxrumKnc5qoxEt
	 JkjD/5j0iq3NRQIJW+M6xB+pKipjevKLgaZP+6YDC7hyVVWjkuy0PTFmwk0h8Hb2MjcK4
	 StN0AYT75f/a7ayq2UZuXZTzAGO7xdtVIHV7cBmgdv9ArNGkLM2Q4V5RkdoI5Mghe1Wr3
	 n3rEjzL0cL2YQw7WK1XtbxW+iWAZRNtPQmy5lLEeO5TjnUZUOjFbpJYW31iAN773RQWqF
	 H+LWL02SmDJ4huHoVFK04sqhz6He2YCGwKl1OksSTuP04Mugso7khaW5PTkOn1FCT4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771628;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:From:To:Cc:
	 References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BmvSFNwuZZ6ZhhMfOJ07HjKd8JZmJAhwtuSSqIjvLDI=;
	b=o17RdgcbGrdDmjlwl8O71TFmSHFMj+Wv37OWFnaoE0pDqv2zfP+YRauRaNG6ZQ+L6lYE
	 gMuyO+l0GrqNqFQeLxHmUm4ecNUniKMUw12YvOe7COB6Tz/hyBkr7pmPJTIm0aME2MEr4
	 4WpjN740ynP/KbxWS1E6zS4vsAgBrPXFOiBrDuCaFIGVkcEf8i1WuHBHarfSRXJZez34h
	 L08GUtRf3m8epbwMfCUVhSlqe7uPT5XjZ9IsKjhbZpT96soR6fsk3qMqjK3CwQa30yduM
	 RIpnnvJX+wRq+fcOK7YvIiNIzhVof0GKLW8s5GL7HCfnKfFZbNbjmc7L/MIDHgFyF0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bE1iioEv;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F87606A68D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F87606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bE1iioEv
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C82521E4D;
	Fri, 27 Nov 2026 01:27:04 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2D533F632;
	Fri, 27 Nov 2026 01:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795771627; bh=JR2LNnD/GioQmSMBCZUq+Ee7uvXzWpRUqwQ+mu1odsU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=bE1iioEvTg35faEDRH8QQcmSSxco5PcTLwvDaem+q49Mv8Tsxn2qxk4r8gbvLhYpW
	 BKe3UFo5vdYHE7oEAXoCv9Ih9hselpxG+O2k7EW+VYtPhnvHg15KCFToQqag46uKtJ
	 az++Xml36zL3z6AkXX3jkHjXGN/mQL0kkf9fPJ4o=
Message-ID: <c502714b-7268-4a77-bda1-3f9540665950@arm.com>
Date: Fri, 27 Nov 2026 09:27:04 +0000
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
Subject: Re: [PATCH v2 14/23] coresight: trbe: Treat access not allowed stops
 as fatal
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-14-3f57cf3199b1@arm.com>
 <e44a9c55-4fe5-438b-80b5-f2ebf09dc1d6@arm.com>
In-Reply-To: <e44a9c55-4fe5-438b-80b5-f2ebf09dc1d6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/11/2026 15:06, Suzuki K Poulose wrote:
> On 16/10/2026 17:55, Leo Yan wrote:
>> Arm ARM (ARM DDI 0487 M.b), the rule R_RRCNN in "D6.11 UNPREDICTABLE
>> behavior" permits a buffer management event when the effective SCR_EL3
>> security state does not match the owning Security state. This can stop
>> collection with IRQ=1, S=1, EC=0 and BSC=0 while leaving the other
>> status fields unchanged.
>>
>> With EA and WRAP clear, trbe_get_fault_act() currently returns SPURIOUS
>> for this status. The spurious handler re-enables TRBE without clearing
>> S, so collection can remain stopped. A retained WRAP indication can
>> instead cause the status to be treated as a normal buffer wrap.
>>
>> Recognize this architecturally permitted stopped status as an access
>> not allowed error and return FATAL so the fatal handling reports
>> truncated trace. Check the syndrome before WRAP and do not exclude
>> TRG, since both fields are left unchanged by this stop. Check the saved
>> IRQ bit to preserve updates without a pending interrupt.
>>
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-trbe.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/ 
>> hwtracing/coresight/coresight-trbe.c
>> index 
>> 4aeed1a17c4bf1653fb41731ac15f31feec7ed2e..1c585b6123df2f20d08747678d836742ce9564cc 100644
>> --- a/drivers/hwtracing/coresight/coresight-trbe.c
>> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
>> @@ -708,6 +708,14 @@ static enum trbe_fault_action 
>> trbe_get_fault_act(struct perf_output_handle *hand
>>           goto out_fatal;
>>       }
>> +    /* An access not allowed stop can leave WRAP and TRG unchanged. */
>> +    if (is_trbe_irq(trbsr) && !is_trbe_running(trbsr) &&
>> +        ec == TRBSR_EL1_EC_OTHER &&
>> +        bsc == TRBSR_EL1_BSC_NOT_STOPPED) {
>> +        err_str = "Trace buffer access not allowed";
>> +        goto out_fatal;
>> +    }
> 
> It would be good to have the conditions in the commit description
> listed here for reference. Also additionally, I wouldn't mind adding
> a wrapper to cover this case or even adding an alias for
> 
> #define TRBSR_EL1_BSC_NOT_STOPPED TRBSR_EL1_BSC_NO_ACCESS

I see that Will has already merged the TRBSR_EL1_BSC_* definitions.
For now, we could leave it as they are, but add a comment as
indicated above

Suzuki


> 
> 
> Suzuki
> 
>> +
>>       if (is_trbe_wrap(trbsr))
>>           return TRBE_FAULT_ACT_WRAP;
>>
> 

