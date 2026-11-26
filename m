Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709696;
	b=21XiduXSQU9oecu7CyNNMo/dXQiC8LzRSXGPqFbaMxmeZZQCpR+5D0Q0lGhau6Zr8Wny
	 ZdQQF0Uloa/hrj9YvzqX39Caq504Zteg7DmO5T5NaXfj0LmUgqPL01iapQghjZH0m1E78
	 3KdeA8btjVT/yMKTMnEp/ph68tLbwz858DaG3pEW3QOygr6XYCLTgMx9imPt3yzT5yeiL
	 XP8qvZnrZhmp8JyjXBkzQa0mAbrNXzZx9AIUGvSCePNCla93HWC3L48N79k2pN04ogYB0
	 Z/EjMq11kM+MkFiddO7R96yqepJxKnhkoTBpQmjWX4x9XF7vetZWAQ2e0LCT3YUwvNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709696;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Fjxg2e0aBeA+BIPDTWMNMTTxa9DV0gJVseB7zst1XI0=;
	b=TPmP7eUdL7PQUnbcsfBRbpMt4ypcWuFwd0Wjv+J/EONVt/5ihYJbN2RsFDsgy5P7wqC3
	 oPC0zzeeLcS2AG4fBj9iF0O/k1vDFneeOJrw3mpXrszHrQXjZ0oWMz/29sbQ8UxfHu69h
	 lpghc9N9PksCeUY7lic4pKo7NQakUIk7n+fmnil8qdu4trW0N4fYTfJVHasEf0JySnOd3
	 2JAnV0hxnR2Qmr80YLa3x0Zm3zUsIsVf0IbYHsids4Ak9CUyl8Ho5xk/x857oiQh1L/b3
	 yXgO4BPiz0tsIk5JlMNaAT0S3GoqESTBvA3t0HqC0Yt381Zuv7fLUUeIlSDgzMJ+xtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Jw3FJh6o;
	arc=none smtp.remote-ip=74.125.82.225
