Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771658;
	b=UsQ9NHl88ZcC4YoUrOZRJTarGUz9QniZaCBskpBmDVxgrUq6j5G/A+pXSjEWO8voeNy2
	 8DjLYucg1gcyh0jfFwOJx5L/4gFf46gHbOLKkkKo7c6oLWZ7Ii0hYNh4oGudPhPDX41hy
	 wWimdMpny2vqxFLm9vNpCkGk36/kZ0MkaihvVqpverDU6LhyzmU3wzBfvAFSPaViKWABA
	 mw2eJpJFv0ynXFjRAWQdmiTTfCHcsSXnASbwLpMjUmDVT7cUuu5AkZA8xejhzPNF8lf1F
	 VaG2yJfFNimIOKV4i5L1RW+tRlY/bTePjrKDWWTEvTiGSuTDLw6xvsKmc2bbGJG3WXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771658;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tO0ZbVOvLqHdVD96cZJ5I5CAW5SvREXD0z4PFqcFHoY=;
	b=HDv5lE4paI7n7QCOJQmD/IOf3piaJ6h1PIVzJHMEIksL21lxiDuXTP8P7q0SMVEei3kE
	 EZvvXSkWAnN1zwGsqs6kGHYcnhWcfy8PeHtXJ6ANcdT6AFqMjodZEGR3egLzZmzdUAK4h
	 7MDRQX/cWkTeNbCzJekYvz7wMFb00nC2tSYY7JIlxskxtEDu9c+wDdIR7E3+UO1Bw1n0n
	 CLu1hg2uiIx0RLbsbjqCpdPdqO+5P4BLTXVOcbVp/R5A2YLbkNXuP2ikuevvusxi3ezv2
	 pvaj5xF6CaUtoAJWCBV4drCsxXSfwAME4eNJWnbOzcTFNPKsQDLhlOku3+KeOdXN51Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FnAfKrCM;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC7B606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC7B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FnAfKrCM
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6E7A1758;
	Fri, 27 Nov 2026 01:27:34 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2D3F3F632;
	Fri, 27 Nov 2026 01:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795771657; bh=daFvf/uPQyO5xYYQlAsUmRTZA1yhelIgKqaSBtUjSAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FnAfKrCMwrKa+dj6msQa5K4JLL4Et3Eb2mvzUrDDnjTZRMZ+WSpKAuzzyl4zEetfR
	 WgB2W8XY4YO9/tzOY2yR4moVHflxlS9UExsZCcxrpwqMlhojfMMS/5j+6LaZetlfFJ
	 OgooA0DaJ/6caXdyyOK9w7iqomTfLU+gvfz0o4H8=
Message-ID: <baf725aa-8814-4f0b-865a-150028d1a561@arm.com>
Date: Fri, 27 Nov 2026 09:27:34 +0000
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
Subject: Re: [PATCH v2 15/23] coresight: trbe: Report truncated trace on
 buffer update errors
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-15-3f57cf3199b1@arm.com>
 <57ca748e-127d-45a6-a662-fc1cb9895b51@arm.com>
 <20261111160528.GD9176@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261111160528.GD9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2026 16:05, Leo Yan wrote:
> On Wed, Nov 11, 2026 at 10:47:10AM +0000, Suzuki K Poulose wrote:
> 
>>> @@ -903,6 +903,7 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>>>    		 * errors and as such buffer is empty.
>>>    		 */
>>>    		if (act != TRBE_FAULT_ACT_WRAP) {
>>> +			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
>>
>> Do we need this though ? If the buffer has space left, we shouldn't use
>> TRUNCATED. TRUNCATED causes the event to be stopped and the userspace
>> needs to re-enable the event.
> 
> Here setting TRUNCATED flag is intentional for fatal faults. The following
> patch restricts this handling to TRBE_FAULT_ACT_FATAL only.
> 
> We can consider this from two perspectives:
> 
>   1. We distinguish TRUNCATED from PARTIAL (see patch 23). PARTIAL
>      indicates a recoverable trace gap without disabling the perf event,
>      requiring tools to reset the decoder explicitly.
> 
>      In contrast, TRUNCATED streams contain ASYNC packets for decoder
>      synchronization, so reset decoder is not needed.
>   
>   2. The AUX sampling calls update buffer callback [1], any fatal faults
>      will set TRUNCATED to disable hardware and waiting for userspace to
>      re-enable.
> 
> Thanks,
> Leo
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20260915-arm_cs_support_aux_sample-v1-16-35cf6f297d20@arm.com/

Fair enough,

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
