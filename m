Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971705;
	b=ZfVdkF8Of+B4Cblxw53U0kEgWMCA9K6S01B24R/cYx8mAcIyVxhYVlnzsXKMt4Nnu+tB
	 etDGx25TIxtgKsh0N81AADWXLKmLC8fxn+ZUumTG77cGi5XBN9qOQaJ+6AagOhXFKwxWF
	 a0+hOSXLX3oPHRHLS+a0Xdf3z7ofPt/YeyFc3c+bC6C+ulhas8bJ6gdKj8PVqSmbfUF1j
	 Ph8TF81fonCVu+OXkjRlFKQ1piQ5fOUVzdIUnHeG64d56iAZR/qifanrd8NIuWMTjEfRW
	 X4n+n8x0lpF2IO8DeBNlnx7aJIUkW1VAfhBhYRtel2iz5H/8FfhLoIqfaS0E2lJZF8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971705;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=GHsPCWNjZ3j+9LUM9w+2wzH4xqttJRaXg+7Oa4fhCJ0=;
	b=I+5Hnd1wYpLCsnHPD6gATpQo3aNZw+zkGeZdVYoY7KsesrvUwGo1CZ6aHBtDdaVSG9Jv
	 ACrNo9Aycw8cwMU/o2tBPNTH3AxLQVEKhCp94PDia7lgSVukVGrSupE3vc6jqe51mnKeQ
	 O8OF5PTGLhms+p7oP1KAlFpbtH54gvDwM6Lh2H07ZmoDspQFzoItlSVbvmK/YW8eeWSMi
	 LAvp/EPcHutMJxa6LftNvyVwCmgw7z0J5wRF7C4lxCmEpDRAunlWz++3KXjWPEvmIpzlw
	 SRAJuTNIxRQD1Jo4G/4/AwV6jpd2EHqVNx/DnWqQkj/h8WQ8SvPteWtc9a/oYMSm1cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RNt3aqA7;
	arc=none smtp.remote-ip=91.218.175.64