Received: from mail-dy1-f225.google.com (mail-dy1-f225.google.com [74.125.82.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3E9606A6AC
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F3E9606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Jw3FJh6o
Received: by mail-dy1-f225.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4929160eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709695; x=1796314495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fjxg2e0aBeA+BIPDTWMNMTTxa9DV0gJVseB7zst1XI0=;
        b=2WcAswzvqMEaw4bTtq/ovBOesa6uc4NnAUF+iFpW+oJwbijxknokjeQiZpluVl/Wil
         I93gxQC9Y1HNCn7FaVPGZ3SPqApWLHtursXJfHbsNT0fWi/dleP9y+7tGRpRFFV2XvtP
         Bw8pL1D7IXwZ8ptFzyzqBnFYF3LidtbKeIdhpboH5j1acrHNGDnq+oGx5KdqLe7kbYbI
         GjDIR6o6p/uwVjD9azKg+yDwQz6Nl+P2mJgJt6PuOzETfNdfPb66UBU4I8HfYio6NrTz
         oHeNvtZJUIbRvICGMQCd7FCvacNMovhb2IYrLXCsHXPV8hvXbbo6l7f9lBk1PymxG4aC
         nCQg==
X-Forwarded-Encrypted: i=1; AL+hErE11P4FAJDHkLGHfvlw+z89HhBp9ewW8wuVOAwbidXQEjpSKpwG+e4Q9unbWScWtcEZKrhL7te366Z4lBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6FgJT9Shrb2V+4//fzbCyspmU1Bo2B32DZSaghXq399tT+/wR
	PgZE+9S0gF3ewySJCWM2zYRuUxHkOuGnQpKNv13iXRNwwxOZGc5mR2hw55xWhquBeWQIt3eq4dI
	ulhdJ9jXb6KAfu1j9iffSACGyFtP9tf3HCxiETn1fDYdfl21a715bqBv7x7sWW19elC0I4hOmTR
	D4uJZyy6vSznhGKDrQKm2/LyXDWnMKM593+q3nAb9oif55xx6ifaQ3yQ/m4BlO5DrERZK20xD6K
	0Kn4zJgE80f1jumdu5RUy8ilA==
X-Gm-Gg: AZFdTZchlMfax0ClCLrzANPnS4eonEBE6z5mx6v5CAEaqveGqmtyUCTeJpYeUKcN/Gy
	bTBXfPMCXqJGlV1cHw+wkMn9blD38pU/J+ZM2h8+DsBX0eqZtaJna4nYpc7bl3gP/6gySS3MVOa
	jTxoBLel1/zAB5a7shHBtv38nJc9xfXd40xcmpXox8trwxVmITMyzilnVP9L6v7aGo5xmaKHkPV
	GKHvSkR7/2NX2Q3QC9AYvSlZbgukak85W/lGa7KTw1IFmTXb8fGjbVcu8/+xrnFHyZ7Rk7GJtoM
	NvjhXZFRfLBnzAWHPsVsFih2aiSqgC1mur1Rft4nW+K8p0wN5WOfUI0Ib89TKGl5Yx7s5BcMnv4
	amnRtEsZxo+APTvnHfCRHpBzN8xe+RXeaiXmtESfd+QozfAuhvS5YVjkB3SIymkpO3SYs9jrlXN
	vO0cu45mWUMk4fCJe1hHo2kMtS+n+qFOIGaQmCOFhYFw==
X-Received: by 2002:a05:693c:41cb:10b0:386:cef4:1ffc with SMTP id 5a478bee46e88-386cef43e87mr5540304eec.12.1795709694450;
        Thu, 26 Nov 2026 08:14:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-38566dd1e87sm3483261eec.11.2026.11.26.08.14.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so1309964085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709693; x=1796314493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fjxg2e0aBeA+BIPDTWMNMTTxa9DV0gJVseB7zst1XI0=;
        b=Jw3FJh6oFHQrn5NzkXdxTwc6XSaMka39DAPp5SO/iPdJcUFtIgkBURB9nY5XoZWD7d
         nWnE8zEWH5F8pWaxSzrMD6BC1zh1Pcfr1jZTi5whx5BOi04vEBrtc95tVPDd0Y+n2I/8
         jKB2P2CIdu3HKsuy2ubLGAfrL2LJgl9e4bOm8=
X-Forwarded-Encrypted: i=1; AL+hErGA/OIoSeIXekKbveomjdXMkxdHxOTFwQToGB0EARTiX0U/pkXuB0TI+sY0OGItbkMNrIoxoRVzOZdgxOg=@vger.kernel.org
X-Received: by 2002:a05:620a:2b46:b0:93f:3e45:a419 with SMTP id af79cd13be357-949ba9b34e6mr3743262585a.38.1795709693222;
        Thu, 26 Nov 2026 08:14:53 -0800 (PST)
X-Received: by 2002:a05:620a:2b46:b0:93f:3e45:a419 with SMTP id af79cd13be357-949ba9b34e6mr3743259185a.38.1795709692822;
        Thu, 26 Nov 2026 08:14:52 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:52 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH wireless-next v2 2/6] wifi: brcmfmac: detect AWDL support of the firmware
Date: Thu, 26 Nov 2026 17:14:41 +0100
Message-ID: <20261126161444.2484980-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-3-dev@deq.rocks>
References: <20261125190254.176055-3-dev@deq.rocks>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 25 Nov 2026 20:02:50 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The Apple firmware of the BCM4364 and BCM4377 runs Apple Wireless
> Direct Link (AWDL) itself and announces it with "awdl" in its
> capabilities. Add the feature flag for it.
>
> An AWDL interface is created with interface_create version 3 and
> interface type 2. The host gives the MAC address, the interface index
> and the BSSID, which the flags 0x2, 0x8 and 0x10 select. Add the
> definitions for the interface type and the two new flags.
>
> The BCM4350 firmware 7.35.180.133 lists "awdl" as well and answers
> every interface_create, including the version query, with
> BCME_UNSUPPORTED. Keep the flag only when the firmware reports
> interface_create version 3.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/feature.c     | 26 +++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/feature.h     |  3 ++-
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h  |  3 +++
>  3 files changed, 31 insertions(+), 1 deletion(-)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
