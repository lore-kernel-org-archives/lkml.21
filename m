Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700153;
	b=5hRM14lxX24wRZzfSpmU6Rw3Mqv7XUA0AQBz2GT0okar8CKd+Ii198/chFQVluyh3ZXX
	 n3fO55gXTIsWw3nBOOjms3tGFsr9dn14zvHiN0ApRGYaE5MBrS7HY6uHK7pwFFWO9sQJN
	 ft5UkSQ458s1SSuFa3wxPnWo9ee9rLZUPQCtdhuSelt7TbjCbh0kcxM9rwnTJK4uATlpS
	 46uzZmdRyUdzzqIemtCO11+Dx7jXDJ+lA1pF204D9WLhfg6dS/HOflN1niPGLflZ5c2JJ
	 /3Kqi2x969YeUN1gGSUzc5kCUGD1inRuRZdHzU/+QDAAfeEwKWVCH41cOZtJkeUws+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700153;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Xb09k+Q7S+nusy1E9oGvKPTatGNmG4h5RDxHcIpii4U=;
	b=S4SNHjJBz4EBoO+B0vZXi0LbU4mRgU4I8bo7t6zA7CeaPh7hNKdW3rHM4wXhTcd/NNtF
	 Qcc5ZoMyrgRHqCKI62j8WHD+h3zrZ9NswP6fYa5avc/R7KxERLJBjFV5OpJtNvgfw0Gz0
	 xQaxTvdwjBXyIgNMMnydaQPcw7nUWuJlwijwoYH1VnC7ddiXP41NhXyjJFOAq06tbQnk4
	 Q6EeERl9BptV/sWP60hHCVheUm6x3p8MHODpOrXZTROxTCYyM3uV8l4NKdYV143ua30aS
	 fSEVudLWB8GFvWyrVpilUijG1rzZI69e/LGd38UbYRNxdL8K+rRq77ggg9Y7eZoiH6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CObOpJZm;
	arc=none smtp.remote-ip=91.218.175.206
Received: from mta0.migadu.com (out-206.mta0.migadu.com [91.218.175.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F240606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F240606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CObOpJZm
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dUdgIW56zc2LmSVw8C0r8LZdqQmDkcHedRF69L+C9RU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795700150; v=1; x=1796304950;
 b=CObOpJZmLdQcR1KhwsX1sJzeNLJrle2kxiHgKrfXFVKhRL1cnhQQhTnA2mfd0SdtdM7Sfe1f
 9pq0+f1cgSqSZYwm71e+W9KMV2t1+nG8AvXi+pc1u1+fxfCwTHbEbLk99nJnNauUwT1AoRXhI2T
 2NfVFzJBJqaLG5HNQ9BvLKIw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6b52514b2ec1a5b2;
	Thu, 26 Nov 2026 13:35:37 +0000
X-Mizu-Trace-ID: 6b52514b2ec1a5b2
X-Migadu-Flow: FLOW_OUT
Message-ID: <0d5126e6-7588-4cf7-90de-0bd193db8246@linux.dev>
Date: Thu, 26 Nov 2026 21:35:28 +0800
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
Subject: Re: [PATCH v3 0/2] Add RCU docs Chinese translation
To: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, wy@wyuan.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 paulmck@kernel.org, linux-doc@vger.kernel.org, rcu@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261126132523.6329-1-xiongwei.song@linux.dev>
From: Bruce Song <xiongwei.song@linux.dev>
In-Reply-To: <20261126132523.6329-1-xiongwei.song@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry for the noise. git send-email returned "timeout" after the cover 
letter was sent out. So I resent v3 of the series. Please ignore this one.

Regards,
Xiongwei

On 11/26/2026 9:25 PM, xiongwei.song@linux.dev wrote:
> From: Xiongwei Song <xiongwei.song@linux.dev>
> 
> Changes in v3:
> 	- Some translation improvements.
> 	- Deleted unused label.
> 	- Fixed indentation warnings.
> 
> Changes in v2:
> 	- Fixed build warnings and errors for both RCU/index.rst and RCU/whatisRCU.rst.
> 	https://lore.kernel.org/all/20261118131636.5131-1-xiongwei.song@linux.dev/
> 
> v1:
> 	https://lore.kernel.org/linux-doc/20261113013054.5662-1-xiongwei.song@linux.dev/
> 
> The following 2 patches are adding RCU docs Chinese translation for the first
> time.
> 
> Currently, RCU is not listed in TODOList in subsystem-apis.rst. I propose
> adding it.
> 
> Thank you
> 
> Xiongwei Song (2):
>    docs/zh_CN: Add RCU/index.rst translation
>    docs/zh_CN: Add RCU/whatisRCU.rst Chinese translation
> 
>   .../translations/zh_CN/RCU/index.rst          |   50 +
>   .../translations/zh_CN/RCU/whatisRCU.rst      | 1218 +++++++++++++++++
>   .../translations/zh_CN/subsystem-apis.rst     |    1 +
>   3 files changed, 1269 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/RCU/index.rst
>   create mode 100644 Documentation/translations/zh_CN/RCU/whatisRCU.rst
> 

