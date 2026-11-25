Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599991;
	b=4Dm+x9XozE/DYAnYVaDhG5YlRJU9ZCjofquNOdt/nCb3jhcZyrh/Au45kf0Oti1HKoX6
	 PKsT9RMdEO77EMonMi7ABK3I2LxUyGPIfpT0y0qmt++fofqu04d6E0TtinaeDvIhjnVie
	 kkxFynNZxokE2nm0784TkfS4ZnpTIG9hqbrOK9MtNfLwRERud2Uc6YK1LN5PhS1HI0DCZ
	 dvieov+ealbt8Xw/4hZqC4VwbwsoxKMOGoTcC8/nbBrMnl919fFYFRw8wJ1OstOme0TcM
	 ypLezmOeFXOIhuGqbdWNXW8wSfThUXJiVnQRttHtCEWyhNxyAIYmoIuGLc8RlXdaIlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599991;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=OT5a/vqvbsaR8KSAlt0L0Kl4bCXvnuHxJ2dQQMulzN0=;
	b=Ij3OMBzPpKq/O41IF/MiwwWvPeVx01Jdelvd6ebhm68l2Xjgo2u1QsIHsksZo5uVPBkY
	 XRumlg/7OXbVddz8kOY3u6T1N8TQblF4koqc2wczOTk/MAHQs2KNmCLOIqbRLhWIEMaXf
	 ZbG16GSuk41kT+jjvv2YDB/EJDtiJM1v1X+CFlZ9s6KmsElS7Dxi4lWUz5WzbDwlD19Lg
	 Qs/q7km77IxMlY6BZASzr3HJfE6QR4l4iqQfA9BBeID2v0Zcun9qA8gLejj/tYgbs5gkD
	 1p4HVeoFnwQYqCZYnoIlV4JwxKGyCQmRYK8+XuNoOpKfl9rv7HRHyNvvPweC8BoihlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kbhRrZh9;
	arc=none smtp.remote-ip=91.218.175.38
Received: from mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45331606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45331606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kbhRrZh9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=01ys/YG56nsWVoCw20oIJbnm2s/GEu/YNu73h1gMbKY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795599988; v=1; x=1796204788;
 b=kbhRrZh9b5kOYigDHt3keeyXCOLfJ0N+9QCbBEKkdJD/nsO5y76sCXVYBvHXXdQKwRtgAPzH
 3XV/7YHYdTOnuyvY/rvyO/sDofqAgT86irL7O7cI9uSYZBJKTMu92UqZdKoTbc3XWgWpEXIFk9G
 pzYVVrmittHiUjwYkmXUBYE8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c6d2ddb4af64e76f;
	Wed, 25 Nov 2026 09:46:28 +0000
X-Mizu-Trace-ID: c6d2ddb4af64e76f
X-Migadu-Flow: FLOW_OUT
Message-ID: <5f977440-44ed-4a5f-946a-e7acf8007545@linux.dev>
Date: Wed, 25 Nov 2026 09:46:26 +0000
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
Subject: Re: [PATCH net v5 0/8] ptp: fix request serialization, teardown and
 SMA reporting
To: Ahmad Byagowi <ahmadexp@gmail.com>, netdev@vger.kernel.org
Cc: andrew@lunn.ch, arkadiusz.kubalewski@intel.com, arnd@arndb.de,
 davem@davemloft.net, edumazet@kernel.org, jiri@resnulli.us,
 john.stultz@linaro.org, jonathan.lemon@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, olteanv@gmail.com, pabeni@redhat.com,
 richardcochran@gmail.com, rmk+kernel@armlinux.org.uk
References: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 04:42, Ahmad Byagowi wrote:
> This series fixes PTP request serialization and timestamp shutdown, and
> corrects OCP SMA/DPLL reporting. It is based on net at 4392bb809812.
> It contains no WiWi board support or LED driver changes.
> 
> The first two patches address prerequisites identified in v4 review:
> serialize all three sysfs enable callbacks with the ioctl paths, and
> prevent SJA1105 EXTTS disable from switching its shared pin to input.
> Patch 3 preserves Vadim's requested teardown design: after removing the
> user interfaces, send direct disable requests for each advertised EXTTS
> channel, followed by PPS. Do not use a pin-function helper for channel
> indices, alter pin assignments, or add a driver stopping flag or spinlock.
> 
> The remaining patches handle hardware selector values and combined input
> routes, recover disabled SMA state on bind, report disabled inputs as
> zero Hz, and correct the DCF77 and ART 10 MHz frequencies. Rebind recovery
> is now separate from DPLL reporting, with the earlier b2c4f0ac53f3 Fixes
> tag, so kernels without DPLL support can receive that correction.

I'm absolutely sure it's time to split this series into at least 2.
Fixes to core PTP/PHC subsystem and some fixes to ptp_ocp are not
related at all and must go in different series

[...]

> Ahmad Byagowi (8):
>    ptp: serialize sysfs requests with the ioctl paths
>    net: dsa: sja1105: leave the pin function unchanged on EXTTS disable
>    ptp: disable all timestamp channels after removing the user interfaces
>    ptp: ocp: handle hardware selectors and combined DPLL input routes
>    ptp: ocp: recover disabled SMA inputs when binding the driver
>    ptp: ocp: report zero frequency for disabled SMA inputs
>    ptp: ocp: correct the DCF output frequency
>    ptp: ocp: correct the ART 10 MHz input frequency
> 
>   drivers/net/dsa/sja1105/sja1105_ptp.c |  8 ++--
>   drivers/ptp/ptp_chardev.c             | 14 ++++---
>   drivers/ptp/ptp_ocp.c                 | 58 ++++++++++++++++++---------
>   drivers/ptp/ptp_sysfs.c               |  9 +++++
>   4 files changed, 62 insertions(+), 27 deletions(-)
---
pw-bot: cr


