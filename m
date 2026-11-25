Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595332;
	b=vXV/1IF3VKaIInOhMfEbir6nGgv7QXIO/3uzQ0eEt+WJ1qQs1//Y8gMw2+mudLeI7hc8
	 +XZ5/fBDTltNNDvuPA1dVbmDubfr/9AE/UrzNlF6itG/12MPwYnMYpYq4r8EbZaGFuuhk
	 tgNIsTTXEC9UbTKfyvFbZxD1/8yK7DcTMSkPp53lkCsrUGisIjCiYB/5v1mxkd5OPHlXi
	 Mq9f8OXcMrXiKbt3cID8XdiDaUN+ESTRqSFAgYpmlFiTNp0cPWMDf+qX3gc9BtQLNPfT3
	 TZWAkqTOJwNplpCCOthrDsOAwoDU41OOrcO8+KH5L2e47JRwVjI6GagjIJ4+isx44AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595332;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=4/x7j50MQJx15iZQDZRl//Wy8YqZBKp5oVRm2ztPBoI=;
	b=GINJhQ7d0WcjDBoO9A2ArFEGmXB/eTNL+YvO3yctG1rJ9RL3VDXtD/U8GbdUIxEcwno0
	 36i5fsn8uowcOL1da7nZ5T7SSjF/Pq9EFFcRaZhoy8GXKzyxX+YYiWyrxzXsJYqwYzTJJ
	 nWGAQLQXCUCqfj8HfAcrhJyUgQNzBuqNsgpSqbgRGxdLJ8BHGUlLO8iw4q1HEwlDUdrnM
	 eAbK+FXfScpF01/E52ZaqTPB01s8fsmHfP6rbpPHzss+dNGuu4BLtrCewGg7MMLZkDVoO
	 1oHezXvWTJUJXKSLqzlItIChEWaT4KJ57SWC5HfGlny/TJJF7PoIBknkm5m6O/mxNoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=a25X4E02;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69676606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69676606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=a25X4E02
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 28188C2BB3B;
	Wed, 25 Nov 2026 08:28:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A9EF60480;
	Wed, 25 Nov 2026 08:28:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBC2411E6993C;
	Wed, 25 Nov 2026 09:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795595329; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4/x7j50MQJx15iZQDZRl//Wy8YqZBKp5oVRm2ztPBoI=;
	b=a25X4E02hlHdAZLeh5VeHxN6+rjmKkzW9i2wpZ/aAVuugJ3MhGFp/MhlILboBpFeQrLS6p
	btaDqDM2H7xJlrfcz+RX7BjG78aD4/ETSqwQCSyqhGkrbhsHwEkozspZam4CAi6QNErfla
	X4cZFjL4zk+R+7axwU3Lts82blj93HcjkzkiSEjLEnO8XGY6cNRu5eTaAvhT9TaGGAsCH6
	EYOgRgkcR8ifvWMI22u/GwqXqhKoPjneZf8UAyjxbj9neMT5lNZwyFv5sqMrod0fIPcK23
	tFEf+qgwfm2eO9AZ/3N8Hwxzz7t37W+uw5aQMybCXkIfmRgiNX5ApaBhMAAuyg==
Message-ID: <e44876ec-4f91-4120-bbf3-3a1eb330a2dc@bootlin.com>
Date: Wed, 25 Nov 2026 09:28:35 +0100
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
Subject: Re: [PATCH net-next v4] net: stmmac: program the FSM timeout timer
To: zhu xin <zxyan0222@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
References: <20261118025528.2703790-1-zxyan0222@gmail.com>
 <179520945915.3135.14304625182301747705@kernel.org>
 <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com>
 <CAP7veT+EjJabWrvczNwcZQ16P_SyH_rAQkTz+nf1G+FjxMvgNw@mail.gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <CAP7veT+EjJabWrvczNwcZQ16P_SyH_rAQkTz+nf1G+FjxMvgNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/25/26 09:22, zhu xin wrote:
> Hi Maxime,

> Separately, I'd like your take on the hardcoded 1s timeout. At 10 Mb/s a
> PAUSE frame with the maximum 0xffff quanta stalls the transmitter for
> about 3.36s, longer than the ~1.048s NTMRMD programmed here. If the Tx
> FSM is still timed during a flow-control stall, that would raise a
> spurious FSM timeout and reset the interface. I don't have a 10 Mb/s
> link locally to verify it, and the databook only hints at a large-mode
> (LTMRMD) without being explicit. Would you prefer bumping the default to
> 4s to be safe, or is 1s acceptable?
> 

Yup, this should do the trick. If I'm not mistaken, you'll add some
better controls once you start upstreaming the glue for your XGMAC
device, right ?

Maxime

