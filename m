Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604119;
	b=SvAVs4r+Aw+TFq21hZ+CJjQMI2VS2MINUXNvKpdetgs6J1POXApFMNVgf9M3KS4uS+hf
	 Yq3NutNVPzaOg2kSytAEqZWYQkjTpVoNCBHrmMKpiNlVM4Q+g0jo/AU9l7TXDJt3ou8mU
	 3kzjBHupPx5f40lQk/r3foYm09xTpHg24oQnbOBfjLCcBDPjv4Nlk4+WqWASoIU3dxfIh
	 JE6tfv+MNpeTul7TCKnBQfokCBQQ2IkkshZxG3Ya1U5K8V7plCuTifgmT8chCB/oMqKrF
	 hWUgqgbksG+dcPvYuGeVgQ16oHkJJfYP+7HBu+tG9Lpesgtb4MAyHqdSV4KBrU+fAtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604119;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Db+YXabgIqjCii4/wDF/p9jfXt7DJt7000EJyfPCLPM=;
	b=hFhWfNKsKT4uhUm5Svi+8CV416DI74D/dx6Cen9TbHHdmIy6xO2bF1mbTsHkSZMv92W3
	 M5fSNAHqMc4GcnXGwQny9wLU7DwFxYRhMLBy+UX1bgLPOjUTxRcFH68kl6dZXGtnPz+Nu
	 AV7yvEVLGL+TYLQw0EzOgofJ4oXBOJYFvnHB0jFyiM6MzW95xWABsliF+Q8TC9JQQRn0L
	 6UdxMNn0HYftiLgKgdw3lUJOElgKx2k3SrSDB3dsZo925m3x0ePvLVa0mLNYIi0t5SRyC
	 AxSDCWxMgi3CVIdkm3g/teYEWQhsqXJ5dyt75JrBXis6bD7AuisLgFokSv2SAjyzDOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DBEhjyIZ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C900606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C900606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DBEhjyIZ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC29D339;
	Wed, 25 Nov 2026 02:55:14 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B9273FA32;
	Wed, 25 Nov 2026 02:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795604117; bh=Db+YXabgIqjCii4/wDF/p9jfXt7DJt7000EJyfPCLPM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DBEhjyIZmLlKPRRVE5g0CwamcwBfj9YwCJRJ+vLawUZqZNqPtFikMTXZ0+Az2qNn6
	 YG0cwOisNF55A5gc5nTLrR7a0W3BB3nfp7S3gwXsMV/y6HOsNj+BPdN7Qlt/ZYqS3k
	 WjF8wBMWvPh4NkUBbLIWXZBRPWwMfra0+oe99Ym8=
Message-ID: <b76773b4-bea5-418a-937a-72679c98ad75@arm.com>
Date: Wed, 25 Nov 2026 10:55:14 +0000
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
Subject: Re: [PATCH 2/2] ARM: v7m: clear the Cortex-M33's ACTLR.EXTEXCLALL at
 boot
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linusw@kernel.org, arnd@arndb.de, envzhu@gmail.com,
 linux-kernel@vger.kernel.org
References: <20261125025852.1160075-1-brad@sim.vu>
 <20261125025852.1160075-3-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025852.1160075-3-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 02:58, Brad Hawthorne wrote:
> so a kernel started by a pico-sdk loader inherits it. On the RP2350,
> the PSRAM where the kernel runs is not covered by the global monitor,
> so every STREX there fails, and the kernel's atomics, which loop until
> STREX succeeds, never finish. The kernel never reaches its console.

This suggests that boot loader is the place for handling such platform
implementation detail, so why boot loader cannot do that?

Cheers
Vladimir
