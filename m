Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795734800;
	b=SMYlzbrjfvqrc5UkGRhxqkqNiWNrJ4J5vaMgL6Jcaymmbtz3vXZdghF6Fco2lBWnseWM
	 WX6309mgmqJ2QXwHKYbV3zesCpoQa5wRfRFQB0tEF1ZRnmBEiMk04EENkurLWN5fcBbbh
	 R6mlp98JLLJVlBjkTcv9gWrlwRebZtpYJFIxt9uo9+Dlgo9s4YWJbMWOwY3C+dqGR6J+Z
	 nTmfj+YPhJpeHBfl1WF1cIJEwX8KgGGdD3Pc+iMKWikNejnU2FNzf6j4NMcbyfaMlziNC
	 o0CybJdymylg3sRc3eKvTOZnPz2zwd91CEaOU8W8QjP72+lCD/UHgZtsNxsQQScouMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795734800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z9oKeq83DopfcyY48tMpJBUolAgSCl+fklUHPsTQ/7E=;
	b=1xzeESU2XBc2Lv4Yy0yr61QVkCUsoPqPMvE8pzfatLqzdJGqpGcjiQJna2cqoiVQQ6ps
	 Of1GRuAVzdGusvcGj8RRBS2uXIDiJK3OC3kon2Czdlo5r+43k6EIQ9P319HMW8W/iXmyM
	 ivTKSbEuXfW9N+f9A9TgK9dhExqkLPypTje4utB5XQ741zjfXgYbHm197yYsRpimNbdD8
	 z9VbioNCYOBzy06bY+oM3ksj80+olW1EyseOwHtMfiFaTOdU+xELFlE77rWe7aTjgITe5
	 BDyPEcrAzyZvdInDDXne4UBLq8SXWtdcJu0AWVAQiH9ntOn04rWy0lBz97h5dFvFoZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JHBO9wX7;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9B0606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F9B0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JHBO9wX7
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so11143084c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795734798; x=1796339598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9oKeq83DopfcyY48tMpJBUolAgSCl+fklUHPsTQ/7E=;
        b=JHBO9wX7gqdhkoJohsMxVoW3x1/jmMyJ7SRSIwy8x3gYUyzzacKd1HqKrXV6b1L5H5
         HT72VlK2dkW9IzOl3rb8ty/4I/f6GEYtwE/yfbr7K4JiXc91gXDGLjBOHNi68i20bn49
         hAVo90M4h/hCilcDiQZDA3M7AV+cwzKh8npk9vXEZqXbCGwA/blen0OKL6LL0UoM2fDW
         yxG1j0hZYEncJfVicFWOetM1tC7N/HtwA/RAJN310kmTsfWWqOGWrqrgRD1PO9Xl6Zys
         sw/R6eJbY489l+QAJ7MEdzBgL6eTxYHjQqmRGSS1/N7qeQW7+dfUpmPjUmtKprdwoOYc
         pDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795734798; x=1796339598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9oKeq83DopfcyY48tMpJBUolAgSCl+fklUHPsTQ/7E=;
        b=INpGwnhplvFPIN/Trc0auBrdE/oLtNx47T/FOmdL3nCXr0uIYhQjYQLsbOxDgKWyaV
         8ysyaiEwKlgIJt4N+MBwnhqfKrFTrXERvgbbmXCq9mSG2xL995kGVL96FCLDlpABpN2y
         mfyE1KLMbDcjmUGjAJ2ribDkJJP2nj6/p5V/b0mo30B/sXSsqnCWRCZLu2H6g9rmBeY3
         YfXZfqWjZav0zir9F6M/zkC5LmcOHJcqt7ufZWecXtcAr+zSf1ZY6zpmOQSC05d1CQni
         b8zD87IKoBy1cmHLG/QKY5BfVEuqqnGIQd9DYEsheDiPBOcIDE9ev/FuvUflIPHv8lBT
         yC4g==
X-Forwarded-Encrypted: i=1; AL+hErEcrqvCu5eIDH+o03c7NM/HzvtXdR+Qbce+b9FWzzk5TumV5Ml5CGeA75x5DwCZSISj+sV3+LmcWHFH7XI=@vger.kernel.org
X-Gm-Message-State: APuU4Z//MCQDGKnmt9fBQyEv0788GN9awbGKX5j9SlKayIpULCLuXF9b
	6QyhWeN+jd+sJZ2W4hpe91tTZH8I8kM8r/EtM0praCZLmj0oOSCkFBJDgco5GZO64ho=
