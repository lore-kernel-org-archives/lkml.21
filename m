Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693998;
	b=wcWOm97Wc72RwqCyuyrbSND7uiDxdID2Q0oS7qlXkGjRVMCbjEtdqUpkioP6lYxWcanB
	 0eJET9C3rLKjZP9LTvb5ZWyoH4HQ3Kiix6ZWdc0JY8z5uMCxL+EPUfa/x4y4Gk0VGDdoj
	 G+u6PbUIua6VzAa/uGw91OPzNhCu3TX550mM+bZortJFETTYyETbZLV2jyM14ftwUXxvb
	 swetthPDrZx+U/Y99qsHL0RJRT6qprSRETUCQfuhhE+BrrziSVyo6a/MVeQIuEJf15Q6p
	 HQv/ngH7rzmM3frU0kR18hsycnUoKVf2+wGQzNcyl76sLs3fAty/LjXsF2aIKSVofVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=3kI5IDFfNjtsFoeKUBTQbibyFH609QEEO0MmiaXh0bc=;
	b=shRZqjgIw09zdyxNgltW82dMgDSK15Tr41XWfhfTXTCKZ9vUpK+up0hbjKhsWtv6RlGH
	 Z+YRZnln64Wf5imWo5urCn4+sIqW1Ad9CHXDpd0meslG0dLl6tuJYalbhZMc9X4zmUYhy
	 3+KMldMhMmO5Tk5zaz6dO72ox/v2kIRAcA0xjLnq5J1JYhPJTouWjD62i1zcYX6BbfRwo
	 9+Wo20+6S/UDakfeswoFxDfW5u5EyQDj6Xh/sQzRaoWV+T3TVUBWRzcjOnic9a2klSVaj
	 x7L6kFtdgJbkOi70TFhyC7mQx87dMkYula/54BWL6IVT8+7A0gRHa8SjoWtwmOlsevw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bfdIASAB;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EA9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03EA9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bfdIASAB
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f03920c477so58702355ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693997; x=1796298797; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3kI5IDFfNjtsFoeKUBTQbibyFH609QEEO0MmiaXh0bc=;
        b=bfdIASAByiwJfbqAAD1+4UTRO9VRc/1cw8CO1aAbFYAINIWPK1sjcGXTYBHg8ue4OC
         ALBdw5OPrfz9wafd7mzefxe1Yi6eLsKJu15ZlAA50EruSbNaCH7EDlhJQtJCvE47DBth
         4bztgRiNEa3EYUQPqvifGMissfDxwdTl3XHAwzEUVkNf1TpK2O1+dYqkEy/wBk5/hE5t
         aobhOuiFfLfcQEuTiDsXwUbOg6Ikt2BXTk7LZfnb93R/1nhk28DHy1jKLpjzKewoFN4l
         NPn1BPuV14cJrkAaCuU0eb/7J+POzSNPYEKAJmFCYfJZXwsKgr7pGmqFw1uelx8gyZF2
         p+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693997; x=1796298797;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3kI5IDFfNjtsFoeKUBTQbibyFH609QEEO0MmiaXh0bc=;
        b=IGAdTsYNunWd3G8XHjHHqOMfu+6tEcpsx+1C6Yighwn3wClaW01ROnmdqxo5A/1WDg
         0Jr8lfF/AJl2lfvpAU2kHIh4pFze+gjpF8pF1ZsTg7JgWD9GeAHDyYe/AJsxDObhW2eZ
         reqCp2woKOIAF7YSgLHA9XQYOpHDeKfqR4x0HIgQ9lCVUZvXLfDp6y139LOPMQGYx26J
         GCjSz1JrzHAT7New0YAqBiZG2++lUwJuZf0d/QHGPo0zvjxmh9+AqcUU+M8tXBRr7W+w
         kQ052vXGcTDb4b/WICJJSZGg4p2JDnE/sVOt1WnZvW8MNuYWOe7y8CRM43WYQPRb3M4J
         0U+A==
