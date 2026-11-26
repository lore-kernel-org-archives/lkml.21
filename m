Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692339;
	b=zMnVq0fbEOZXoVgP88m2baE3wHrYCM/YaKlsB/z86TDW2LQGSfa/OmAxphQKBm9hJS0T
	 NQGkn3cF8opX1kG5I7Qeum/hx52ySQhbXTv6uXeztANnpW9YiFE/V34PTwEhqNWtXwiZa
	 Eh0nw4VCM8Rm//TubcfQ432wY93JHBiS9Ppfl7vtK14T8GKAI2Dn7hdnC3MEsubnxWe/u
	 +yHZQGXzNaXKkpF0bfSlxkisbvCx7rWvYZFURLDuokFrg9gYUmQZUAWqSnw9Q72cA4exA
	 txR35fDLFIxU3Vi+sEDpY88CZx1KkAlurTX4EsYOg9h27mCXhVYnSLH4G6eRNCClLpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692339;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=l1rG3sYne2tdlIq1MaAmTO6Mrc8TdahETTJ3Jk7THx8=;
	b=ms2nTeoisFF40aeHfkJKxCxyMCrZCz9qiXl2uuTpyUioeuzjk+krvn/NA8gg58Hm0Nxf
	 dQVx0UViWZ4Yxd8LBOqCXxRfzj9bvJU9yeYW7+MgNOv9KMbuBT5LTu8MaOPv+++xrjQvm
	 a9v4604su1iMYkk6vQHpxH5VBivSu80jKqVKQZnTArvIskyhUrtp3tJISuFDxaQPukVoK
	 x6huBfZynTlWxfo1m/Or1HiXTY1jKL8J4WFupxrJRmrUNpw0vPxDWkrfwwAJ6fTAqMahx
	 My6de4YIIjghhPvmpU1lnO+8ExX0Pm2+jSJWBqb5B5sHb/fZLNgN1CnjVL8hQkbq+aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MjbFUwF+;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=I9GylhP+;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A71606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A71606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MjbFUwF+;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=I9GylhP+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795692338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l1rG3sYne2tdlIq1MaAmTO6Mrc8TdahETTJ3Jk7THx8=;
	b=MjbFUwF+1KI4lEnXYf1OeKLTmtScvWOvgxbZFyUgDMNjQKRORNCVuGXTlTg87gnuUfkB+t
	pv6z7KTHa0WDriWEtyW4N/mb1eUKOl1clDfWNgjxkRxnvjStuiDre3KT+NY/ME7Pp/86MI
	K0LmtYo8n8dg09OHUR2KUnG2npTuv80=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-Tgt3lrp9M_K9C1g2lOB_qA-1; Thu, 26 Nov 2026 11:25:36 +0000
X-MC-Unique: Tgt3lrp9M_K9C1g2lOB_qA-1
X-Mimecast-MFC-AGG-ID: Tgt3lrp9M_K9C1g2lOB_qA_1795692335
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso58543085e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795692335; x=1796297135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1rG3sYne2tdlIq1MaAmTO6Mrc8TdahETTJ3Jk7THx8=;
        b=I9GylhP+YHFNhiOIqu+Sjf4dgfqyhHojxESXTa3r8Cgw1gBWLBcC6DffmL3YKdSeCi
         Kt/gjRjklGYamgvhuBGd3O3J2S1/jGBdHyFWVJbRVtBoycS4WpJVsdSksrVM+/DHiM+n
         9bnV9R0i0+BIx3+kF4Y/hHE6TzEoR/7NLclTtcPdMqsgCUw7L3GYoGSIj8EevBuKd7eH
         I577pVFA0xJeYxV6qxziXUKxc/2zcsUFDngDaRgLys2AgXNvurph+MK+nt5TOGhWgoUr
         rilooN4vnYEaCFtQHO3sC8oxED7z99W1QrGkfKbUVCPnGU6tcyuHt05r5HVi/QQpRWKx
         souw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692335; x=1796297135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1rG3sYne2tdlIq1MaAmTO6Mrc8TdahETTJ3Jk7THx8=;
        b=CQkhR3KDO1QcF1zsZhWxboeK/UjqrVduwlIMekOjgHSedjyo22gBWHf2AIk2zQh0bw
         7oHXVyzPSd/EUWQDaYpouTdNHb7ffL6nvwptiA8pA0W6veiHCX5tyUsSmfqEQkX7Gg5f
         7SvnIrGXHGZUQmdAwSRJySL83/uA3z3yLV0M9di6GMw8ZwNS8EDPYof++tYH4Dg0FTLY
         MTRk3TEytRss4oSaZ3LDP8vU4cz6GVikg0x7CudF81+xMR4WsMVlsV0QG9ZOKTD1lSvm
         zfrKGw1DmKLww5BdfQFO23HUAPVgFNMCd56CfQgOxQ94llT9vworcwX85KDAYWzV4fNw
         v4Rw==
X-Forwarded-Encrypted: i=1; AL+hErFwyLIonpkJYxR3KHNjVPFmKY68S2RjLbwCds73RMmQJhKurxt8X3EVis01IFKLSDzuomOBpDD2FOCyF2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OW7haMwKxycxXz4Zt1Tpbf4Qa3AtGud3agzaCnqKQT8A8ZgHx
	RLkWJarG6oXTwKIQ8dyWBdJK7sdkMEy4hzzLLm6hNHVgK6PmSuqQxOvdMNiX+EwDRDHRJ0g3K20
	F6Yx8aFPo4hYJJ1MZCW7y3B/AHXplYeMGeZP1eek2qDfMfSEhUZyNh3Lypue44TGz+A==
