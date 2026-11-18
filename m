Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004509;
	b=oNNh1aeeK7Bqa/mca8U5A0jhqjGLbX6DX57RT+aZk6d6xlsK69JhRLNaPkArLnqR6v9s
	 WgDfbqGCH2U6BMbpUSuzOS2q4ItJOPz9KaoKEoTbSUNefgvbCAEOQgosMEkdY649/eNCN
	 6oSmTj0eHcTTWJCdCm+S+rOW8SojnuQAw9zMD/FUAFq1MmfdMIeIidViGuBNon7ZQEReb
	 wWx9bEkSsh4tEtJuOaSZbRH0rsguzuIsB2VYCYo3YpJ5MAqppDYNSB9/IarKvWfsh51a6
	 n5shSNlP97SJ2r5dtNIULEMZ+ZQaaeQLu6ugw/sV8z4yOgJdTJOhxjVtF3I7SkencdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004509;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=i7cQ0TqQjtgioJTFXdfvZ8oEUKYc3/mFBKIQJtrSBN4=;
	b=zfABNO+JeNRgpz14VA9xiQgN8ruK0L8QrBPz8WZHwQ327zu540WXq2BwxfY+rejh5Ocb
	 ta+FAKcnn0V9bMT8Dcy1g8CldyDrwXIpJVjuwoRJDg2zb+heMDWoEKlsglLKJUMVMzXpb
	 /jmx8uxemA99z2Es4kvCrf6pXv0QX1Ub4r9eOvFyxLNEgZG83r13AgTN6Os7Z/a/lAOtF
	 VxdhRU/K6jD+niA45RGuhcDIwhfSBogMSw8jo+OrPrWY8AIUQH2I2rN5LRTzDxg1FfiO2
	 juNBlnIjYsPfIi3++lBX3BRscsQ/0qpE6C9InsBhtscl5Gr55NZ5Mi9LoHKwi4lEhMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WERrGwEi;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BBA606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11BBA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WERrGwEi
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso441651a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004508; x=1795609308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i7cQ0TqQjtgioJTFXdfvZ8oEUKYc3/mFBKIQJtrSBN4=;
        b=FYhSS5DfdOeVCA6MvnyiW0dKbVjRQpaIKc9lmidebnufuG2LS6ip2R7LFrXeunXlux
         rIqKQBzvLp5gU6pEvwyd83MJtOTLlSqMEJDlTHZiPCGyP7v7xgd+38+Bp4S0mb5I3Wuc
         u+C8BBtlBmZq+RXx9sr7yStp6rcSIuvzNdu1FazMXEmdSlDucFR6XX2JB6aYVcCm6bQJ
         SPxwOLhf44UwcjgmyE5UShUmfTx/Yc3PMsv+SknDOjDHdwCRWGBdb+oYu6uqydHfr4E5
         g+pJ0waKNY01mbM+OwYbjBO/80a8aXnXbPOiTWlmk7OLqTcMc69PDSW6rByn48JIcY5n
         3IRA==
X-Forwarded-Encrypted: i=1; AL+hErGWHzk4eIhCxyiSrqIM5aWyMtD2w4tEmNef97BUKmrrXeRQGBCAxjDq9CG2tnTBlGp/t1qOZePUUhiiv4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X+mosep/XRFrOej4myuNj7aHPcE0cjOwevughHe/laQnqg2HS
	wsR7NSCh12cMuwjrqIMi1W610msERT4IW4q0G3DaclI9pLdz5Dc2yVP9yaQHVn+fvTlLX6NN2w1
	+WG3bptydEo8BF8cEArlBi1L5DuCsGp7hWvqpEYiHVG1bnNEhrA47oKPqrPVajpuI6lvZAE/b+Y
	aak9Ulfj7PlVF0b8UcZ4rpM6XxrH871tgH5lLwPZdoE6qveYSqaDZ7Nqb5SU1MHhnISCpFe2Zm2
	mDVtIH+gW25RTgpt/2a8udpxA==
