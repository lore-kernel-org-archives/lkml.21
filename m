Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598298;
	b=2L7c0fWLSNtladlNHz/2/O6abuXiLtwGo8ph3OWu+0bz3+Mi2yCXU/x9TIUKZZLG304x
	 rNsxBfLYoA9lXNBAGXNAz40gFvllYUFjD5jD0rHcOPN+RazrGpbrar8SAqFDckWMojGjk
	 yAQbKCQ77WRUfAWPiZnTiKwdfM0jC/FldPlrLSrE5qTyifHC02vrMaTLcZ8AyuW9N0Uf4
	 bXXVH5KZa/qYGMaj+3Wxw7ZcOa04dn5L580desKpPZAm/O61K2FK9QYcqaIyW+fpz2MWE
	 AVYFyXUoQ7rCrgcqLwHsY5ct6nO84uUkFBP0zM+y9FO2BK+dwrgUPxeJaw9Ez7MeniA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598298;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=y+2r4fG+UznQIXXE3C+R4pQGdQ5wZVXkmN5K7GeDHs4=;
	b=rCe+UFm2VhPCauiyGL6wGx3SikK+JE0g3vRmqXqQoMNChMsv3s3+ZNp96teLUr3mjSmy
	 vstHL7CUo9jsnG8+LUzTI0foFVAe88l38OPqousYLf0T6A5/224brHvgTTWafnqgrCoJI
	 ks1x3ocEVCe/gGdOHCS8b+P+UjxvEr8ThwVLV8jz/ieDicrfw8LwgBAfWXfl+tXYpMeJO
	 JpI3+RpYWP7qjHlFSYZMe77lGttnE44wJZoJmE4e4vZGpja70ukkyGUPaskaRutsu/YFS
	 eHILABEwZ6+JSUBtfOFyEYGqFqfofjA50G+B+EGLxkl2aEp1ElfvaIdJE0lylhYTUEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j00Rsx2O;
	arc=none smtp.remote-ip=95.215.58.143
Received: from mta1.migadu.com (out-143.mta1.migadu.com [95.215.58.143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EE6606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13EE6606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j00Rsx2O
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BMfH48xOt2irIlEx2o6dYqxmMgmYPvLKMXb/KO3WSmE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795598295; v=1; x=1796203095;
 b=j00Rsx2OaBeT3y4UDlDtjo4HxsX6uIoNNwmgKZhoYfKOymOtqBCmuls20kOKbTvtvYd/mq0y
 8wTL6iMs604p1047UcBFNKpslOS4rcgFwOKGoSzMaxrMMdE3T2xgCiqxqnlawQlieshLqInAb/x
 7Pst8LlLSDNPOg+eVA09tGFE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 38a7a00aad77a690;
	Wed, 25 Nov 2026 09:18:13 +0000
X-Mizu-Trace-ID: 38a7a00aad77a690
X-Migadu-Flow: FLOW_OUT
Message-ID: <a337f9fc-b6ef-48c4-ad98-52972b10b4c9@linux.dev>
Date: Wed, 25 Nov 2026 09:18:12 +0000
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
From: John Garry <john.garry@linux.dev>
Subject: Re: [RFC PATCH] xfs: add a per-filesystem switch to force atomic CoW
To: Dave Chinner <dgc@kernel.org>
Cc: Wayne Gao <Wayne.Gao1@solidigm.com>, "cem@kernel.org" <cem@kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <LV0PR10MB997684D5CA8A6AC037F6D1CD8AB9472@LV0PR10MB997684.namprd10.prod.outlook.com>
 <awSd1JEB0F4WeKt0@dread> <2a615ca6-3777-4b71-bea6-4072d4fbd950@linux.dev>
 <awXuAESDkLr1nd3n@dread>
Content-Language: en-US
In-Reply-To: <awXuAESDkLr1nd3n@dread>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 20:05, Dave Chinner wrote:
>>> Ok, so you want it for your test/dev environment, not production?
>>>
>>> I thought we could already change the block device characteristics (i.e. support hw
>>> atomic wirite or not) at the block device level?
>> The block layer just accepts whatever atomic properties is reported by the
>> block driver and there is no method in the block layer to change these
>> limits or turn them off.
> Isn't that a bit of an oversight? Lots of the hardware related IO
> capabilities are configurable in the bdev queue (e.g. max io sizes,
> max discard/unmap sizes, max queue depth, etc).

Generally anything which affects atomic limits is fixed. As you 
mentioned, there is max io sizes, which can be configured from sysfs - 
however, for HW atomics we ignore max_sectors and just pay attention to 
max_hw_sectors.

For any normal IO, the block layer can slice and dice the IO any way it 
wants. HW atomics are not like this, and the IO must be submitted as a 
single bio/request. For any dynamically changing HW atomic limits, we 
would always have the TOCTOU challenge, i.e. bdev limits can change 
between checking atomic limits and submitting an atomic IO.

> 
> Sure, they are initially populated by the hardware values, but the
> user can then override them (e.g. via udev rules) and that means we
> don't have need to add 'override the <bdev queue property>'
> management interfaces to every filesystem that supports those
> specific bdev hardware offloads.
> 
>> Then for the only block drivers which today support atomic - NVMe and SCSI -
>> similarly these we just use the atomic limits reported in the disk.
> That seems to be inconsistent with how we manage other hardware
> offload size limits on block devices. These are -not- filesystem
> properties, and we should not be trying to manage them at the
> filesystem level.

As mentioned, HW atomic IO is special in this regard. Now for XFS we do 
read the limits once at mount time. We could read the limits dynamically 
instead, but it still has the TOCTOU problem, above.

Thanks,
John


