Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556610;
	b=L4oXUmFLPwW+ayUEkkqz8m0dloWOeE0P47uBtIhF4F9belp3RmWrnhwhllABWNs94orw
	 ssdF7WmQJNEOy/OaNY4KovmpOTtziwvp5dUtn85aWlbiTVIZ3oaT27ZDZnY3njUE7zWSS
	 0eZEdIC3sjB03Wbvzjgv5fbApxj9dK7SoWfHy4RY7h/tverZhxmRSH9AXsCyaztiuxYn2
	 t5hW/kXx3zak/4m7nMgLuGdr0JMhne+8t6ZijPd/lJe/E7pEOG3enohj+1kx9qJ5HHK8v
	 F5FBErEZB4WxwWIbVlOWH2zNLlF13IRQbJWsAVdIAhjgiQNjjY/noA0MuW2xOoIxDww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556610;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9c8fNmgaKkXaFYrHx845ld1QJpotCxsOYnaNrMwbAhU=;
	b=SHI5saNo3dMXUrU2/kgNeTP+W3+ktBqv2ySZRVwvvzVylK+htVhvFlrjOn957M0N4ESw
	 8123igJlNobyKUb/IuKNDaCFyp0ZDhmlFhYtS940pJPQm1fR7gOQSNd3X7se/i14cVlNY
	 a5OBOCFKv6vwWgNwJ6gjf8FbsmQylojBpIPXPqB1b0lSPq0xLVINMzV05w8BOC105t+Cr
	 WVkBKHymjfJf51bEOOE3rSZ5SUw/Y1799dbwrJPYw4xC6yBQaNRcXKQWJwJtN/oZg5XIQ
	 08yWUS0wbOpG6NWDoQhVdnF+YgI63TaSijrnDWLy/OSLMQa5Q1lu9i6oeZlMh4gzrzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQtrUCTV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78B0606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQtrUCTV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BAF31F000CA;
	Tue, 24 Nov 2026 21:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795556610;
	bh=9c8fNmgaKkXaFYrHx845ld1QJpotCxsOYnaNrMwbAhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HQtrUCTVW+PxnsFWNoZ5OjHQsUEgwlvvaWHuKStmZbmk1lhTg2CTvDqjToDzaqxnW
	 ie8N4WcYYssQk5PB9YXWr/WuSZ+SNFTySHz49i0n757YLbtLGys2Fx4gx3kdaB7Xyi
	 1N07K1wrCReoFNfrD9GVbCoFSFCR9C4/rhzppaslB509g7Sic/SISVnNIuV1MJu5U6
	 jBWJE9+c9rSYOLoC+2YLFEYZ2v01Z+ArsPJDSFGYZKWMUp++nytM3t7reRSD+nE9PS
	 vw7uMNfqnsGZpBdH48xmn665b2/U1IAnoSQjXbNijCi2EhTk3XuW606TFAFG9C4fMN
	 n3TqcFmOV2FqQ==
Message-ID: <d774e2db-d584-49a3-9413-ff594ee33fa7@kernel.org>
Date: Tue, 24 Nov 2026 21:43:28 +0000
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
Subject: Re: [PATCH] slimbus: messaging: fix out-of-bounds write in
 slim_msg_response()
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>, gregkh@linuxfoundation.org
Cc: srini@kernel.org, zhouzongmin@kylinos.cn, linux-kernel@vger.kernel.org,
 trivial@kernel.org
References: <20261120085011.2080-1-zhangjiao2@cmss.chinamobile.com>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261120085011.2080-1-zhangjiao2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/20/26 8:50 AM, zhangjiao2 wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> slim_msg_response() copies the reply payload into the client receive
> buffer using the length reported by the controller, without checking it
> against the msg->num_bytes for which the buffer was sized.
> 
> The reply length originates from the message received on the bus (the
> RL field of the message header) and is therefore controlled by the
> remote SLIM device. A buggy or malicious remote, e.g. the firmware
> driving the Qualcomm NGD controller, can send a reply longer than the
Do you have a hardware that does show this behavior? or is this
hypothetical?

> requested number of bytes and slim_msg_response() then writes past the
> end of the client buffer. Client buffers are typically small, for
> example the single stack byte used by slim_readb(), so this can corrupt
> adjacent stack or heap memory.
> 
> Clamp the reply length to msg->num_bytes and report the protocol error
> so that the transaction still completes normally (freeing the TID and
> dropping the runtime PM vote) without overflowing the receive buffer.
> 
You said its a fix but I dont see any fixes tag or Stable.

--srini
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> ---
>  drivers/slimbus/messaging.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
> index ee127ef42046..b20864b59606 100644
> --- a/drivers/slimbus/messaging.c
> +++ b/drivers/slimbus/messaging.c
> @@ -41,6 +41,13 @@ void slim_msg_response(struct slim_controller *ctrl, u8 *reply, u8 tid, u8 len)
>  		return;
>  	}
>  
> +	if (len > msg->num_bytes) {
> +		dev_err(ctrl->dev,
> +			"Got response with invalid length:%d for TID:%d, expected:%d\n",
> +			len, tid, msg->num_bytes);
> +		len = msg->num_bytes;
> +	}
> +
>  	slim_free_txn_tid(ctrl, txn);
>  	memcpy(msg->rbuf, reply, len);
>  	if (txn->comp)

