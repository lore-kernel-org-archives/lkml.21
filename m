Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193161;
	b=qdMjokmz7W5ewx/rlSNHvRbxzZbS3g+CbIZS+qR5+RA/7HXU6IZtgfuHAzQNzZ+/Vezb
	 XQ/KmAM+AnwakOSkfhHSMd/QeQpil1Hg6PmW5wIGxaTA0EwPsXBik++1/NH0veXu15U25
	 QdHlbB1DiTVpZwUhVmn5Ijz5ImfDTs2kGh/RwkuLsqgQZLVFdPfQhrzvrfXS6dPZitLo7
	 RLqKpgZEPzqhtnrk5P8v1qkkwlQOWPsbTagaYaQipUjO8UyyKgKVkeP2QCwlxRuxWAIoc
	 DsFvJL4QaopR8DXIvgJ7rX7JQ8zOzsUIyIVrQRSwv0ak74mIa9Xag8VZPSc3/Sj2o4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193161;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=toIxM9h47Gcaai59SX8Ni8vG82Z3pFL7p42nkCgrt8A=;
	b=z+MGwRXdX/d+DRMqqPM9itYVs9PdaxO9uElCxIjJOw2m6PyvlTg1OgRKkIHBDpd7lJL/
	 KuhNda1Iyjod9vE/mFXcZ78pyVxNuplC+7+myw735JPSTUUida1DnyamNzI0GXf5fwhlr
	 B9TfGNbVi/hxLdWjQHZTFF3EU8cR4IqYol5UwzzDC0Jd5tvwbeZL6O27AWWbH0BQEF83B
	 t1Ru4UJbyb1FPyKGRQII0tMxAajfCzS/JwfKdMTAKQIXnNcJF96C60j04QfQadDOmKrED
	 MKCxwXgYB+/zfes9YcT9aYgs+hXY61wHwiTXVHchlpFJxSToTOLqGlSewG3smof11kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L5uoyeXO;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75A0606A609
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D75A0606A609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L5uoyeXO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795193160; x=1826729160;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iyz8URwfvDCr0uFnwVBZz4PV2nZyMsewoLz1lslprH0=;
  b=L5uoyeXOqK8Z8qXpo+Ai/9416ZWWhqXEe0jV7UaVX+tdG6s6Y+psukES
   Y0sECHSosg46ZvYAwYdWxbaLSTlC395ake6XcFJCiWXDb5z7vi/LGPLp1
   HLBLmgSLAodkuoyu0sbgLMt0WJanmsOoYdHF4ZxSM7udEicTDdTn0wmvP
   /C2Ff22JlTQbqN46ldfy0piZQLsazbCoKHMFEPO0W9GQS9Xf4ymHos+BI
   Ofq+Nk9Eo4BpIztnbly4tsou/SFjUPFvGI9nXRav+UJTzf+mZHINaDAHD
   sJ6SoPNGi1NO8l0U6q3x38/Sqp0WxQEizfGWklKjWC2WgdeeJtCnbrBWy
   w==;
X-CSE-ConnectionGUID: 1bvay80rSdmV31NE/K4C/Q==
X-CSE-MsgGUID: medzn+PdQd+UG0I4US8iEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3958374"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3958374"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 08:45:59 -0800
X-CSE-ConnectionGUID: 2QY7aqivQKaWn2Anb5npbQ==
X-CSE-MsgGUID: FcrW2cMuQi+UAbksFPNbpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11078533"
Received: from jjgreens-desk24.amr.corp.intel.com (HELO [10.125.109.138]) ([10.125.109.138])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 08:45:59 -0800
Message-ID: <4c1e85d6-891d-4240-a705-da896fb4877d@intel.com>
Date: Fri, 20 Nov 2026 09:45:57 -0700
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
Subject: Re: [PATCH] ntb: fix peer_spad_read() returning -EINVAL instead of 0
To: Koichiro Den <den@valinux.co.jp>,
 zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: "jdmason@kudzu.us" <jdmason@kudzu.us>,
 "alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>,
 "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "mani@kernel.org" <mani@kernel.org>, "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
 "Maciej.Grochowski@sony.com" <Maciej.Grochowski@sony.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "trivial@kernel.org" <trivial@kernel.org>
References: <20261120084546.2018-1-zhangjiao2@cmss.chinamobile.com>
 <awBqDjJJGgYt6Azq@z790sl>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <awBqDjJJGgYt6Azq@z790sl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/20/26 9:34 AM, Koichiro Den wrote:
