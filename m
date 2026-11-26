Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691901;
	b=D2INMRc1HEVptZrG+OdgGDrjb4F/zjJ/lXnjANr04DSSbcFapYf86A2nLeuifdQz8saM
	 vFQH88U6vaR4GTTZX6qbg5O6siEonxs/AI6T/lDYZsYLy90CFVuuS+n8XtWr7Wzl5aWZH
	 lhduD2uVZlVtaqyrDs//FMclvn7K4ZlqiI6BWeSu6b0QEYPbAnE+LbGARE9pBswmettLy
	 7GbBrfz/o91+T5a0p/OdE1+OKecckudttFhzkkER0/22VXcplPHi4pFWCAEpYg4GQKgWC
	 sfvXpqjYp88M6DvxxnZlp8iW0InoXNhRMotWgnIooKkVV+EEDOw4JumT/av8DTWSxxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691901;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Kk5+tp69Hm4OtlJWx6xUcvS1bABaPkFBgaohYRUNQY8=;
	b=BM2AzOhHfdSYltWTMbLK3kez9RsHMyKs14O0Yn/ZQlY/zKArElVwyEisoh0bL5j9RyP3
	 ggOZ/XkxnzTV9P06eYGQNRNTu+ia3r0gSxiTSEvkMp63LdDp8Ge1acpvX+drOf+up5MVz
	 ODLZso0bwZjsOR0cZiLApBRpH1AGY7JWI0+zNnl0Z34DV2MSxQNciqBGdoauXL2o9c+x6
	 a6zz7mACKBrNOy31HyICZsCeMlq/kZlYSUlXhors3Y31i3onG6cPmJYSx76WSTSQhQVsw
	 RkQGG4jmBpcoHnFIj6dW7zSCnXe1JEht9JQ4OI8e6FjwOlgO+sXeQQivPY3O7JpVOeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CK+pxkrs;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=G7h9QPK8;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED5606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8ED5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CK+pxkrs;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=G7h9QPK8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795691899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kk5+tp69Hm4OtlJWx6xUcvS1bABaPkFBgaohYRUNQY8=;
	b=CK+pxkrsAPojIZlyCsDBEYmpuYx5AeWFYsqPlBWxY5WnPazA5ODgBjHGVAs/gdPr8X2omW
	oOtZdbuaaH5d3Y/pe83KyI0qPanXsHmkmcXxKvTWbXBfHqEkN4VuLZGObLx9XnZm1a10In
	T7yVZv7O0AMV4l3JVVQkShIxLTAiBCM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-GJi3ZUimMtKVAbbzkG_cFA-1; Thu, 26 Nov 2026 11:18:18 +0000
X-MC-Unique: GJi3ZUimMtKVAbbzkG_cFA-1
X-Mimecast-MFC-AGG-ID: GJi3ZUimMtKVAbbzkG_cFA_1795691897
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-492b5408dedso3938508f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795691897; x=1796296697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kk5+tp69Hm4OtlJWx6xUcvS1bABaPkFBgaohYRUNQY8=;
        b=G7h9QPK8gnJo7kqPQbu3gaL+m+Ya43nEf6+bWfqo49HZ1dC0DYQbk5dDkyb26fAkI2
         GOzZy2f9tJZhkyEJQushAGtt04Q2LKOar2O60HO6g0RvkF6fBHbzEnz57Lly/ESzWdI6
         WEqiQ1hpvrtvCydSSltsPf3ujtYaOLqp7MUbi2LBFjLKn0UKWacBClbDJpiwZXNWht5X
         YwFx/II7+94pApAre47be29YqhMsUg5vM7citZDeIHYBjC9IuckxRWDKlT4OvevZMZM7
         oL87VAGj4PDOATci7S2OLgX5NBbxF1qMvECSNqpkrgY2mMmoY0PZ0/4tzXoICcoK1st/
         WGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691897; x=1796296697;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kk5+tp69Hm4OtlJWx6xUcvS1bABaPkFBgaohYRUNQY8=;
        b=TR+JNMdrt4xwZyaw+/ypFaAGnc4IA513siYcs8TRP+ef4jQtKpzMBCzjfkVTSjvont
         lXxZaFC876T9moWbnNlhQsvH5wHdA2nA1yUVX0mA5C9kTc9sk7fDynmkaxgawga7mrWU
         TwR5RgN2wyNHqI7nMkyfHDZpZxb9PMj9x0xeVzaxlLNrIv39lai9YLRafmc4Hgskl4pY
         VHV57i0y3I+F2hRkWczKiWIDKvyAWYF3gAy7CGCmslzi7GdtmI5cLPV2OTZpIuEVfjrR
         dFKeGf6WYmbE1eIo9Qyzy+AEkNMq+HHRABvgsaX0eNoAj+bGnAEnRYrIiktBmPXz8KAb
         KJvw==
