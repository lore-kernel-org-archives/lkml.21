Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795482660;
	b=jJXi+PqG4owu+P9NHBzLq9EQjSftknxTtDZscPDuDOL/zq5gXtbvZK6ruYVf3cAOrcGP
	 bJtr1dtjtSh+h2E5SmH1Vkb+4j5zMLqo7LygTbtWqaZhaGbsA/V3mE5tAcLnznOvaUg3r
	 u9A9U7Q6L6A8CJ5MQMM246Lrv7motmGOYDiv34AcFxoq+xkMbiN/G3bu+eiF0+sHrSZLh
	 bHhi8ccdD/z4vs3UaroFOL7AYD6cbz0mZZlThNTn7I5iFRnQkyEOK1gAOw3DglyECnv0g
	 APfAiBc8VkBDdC3bo+/2ltAwOio/mwu0KyXUN/GJldkVcRJe8nugxU2f5Aa7/xx9TsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795482660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=CwEMPI7Nv8Y4G/uSjVrKaLXUsD6jBVuvooxioPWLmTc=;
	b=ydg/nQ22qMqwqBZ83paXJPRHX2oCjcslbl05WJmsIudKEOAjH8BaDentMvfwneCycDKR
	 5mBQMHrJ+g/g6bncJbVrtlXG5i9Rpotx15qq4tKKn8C35xZI1qR5sNQbUu/p/bHKpnCqd
	 X7JTc1HzfXU1cqIQAUFF7aYoVedHrHfl18g/Y1cpAbjIbJQbIhMcVkLwA33GVPv3XCpvZ
	 KuZJcxk/Vfc5wtEkyjvBfxkGVTtiXAvhkMzTvUY8tW4WzED4SMvuws+QTnSzmL+HHlKoG
	 V84wi0zIuc2bpN5u/mVIbnEkZOGmx87M5wZhvjUzMNYmEoEpY62yljT1vv/3n8jGTUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kKG19Co9;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC62F606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC62F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kKG19Co9
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386bd881d39so998718eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795482659; x=1796087459; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwEMPI7Nv8Y4G/uSjVrKaLXUsD6jBVuvooxioPWLmTc=;
        b=kKG19Co9tDWF2kSXK9dKvmLlvSosMXN5A+fjtmNUuhQN82VGIHKHSt7hl60KkIuTqu
         OTELZTKud2yzTtGpJ7YssH7XaqMzCZGWMYDkBuT+NcCO6f/J1jqPT0iyZQqXfdWQVo+7
         NpL+BVzS/nn6KT8iZArKwzuxRvPxz7vHEFH6/T2KHs/4S02PCeK1dyecPiT3ra5J0+fQ
         /fgxtsqz+bypFUe4822LHXZAKII+1BrHRYFU9BpYbk+8Uqr0d9LvdyqMqVFfzPKr5ne0
         gjqbIHRdr1UAU+rh9u1Qy9nf2cgwwJCw8nbQvW/s9TlQ/Z33NtjHLWdZggyn3wfRzLHS
         ZRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795482659; x=1796087459;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CwEMPI7Nv8Y4G/uSjVrKaLXUsD6jBVuvooxioPWLmTc=;
        b=oLuRgnlotNBsdB/UfqpE8RXR6OUTh/RygiNe8wUOaKag0VlLK/aLJe/KJGJKtfhzSi
         ui2Ob5jxQH7nznXBAqJdrCQzjvaJMxQ9uSEkuxo1OALNR8gJ6n4KufGX2EF3U50TmfdQ
         XHd3D96JfoVmN3CN9J+1PesuE+6WU6TrZB25eZUIlPC7Cr3gxVzPFjB6eej7J13v+qAG
         Btl2hQs1XxdA9B2hW18Ve8yp82j1RqAi55ZgjINPVlHFU3vZb0oksuKRnBROJFnPnlZj
         Kg37HEjSBzFn4FF/QenE1n6CBMRyrSIYbPn5p1y8rHyY1OZXC3vTXXcWOe3teIt7DWq5
         HA7g==
