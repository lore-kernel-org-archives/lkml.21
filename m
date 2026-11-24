Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480478;
	b=ERPMKLE22CewJlEivHFAmnRz/5LEQfA97OvAToFJB3V9P1zfO/FfkZz4dto8X4geuNvP
	 6U7D/8YO0corpiytKLZc8x2wY152ctc/ITyZZ0iA8voFW++Fi9eEMbjZXilokkCzFFywi
	 naWM1vKfyfP3tCJFzwP40BKSGCYnnGTln69tIniN7MOmRIgRawgCMo8UaIcdREE1G+8A1
	 eGOcf31G9qoT19Ws1xqAdkixYQ0K7ir4P9fOaf5kksOVOO5WgpONCgsTM10Sb3tFgF6g3
	 yZ0ACAEL+yOoVKia8zG0ljy14rAZ2xXtNrxewMjxDeMQWM6tfF2c4aJQwzwR/eVEW6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=l7RsmPiXmsKn+Pr+oiok7oJbW9rtNR1UkxIP+KjD2WM=;
	b=E7uJG1RpKIsanhh3SRy6NPIQ30hgZOR5B5dYwFE6SZ3MHXaxaqdMxJ6e5GnzpSCiFapL
	 N254fjn7qYysR6LanE0/KxS9H/zsxWqKEInvNXf35oX8YS5jrBCG6F4pnVxLIJPdm/tR0
	 J1ocqdsCd1tQrZIzKEGXBB9gqjgBemPQlXEMvc/X22EOkjJf4tqDjQfhZgKc9VItgEe7y
	 TFp7XmCzSNHhyrq8K5WhWTK1MFoK1R/fKc2u8BZgrniXXB4LLwNMcMiFC8clkl8TfsLzU
	 u9EDx+lN6ecnhWnwgZ3eDoRUH2oyHWrAbfWCkD71izrLn5A6DJpvY3pmc1E6W1HWEKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Fl95uPc2;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E26A606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E26A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Fl95uPc2
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cde84cb8803so734078a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795480477; x=1796085277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l7RsmPiXmsKn+Pr+oiok7oJbW9rtNR1UkxIP+KjD2WM=;
        b=Fl95uPc2lWIRLyNUr23VSjU/b4abaP1c5nkdSmtoCKLrh85iqjzNtkD9lEH0v9g+5D
         fhSoOyjdI426VOA181RhnHHat6RimdbYi3kT0Kt/aVO/K8CwlSw8wFY5V4vxRaoJLP2F
         1TVJHq3XMkLsfB7buzrGpDxAbck2qM/2Km/Qrr8J+hehuWDi0t7s4Eusl3hd7NjhVmO5
         5E0Z3RGf04wVwv7Wxt7S/ne+0xb1RSadAB7djYE7OuqIisEqWIvY7vKqMBG0FgEkn6qh
         L4qyAMxwiZNvZkk3q99S0TMP+F1irub7VBBJY2isyF59cFxAyusXqIORZKzoBwucaQF1
         QBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480477; x=1796085277;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7RsmPiXmsKn+Pr+oiok7oJbW9rtNR1UkxIP+KjD2WM=;
        b=1R5vTOqq9XozcclN52EGZOUohdPYMfoHfslTxgswgIfcXWnzzp0XzFwqzgOuWAMaKE
         G/0nD8VvhhyCvmMVOnOFEeGoDmX3sqmlcpAnWQHTLjPRkTddlYEKFZ3Wik+xOMwkcusp
         AWRvL6nH7S6vcE8dC8C7Yu+6x1iAfKTAtiDmLpXsgXdTr3hRnwlXis2poWlBS9/5Whz8
         42P787SZa7xvOzKGJDaelQA6QjJW+03zs5XCCguGQ5VnLDCjzlDl1WlgUKg2VV8YdTGH
         ukheI4piRbnSNemj7XqagLCIohhEwxgasIUDklyV6yFTaM61nKwKpQ5Bq2yeuYzngj5C
         H1WA==
