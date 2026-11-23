Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437494;
	b=qIzQ6DTYDEZsJdg4vpwU+Y/LU4Ua9VLArAsyDr3MYw+EmoZTK3nkklhXkUt2aCJOG2XO
	 /EAoJYQ+Y/NqD0jNxn+PSSIxayAO6GeTrc43RXnFLSZzPHvbT0FowPSzEv3Zsi4j1+4a0
	 y4x/LjGAHilMMaBNC5t5YIXdd24t2FzOueh9ZFydrxztDCdcvOky2bK9JZVCNQPMl3+M5
	 /BxAHQTFQMX1VRhnn3L9Q2cRK3i4FzuCUmlbyxbjC+zjEg0j3tbjgAEHSmNL3hqoN+/08
	 kXPP8GXVxLPJbZBatmLSfFoeeoDKc4V4XZv/zwxrlLqu/1mBjJszeGATuGGbbW13cGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437494;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gyeIde0avqusqT9a3dBuxFK7Sej2s1ySii6jTsMJ9Xo=;
	b=zJip896D6DSUHC82wybniDoTB56u4/YdqUFnaM0qUCDMljt/DPoc1rZTilhscqVJcoEq
	 xwAkCLhf/0nYQBYxf/qc0GP0u+JTKQQeucGmkouU5/Sc5ss7WjbYzwiJIC7k5i6EdTd/s
	 XpwlkIb+3hkAt1nESuB06+ynnAXVBY1RcGHhqyzKNbYGjT5lZ6Qljd0rzrkDooHji0q+s
	 pbC45+yg7jtTxj5/m+GfylmnqwE3x+9/0wlJb3NRwTjNd39QxNOJospypJt0lDSlFseMi
	 9qhacONFTTDtD+i3m8VkUVTP/21Hjm3Ui0UkikzP7ZFJ8methATHikdyDy5XQfqxNhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NxaAZuj4;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5F7606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC5F7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NxaAZuj4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795437494; x=1826973494;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=noXsiV34IzHrnUGMjWMJk9K0TE4u0xXSkekc5W2Cx7U=;
  b=NxaAZuj4zofRryDmdfOjOflh7rmEtix/+O+CpIbq9Zzf5IXaHInA9N+A
   LBoFb1Jvh4fBAF2dQz1/++uoN8WwgOx90imgLMI2MM1AK7U1NfofZtCpk
   ZEp+y6v56b9+ck445JdCM07rKYn+r8r8QqZ/ENKHette4YPKnujxm2EDz
   Jqz+061INAHFr4sod7kSdFlQPmVXfl8cV1O3v02nmz5iozZxQuhJ6bEIj
   J8gUh0ApwA3qa11kk1QV9fGjkhhbzQAqoA5f8sFghHYVbOpmK7rWPYIUo
   cVFqw+rrfHooXneA2mtVx2p7iRumJ1DcQFuFdNYdltNJOQLM/t1hLIBhI
   g==;
X-CSE-ConnectionGUID: KivRZhekQTSw/8G6w2kAbw==
X-CSE-MsgGUID: UE0l2WQZRJm539zBt5iD2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4141054"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4141054"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 04:38:13 -0800
X-CSE-ConnectionGUID: VkO5xzvHQgerGP59zkgMEQ==
X-CSE-MsgGUID: 9FKoM4l4T/ak9kNjYPh1EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11649063"
Received: from soc-pf6038af.clients.intel.com (HELO [10.217.180.38]) ([10.217.180.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 04:38:12 -0800
Message-ID: <d9b91e95-243d-4e3c-92b0-0355dca59a63@linux.intel.com>
Date: Mon, 23 Nov 2026 13:38:09 +0100
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
To: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 andrzej.kacprowski@linux.intel.com, linux-kernel@vger.kernel.org
References: <20261123122007.2580451-1-dawid.osuchowski@linux.intel.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
In-Reply-To: <20261123122007.2580451-1-dawid.osuchowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-Nov-26 13:20, Dawid Osuchowski wrote:
> Add myself as a new accel/ivpu driver maintainer.
> 
> Signed-off-by: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bcade5bfbafe..0afa391498d0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8198,6 +8198,7 @@ F:	include/linux/power/smartreflex.h
>   DRM ACCEL DRIVERS FOR INTEL VPU
>   M:	Karol Wachowski <karol.wachowski@linux.intel.com>
>   M:	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> +M:	Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Supported
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