> On Fri, Nov 20, 2026 at 05:45:45PM +0900, zhangjiao2 wrote:
>> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
>>
>> The amd_ntb_peer_spad_read(), ntb_epf_peer_spad_read() and
>> switchtec_ntb_peer_spad_read() functions have a return type of u32
>> but return -EINVAL on error, which results in a garbage value
>> (0xFFFFFFEA) being returned to callers. Other NTB hardware drivers
>> (e.g. Intel's ndev_spad_read) correctly return 0 for out-of-range
>> scratchpad indices.
>>
>> Fix all three functions to return 0 on error, matching the
>> established convention in the NTB subsystem.
>>
>> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> I wonder if it would make more sense for ntb_peer_spad_read() and its callback
> to take a u32 *val for the result and return 0 on success or -errno on failure.
> (The wrapper could then return -EOPNOTSUPP if the callback is missing.)
> 
> It looks like ntb_msi_test can legitimately publish an irq_count of 0 to its
> SPAD, and ntb_perf uses all 1's for an empty command slot (ie. PERF_CMD_INVAL).
> So I'm not sure overloading the return value to signal a failed read is a good
> choice from the beginning.
> 
> That said, I agree that returning -EINVAL as a u32 is misleading.
> One thing I'm not sure about is whether switching to 0 is really harmless.
> In ntb_msit_db_event(), what if the doorbell bit isn't a valid peer index?
> From what I can see, on ntb_hw_epf or switchtec, the old value (-EINVAL) makes
> the allocation fail, while with 0, kzalloc_objs() returns ZERO_SIZE_PTR rather
> than NULL. Wouldn't the code then use that invalid peer index in nm->peers[]?

Yeah maybe return int and pass in an u32 ptr. Thought about MAX_INT as error but we are reading a u32 spad so any value should be valid.

DJ

> 
> Best regards,
> Koichiro Den
> 
>> ---
>>  drivers/ntb/hw/amd/ntb_hw_amd.c        | 2 +-
>>  drivers/ntb/hw/epf/ntb_hw_epf.c        | 4 ++--
>>  drivers/ntb/hw/mscc/ntb_hw_switchtec.c | 2 +-
>>  3 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/ntb/hw/amd/ntb_hw_amd.c b/drivers/ntb/hw/amd/ntb_hw_amd.c
>> index 36bee0d8ac6c..40ced4043340 100644
>> --- a/drivers/ntb/hw/amd/ntb_hw_amd.c
>> +++ b/drivers/ntb/hw/amd/ntb_hw_amd.c
>> @@ -529,7 +529,7 @@ static u32 amd_ntb_peer_spad_read(struct ntb_dev *ntb, int pidx, int sidx)
>>  	u32 offset;
>>  
>>  	if (sidx < 0 || sidx >= ndev->spad_count)
>> -		return -EINVAL;
>> +		return 0;
>>  
>>  	offset = ndev->peer_spad + (sidx << 2);
>>  	return readl(mmio + AMD_SPAD_OFFSET + offset);
>> diff --git a/drivers/ntb/hw/epf/ntb_hw_epf.c b/drivers/ntb/hw/epf/ntb_hw_epf.c
>> index c47607d4f8a7..dcc5eb4bea74 100644
>> --- a/drivers/ntb/hw/epf/ntb_hw_epf.c
>> +++ b/drivers/ntb/hw/epf/ntb_hw_epf.c
>> @@ -273,12 +273,12 @@ static u32 ntb_epf_peer_spad_read(struct ntb_dev *ntb, int pidx, int idx)
>>  
>>  	if (pidx != NTB_DEF_PEER_IDX) {
>>  		dev_err(dev, "Unsupported Peer ID %d\n", pidx);
>> -		return -EINVAL;
>> +		return 0;
>>  	}
>>  
>>  	if (idx < 0 || idx >= ndev->spad_count) {
>>  		dev_err(dev, "WRITE: Invalid Peer ScratchPad Index %d\n", idx);
>> -		return -EINVAL;
>> +		return 0;
>>  	}
>>  
>>  	offset = (idx << 2);
>> diff --git a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
>> index e38540b92716..a9fc94869aeb 100644
>> --- a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
>> +++ b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
>> @@ -762,7 +762,7 @@ static u32 switchtec_ntb_peer_spad_read(struct ntb_dev *ntb, int pidx,
>>  	struct switchtec_ntb *sndev = ntb_sndev(ntb);
>>  
>>  	if (pidx != NTB_DEF_PEER_IDX)
>> -		return -EINVAL;
>> +		return 0;
>>  
>>  	if (sidx < 0 || sidx >= ARRAY_SIZE(sndev->peer_shared->spad))
>>  		return 0;
>> -- 
>> 2.33.0
>>
>>
>>

