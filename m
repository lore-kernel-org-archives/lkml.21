Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421135;
	b=DLG6ICZdk1fMQhenuhATZxFEG30cVngpO0DC0okujYHCnDiL76FoPLlrKv1K1T8/qoQX
	 XVBOb7X0ponTIU73A63cVpYYbEpCInayLF/CGYD4CbqYHCOuUp1CnQjAgZONxwUKmkczD
	 iAX1VQalwa+j9qM/XJDa6Y1mIT/ofAYBuuvbwejxwNzDl4/1yjElptzjQl5ZCnPOzFf10
	 S/QpS+P5H5Crdf2V0TQEWUbvUMtE/lWWLBAOzFKEa7zznx7eISi6glP+JdhM3ShTHDYun
	 MjDwuX4NgUk5LgWfqX8f3Zy4IO2R5CEU4msuJKcgOo+XjN6a2DBvKgf4n1uBoyHpCeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Pu4yypJl6coCX7FrhDOYrF2bQ4S6oHs6DmVHvAaSKII=;
	b=yEtUI3imgyCADZwV9UJaunV4Ji8/b6UBIqZUmqWN2G7doHGldKwWUuQs9bOao7UMCut6
	 28HyzxmOTBuUdCC+FsQhFbSsAFgchd6DPJSUrK+a+3aop3c6Vt+lKVXOOW3FhfSlqNQ37
	 hA4BbkPTaAJP1VXRrUI0WhyMdktsRSVkfKAzF8E4KWImV6WV7x353r8OFc3vRk7M6w0o2
	 EqLrfEs+HR9fXjTAq6EG2JJ0OWsqkcg7m2zbVFsmZTZ6dgj/9EzA5D+ighjlDCMu+kK7J
	 dSMAt0ftkO3LY/NP0KZkPNbGx1FtoYPTKCukyqA+5FYtf2TIUaVaitLXQU6dvxDovOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J8lnH6T/";
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6272560A2603
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6272560A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8lnH6T/
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f05bc71e01so10498085ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795421135; x=1796025935; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pu4yypJl6coCX7FrhDOYrF2bQ4S6oHs6DmVHvAaSKII=;
        b=J8lnH6T/iPoKZQTYPXS+7m92CxkIDbF3kbq1rFBp1sMhB+DMCya9n1m+zS7AdtfcU8
         +4ugcIKOF16Wzs71XYDG99Xl3+AiP9ozh9H8h3jvdmFsZ37VqF310KOgGX9K/QeMEZF6
         1b3jD58aotCBiUfOUFG1A6l6S3GdpSAE3lF0FwfAXMbJDp4PUPvzDuIYytcpU+thySZt
         HayFkqAIe8rgdVssZ95SPVMkX1RGdL7K7shqWxIRxT6stBQLiFPy7vSe4n2qLCSgRTdl
         4nDAqz/tc6Dp9/0KtDEFP8nkQ12gpUwcxYZPICf6dvVXrOfMFHup3YqfJlyG6mGPrfnW
         NEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421135; x=1796025935;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pu4yypJl6coCX7FrhDOYrF2bQ4S6oHs6DmVHvAaSKII=;
        b=syyyEcrK3aDtaY5NBVT8yu2BQSvNh/AZrzrBKlI34HDcmWlE+dEh6PMcplVZ0wXisk
         J62If06y+y9kqb8gjrL9+h07oi1HxBxsk/BqMnNgfDc/aDySe0luKrnPzXrPUSNRubxI
         50E5ehZVkUTd3EBrTVYgRQN6ZXTTIWDL7MuoV/RloTbQzYSOxF7i9OuAvHUCBy7Bevg7
         5PDuxPbUEUqN2RtDV1nbdMqnxsqJ0jwpTh4/8bocI2ALZWCMbaKVymEEAyPWFLucy14Z
         C3y0BUxjjNHFVldELNxyUQxbmong8eVbAeh6ecWyz4fHfowu6/wKHtLWi9dUu5iKWUrq
         TJ0w==
X-Forwarded-Encrypted: i=1; AL+hErFh3dVwhvXvqyW/oOBzTw1mEj1Onv7NvgIK9H4S3QiCSc4tTK+4N+8D6zSyQSjyPPFfdlyY7he2iN/dOu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eGkfZwian9Dho6X3Z1nBjX++eXc7NvFzc5SJXt5J0iTTizHGR
	4SAaudbEnT717mgk3k0sCGRUND+pq36hJ6N7Zh38gnWKPJjOq/Mv9udG
X-Gm-Gg: AZFdTZca9WV65H/n17GUpbqAl4szXfO6GCJ29uNrFW1k/EcJH7pYv6fFaXCRlr6qg8y
	Dg1Bf/PcwGs/qsRZgkXKMAaqvhJJ/Q6hqXQACcfKNjIp/4JM3Hwy7xwM9e6rIMORkiodcCNlota
	DbmdGgDdHTDuL8GCOBrBbbV8vkzxWgHUE6xXOh6ihfOvOjf5L3Skqd52+FO5JSrTxj5Cthu7cfC
	BkWMKfKMQIe9Gb+UY/Im9DaAwETw8fBcg6prWUiRDkmNPumsIIKwi/fH7+NDK6BQUREmcKAlPQK
	xYEh9Vg5fxMdl8GF5ku/Em+6s1ntYMZx/iV/1DuC8TcCA4FX810aku6WEbks+71sXV40OenI0kA
	ROYMGNMab83ahUalnSeDDC1IVvDEmspO7/K/NBsKqbmrlSKLwCJKXg9BmV5lASaeBYloGmCzlDH
	4lI/8ut1X70WZ13h8CWD2dIrw/PcC46HS/e7Ctnl2JDOj/TJiWzpkhlHV8FtSGL4rL2yREN5Mqx
	a7tQzJ2V8NFfd1Qvar0fswaUBKRNWVCarW36+eh6fyHkOxXozQI7i5vm4YKBXz7Y8BVhuc=
X-Received: by 2002:a17:903:2b0f:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2f03ef3d695mr105076155ad.1.1795421134729;
        Mon, 23 Nov 2026 00:05:34 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84425sm49848635ad.6.2026.11.23.00.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:05:33 -0800 (PST)
Date: Mon, 23 Nov 2026 00:05:33 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Xin Long <lucien.xin@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jun Yang <junvyyang@tencent.com>, linux-sctp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] sctp: auth: NULL asoc->shkey after a failed
 SCTP_CMD_ASSOC_SHKEY makes close() oops
In-Reply-To: <179540440300.3135.8565987128928534228@kernel.org>
References: <179505710266.3511678.14017674052424733262@gmail.com>
 <179540440300.3135.8565987128928534228@kernel.org>
Message-ID: <179542086425.3214459.13730708805653555091@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 23 Nov 2026 03:26:43 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: High]
> Is this check enough to cover the keyless state?

No. As Xin suggested, v2 and v3 replace this approach: when processing
the INIT-ACK or setting up the association key fails,
sctp_sf_do_5_1C_ack() now fails the association with
SCTP_CMD_INIT_FAILED, so no keyless AUTH-capable association is left:
https://lore.kernel.org/netdev/179539544818.3016044.13738712075053349592@gmail.com/

The I-DATA key selection in sctp_datamsg_from_user() is a separate
issue; we will look at it.

Kyuwon Cho

pw-bot: cr
