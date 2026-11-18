Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999125;
	b=cQp9JI5tUlaPIAvn3WpmKgf5MyNhhscpksekE4Pna7yZ3tKssQRD150KNIWILJvMFTmQ
	 Rl7bSCk99DKnLUBshum6ImepG+hXYLof0i7cGwkFpBIeRUvFrQ0FWE2bukkwpgeqNNF/J
	 MUD76+Gx8aEucOBRkJsRMiP7gtC2aSfDj6r4sYZp3TRj8FFmdZsR6LpUwBa6HeX4yFclZ
	 gpgpVQekBPh2K+6zdgGo+zBfDC4Q6TSIaHobXGbnE3pJ5h64paObuuD1wVLaoFYnwx7oH
	 pDkHDaBiLGUIlUENikJLPN2292Mw2LAGTtiGlCjdPoZ+K7sEFRORsvRRq8CEeIenUOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999125;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=FE7v7dHvmS75LoRvG3gK/6EpuUCCumSYtyu9zFwPn9E=;
	b=FdUFv0zGTchYhuVEI10B7lTgNzrWSOnfLRULlmgJIFNEhRfG8nAm9MLfve2H+SGtazR+
	 rRiFiWnMzfwpwkI7wj0fNbaXF9epDAo3M8o9sFsBj9/pZjkMLk5mK8mvOmyiej27yucfz
	 nmY1uKLiqZUdCkxHyH8i64h+AVOEvVHeAP+UfO5GoLRVAX8tEsGDsOPwh5hOTghQVu9TS
	 zYcvqc7s/U9urwCTFdgEdVPsEh/Av8S1vvplgR9Zs7BNKgowImC41xYpQpRCTe2tX5e2D
	 w3pymzYVHpG1QWfFVCp+h4oc11bBIejQS0lV0mh7ZBmelDJmlTYedoJtU0rNE38KeVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IqNDTQ05;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190D1606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 190D1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IqNDTQ05
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso347650a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:52:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999124; x=1795603924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FE7v7dHvmS75LoRvG3gK/6EpuUCCumSYtyu9zFwPn9E=;
        b=zPR3iB21eEIL7dv/2fmAX92HEuabZOS3HaksASjg0DcWax+2szrYQ7npHHaLJb1QpT
         dMGqTcZNj+pTo4frzndjsJou3Cl8GdqYyvMaKWOIw/WirUWxJjqojAWk8xavV1a6iAnV
         Mqem4NZZ9shbdLZ92TevU+Um0LPdg1Qr7HT1MoULMszbQH2B6heNBA/nbtehpq5T6yh0
         3xJgR3nkQ+P5ioUptNNYdPqC9sg4qpSUOYSRKv9aXBrbiYY0mCocCLHBu3sJppxF6v+B
         s4Xhut/K9WTyHBXWltgSxn1IHUGC5ALLok/URv2QbEzU5uj723+msCm9MF2J+dQsGIkE
         RneQ==
X-Forwarded-Encrypted: i=1; AL+hErEwf5LGGOWGwOZT0z/UtqJvpvK3wRiZx7ynL+/8ajdR5Zz2OLjmJ5RQ/wkvl1J2ulkjnpCZZ/fdK+R7AUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dHE/mTUB+93Knnuvp+0pmefW9xwjYZvaI9t6hHW9KspqPg9ls
	hymoGF9+CIUMnyR9fu2mXu2cv86chffRDwLrV6aHdphbSt+Gp05d9DEKIHwH5kkqeWi8b8XUMvh
	Kx7TM3nHn067pdQOxAO31U9xq4vaiC0Sqk9euYzNNQR0bHUHtg7kk2BkOHxLsoWH2R0+Q58Q9gq
	+yH+q7/RirhoJtoE5uhPfNcOl6z+mFwQ7ofOqfUiM63Utq9H6EatwAE7etzpwXKmLaJkwMCH/hw
	KssiNBQAy6vvRsBHZfEjgD6oQ==
X-Gm-Gg: AZFdTZdhwhR5ADZ1ESetieHEKIgR/LF1Ge7jgIgkT5j6p/ylDmwzMQ4+QVi+lNTyxXo
	UFdHTYQFHgImZMv4hK/saXd4XZvCJVl+EBTRBeMqdbPGm0VkYK+chJoSWOAv0MNTKCb0MPSmeRD
	tPoqo5OD5Cove7sV8YQntdZm1wlgot+aRhD1OA9WixWRGh+xroJhzhr/y+n4D0qGCpgaf4/NcZI
	HBCHFDG6MdX/NiE1mKrAjfZDaVonu64njetTE443+3R8SrzhBwMhNivRdE15p2EH541ssxvty00
	YVnj/+AfEIoMF1ISfV8S6D5v8fJkJTX7/YRIjhzA78g02GwkMo0jOrrt9QRJZvauowAEt9bf4+1
	2mxplpAlRz6/gIqsCrmOuOklfOAbsV9mL0AvFMS+UZ4m+vLUl5RSS+hlXYTRBCD8tRhcM3+tRIv
	+Z9Kbfk0337rSe75+P20Y16DEasmSq/0D3+beSZ3g=