X-Forwarded-Encrypted: i=1; AL+hErH/j4dnSwgIQ+CBz2mXS3HNgqFYcseupo7PalcabO4xDUgHTbDm5QBA1IOrbpVyhFtSajWtoZI8/3yf7tU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MiLxlgF5+VqNglXMfcFUK/2uq9zeCS4j7+kkmKWxp/OxRtuz/
	olrXBlf7KRemayE8q3JOITNiT5KEjUjsbfXO9Nxi969THNOKtjWMePitOs7zI0+IRIwYCZ3k1gW
	O+CxekISgbk3BjmvyhCRorL02NJ0W0ODrHLPqNCI/U6qAkHQeQ1pRxd7SLh9/x5F8kw==
X-Gm-Gg: AZFdTZeAZD1VsC38wHhr9d3LfuL2ARNcmcpXfW9zrlZ6m+3d4pnMO1kcjp2BDY6butO
	N/ZHos9B6C3Wvd0A9VPlbaQJVZ1B1Hvp5n36lt8hxbRE0oWAhFzQ8dpjTtv2uQoKiMWqtr27nTT
	mHnko9rfD4hLDQCS3p2/+ta2MuclCh/PADV/AYQWoHR2Nr9ry6zDRUuUcH73DeIU4ERWWokzZ9n
	klt/FWaI67A7GLCpkLidQFy3xqRi2nIk5dUXd4oea3++Tu3vodTqocrJyZwYMUOlPel6JV/cbcR
	+ytwfetbg8KYlCttEQbN7LzWtr0FEnhr3p3EGxoTBVzn8bjYu/t1pneGABcoJbPoRypnk5IvsSh
	ord+MdPtaWUmw6lp68ru3PLpOvI+Ows7VuK59giEqCUE9MZ852HdwdWmW/fQDQkZ+aUvQTTkWkk
	AG/vw6pSG9GknO+dTKIxGoWp6+idaX3ebRqupo7hGw8XL9
X-Received: by 2002:a05:6000:4284:b0:4a8:647c:f964 with SMTP id ffacd0b85a97d-4abb6d04d79mr43589555f8f.57.1795691896615;
        Thu, 26 Nov 2026 03:18:16 -0800 (PST)
X-Received: by 2002:a05:6000:4284:b0:4a8:647c:f964 with SMTP id ffacd0b85a97d-4abb6d04d79mr43589476f8f.57.1795691896105;
        Thu, 26 Nov 2026 03:18:16 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm18159816f8f.9.2026.11.26.03.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:18:15 -0800 (PST)
Message-ID: <3598861f-f441-46ea-a5c8-574372a34370@redhat.com>
Date: Thu, 26 Nov 2026 12:18:14 +0100
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
Subject: Re: [PATCH net v6 2/5] bnxt_en: check HWRM response if completion
 never arrives
To: michael.chan@broadcom.com, prashant@broadcom.com, horms@kernel.org,
 selvin.xavier@broadcom.com, kalesh-anakkur.purayil@broadcom.com,
 pavan.chebbi@broadcom.com
References: <20261120152830.699712-3-joe@dama.to>
 <179545865940.3135.4199576162321798829@kernel.org>
 <awTBkxA0DV4BiQym@devvm20253.cco0.facebook.com>
