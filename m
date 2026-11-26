Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692739;
	b=DVXbT4o6wmBGPG5oyThxGCPmzO47B2xv/7CdVwmLB6ifjVSkAPVbTxWqKI8KRMYdoMn5
	 YEuAv9lx7YGxcd08uiSv5szTjtSnaU9CNwsNPKylQqFFHcpmtO3diytHLIbsZC2xkaeJq
	 CgEwGyw412XCKPQjx1R33cuD8hOJawegvvwhhP7vrI6YA5xh68ZrZrSuC0g2zyB5XN7yh
	 p3ThYO1OplqqK4wO58ZhWHzlXQPl75MvoRpdOq5teAfm7uz5yIfT/eYtvYg60YL4VN567
	 lRjjZqJ+BXEc3UwJ51YNsY+jSKxpriUUFmhTBM4yaUmtbySUt7WWaB60UrIqUAAdoTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692739;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eZHk0lUewvFPiZ+U/CMb2apduCb+QafvCAoyz+WUt1I=;
	b=H9+JA2prvjcTlXT+NhufYO/bqD8WXhziVX8R91RZ8yFijz9OcsV/xlook+RqxQQQKJbX
	 o+Una2yE44PvE3OhCG4Bm2GgB4/nbtSzN55haeqaebQUVsuZkSIt4XLn4D2smkMpYaW/B
	 DTwmymKqzOCXwqTS1Z5aogSyBuF6dxaPAcgXiQYswm+4CF1k3k1VkumisdTb7tm01Lupy
	 R7qWI/MAJF4aJEtFFzHDQRqpe4hiZ71wU9EceXk7FV8gdLOoTwN0PIzZt0Gptr3f2Vw+r
	 mOXRB4fvfFJxDLkATBeCO5LWcJbnPBUroNBf+Wxpjqu68NW4t46H0IXjZYkTwe6LdsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XTtbtpV1;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="A/2hT5d9";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7D2606A68D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC7D2606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XTtbtpV1;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=A/2hT5d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795692737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZHk0lUewvFPiZ+U/CMb2apduCb+QafvCAoyz+WUt1I=;
	b=XTtbtpV1AeV7exlpc4R6znWMAbNguXi/1BmVpB/f37GBtkAxGS60Fcyz2SEvmMBtnDcS//
	FuJcJoB+V/+0euKn1nYa+OmuTuSjqp2+bNaGTJQk9CEI73fO2TW6kIb23FtrkxGEvBwYZg
	MJPqx6QFSJLrxFURgOycEup0BFTvZtQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-SoHd0X5TPHW_m2pYrKnu2g-1; Thu, 26 Nov 2026 11:32:15 +0000
X-MC-Unique: SoHd0X5TPHW_m2pYrKnu2g-1
X-Mimecast-MFC-AGG-ID: SoHd0X5TPHW_m2pYrKnu2g_1795692735
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a647e776b4so5280118f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795692735; x=1796297535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZHk0lUewvFPiZ+U/CMb2apduCb+QafvCAoyz+WUt1I=;
        b=A/2hT5d971fEEgcxRU8UciKIPLvu2F38OKKOaR7oU4K+cWGmsn+g25d7hz8++QRdAv
         Y2cUsvPNI3zcqwLm9vGTdueFRvWAC2uA3ljdb8tEWZqchCL6kBaSYoSvdXmRfdYZyO5B
         B5hDP4A1VgDR2x/bVBO0Uou52LPba90yg7c08tDOBlHvYGpa3Un365wQ2RgnFHNTcBb/
         AMvgQTDf18h74SSt2BierG2brTy5amSOQ0GSGnvFTnQ4reptuU+s2x3OsdLDyosjABT3
         dLKdXuKJefDCRBF8G7Os8o7qGKKff9uSSbP7hceJtHCwTJdwijfFuBbXkiXAaNJa9x0V
         MEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692735; x=1796297535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZHk0lUewvFPiZ+U/CMb2apduCb+QafvCAoyz+WUt1I=;
        b=toZTNeGJgc0Kiotb8nNT5pbR/dvjsiOA6BxxBbatNehN0YV+VJ4Nyg8+XgQDVRdc0H
         09aCp0IWXsMYHAA4MPLZ3FvqDdVo3cID05uskVXY8lwXX5WAPq3iUpXL74U84+S9CxpF
         AkzMN7dRQDX5maR8kAOT4CHgI3AcSdo1BpoHIftUCebwYeHikSa5pYaYwbBlgwP4LDNR
         Q37PRVM5oYf3YSv40R/TXrFP4IF/D+nyMuJugvUo0kxxxku4ft1vTMDFIGTcq3K2W3YE
         J1OEPT8FA7WtNXgRy+AVrXPo6lppy7N4eTifxUJGtUtCiJr0S48R6XlS4P5Vwlo1ZJVg
         nMXg==
