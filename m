Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516675;
	b=5IYkAGaKeO3KAvEpCSShBkyU9BGnQOZ9Cv1+hS6eFuX8srMONScX7CbnewLcPD6FFtnJ
	 YDWPmvIcoVLKa0ZUfX4KByh2fgjI2CW8XFzdSMjeZJWooEmxc3XeRDH8SiCXLIYZSOEq5
	 7q/MUhp+QjCw+LhXwBX6fOqhmDJl7C1AmN3y3K7lAy43ehcLYDIDAoVsWjXrvNpzznSVQ
	 xO0lYMT/tZGOfQkzfQr1FO/TFismsb8bWGgO7bHFw0ieWXvaX+iCWjHKYKnGq7W5JFFA1
	 /dkzW70fVKxxRXkhKNp/aOhQ7Jh6/E+eZTlQo1Wpd5u8csks6dtIWSiyOZ1p9U5uDYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516675;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=y3HWHevQIxMDv+ccaC2mVi5LLkSTQnAJeVsGyBp97HU=;
	b=rcxiFCy3islQO6q7WJgN3YheHJorAWKrdpe75CvVtG1jWREdDjr654FcUEmW9K044Wl9
	 cgt7PVSAJ23RH1ACFg64G5jI5YY/I4TNsPLIc+0i+pp2CQCE1+q4bfxwYHD9zjrxegwl+
	 LNX7I+ETHURHjO8uUgmhx+bG5oDp7lgi7TEquSO9YhOgQ2bMnGtqDDZ7E8e6L81I4q/Ch
	 5MHGqWUD/3e0GRudzJED4i6R8X8ROfMfQxlL4gk4PkTYDCTRFTyDv9QZVoqcW+EvShs/N
	 UP+vPWjODTN+FuFzWXlRcn+N+lnftow4VXiO6PyOgxRrxvcvSrP3ktzk2k8v31ghCQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vktl7hxE;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF5A606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF5A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vktl7hxE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795516675; x=1827052675;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=I4v+wONK1FXSVueaXbyLGJ1AmJLwnyimTD98hqISR48=;
  b=Vktl7hxEJeVFAfcLl+GWIEEpebZUjfOAQpgu4VfSV4z/qAIaLeiBzTzk
   Ngi0f2ZQ+GUPf1h2BKTpR5hdAyeL4hV5XiBq/Jlf5SWdm3BtyG59WNdXZ
   MNCFsA56zeK0w365LXTgE71O+HsI0EGAllk67zHCs2equxZT/a0cV6ldq
   +4xDCTyOEPOpPYrjinjzhnYFGuvnp3L3dbc3v3tMBqj/S7PI3l5zgddbl
   1G1mq4sW8ZYeDbWQJLq0Uv4p+/NhLFtEl0Tzp/KO7pH0/9mslcFHUI+rq
   tmQrC0Mkz/4k/pL7h8K2yM+FdTewyMN6mubMQcJ4yBEQYFaP8K5KGmHU6
   g==;
X-CSE-ConnectionGUID: LwLHEhknSEqXdw0+cbX0jQ==
X-CSE-MsgGUID: bVWUkpPpThqLZWp3nJNirw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4234911"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4234911"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 02:37:54 -0800
X-CSE-ConnectionGUID: rLQ1pzOpQbGZ5wKVY0VZCA==
X-CSE-MsgGUID: FyFWJ1/yR22HkL/u1Z00Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="13542398"
Received: from soc-5cg4396xfb.clients.intel.com (HELO [10.102.89.37]) ([10.102.89.37])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 02:37:53 -0800
Message-ID: <134f5d27-332d-4314-9d9d-43a45ae17532@linux.intel.com>
Date: Tue, 24 Nov 2026 11:37:51 +0100
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
Subject: Re: [PATCH] MAINTAINERS: Add Dawid Osuchowski as Intel VPU maintainer
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, lizhi.hou@amd.com,
 andrzej.kacprowski@linux.intel.com, linux-kernel@vger.kernel.org
References: <20261123122007.2580451-1-dawid.osuchowski@linux.intel.com>
 <d9b91e95-243d-4e3c-92b0-0355dca59a63@linux.intel.com>
 <e3e03774-f066-4cfa-88dc-183fb06d80e5@oss.qualcomm.com>
Content-Language: en-US
From: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <e3e03774-f066-4cfa-88dc-183fb06d80e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-11-23 5:31 PM, Jeff Hugo wrote:
> On 11/23/2026 5:38 AM, Karol Wachowski wrote:
>> On 23-Nov-26 13:20, Dawid Osuchowski wrote:
>>> Add myself as a new accel/ivpu driver maintainer.
>>>
>>> Signed-off-by: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
>>> ---
>>>   MAINTAINERS | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index bcade5bfbafe..0afa391498d0 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -8198,6 +8198,7 @@ F:    include/linux/power/smartreflex.h
>>>   DRM ACCEL DRIVERS FOR INTEL VPU
>>>   M:    Karol Wachowski <karol.wachowski@linux.intel.com>
>>>   M:    Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>>> +M:    Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
>>>   L:    dri-devel@lists.freedesktop.org
>>>   S:    Supported
>>>   T:    git https://gitlab.freedesktop.org/drm/misc/kernel.git
>>
>> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Applied to drm-misc-next. Seems my commit rights work :)
