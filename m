Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469537;
	b=smzTf/6egWiuTBMkCjAqfKW6lOIkBTlOuMd/aArUepFXb0ZDvjXqpPGmRH1UwAxFWGPg
	 iBH0exkYUqg/pWoNWXvTf8WlM0bFzIqBUD0FSgvZBk/lu6w0j2AMIk31CD8v2kdGE/HDC
	 /U/CWPjMD3v3WsAiyF+slfi6+FuYbG6xsW/9j9n6L6f11a5npTaJryLWPLPfv02Ji0MHI
	 gAGsyW3aiCAfhwjvaDOKcUFcpcPpZcD8yEqY4/8MbEDnzVA31c61pgserQ6GLRYH1ZBEv
	 AiCe9ngPRc9xBQfHD+8Qn6Alzl1Tkvt+KXyD4HbtinO6AhDrrsR+TiPMO/0GRVhkWiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oMcHckr7xzBy87rdjUeibIDdjsNnDgKiiqf5JhMKkgA=;
	b=l/JtFs1O1Qio2g2gw+HZU59dgo+UpRvKA0eU1FgPy5OM1T9dk7h5tQ/et3d3gH43G3ix
	 QbuTowq885MokdpLUsp9ET0vZwiFNOb8YYWpOZpJozoqOgT2nUCyTH2ZZUkmAyJi/zZ+9
	 cEirxmUmDg5dQX4gg1xjDuR4I7OUVlQenbdHO7oB3X/s7q+WknuWbVQEfc0g/S+sowDFK
	 oO+BFTlYKkXeQhJsNVyE3mEHPicu0eRtb6o+ggYGVu7elmBIfbqCqS6TbsZGMNwcuRI29
	 0rpneWy0m70ppUIy0BH87G0nMRHU+sWAc+SFC5AFAwCUepnc5cFyWG8aOD57xEorsxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRqG1qpm;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D15B606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D15B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRqG1qpm
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df4f7ccf4so270209f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795469536; x=1796074336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMcHckr7xzBy87rdjUeibIDdjsNnDgKiiqf5JhMKkgA=;
        b=QRqG1qpmNHm3CINMJEGFCZVUZIHELj4/YROVzdBghlrKedFgufnZAPMpY5qyvBwUhy
         VXG2uzc4GCyrh29M6DVcTOeOk/X10AO0oLoqOrCTQcA6qOKkuY075ncIJotc5BqGxf3Q
         SZ7LppdbEcXHlQbh5mziFtI17CPDvaCl3BZT/bkDeWMYHQccfYHLlCdzEFUcL6cB7UzC
         oESAP7RI+3rqpO9C4nHf176roq6sbARwbEBk8D7PWNAbN6lLtTtUeQhKn3aIyO/EPoc3
         AsKIkGUGvD7CBVf4nzTez+L1uItMEGA2xKKPPGHMGwdwJ6wV6RxrDczkSJrPv81VOlNg
         TruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795469536; x=1796074336;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMcHckr7xzBy87rdjUeibIDdjsNnDgKiiqf5JhMKkgA=;
        b=qjZZSURHmyIMmp7OxsAFrYm5UJNCWNGn1VgHX2UzIDTNLFYZ7U/nG8Mwzc+kIJP2OC
         OacqHV2Rj2igbwzqjQE1rwsSCI4C1aDNejAtwpLoq7UNDxfCiYyOClQjXiR74QCLpHMx
         OSbgaxaMnjwRSnYN1MsTl0Ij8yZzdQgVHt3GP+acSMC8y694PF3kWdytWk+NEGIJNGBh
         n7BJu3kmyKrg4jh/q+KbYGYHEaNQxiyfgWVTjJ4GF80R3F1h2dPqCFkznhVuZCceZN7H
         nuzPo5u3jJJm2AajhU0IHaF7KG8ikJ4yXqW+yxzH8hlTJsm+NxGqpJgmEcD8D5L2yRoU
         zszw==
X-Forwarded-Encrypted: i=1; AL+hErGa3XGrLmZ8a2GJR20ginzyWW0G/Ld6W89lBgL2oAZLQWwEqUZmsUF2h/1KmekTlHH3o6JFw8JjCXE8SvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dge8mrhLl8kXxUZ1lKdP9dN7rEgNSEnZihiCrSh7DqPMnJhvq
	sIpqgeAAG4iDWp2sxQoiW5LtznWmvNbD86RtbX1ZuUhga2GenHdsq/yX