Content-Language: en-US
Cc: Joe Damato <joe@dama.to>, netdev-bot+sashiko@kernel.org,
 edumazet@google.com, netdev@vger.kernel.org, edumazet@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 linux-kernel@vger.kernel.org
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <awTBkxA0DV4BiQym@devvm20253.cco0.facebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 23:43, Joe Damato wrote:
> On Mon, Nov 23, 2026 at 06:30:59PM +0000, netdev-bot+sashiko@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential
>>> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
>>> index de02d1baa7514..53667c0c38aaf 100644
>>> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
>>> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
>>> @@ -582,11 +582,50 @@ static int __hwrm_send(struct bnxt *bp, struct bnxt_hwrm_ctx *ctx)
>>
>> [ ... ]
>>
>>> +			/* The completion was not delivered, but the firmware
>>> +			 * may still have freed the ring. Check the response
>>> +			 * before giving up and log the state.
>>> +			 */
>>> +			resp_seq_id = READ_ONCE(ctx->resp->seq_id);
>>> +			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
>>> +			if (len && resp_seq_id == ctx->req->seq_id)
>>> +				valid_byte = READ_ONCE(*((u8 *)ctx->resp + len - 1));
>>> +
>>> +			if (!valid_byte) {
>>> +				hwrm_err(bp, ctx,
>>> +					 "Resp cmpl intr err msg: 0x%x len:%d seq:0x%x/0x%x\n",
>>> +					 req_type, len,
>>> +					 le16_to_cpu(resp_seq_id),
>>> +					 le16_to_cpu(ctx->req->seq_id));
>>> +				goto exit;
>>> +			}
>>> +
>>> +			/* Read the rest of the response after the valid byte */
>>> +			dma_rmb();
>>> +			if (!(ctx->flags & BNXT_HWRM_CTX_SILENT))
>>> +				netdev_warn(bp->dev,
>>> +					    "Resp cmpl intr not delivered, msg: 0x%x completed anyway (len:%d valid:0x%x err:0x%x)\n",
>>> +					    req_type, len, valid_byte,
>>> +					    le16_to_cpu(ctx->resp->error_code));
>>> +		} else {
>>> +			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
>>>   		}
>>> -		len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
>>>   		valid = ((u8 *)ctx->resp) + len - 1;
>>
>> [Severity: Medium]
>> Is a set valid byte in ctx->resp enough to show that the ring is safe to
>> free?
>>
>> The commit message calls this case one where "only the notification was
>> lost". But the commit in the Fixes: tag, 74608fc98d28, sent the
>> RING_FREE response to the completion ring so that the completion entry
>> itself would act as the fence:
>>
>>    "The response will be the last entry in the ring and we can free the
>>    ring after getting the response.  This will guarantee no spurious DMA
>>    to freed memory."
>>
>> The response buffer and the HWRM_DONE completion entry are two separate
>> device writes. Once token->state is BNXT_HWRM_COMPLETE, the existing
>> success path reads resp_len without waiting for the valid byte. That
>> suggests the response buffer is written before the completion entry.
>>
>> So a set valid byte may not mean that the HWRM_DONE entry has landed. It
>> also may not mean that the TX/RX completions queued ahead of it on the
>> same ring have landed.
> 
> Agreed. The valid byte shows that the firmware finished HWRM_RING_FREE for
> the TX/RX/AGG ring. It does not show that HWRM_DONE was posted to the
> completion ring.
> 
> Michael, can you confirm that the firmware has stopped DMA for the ring
> (other than completions to the completion ring) by the time it writes
> the RING_FREE response?
> 
> If the response is written before the ring is quiesced, then this patch is
> wrong.
@Pavan, @Michael: there are pending question for you here and elsewhere
in this series, please have a look.

If nobody answer in a few days we will have to toss the series.

@Joe: could the issues be caused by a broken firmware? in such a case
nothing would stop it from doing DMA at the bad time, right?

/P