X-Gm-Gg: AZFdTZeAev4EYIuLQDXwgpzvYD3L7dDNTLWMpwtIAjxUWTD5ZjkJgOAuUy801A649zQ
	VHa/DI58JkK88H74weI1W6RBiyW54XQ84heG4Vwfgt+7ozLgLubA/njblQ5VPYkCKcnvsJFuDsO
	QtB+o5etqJBEYvqmSdA9nlWNgyIdDiwVfLHABSyRnfEwbCwmpGtCIbGUs7pVMcxH3O/x/qs+GY7
	LTGF8fKvkHwMq8GcUTuvbJZ8h4iK5NWos4LSxmNed/5bXoPDQSTB7IiZvVKEGZaXLO99wE7iCC4
	eHJZ/p5NHJBRNziXDS/86UG/Z2fAmx+/gsVSzDFuxoTYAFTKG392qfti4cy+klqNdp2ZuVCA6jZ
	1/mQO+TNBelL1NfWr3dlUhcV7eP6DXdoqyp3Ct15WvUF9M2TAuf4nod4puquHRb49W74p94WsNh
	RNopet4qLoCoM4jNTFcbw0o2aDtBVoA0w/JcT6ATaQa+r/
X-Received: by 2002:a05:600d:82c5:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb88822642mr470109085e9.31.1795692335232;
        Thu, 26 Nov 2026 03:25:35 -0800 (PST)
X-Received: by 2002:a05:600d:82c5:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb88822642mr470108545e9.31.1795692334821;
        Thu, 26 Nov 2026 03:25:34 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm38694819f8f.47.2026.11.26.03.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:25:34 -0800 (PST)
Message-ID: <4a434d3a-a8d4-48b5-a630-7dd8a73bf463@redhat.com>
Date: Thu, 26 Nov 2026 12:25:33 +0100
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
Subject: Re: [PATCH net v6 0/5] bnxt_en: Make RING FREE more robust
To: Joe Damato <joe@dama.to>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, horms@kernel.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, selvin.xavier@broadcom.com,
 kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
References: <20261120152830.699712-1-joe@dama.to>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261120152830.699712-1-joe@dama.to>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 16:28, Joe Damato wrote:
> Greetings:
> 
> On two production systems, I saw the following dmesg pattern:
> 
>    NETDEV WATCHDOG: transmit queue 0 timed out 6073 ms
>    Resp cmpl intr err msg: 0x51                  x20
>    hwrm_ring_free type 1 failed                  x12
>    hwrm_ring_free type 2 failed                  x8
>    AMD-Vi: IO_PAGE_FAULT  x3
> 
> This suggests that, for some currently unknown reason, TX completions stall
> and the netdev watchdog fires. The driver asks FW to free the rings, this
> times out, but the driver ignores the possible failure and frees ring memory.
> Since the FW didn't respond to the ring free command, it is possible that the
> FW is still DMAing to the memory which was freed.
> 
> To address this, this series makes the driver stop DMA before freeing ring
> memory when the firmware did not answer RING_FREE.
> 
> Since the RFCv4, I found a third system that hit this repeatedly:
> 
>    NETDEV WATCHDOG: CPU: 35: transmit queue 0 timed out 5459 ms
>    hwrm_ring_free type 1 failed. rc:fffffff0 err:0    x64
>    hwrm_ring_free type 2 failed. rc:fffffff0 err:0    x32
>    hwrm_ring_free type 0 failed. rc:fffffffb err:1    x64
>    hwrm_ring_alloc type 1 failed. rc:ffffffe4 err:4
>    hwrm_ring_free type 1 failed. rc:fffffff0 err:0    x44
>    Abandoning msg {0x51 0x3e35} len: 0 due to firmware status: 0x408100
>    nic open fail (rc: fffffffb)
>    DMAR: [DMA Write NO_PASID] Request device [47:00.0] fault addr
>    0xffffa07ef000 [fault reason 0x05] PTE Write access is not set
> 
> This case differs from the first two in a few ways, but this series would have
> still helped:
> 
>   - The ring frees fail on the close path and again on the error path of
>     the reopen (bnxt_init_chip()), and the device then writes to memory the
>     driver has already unmapped. The series stops DMA on both paths.
> 
>   - The interface came back up later, the watchdog fired again, and the
>     cycle started over. The host logged 79 DMAR write faults in about 20
>     hours. Patch 4 breaks this loop by refusing to reopen after DMA has
>     been stopped.
> 
>   - The firmware answers each RING_FREE about 5 seconds late, after the
>     driver has given up, and finally reports an error in its health
>     register. Patch 2 does not treat these late responses as success because
>     their sequence ids do not match.
> 
> In this most recent case, I suspect the hardware is faulty, but the driver
> shouldn't hand memory back to the system while the device could still write to
> it.
> 
> In all of the above cases, the IOMMU caught the error. If the system had no
> IOMMU or the IOMMU was in passthrough mode, data corruption or crash would
> have occurred.
> 
> In the future, this could possibly be extended to make recovery automatic.
> 
> I wonder if Sashiko reads cover letters and then avoids flagging stuff, let's
> find out. (Unrelated: I wonder if anyone reads cover letters).

Some poor guy still does that, especially when the cover letter is
shorter than a novel :-P

FTR the upstream sashiko was not propagating the cover-letter context
to the individual patches review. I'm unsure if the nipa variant has
fixed that.

/P