X-Received: by 2002:a17:90b:4c90:b0:3b3:c18f:d8e3 with SMTP id 98e67ed59e1d1-3b3d07a2117mr2028357a91.20.1794999124232;
        Wed, 18 Nov 2026 02:52:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d1423d6asm1715370a91.4.2026.11.18.02.52.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:52:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-542fc61841eso15024201cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794999123; x=1795603923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FE7v7dHvmS75LoRvG3gK/6EpuUCCumSYtyu9zFwPn9E=;
        b=IqNDTQ05FJIptEe9YxBZgFuRv5PC+iqEKRyGoZsSOEgEaauyQ/TS84C9wCaPX98Lc7
         I6l7hqEbu9rQKC/9eTln/pva6P/49+yIiCdUKGAirt1C8bdrQoaXC+f2r2DCDgmEk6DB
         Alk58Pm5ImE1jnT5kc7DmNuGnvAsQoRqOYKBc=
X-Forwarded-Encrypted: i=1; AL+hErEZPyOwkl0OsJu64Vtn+8i+BzB0QfMInDSwKmsll5R4uslGmB08OeQR1wy5pqpo4r6nUIPNk3NRXj+PP7Q=@vger.kernel.org
X-Received: by 2002:a05:622a:5b8c:b0:536:5004:6347 with SMTP id d75a77b69052e-55d5a57e275mr32115761cf.25.1794999122904;
        Wed, 18 Nov 2026 02:52:02 -0800 (PST)
X-Received: by 2002:a05:622a:5b8c:b0:536:5004:6347 with SMTP id d75a77b69052e-55d5a57e275mr32115451cf.25.1794999122352;
        Wed, 18 Nov 2026 02:52:02 -0800 (PST)
Received: from [10.176.2.72] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d5907bb80sm19852041cf.17.2026.11.18.02.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:52:01 -0800 (PST)
Message-ID: <84585c89-9f57-42ce-8127-6a4b2da205c6@broadcom.com>
Date: Wed, 18 Nov 2026 11:52:01 +0100
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
Subject: Re: [PATCH 0/7] wifi: brcmfmac: AWDL for AirDrop on Apple T2 Macs
To: Aditya Garg <gargaditya08@live.com>, Andre Eikmeyer <dev@deq.rocks>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>
References: <20261104151547.70333-1-dev@deq.rocks>
 <c93fa1b2-9d05-4536-9025-6c4d1e6e6b5f@broadcom.com>
 <PN2PPFCAA8F915813E84B62E1B2B919F11BB8712@PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <PN2PPFCAA8F915813E84B62E1B2B919F11BB8712@PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/11/2026 15:28, Aditya Garg wrote:
> Hi Arend
> 
>> I really have no idea how to deal with this series. AWDL is not part of the IEEE 802.11 so I can imagine the kernel wireless subsystem does not care to support this. From driver perspective I am not keen on supporting this upstream either. My limited understanding of AWDL was that it was Apple's variant of TDLS (802.11z).
>>
>> So what does AWDL provide to user-space and could the same be accomplished by TDLS? From the explanation above it seems AWDL provides more knobs to user-space, but not sure whether the awdl%d interface is merely a control interface or actually passing data through it (patch 5 implies it does). If my memory does not fail me then adding vendor commands is generally pushed back.
>>
>> Regards,
>> Arend
> 
> There has been a lot of Apple specific code in the kernel, be it HID, DRM, EFI etc. So why not a small bit of code in brcmfmac. We have never faced complaints from those maintainers in getting code upstreamed which is different from the standards, but is needed for the hardware to work. While the concern of unable the understand the code is valid, I believe the author can be questioned to clear doubts before upstreaming. Getting code rejected just because of inability to maintain is heartbreaking when people work hard to make something good. Also the patches are just for Apple Macs, and not for supporting AirDrop on random hardware, so it shouldn't be that difficult to maintain.

You are reading stuff between the lines that are not there. My concern 
was mostly related to the new vendor commands. The vendor commands are 
out of favor as it was used to avoid defining an generic nl80211 command 
and thus avoid true collaboration in building a device independent 
wireless subsystem. In brcmfmac we currently have one vendor command 
which allows user-space to interact directly with firmware for debugging 
purposes.

Also AWDL support is not about making the hardware work. It is a 
software feature providing the transport layer for AirDrop (and 
apparently t2-drop). I would say the same experience could be provided 
with another transport layer, eg. by using NAN or P2P. I get that 
downstream users are happy with the AirDrop-like experience, but that 
does not make it a must-have in upstream linux.

Regards,
Arend
