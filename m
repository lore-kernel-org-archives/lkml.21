Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412354;
	b=kxqRiZMeH26D160mqWydEnE2+E3nTmXay/CmUmF60t25CNZXRZNZ2aBTmbII9wXsf4sA
	 HQxJGAcgVO+KVNtgmJ8L/ISYm8+EWexdG5CqiYuDo+8cixfqW1BI4yIJOo49Uj2bJtOPm
	 zu00I8FOcxHXcOLTE7ymZizyRREaOoqjDXmeWEb/x66slsFweQr3LOK511X1tlNFWkrw9
	 bwDzNReuNzj7msKc9gIRBKOtVUiiKfcCvtih+TWIwbozofghYgbqlHV9Bj7FM8u4jTb9B
	 SUoxGrCKoK9XCV8xPiHAodEH79DMAAAci1TpnAHhJ8xZ1MU3vWksAKwidPxpVkCHoiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fvhTAiYdeCl5kHtUIEV2YL4HP0g+GBZ1mPbqO9vDWEQ=;
	b=NHE5mKoeKL7H7jy7+eEFpJBYLC6mHcuQvOpM6F83DNvtN8qvG/G+hdokr5zfH/JEcAiw
	 jU9ZL34tyPk9IYo2X+BPXjTFmCyyh6q51PNDBUDcjghV5C+ke07xl405Z8ck8CAuNxlL2
	 DblLj3C/zx+BFSDOr2UMMafhf2w5HI/gltyoF6Pggym+RYK64ZzqknZBM/cHOI7GOBcYf
	 XGgNstG7W/bZ6gEHlCL4hD2d73sEj2MSxg1W6BMWZp5KAysQ6yRbwKPAnFRGVI2GjNrVT
	 YOkATxPke4MCNH+vBnc2lRgIVW69Aj6+WGDhfJA7A+VQx1jVShOZY0pwh30jmIrXzqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BbXsc7S2;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2637D606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2637D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BbXsc7S2
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6ba85ac95b7so137121a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795412352; x=1796017152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvhTAiYdeCl5kHtUIEV2YL4HP0g+GBZ1mPbqO9vDWEQ=;
        b=BbXsc7S2FcaMo2r/z65LEH7s/j2SKbvYz391NVC7yplm3ZolF1p4R5JOiC595I80+w
         4CkhYd7mSqZaiXocqpnQbkhTQLRBAtIjhFVSuEX4JWYDrfODNiw9VaWMUXRfI4yCHTA1
         +mT6d//jA6LvzA5CxuzuNQOl7WLxKvUkPsgHoTSe8Ln0KzPZJd1w3vwEt828xv9cPE0T
         Z6U2UC0ltz/ndTo7WW4Dig0NZ/pT/1ppxL481bVJn6a+zedHuqz4XASZjVarZEHLzuE1
         7z5xiL3MHOTVmmJyoICrZZPapq7vEOG486578+A6r1w23tfb2ZrSTrbnJLbhykSELe3J
         duPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412352; x=1796017152;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvhTAiYdeCl5kHtUIEV2YL4HP0g+GBZ1mPbqO9vDWEQ=;
        b=H/F68mFD57piSwQyMLckoenRRKluy6pSxWIFe3at1257L06oY3XsRc59XeEXSTGuTJ
         TcgC5vIDhuM0tg3fGx8yY9YWI6tod12jKdeyiSPqbj8WXwApgxRvs69I+n20k0cQaonx
         E1uY9IEo5005CUU2vPRthP2kVgxy7h6sQrCi7s/J6X7zp47CRMv9DBdznUKD44+/i/fu
         jn9gbYXKJG0XI2OjHN4qmwIu4yMP7I7BPzlyhfU/Tmci7Vr8rU5Xpbs6/9mQAk7PF+ip
         hhw7Fg8q/W0JIPUEvExzeCSwyARWP1OlQAPIV9X1UKTOorEQNpUK2W3VPlZK1/ExjQDg
         SoQg==