Received: from mta0.migadu.com (out-64.mta0.migadu.com [91.218.175.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC76606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC76606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RNt3aqA7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nJoZwlef91SASvJ+jvaUEJCD1Bbxj6XteelnuiTYVr8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794971702; v=1; x=1795576502;
 b=RNt3aqA7eFsOTV312tzXmNmdTEdiw/KTpxDt3NFrI+kwQhWqgzJIlV4aF6jvhip42r+thmHD
 4fAIe/WpNWHDL/u0NWZhia0YwE3q4DJ7aSiGFHEtzm5+YmSqAzSNdicuxcHG46NMW5QO6/SSTA8
 BeU4QROGh5naaQ9io/LGidYo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 157c3c1a4e5dffb2;
	Wed, 18 Nov 2026 03:15:02 +0000
X-Mizu-Trace-ID: 157c3c1a4e5dffb2
X-Migadu-Flow: FLOW_OUT
Message-ID: <664b98b7-d9b6-41cc-b830-13459d02b7d2@linux.dev>
Date: Tue, 17 Nov 2026 19:14:58 -0800
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
Subject: Re: [PATCH v3 1/3] lib: extract 32bit mul/div helpers from nios2 into
 GENERIC_LIB
To: Simon Schuster <schuster.simon@siemens-energy.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>
References: <20261110-nios2-remove-usage-of-libgcc-v3-0-1449ce37948e@siemens-energy.com>
 <20261110-nios2-remove-usage-of-libgcc-v3-1-1449ce37948e@siemens-energy.com>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20261110-nios2-remove-usage-of-libgcc-v3-1-1449ce37948e@siemens-energy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/26 07:58, Simon Schuster wrote:
> From: Dinh Nguyen <dinguyen@kernel.org>
>
> As suggested in 426c73b7-b4dc-4b68-9aa5-6145a13280bc@app.fastmail.com,
> the software emulation of div/mul/mod on 32-bit platforms from nios2
> might be of use to other smaller architectures as well when trying to
> drop their libgcc dependency (e.g., arc, openrisc).
> Therefore, extract and add them to lib/, guarded by respective
> CONFIG_GENERIC_LIB_* options.
>
> Symbols covered:
> s32 __mulsi3(s32 a, s32 b);
> s32 __divsi3(s32 a, s32 b);
> u32 __udivsi3(u32 a, u32 b);
> s32 __modsi3(s32 a, s32 b);
> u32 __umodsi3(u32 a, u32 b);
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> Co-developed-by: Simon Schuster <schuster.simon@siemens-energy.com>
> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>

I used this to complete ARC libgcc elision: light boot testing seems to 
work.

Reviewed-by: Vineet Gupta <vgupta@kernel.org>
Tested-by: Vineet Gupta <vgupta@kernel.org>

> ---
>   include/linux/libgcc.h | 10 ++++++
>   lib/Kconfig            | 15 ++++++++
>   lib/Makefile           | 10 ++++++
>   lib/divmod.c           | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/mulsi3.c           | 24 +++++++++++++
>   5 files changed, 153 insertions(+)
>
> diff --git a/include/linux/libgcc.h b/include/linux/libgcc.h
> index 0d68f9d6a6a7e..a26cedb509f25 100644
> --- a/include/linux/libgcc.h
> +++ b/include/linux/libgcc.h
> @@ -7,6 +7,7 @@
>   #define __LIB_LIBGCC_H
>   
>   #include <asm/byteorder.h>
> +#include <linux/types.h>
>   
>   typedef int word_type __attribute__ ((mode (__word__)));
>   
> @@ -34,6 +35,15 @@ long long notrace __lshrdi3(long long u, word_type b);
>   long long notrace __muldi3(long long u, long long v);
>   word_type notrace __ucmpdi2(unsigned long long a, unsigned long long b);
>   
> +/*
> + * Software 32-bit multiply for cores built without the hardware multiplier.
> + */
> +s32 notrace __mulsi3(s32 a, s32 b);
> +s32 notrace __divsi3(s32 a, s32 b);
> +u32 notrace __udivsi3(u32 a, u32 b);
> +s32 notrace __modsi3(s32 a, s32 b);
> +u32 notrace __umodsi3(u32 a, u32 b);
> +
>   #ifdef CONFIG_HAVE_ARCH_LIBGCC_H
>   #include <asm/libgcc.h>
>   #endif
> diff --git a/lib/Kconfig b/lib/Kconfig
> index 1e42f5167c68b..16c2f2008b82c 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -611,6 +611,21 @@ config GENERIC_LIB_CMPDI2
>   config GENERIC_LIB_UCMPDI2
>   	bool
>   
> +config GENERIC_LIB_DIVSI3
> +	bool
> +
> +config GENERIC_LIB_MODSI3
> +	bool
> +
> +config GENERIC_LIB_UDIVSI3
> +	bool
> +
> +config GENERIC_LIB_UMODSI3
> +	bool
> +
> +config GENERIC_LIB_MULSI3
> +	bool
> +
>   config GENERIC_LIB_DEVMEM_IS_ALLOWED
>   	bool
>   
> diff --git a/lib/Makefile b/lib/Makefile
> index a2afe954805cb..352a012baecba 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -337,6 +337,16 @@ obj-$(CONFIG_GENERIC_LIB_LSHRDI3) += lshrdi3.o
>   obj-$(CONFIG_GENERIC_LIB_MULDI3) += muldi3.o
>   obj-$(CONFIG_GENERIC_LIB_CMPDI2) += cmpdi2.o
>   obj-$(CONFIG_GENERIC_LIB_UCMPDI2) += ucmpdi2.o
> +obj-$(CONFIG_GENERIC_LIB_MULSI3) += mulsi3.o
> +
> +divmod-needed := $(or \
> +	$(CONFIG_GENERIC_LIB_DIVSI3),\
> +	$(CONFIG_GENERIC_LIB_MODSI3),\
> +	$(CONFIG_GENERIC_LIB_UDIVSI3),\
> +	$(CONFIG_GENERIC_LIB_UMODSI3))
> +obj-$(divmod-needed) += divmod.o
> +
> +
>   obj-$(CONFIG_OBJAGG) += objagg.o
>   
>   # pldmfw library
> diff --git a/lib/divmod.c b/lib/divmod.c
> new file mode 100644
> index 0000000000000..4ef3087d7ef28
> --- /dev/null
> +++ b/lib/divmod.c
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright Altera Corporation (C) 2026. All rights reserved.
> + */
> +
> +#include <linux/libgcc.h>
> +#include <linux/export.h>
> +#include <linux/types.h>
> +
> +static u32 udivmodsi4(u32 num, u32 den, int modwanted)
> +{
> +	u32 bit = 1;
> +	u32 res = 0;
> +
> +	while (den < num && bit && !(den & (1U << 31))) {
> +		den <<= 1;
> +		bit <<= 1;
> +	}
> +
> +	while (bit) {
> +		if (num >= den) {
> +			num -= den;
> +			res |= bit;
> +		}
> +		bit >>= 1;
> +		den >>= 1;
> +	}
> +
> +	return modwanted ? num : res;
> +}
> +
> +
> +#ifdef CONFIG_GENERIC_LIB_DIVSI3
> +s32 __divsi3(s32 a, s32 b)
> +{
> +	int neg = 0;
> +	s32 res;
> +
> +	if (a < 0) {
> +		a = -a;
> +		neg = !neg;
> +	}
> +
> +	if (b < 0) {
> +		b = -b;
> +		neg = !neg;
> +	}
> +
> +	res = udivmodsi4(a, b, 0);
> +	if (neg)
> +		res = -res;
> +
> +	return res;
> +}
> +EXPORT_SYMBOL(__divsi3);
> +#endif
> +
> +#ifdef CONFIG_GENERIC_LIB_MODSI3
> +s32 __modsi3(s32 a, s32 b)
> +{
> +	int neg = 0;
> +	s32 res;
> +
> +	if (a < 0) {
> +		a = -a;
> +		neg = 1;
> +	}
> +
> +	if (b < 0)
> +		b = -b;
> +
> +	res = udivmodsi4(a, b, 1);
> +	if (neg)
> +		res = -res;
> +
> +	return res;
> +}
> +EXPORT_SYMBOL(__modsi3);
> +#endif
> +
> +#ifdef CONFIG_GENERIC_LIB_UDIVSI3
> +u32 __udivsi3(u32 a, u32 b)
> +{
> +	return udivmodsi4(a, b, 0);
> +}
> +EXPORT_SYMBOL(__udivsi3);
> +#endif
> +
> +#ifdef CONFIG_GENERIC_LIB_UMODSI3
> +u32 __umodsi3(u32 a, u32 b)
> +{
> +	return udivmodsi4(a, b, 1);
> +}
> +EXPORT_SYMBOL(__umodsi3);
> +#endif
> diff --git a/lib/mulsi3.c b/lib/mulsi3.c
> new file mode 100644
> index 0000000000000..6596a6598de05
> --- /dev/null
> +++ b/lib/mulsi3.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright Altera Corporation (C) 2026. All rights reserved.
> + */
> +
> +#include <linux/libgcc.h>
> +#include <linux/export.h>
> +#include <linux/types.h>
> +
> +s32 __mulsi3(s32 a, s32 b)
> +{
> +	s32 res = 0;
> +	u32 cnt = a;
> +
> +	while (cnt) {
> +		if (cnt & 1)
> +			res += b;
> +
> +		b <<= 1;
> +		cnt >>= 1;
> +	}
> +
> +	return res;
> +}
> +EXPORT_SYMBOL(__mulsi3);
>

