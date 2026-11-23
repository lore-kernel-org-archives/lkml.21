Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477051;
	b=xNnmBDhLnZ9oodiKz2jBZJlzIvxsb3Z61kSxZ6iKwDdamYOJXniEsMUU9Tt18VgADlAv
	 PrY8duDq8Noqdr/ipkwrZhPstItVzA5E4dWKn1quI+mSgVAXvJG2e7JYLbV/K8wzcBnrB
	 mhdLTw6XL4WYUiIbo5M8hp8cBhLSORYl1t1AJpqLeT9uMgu4rZ6XXviT2e29FiZoMxVmq
	 DZrUlWxHQ/bDPMQBOEeG1rcC+KGXw7lIXsFJZ3oA3GLazk7w05pQt8frM4qIHXDghkcm5
	 sponA9SmN+xUgRrJpTxl9jyNIFjeh5S6OemkhrN+92L3wAC6ZgCZYQgdyZOniTGzSMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nCtOThlgIxlSduoLEYBHryFj9jT/Zq+67s7VxNMjkzk=;
	b=AyOjrCw6FQd1f2OdLYAALJZH6THSTKVgp94zIkqgyqu56ZN6PdmrYF165dO+DNLeyM75
	 zbOp9l5dTnQXKEWKr+0cj6x93h4llzmoDclj1S1NR1MRnMSPJhjjOoQDPHLU+FthuE9Pa
	 R3Y5cC2WpC870zhq1rztOA83+mg8X5JhzPIkuN6b/2l2dpNw5IQ3K1bznnIfGri0Ph7VY
	 T0qovkRRm0FmOilcxRSTg8xdmxNAE59th7Kjjqdc4e3GWvvLT8If4zNmknx7leRqJOlbE
	 MsRW4VLpaLYlGd5IR/xLZdWXkGMNyd3YZiFqAlg1Wl2zK0T8oputzr6W39f9CqnyE7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NHlkL+qI;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62436606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62436606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NHlkL+qI
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b413d04c93so2252418a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795477050; x=1796081850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nCtOThlgIxlSduoLEYBHryFj9jT/Zq+67s7VxNMjkzk=;
        b=NHlkL+qIwXD8b1pC0f90rQnXIGTuE42Rd17hMdouo0VjxooaoGPJLXqj0mPM0dP0Uu
         UQObb7iUBTm89PIsssTqdgIOZ5nIUzluWbEryuNEf4D03NOA9bUWJd4MdbihzEew2kM4
         6qhFFyZxo3kz+fppgYOVZL/e0pxhA4LTdmp7TiWGdz7n/kr9g1fckW/XKLmovydGoPdx
         jMNPDET4E4xfYQou6PQSQxVfL7hapvjtVavUM+vn3nqjzoVzQlPO3HFe+OlTB2nzZ22P
         zPwGgHq0Xb/aSmdc6cP7GJd8MUE8hEmg1Yr/jE17BwVQhXLhmkYzVi5n4d62GyvcEl9Q
         anaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477050; x=1796081850;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCtOThlgIxlSduoLEYBHryFj9jT/Zq+67s7VxNMjkzk=;
        b=OJmYs6efNTGQXMm4c2TawNA7q1rfQuGBXJErvhAWrS5qYwAno0JhpBV2PZhBghntvE
         uJymsRVmnTfuOCTFZbw0BZvR/S8OJtTLJ2Jt8uwMZ1QxTlDGEXiF5uDGxeF6k9LgnpEw
         vDnOEGseIL7kqamOIpXvT2/2MpRcfh0b+CMZ5Uz9s0VW3Uzd1RbEWA+tA434escrWh+N
         /77GrhHOhqmAVoQQG0VPl/eNdSzIDlQ7lo1ukLjeV1eRWm8o6mWIjHHAGIN8/wypyhve
         ipW+swYJbOLOh+mZs8y1yJOroMhX0wM6TBayF7PleB6J/nw4zHcnPO8VBjhDE4/ws+U5
         N9fg==
X-Forwarded-Encrypted: i=1; AL+hErFlGfJ/x98a9px89TVYYetVBV3+1oeuFbTdemYUDVLb7SWAnwYJSHNXroNCPPSdmhTlJJsscSmjaOekC60=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xa6ovaZqNZtD0DhmEJYk4n9vQMKqrCETVfbrKOYtDBJFOSQuC
	nvQNFvIXAE0DQ/6h1lWW9A6EbM6KL7MUTTbf2rsuwonj1IKlF5okWXnp+fUiwehCof0=