X-Forwarded-Encrypted: i=1; AL+hErGocgOPA7oBW9xLwlNaTaRmetEDRAA2kc9ZnAlLn0l05r5VHQblAq9T7KjSZCDdRRchj2J1HUpZruw0rCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lWOQk9UyIKm89gZ7imJCz2N0gWDBw10sBeVkimwRMLBfpDesr
	S8wsbdS/SrXUUrPlcZMaHLQbG20240WTOLAncqnNYKK8WpCJzK/9+OiC+frDhoz96qQ=
X-Gm-Gg: AZFdTZc9xdlhDTtv1BjL1nPNrQMJIFk0FescS200dX59MEYyLz1d3uGmSGBzmpqzXEn
	Grm4tFAhUUaFAzjRYUtbSZSQ7Ho7nHILzigQ+Nu9Gqed/sAognvMWfLsjPw+CDLr6EZZ6y9vrVV
	6y3hIYskxu+2jSAup1v3zBcRGuU25EtpiEuezH3y0rj7i72ji1Pln9lWWPAcf68oZ8D09NVWtEe
	Ewl2Y9oKtoP9pjsN6figZJlnMuGeE3s3nsDtOKwAtwNuDGbvB++X4nMrB8VIi4ARYHSWBaoiMsv
	UCbHh8tBgzSJyD9J5jC9VRb7FpItbc+xZZPw/oneO1KVd9qfWqvRAC1UP+zQlrz3czS7k015fTr
	42FH6U2tj40AG9GgYj7YPliVIUBNyzwFpjHYTRhuyCdXLjMTQSWXo58Alvxs7yCWET+e18APOlE
	PC4/R6a+cLcbLmRmV9d4wXMFkuCeDQQWV6FC/IpijYKbfVpYv0ir/q/7bhNpTXs0/MGZpXDpN61
	0VcZqR5QkBaNh7ZC7lAu+FPb/THY+93wOTzj98Ehwt/ol9Gkbb4hRK7bBOGUpMEeRRk1d5xJWSh
	28r/N9lnq8+Yufe+Xt417DAlzBpwMxg1Yxw=
X-Received: by 2002:a17:907:932:b0:c51:8bf:9f22 with SMTP id a640c23a62f3a-c513a5c0549mr753217366b.2.1795412347619;
        Sun, 22 Nov 2026 21:39:07 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c88sm46640605ad.56.2026.11.22.21.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:39:06 -0800 (PST)
Message-ID: <32151907-21a5-4655-b4ae-253dc7934588@suse.com>
Date: Mon, 23 Nov 2026 13:39:01 +0800
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
Subject: Re: [RFC PATCH v9 1/3] ocfs2: Add new ocfs2_map_blocks() to introduce
 iomap feature
To: Christoph Hellwig <hch@lst.de>
Cc: joseph.qi@linux.alibaba.com, mark@fasheh.com, jlbec@evilplan.org,
 ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261120060014.12087-1-heming.zhao@suse.com>
 <20261120060014.12087-2-heming.zhao@suse.com> <20261120183415.GA2450@lst.de>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <20261120183415.GA2450@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 02:34, Christoph Hellwig wrote:
> On Fri, Nov 20, 2026 at 02:00:11PM +0800, Heming Zhao wrote:
>> As part of migrating OCFS2 DIO read/write code paths towards the modern
>> and performant iomap framework, here introduces ocfs2_map_blocks() to
>> replace the legacy, high-overhead buffer_head based block mapping
>> routines.
> 
> Do you have numbers to antiy the high overhead?  Or should this be toned
> down a bit?

Thanks for the review.
"high-overhead buffer_head" means that regardless of the IO chunk size
(per IOCB), the OCFS2 buffer_head DIO path splits the IO into 4KB page-sized
IOs. This logic cannot fully utilize the bandwidth and easily leads to
fragmentation. In contrast, with this patch set, iomap can handle up to 16MB
per IO chunk.

-Heming
> 
>> In addition, OCFS2_MAP_* flags are defined to gridge OCFS2 internal block
>> mapping flags with the iomap API requirements.
> 
> "gridge"?
> 
> Otherwise looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