X-Forwarded-Encrypted: i=1; AL+hErGJ63ZwgE0G9ouH/EHEkdo3Iik5bOBaZleOLpWOuCqRebybzmfCaCZVugb4O9ejFjnnswVhP34SQk4ykRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bWydbuhkHg+p5hkovFAxtQiRUC31KE6FIvKE8g/PXiIdwVwBX
	y33RqNGWBiKUxwYHnTaBs0ncavmKMMYiRteWUdRQAgh4jJ964239CdUvCygt4SaJoLdj2eZGfJP
	jZzMDSdlAfgrwAEjOak6IlmHVl8I+eR+USaxRAFsFi9/bZaULqHnfJMCBO+pRcLG3ww==
X-Gm-Gg: AZFdTZc4nvfaKb2l4o6nCe8qUrUDNtDCicpDS+aHc9Xc+RhGXrp9rB54ViaXrucuXL2
	A5L3FyK5ZBHwlD0S+UBApKY71e3YI3+6tOz0VVMNf6F5aFZUZ6iWFfVn0BNTBp0mjkdHR/kIA0V
	wgi6w3+Q7D26HHcWhWtrJMzjmuMZE2EQ3QD/Nf+DqfWBa8fSmIkdRo/2d+DY+J6Fqi+ONtL93CB
	PCPfgU6RhLXTTX5bQ/QLos5/a5qCXw7behD4DY/lHTS6G2ae+21CINZg0iWFiKOs7T6LkM8M8Cr
	bXwje47/ZMgbtWQhQSbMyJNXkbpMohtD2i8a4Lk17qIvSyQIlp4kMt8uBN6qVMcs8lvvH3wP3Ik
	4f5FCx1JaCp7LdUz3K+YU5WuJlgvvKdqDg97t3We1OITRxnluFR2+r97M5zGDrdzEOJ3qvU+gjv
	uJlQhfamPrz5fglJLA7jMFdJDwx193DK8+juOKIkd8NhuL
X-Received: by 2002:a5d:5888:0:b0:48c:4a62:9af7 with SMTP id ffacd0b85a97d-4abb70d6148mr36056421f8f.28.1795692734681;
        Thu, 26 Nov 2026 03:32:14 -0800 (PST)
X-Received: by 2002:a5d:5888:0:b0:48c:4a62:9af7 with SMTP id ffacd0b85a97d-4abb70d6148mr36056360f8f.28.1795692734155;
        Thu, 26 Nov 2026 03:32:14 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm38692194f8f.56.2026.11.26.03.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:32:13 -0800 (PST)
Message-ID: <5c2785c2-d041-4a8d-bf1b-4c2eab47b888@redhat.com>
Date: Thu, 26 Nov 2026 12:32:11 +0100
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
Subject: Re: [PATCH net v5 06/14] net: pse-pd: check the PI state under the
 lock when setting a power limit
To: Carlo Szelinsky <github@szelinsky.de>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: netdev-bot+sashiko@kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Kyle Swenson <kyle.swenson@est.tech>, Ross Cawston <ross@r-sc.ca>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <c84543f7-b824-4da8-9f8a-8e15d8f89140@bootlin.com>
 <20261120100851.2377899-1-github@szelinsky.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261120100851.2377899-1-github@szelinsky.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 11:08, Carlo Szelinsky wrote:
> On Fri, 20 Nov 2026 10:32:01 +0100, Kory Maincent wrote:
>> You have my R-by on all the series so we can only wait for a net
>> maintainer to take it. Jakub, Paolo, would it be possible to take it?
> 
> Thanks Kory for the quick reply, I appreciate it! I am looking forward
> to Jakub's and Paolo's feedback.
The series LGTM, but is quite big and AFAICS fixes issues mostly
present from the beginning and affecting the device initialization
/tear-down.

At this point of the cycle the above does not qualify anymore as 'net'
material. I'm applying this to net-next.

/P

