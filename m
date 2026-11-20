Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202922;
	b=X5Jj9HLuYldpButtoCwRbEZKvqnteNJni8vskdMXEZXWGKxfaCdWZUekMgkZQIloegNq
	 JV/upIG76DGIcrIHQrCf9FnErEgAd5ZqLbvNY4KMo+YXKKHMJs9BqExfRqubJcF5nru2m
	 4kJ/D3Ht82BQ7whDUEGN+JfCv2ovG1SUyHCKSAiCNTKhtOPyN9IblY9YbUnLSgfBhm3e0
	 KxD9t1VrtdT3PIe+hpWONe9xwF5RSTwfulnj02X0WjmfFyV95x4j9Bgs/6G7EG+HZrRjX
	 J2q+Xm4UukHqqLtwiyBAYhhZoRuknAoLTG/UiAVcjSPwDDvXpa3wquzOeBlmQqMPT5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202922;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=84L2PnC50po+vowEX1AZfsuRKSK7D/MCsUYaN8UBkl8=;
	b=PqsWXXUzeE6WQgM/LTqXqJ/KWCx3f613Yi72w73T171sciiHa/Hy5fR5k9WbhKVYNH4y
	 kQ1l+/sRODdf9z3xNjMM7Ak2e8N5mn+z3DNiL56txAu4C8C1PVG+RrlZSVhKzazWpN5Tn
	 NAF0Z94QcVRibpfJ5aeEMJkCpmPkdlhJAihwY6lBs/NukGQ72eifmMoQV0fRqpSrjbZYG
	 wY1v4HdxvwLy4X5X01hORtPRl1/eZdhsbHwRmFQSSSLq2DTC6iERkQehl4Wqb77e/eq8W
	 t6y38lDj5H2MiyUPVcc7QEz7rOXjxLT0dQIl3yq+r+d/oaRRgUIR7yoFwSY+wJyCOgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rNfw0UPx;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B51606A6D7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B51606A6D7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rNfw0UPx
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id UGjExhfT34vCDUUHoxtTag; Fri, 20 Nov 2026 19:28:40 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UUHnxuKAI0288UUHoxSqHJ; Fri, 20 Nov 2026 19:28:40 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6b009f68
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=1XWaLZrsAAAA:8
 a=1YBSXKnJtEmCh-povuIA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=84L2PnC50po+vowEX1AZfsuRKSK7D/MCsUYaN8UBkl8=; b=rNfw0UPxRgiunlhlgEqS/uIFz9
	C+dCm1G2GFsAyq/LiiXKpvEn4Xw54QHTodEc4y6AM0s//RoiVmRqk38D0Wq7ukzzFPFnVOiC8TRMO
	SYaF7xY11Kr1QiWkGU0Z5M/KhXF52+AgDqs4+T8KgOPMtGaZ++VDcjpc204oR3Nx7K5M1sUAAG356
	BlzvoWzSjc08c1YJGSPfpxhZSypv4VhO9K23lENqfmJOIRCpOSHLhNdaT0i1VYVZD8bEIX4jqhWo0
	6I5t5hR5tYV1Kbv64nHbKvEhFy58sTM8/pR/AKbQhy3aTG6P4hxYHMtY5Rc+/5taqbCHWda781zM/
	EKvG2SNA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41024 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUUHn-00000001Y4h-2g7I;
	Sat, 21 Nov 2026 00:58:39 +0530
Date: Fri, 20 Nov 2026 11:28:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Arthur Korn <akorn@google.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus) Clear only CML command and data
 faults during probe
Message-ID: <4ac69e60-158c-4be0-8e2c-dce89f8d6811@roeck-us.net>
References: <20261120024416.338876-1-akorn@google.com>
 <20261120024416.338876-2-akorn@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120024416.338876-2-akorn@google.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUUHn-00000001Y4h-2g7I
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:41024
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 18
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCnQ6TzYwNYIhEbyZSkI3+bTnflltx7Vknzk2cW2TMMz/xPsMKDBPspmHo7pQZ+5gICPFsVQi4s4K/c0fMoZYilz3CnWBrfFa+IVRQ/9D2zBTNERJjvO
 L5wcVgMeODm0TcXq+KPDTA3nDDLrn0IMBhX2465aYp8kHGsfYKLezCqk66g7sx7PWTjG392yJWRnCG2OMwrqGxoGnMsh61KjliEbK5sAdYov5JDgxkL4PsdM

On Fri, Nov 20, 2026 at 02:44:16AM +0000, Arthur Korn wrote:
> During driver initialization, register capability probing, and SMBALERT
> mask setup, pmbus_core and the generic pmbus driver send CLEAR_FAULTS
> (0x03) to clear any communication or command faults triggered while
> probing unsupported commands or out-of-range page/register operands.
> However, CLEAR_FAULTS unconditionally clears all latched fault status
> bits across the device, including hardware power fault registers such as
> STATUS_WORD, STATUS_VOUT, STATUS_IOUT, and STATUS_MFR_SPECIFIC. As a
> result, a BMC reboot or driver re-probe erases pre-existing voltage
> regulator fault telemetry before monitoring or diagnostic tools can
> inspect it.
> 
> Simply omitting fault clearing during probe is not viable because
> probing unsupported commands asserts PB_CML_FAULT_INVALID_COMMAND in
> STATUS_CML (causing pmbus_check_status_cml() to fail subsequent checks
> with -EIO), and probing out-of-range PMBUS_PAGE or PMBUS_SMBALERT_MASK
> operands asserts PB_CML_FAULT_INVALID_DATA and PB_STATUS_CML.
> 
> Starting with PMBus Revision 1.2, individual bits in STATUS_CML can be
> cleared via Write-1-to-Clear (W1C), a mechanism pmbus_core already uses
> in pmbus_get_boolean(). Introduce pmbus_clear_cml_fault() and export
> pmbus_clear_cml_faults() in the "PMBUS" module namespace to clear
> PB_CML_FAULT_INVALID_COMMAND | PB_CML_FAULT_INVALID_DATA in
> PMBUS_STATUS_CML during device initialization, register probing,
> pmbus_write_smbalert_mask(), and pmbus_identify() while preserving all
> other latched fault bits:
> 
> - Verify during pmbus_init_common() that PMBUS_REVISION is valid (>= 1.2
>   and not 0xff), that the driver does not hook write_byte() without
>   write_byte_data(), and that PMBUS_STATUS_CML is readable before
>   enabling STATUS_CML W1C clearing.
> - Fall back to pmbus_clear_fault_page() when STATUS_CML W1C is
>   unavailable or if writing PMBUS_STATUS_CML fails.
> 
> Tested on BMC hardware across 130 hwmon devices (105 PMBus devices
> covering tda38740/xdpe1a2g5b, isl68137/raa228234, adm1266,
> ltc4286/ltc4287, and generic pmbus regulators including TI
> tps546e25/tps546b25 and factory write-protected converters), verifying
> clean probing with no -EIO regressions, preservation of non-CML status
> faults across re-binds, and fallback when writing PMBUS_STATUS_CML is
> NACKed.
> 
> Signed-off-by: Arthur Korn <akorn@google.com>

Applied.

Thanks,
Guenter