X-Forwarded-Encrypted: i=1; AL+hErF4jCL2kje9/6KsVQjyA9C7nyknOZt0ZD6h42xCqdIrIvkHagZL4Qu51f5GSav3YpY4RnPqv3tPDMb2FxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ckKRzaPj2bUwUExvBenNaoWzxoLY/X9GWqy58n6OxZioKebrZ
	mkh+HJpmRPqXEobMFLS0F8crGTgXCh8uKgj5DwJbOKSQk05Kxv4Hib3O
X-Gm-Gg: AZFdTZe+9fWoab9cnifGuptsjtoafOChH6fO4bv9bni1p1u/EWvAVidCVo7fGJwaVUB
	ukVnAyzbIW+IvuxjFyYjtDGCrOrAThQ2fjvykFDDBx7BnZMRb6PEOm+vcF7v/2GgY1miyj75Lyw
	/jG/ZNbhzsQPuBRki+WtmNEI/nfuSyxi+B/JIj5v1ZfQHoXYH+zirdFWthy+LKWMiXwk8VnPGnj
	5Dwc+tt0xOXK3X6suqhrJtVyzgD104SpXR25ouCZlk9+BTAZhFha5Q5MbDKwvgxML69XIF3eo+B
	hKO3ZcOvqEDuCVXN2wPWbz58TCii15mxrn0anf6kcx7MRxsAwXOkymSJzNDUbgJ4L7psm6eZQmK
	E7JhHxR6LILtQG9WgZlagtJdh0BVvzFS8xdkuZXw1zdewXQUjYmp9XjRlpy5FCrFvCET0ECPwf7
	T9K/OciSq93oBXMwy0dU0A2LEkXJTeLG8s/zJ23sLIxFCrQxUaZSxYOANHGrltnLjMnwYxHF5eK
	z7Bk5PpIUpJllIfno9ODgOPijVky79/9GbgRTMsfRTMwrxhQ3LTZljU8rm8mDOyFuyHL0iT8GOC
	dMEVgjR6fZOFE1z2BDaH4L/HZcxGxPc4C7j9FLeMRcEH2EyVa9OFCHQUx41nTDO99PnBXQ==
X-Received: by 2002:a05:7300:c695:b0:37f:73f9:aee7 with SMTP id 5a478bee46e88-3856c9a6408mr15050898eec.5.1795482658749;
        Mon, 23 Nov 2026 17:10:58 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm15816977eec.18.2026.11.23.17.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:10:57 -0800 (PST)
Date: Mon, 23 Nov 2026 17:10:56 -0800
Message-ID: <2f25009cbd67a8ee7b417f12b35374b1@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Gibson <warthog618@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 0/2 v8] gpiolib: finish the legacy cleanup
In-Reply-To: <7dpg3x3gkypkznzhuetjsqmk5fhqwuwkc6kupbs52zqh5mibgx@fjow6eodw4pf>
References: <20261123085723.156933-1-arnd@kernel.org> <tdc6h325jthjgyik2ne4oistkm563maoc2cpnffqu7hh34tpl7@oscripzv4dwq> <qvmy7iaxc7cjy2gkajqkr5ma6b4lwxz5ff64a5zsqrgewkxodr@odbjlv5x3hix> <8296a5c2-0aa2-4fc7-b65b-9d336bc4dff6@app.fastmail.com> <7dpg3x3gkypkznzhuetjsqmk5fhqwuwkc6kupbs52zqh5mibgx@fjow6eodw4pf>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Bartosz,

On Mon, Nov 23, 2026 at 04:41:32PM +0100, Bartosz Golaszewski wrote:
> Can I apply v7 and provide it to the SH maintainers on an immutable
> branch?

BTW, I have the soc_button_array rework (converting it to software nodes
and dropping "select GPIOLIB_LEGACY") on an immutable branch based on
v7.4-rc2:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ib/7.4-rc2-soc-button-array

I recommend pulling it into the gpio tree before applying Arnd's work so
that x86 builds with INPUT_SOC_BUTTON_ARRAY enabled no longer pull in
CONFIG_GPIOLIB_LEGACY either.

Thanks.

-- 
Dmitry