X-Gm-Gg: AZFdTZeSc+jAWd69SqF1VECE8HosXlUmSJ/h9V7OkKRs/1dPYCFGBNpkXsv8+96GL90
	IekZYxQsPAZo1syCrkDmu+anFfnRBslaBnnWbXh8hSzrZrEQjFu4vTJMnGMw/wmPQCBVN825h6R
	s/6D1YYyBis4gwuyEXBNNgfpBDrmcIODQyxal43UaFeU8m73NxAoF3+Y/42eRgdhMpHc+IYFKIw
	CHTz1jJQfyaeLJUl++uVZTzjbbFq1FLG7PHMegK9NeFuury6D6OpLT+eJgqeYF29Brgq2n5tXeC
	wflTboFZSPwA0iaWvDq5Rf/j+DTlTTzOTJ4/sBSOKacX25qhdD16L8MeyAPHnbsey5pJfku0wUu
	dgQb2rLbzeK/ZtntGSFZKacxOVuPQNh5FFptjVpohT88v+nmaWF2zF2wH4aO5cF4T7nIC8DNlpX
	X15RETb0vSJ0wPREpxzUk7c/rxuntisR01cpu7Fr1ATHDZAC4BACJBkn4cWXvEAITXKbL8YjgHm
	G3m2zmwiNjzYEdKSEdootG42750ECu5lFOiXabuPFsFtG+OD0CxCymQzQg7qBoHb0ErqnSUP6hr
	j/l3XhhA1PsPK/8jN+D8YniLi0jaH3D6vXWF3EWd7VNek4Adw20AQ5IvJ/mqWvt0cOCEJTVb14f
	0P31PJn00tkUDexHI7rCn8lQtpA==
X-Received: by 2002:a05:7023:b88:b0:1ac:d029:70cb with SMTP id a92af1059eb24-1b5568c5127mr27239842c88.30.1795734797799;
        Thu, 26 Nov 2026 15:13:17 -0800 (PST)
Received: from [10.1.3.103] (162-231-245-176.lightspeed.sntcca.sbcglobal.net. [162.231.245.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm52330279c88.8.2026.11.26.15.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 15:13:17 -0800 (PST)
Message-ID: <eaefe02d-02ea-4865-b000-7d5b74da9f27@wkennington.com>
Date: Thu, 26 Nov 2026 15:13:16 -0800
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
Subject: Re: [PATCH net] net: usb: cdc_ncm: don't flush the TX timer into a
 stopped queue
To: Paolo Abeni <pabeni@redhat.com>, Oliver Neukum <oliver@neukum.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?Q?Jan_Kl=C3=B6tzke?= <Jan.Kloetzke@preh.de>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118034122.315979-1-william@wkennington.com>
 <7a0566c6-7a5a-460c-a113-d9463be3607f@redhat.com>
Content-Language: en-US
From: William A Kennington III <william@wkennington.com>
In-Reply-To: <7a0566c6-7a5a-460c-a113-d9463be3607f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 2:51 AM, Paolo Abeni wrote:

> On 11/18/26 04:41, William A. Kennington III wrote:
>> cdc_ncm_txpath_bh() calls usbnet_start_xmit() directly without checking
>> whether usbnet has stopped the netdev TX queue. Since commit
>> ad70411a978d ("usbnet: fix kernel crash after disconnect"),
>> usbnet_start_xmit() frees any NTB submitted while the queue is stopped
>> and increments tx_dropped.
>>
>> This triggers routinely under bulk load. With the default 16 KiB NTBs,
>> usbnet only allows MAX_QUEUE_MEMORY / tx_max = 5 TX URBs in flight, so a
>> bulk TCP stream stops the queue constantly.
>
> The sashiko comments look relevant. Also it feels like this is papering
> over the real issue: bulk transfers should not cause TX queue stop.
Yes, this was my original thought too. I have a v2 that just pokes the 
TX queue after doing other operations but that feels like it just papers 
over the underlying problem.
>
> It's not clear to me if there are H/W constrains behind the
> MAX_QUEUE_MEMORY value. Perhaps is time to revisit it?
I don't think it's the MAX_QUEUE_MEMORY value. I think it was a decision 
years ago about how the queue is stopped around link down that is 
leaking into the congestion flow. I'm going to port my platform onto 
master and do some testing.

FWIW neon seems to think the BQL changes for usbnet might have fixed 
this as a side-effect. Let me test it and see. I'm not sure how that 
will help me on 5.15 in the interim though. I may just carry a 
downstream patch to force kicking the queues.
>
> /P