X-Gm-Gg: AZFdTZcmJtZQX7r4Z0LyUEwMxZseEmb3YK20hYYPHvLY8PUr9teluki26DPaF3o/rWX
	ZaH/+WJJNnxZmbMfVMpHF8/y/zNLgwINI8Ta0F53qa+jS8zoZ/zTzFB4Mfmw1JdWPhBZBsl3+4I
	YILsRqOOVr3y30pTnU60H7nr2YN9u+r9Qi/Be4308KSGk1HFxAqhfYUiKwxmP5Vw9NBTuztFMk/
	z5gX3gOkLPKLN2hedJ+zvt1ee0pdWxxOjYNntRCWpBmBUccDA8ZeZfnQzZhwyrl2+NlkCzpD5SS
	78kZzBnlZ0lSsU4XeckMZNFZFjQfEMpmw4BZ05OuRC78gBe04eI1eClo2/6wEHgbLTn6oQ20c1i
	7hUMviIryqk+3ffZZKdVzC0/slmCdS6tnUvWoIww8BkQpuwhaXU01WDNsxNZtPZI+ui1dui7sge
	xW5sgAycjwRh3+5fJeVg2mXAeUARHu8grYQsFdSjmia5Rid+YNIxabKBAapxBLUVdbcQwBd83dA
	27TkJ4Wmr6R8VqGpaHpAWS48seEr0nBXe1s2tJgQhjYhi6N8PSEa/olVFOkMs4oKRS+/EuXn9bB
	HouSiCeHIxijqTm1nTUedYpZuN4IFCLn9ebiu55qvyQMys18PWLajM7b6ScKmfVnImTL2f+LIYY
	CunEytNO7zIunzB4x9Y1VJo1zow==
X-Received: by 2002:a17:90a:d2cf:b0:3b0:9781:ee8b with SMTP id 98e67ed59e1d1-3b41c9e46b9mr11862740a91.26.1795477049685;
        Mon, 23 Nov 2026 15:37:29 -0800 (PST)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm22676475a91.14.2026.11.23.15.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:37:28 -0800 (PST)
Date: Tue, 24 Nov 2026 10:37:25 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: guohongyu <guohongyu@cmss.chinamobile.com>
Cc: dan.callaghan@morsemicro.com, arien.judge@morsemicro.com, 
	johannes@sipsolutions.net, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	13057616121@163.com
Subject: Re: [PATCH v2 1/2] wifi: mm81x: clamp command-response copy to the
 received skb length
Message-ID: <bpjumdldx5sj6ejkypglwajk7th245ppczedzmzj4rxjt2ug44@bgbijfc5smby>
References: <20261117032227.154874-1-guohongyu@cmss.chinamobile.com>
 <20261120064905.192045-1-guohongyu@cmss.chinamobile.com>
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
In-Reply-To: <20261120064905.192045-1-guohongyu@cmss.chinamobile.com>

On Fri, Nov 20, 2026 at 02:49:04PM +0800, guohongyu wrote:
> mm81x_cmd_resp_process() copies a synchronous command response from
> the received skb into the caller-provided buffer:
> 
> 	length = min_t(int, length,
> 		       le16_to_cpu(src_resp->hdr.len) +
> 			       sizeof(struct host_cmd_header));
> 	memcpy(dest_resp, src_resp, length);
> 
> src_resp->hdr.len is the inner host_cmd_header length of the firmware
> response.  The skb, however, was sized by the *outer* mm81x_skb_hdr.len
> (mm81x_yaps_read_pkt(), yaps.c:186-199: skb_len = sizeof(*hdr) +
> hdr->offset + le16_to_cpu(hdr->len); skb_trim(skb, skb_len)), and
> nothing ties the inner header length to the outer one.  A buggy or
> malicious firmware can therefore declare an inner hdr.len far larger
> than the payload actually present, and the memcpy reads past the end of
> the skb's data into adjacent heap memory, leaking it into the command
> response buffer.
> 
> Clamp the copy to skb->len so we never read past the data actually
> received.
> 
> Fixes: b1906cea00b0 ("wifi: mm81x: add mm81x Wi-Fi HaLow driver")
> Signed-off-by: guohongyu <guohongyu@cmss.chinamobile.com>

This has already been fixed by cd4335a9a41f ("validate response length
in mm81x_cmd_resp_process()"). Make sure you base your work on the
mm81x-next tree [1] (or -current).

[1] https://github.com/MorseMicro/linux-wireless

pw-bot: rejected