X-Gm-Gg: AZFdTZfCmkvruYl5Se65mm12Ep36eH2i0SrAmV50XPmpDkny+8QNpYfN6Q8F/CkyB3J
	7vrbyF+83LFgvkhGDL740iL6potWpB8KN2TufEM7X2Bv0ftNJnK+r6MM2eanNiwuuLsxx/T8GyD
	j+IjwWIykTm5BuGeV3U9ABAcuTLHyl0t1NWT0+RbagNJnSqAf9U1CbSkYY5znK/GUnPCzrEAmO+
	yin/SxOAfdFZAvYlb5rOULHLodz+Dux6i+5jrp2ivVF+N3vBHnGd4dTpwt8RhUOUn/kdT4WTDep
	cXxuAZxj8cBvENqwMHCloscv4JN0Jy5wioMEEXtvW9h8XbNLM+I8BkjAFlP9YUt+4leGUhe991C
	mMb3UPUwX/dYmKABuiuRT/n4v9PrfLSjrGZhuldNK8KuDM1Sj/r9GHgk5utJ56Lcfx2+CnMLgnp
	oez6JG8voJfGKjMlEdxpiPVMPyggrWdRI+nXC4OBRfZRmFSlNjC0ZJ49wUZCbCXnvmfvhWvE29b
	qD+lJrhMWOLe7v4HzTVKyvKAaIj7jLa3EKnVuRcldtsC3Ze9jNHRZBL//oQF5ftFiadkSWxXAFd
	xpQmfMOhCremh1a15k5bheUj242IYnAVZkk4f0ofDICxC4WS5X8kqBFEueabG2qvKRZP0zOszQe
	GQgw1uy9nwWdEyv70T3AfNaI5IWBPGR81XZfmwrUVwhdBj76fVNKo1Z2T/6V9pTanCq0=
X-Received: by 2002:a5d:5888:0:b0:4a6:d298:832b with SMTP id ffacd0b85a97d-4abb6095e39mr24438734f8f.6.1795469535507;
        Mon, 23 Nov 2026 13:32:15 -0800 (PST)
Received: from [172.172.2.5] (host-188-174-207-233.customer.m-online.net. [188.174.207.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm22833466f8f.18.2026.11.23.13.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:32:15 -0800 (PST)
Message-ID: <43dba41e-092c-40f3-b92f-45c8ed063c48@gmail.com>
Date: Mon, 23 Nov 2026 22:32:13 +0100
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
Subject: Re: [PATCH net v7 1/4] net: hsr: keep GRO disabled on HSR/PRP ports
To: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org, kees@kernel.org,
 petr.wozniak@gmail.com, qingfang.deng@linux.dev, fmaurer@redhat.com,
 luka.gejak@linux.dev, bigeasy@linutronix.de, xiaoliang.yang_1@nxp.com,
 skhawaja@google.com, liuhangbin@gmail.com, stable@vger.kernel.org,
 sdf.kernel@gmail.com
References: <20261009201324.17-1-xiexinet@gmail.com>
 <20261009201324.17-2-xiexinet@gmail.com>
 <6aae7800-5306-4839-a4c8-56265a0fae45@redhat.com>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <6aae7800-5306-4839-a4c8-56265a0fae45@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/11/2026 13:27, Paolo Abeni wrote:
> I don't agree with the goal of this patch. The kernel allows a very large
> number of bad configuration. Explicitly preventing one of them may
> lead to regressions and leaves the lower device in an inconsistent
> state.
> 
> Please drop this patch.
> 
> /P
> 

Thanks, understood, and I agree. The patch is still 1/4 in v10; v11
will not have it. The macvlan GRO check in v10 2/4 and the selftest
cases for the GRO policy depend on it and go as well.

The segmentation patch splits GSO input on every port, so aggregates
from a port with GRO on are still forwarded frame by frame.

Keeping GRO off on the ports is then a configuration matter. I am
working on a userspace configuration tool for HSR/PRP setups, which
can take care of settings like this one.

-- 
Xin