X-Forwarded-Encrypted: i=1; AL+hErEh/kk8amLTsEDrAmModKs6RMB4BkjphzkuslEsg20sXNxHOkOj/I1nN0l5IKGAhOJOQh+xo4jaYGOPlmk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5q9XIom6/MlAkQkETTFwcsMqQKFE6f0uru3YmWavrQsTbJ/cw
	UNfVsGw6Pr3JuMRqMowQs9I6r9QHu9OdVgwK1J5jSltbZit7UL40Xug=
X-Gm-Gg: AZFdTZf0betSMBclJdm8lpAN7Wda+QFO4byhBkUazQRiBSv6G8n1plkgXhDcwUjec32
	7FULeOJnixDcPxb6mHoet1R9pVoNfzfR6OaJpW87kNA0C5VZC3rcDSB6imW+KtLhfR8oQKvUYwD
	5bQ4l/yuzbqOVl5/ZjFVFLUZhXppEmW4yviz3G6m5cZlhJUbrTDseJfS3ExPdZ814oZQSEVhOTD
	kcu1mbeOtbCZ2sdL9Kt+Pb1nv29e0vPK9geLjVKS0ZTmSev5uzwYYZG4UbrfiXuMT5Znf5ZFbnF
	gaog/6dHzUXMBDykzxo2U0Y6sltSgpldYsI8K3gfhi8twJczlVdInaetd9o1TxbYxaDHf3yDKb8
	Em4MvMe5LwRYu3qs677zj1jzPoEnZ8AkbfGnxnOypL+9y2F+LJpjCb6bKJ1TYvqJXpFV1JsgwgF
	FCKzTHHRPU4xkN+KhFLmYYcdV/b828nTg29tlGlrcLSxYZstO4cpiPwCdoX/+lnOkZ3/YHOZm7P
	f2DpORG+gBlG2eqoLSq5HpBpZ/DlLXMp84X3cTZ+ASc0RA0V8scoJXzj3ayMsaCZuCm3YJCSSoD
	4U5S8LefEnWDd0+STD2IfgabffT1eLQK4AoKTfDyw+XNs/nobrBZxjq709KL
X-Received: by 2002:a17:903:2450:b0:2ef:f312:b848 with SMTP id d9443c01a7336-2f03f16ca8emr221908695ad.48.1795693997244;
        Thu, 26 Nov 2026 03:53:17 -0800 (PST)
Received: from smtpclient.apple ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f8aca00sm93559375ad.38.2026.11.26.03.53.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:53:16 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH net] fsl/fman: Drop device references when
 dpaa_eth_add_device() fails
From: Yige Jiang <yigejiang86@gmail.com>
In-Reply-To: <179568615995.3294.18215982267016488454@kernel.org>
Date: Thu, 26 Nov 2026 19:53:02 +0800
Cc: Madalin Bucur <madalin.bucur@nxp.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Sean Anderson <sean.anderson@linux.dev>,
 netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6C42B38F-A7A5-4152-9B25-5BDD067AD267@gmail.com>
References: <rc-b1-20261110-vc-177-85d2478ac4b9@gmail.com>
 <179568615995.3294.18215982267016488454@kernel.org>
To: netdev-bot+sinfo@kernel.org
X-Mailer: Apple Mail (2.3864.600.51.1.1)

Hi,

A static analysis warning about of_node_put() led me to look at
mac_probe(). The warning was a false positive. During an LLM-assisted
review of the surrounding error paths, I found that a failure in
dpaa_eth_add_device() bypasses the cleanup for the FMan device and
both port devices.

I compile-tested the fix on arm64 but did not reproduce the leak at
runtime.

Thanks,
Yige

> On Nov 26, 2026, at 5:42=E2=80=AFPM, netdev-bot+sinfo@kernel.org =
wrote:
>=20
> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
> - How the issue was discovered, e.g. hit in production, hit during
>   development, syzbot report, manual code inspection, LLM or static
>   analysis tool scan.
>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>=20
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