X-Forwarded-Encrypted: i=1; AL+hErF9SeM2WajnBnVgbgg+rjcf43tSResgSq4lXAMSoFbyhyAEFlniVRFK+1SfmTQr45PAQj/TGY3E8YiV5VM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pDfpVF3TcVdFwJvkOfzEQEKkO4UZ/QaAM0lByxgiPYy1rTYti
	SWFSw+BVjmjLtAL2KNj6NWkxmoxszk+arrZrvBbH6TlirbFSylrSMgtpj0Yc5mLzlfE=
X-Gm-Gg: AZFdTZd8dxYO0XfGafq3W2ONUqysKgwOYsDHzdB3c9MViPJa/ZpS/A5bE518kh0ix5D
	4og7rBDqg7eRuHhKTIi/72A3efOI4Dc2YvIDkgr6ZqFp3eCcpLCxZO1/yt2b+1KtTAnS1rf31G+
	fudwk0SCHf2XF5y/Ecs/NJiwuw1zZWO7wrtJsvFIQLGzVIi9J+XZl/ORB7Sva+vVpSFeFJyvKHi
	+DTIBFIYxoNEJtXElgf4kd++HTCPsGsuPmoApIIG8UAn8lA7rbGMOPkIeFrlECW8nXrOV3Anwzy
	Gy+LcaO4l8GqfI0Wd74qg3LqGZ9kRyda6Zk1o5dc0yVNfJ78bMpsLV9VS5bDesCdac7g3dfRoGS
	UUJfNvvyyoyDa/qGT7wxgQ449s7yrct7aiGJ98zK6Uj+n3UnWvTmup2eEpT4ndoWSZeOVaCj5oS
	S9VVAVud0cT/YLDGwQK1RKr4UfGmo/6KrJd0/ufq+xS1MgI2jODhTeWnkNJfbjs4TIZovranORk
	lNDf2ACoRc5NuawVv4UMizSkIxq6KoM+IiWduDwyoMHX8Tc+HJnHvnncmvHcP8nMNO50FNs8hGC
	QGp59EW7CHy8RsemlCGF/+Ygrkq5+Ina6rnO/gCZ14bqQL64x4w2+hC5ZHnvv/cJ5K00HpAmNm+
	LF2zQeRIYdMewpcBHiqte/m4iAQ==
X-Received: by 2002:a17:90b:4e83:b0:3a8:32f2:f4a5 with SMTP id 98e67ed59e1d1-3b41c956a0cmr11971327a91.53.1795480476894;
        Mon, 23 Nov 2026 16:34:36 -0800 (PST)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b704cfesm7131414a91.1.2026.11.23.16.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:34:36 -0800 (PST)
Date: Tue, 24 Nov 2026 11:34:33 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Dan Callaghan <dan.callaghan@morsemicro.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Arien Judge <arien.judge@morsemicro.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Bin Yu <byu@xidian.edu.cn>, Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH 2/2] wifi: mm81x: clear a stalled bulk endpoint before
 the next transfer
Message-ID: <vshptwv5idooqjvdirp5ssf2ofiff6tjhgjnzqgptte556uzem@f7kec5a632s7>
References: <20261121164923.8862-1-25031212351@stu.xidian.edu.cn>
 <20261121164923.8862-3-25031212351@stu.xidian.edu.cn>
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
In-Reply-To: <20261121164923.8862-3-25031212351@stu.xidian.edu.cn>

On Sun, Nov 22, 2026 at 12:49:23AM +0800, YuanZhe Liu wrote:
> A bulk endpoint stays halted after it has answered a transfer with a
> stall, and only a CLEAR_FEATURE(ENDPOINT_HALT) request resumes it. The
> driver never sends one: the completion callbacks only record -EPIPE in
> musb->errors, so every later register or memory access on that endpoint
> stalls immediately and the device remains unusable until it is
> re-enumerated.
> 
> Clear the halt of the endpoint that reported -EPIPE before returning the
> error, so that a following restart can reach the device again. The command
> endpoint is the memory write endpoint, hence the same recovery is applied
> when the command urb itself stalls.
> 
> usb_clear_halt() sends a control request and may sleep, so it is called
> from the process-context paths that wait for the transfer and never from a
> completion callback.

I applied patch #1, but this one seems .. interesting. Have you run
into this problem? Do you have a reproducer?

lachlan