X-Gm-Gg: AZFdTZe5roIXx4bTBkpchHeR5j2RG1mcSn+VVS+gPpkk8WQ7GJssHJmcXMLddJayZDx
	Kfa6RkJI7LG0bSf/D+4tlzy5GwrKeRhBvu6uTcNpTEHfAxpL2DOM5snre4F9qirZW0mkRjg2chI
	P0LImb+84MHwN19JenPtNBmAwGGr/HrzzDpr5Or7opivCHAv4WaKulnf0Ig1PwXjKRGRqpmNiDn
	lsdDTYj9/n3ZV/DYyRz3xVUoa3GxbVmL99V1A1iYy8xtND6gqtvLWvC+s3m6gk0fthkO+nYaCt/
	vEwXrPTiTqRlV0gIFAqjSQHwJ3X0ubyIz0QM+p4bUomOoLqfQU1KG/nMXlchfwRcDdEYpVVPBdh
	azTTrk6uj5NnCBT4PRfuFcilTbB9xOTX1L5YZCbsl1QebhaPMuOTl4ia16JjApJje7xhV2lz9QQ
	QkjEgXQ82zDToz9uU2AMdtC3iWM7mAdkCXFppjcvk=
X-Received: by 2002:a17:90b:384a:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3b3d079ffd2mr2059396a91.19.1795004508267;
        Wed, 18 Nov 2026 04:21:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abb84fe8sm4102081a91.2.2026.11.18.04.21.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:21:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso133349085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795004507; x=1795609307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7cQ0TqQjtgioJTFXdfvZ8oEUKYc3/mFBKIQJtrSBN4=;
        b=WERrGwEiUrfb0F1OTj5Z8wzeHIlVNZZ5TXM7wBqzymnR8WJ0OeHvchNgG2SBjbQIYV
         WwjfDE92TFJXGdx67ldf1ZQxqOpuGiQh/IHbhx1f1oM5l46higoPIf0O2t3BQGXQpW2W
         pUlhqRYGp/ZFE3g3PtsdIUn0EqUuaXS01jprE=
X-Forwarded-Encrypted: i=1; AL+hErFv49QOTycQ3elbRK2QAVe25IhSz3PHUcj3N0eUXmsU2Iz52X2NwTeeXvzGy4280oTnXCyO9/qqsUE+Zss=@vger.kernel.org
X-Received: by 2002:a05:620a:45a2:b0:949:7502:696 with SMTP id af79cd13be357-949996230bdmr468918585a.72.1795004507052;
        Wed, 18 Nov 2026 04:21:47 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:949:7502:696 with SMTP id af79cd13be357-949996230bdmr468913785a.72.1795004506453;
        Wed, 18 Nov 2026 04:21:46 -0800 (PST)
Received: from [10.176.2.72] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b457495sm168164685a.2.2026.11.18.04.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:21:45 -0800 (PST)
Message-ID: <0d8104b6-888f-475a-99e0-0275c12f7a76@broadcom.com>
Date: Wed, 18 Nov 2026 13:21:45 +0100
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
Subject: Re: [PATCH] wifi: brcmfmac: reload the firmware after a missing D3
 ACK
To: =?UTF-8?Q?Andr=C3=A9_Eikmeyer?= <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, Lukas Klizas <lukas@klizas.lt>,
 Yossef Osman <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
References: <20261104151616.70623-1-dev@deq.rocks>
 <20261116110839.4481-1-arend.vanspriel@broadcom.com>
 <b8ccdaca-ce91-44f9-925d-eb5ef6b78088@broadcom.com>
 <20261118125034.4d257b01@kait2en-mbp15-1>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261118125034.4d257b01@kait2en-mbp15-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 18/11/2026 12:50, André Eikmeyer wrote:
> On Tue, 17 Nov 2026 13:12:49 +0100
> Arend van Spriel <arend.vanspriel@broadcom.com> wrote:
> 
> Hi Arend,
> 
>> It is all you ;-) so you can probably confirm whether this is indeed
>> superseded by the series mentioned above. I marked it as such in
>> linux-wireless patchwork.
> 
> Yes, confirmed. Patches 3/5 and 4/5 of the T2 suspend series cover both
> parts of it.
> 
> The same goes for the older "wifi: brcmfmac: handle missing D3 ACK on
> BCM4377 T2 Macs" v2 [1]. With Michael's mailbox over the control ring
> the BCM4377 ACKs D3, so that workaround is not needed anymore and can
> be dropped as well.

Understood. Thanks for the confirmation.

Regards,
Arend
