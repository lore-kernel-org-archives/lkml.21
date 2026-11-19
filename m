Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076117;
	b=QnGfdGWWKNR5Ik/vec+fQVJ7tsvwGOxJ4qkKSxrfdAoM24WOOO8xM3bmZRwf4hF7/UOV
	 biFVJoAr4pnf9JUWMlvfYWZH+3p8wt78NtFxta0dzqLzzghfxeV3K0GveNmN7GjOxRNDV
	 LUVZU3d/ylAfl4yD9Gz2MLGL0BBcxlq7OuQZWL6vGltMaUjxJsh5A6mKu7KOwi0F7kqyz
	 bmv3VSYgGuBRBh8ZMpnfrcp+CKiKtnfND7S82sIC1eYnRJKNFl+SB5H/6rnCQEIVVUrTN
	 xIsxbG2vcQYJrXAT6EBdym9TflOQvy70ccwMGXlOvx6CXwEwsK6wmRr4UGpfDzCly1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=SbD58ugfokxPZmAa+sr28GhjcGo78uQBy/eh0bnkppE=;
	b=fUEhBip+1gf6YCS6UwGNlHl3iTtDH/kF7yulp2pggnye9/j4f08kTn+nswB8eE+K6bxt
	 cPmZ0JXIPbvHeFgfEFJATx5sTPGU1bmWT9G9f81xznwAV2KiQ8G9R8x0gp4wb/oRN24nC
	 7j/J9DCE1TjDoPuc3DB+krNTaNLtdzzzRvZKNtJC0h1AL1RfTHLKrYBGYOhIibliL2A1z
	 O/OuFX5l5w1VjgFel/OShBZuiShI5iKCK0N8EG4wkjdYvNROBz1CKE5shBNkwViGuMGvl
	 2Wruz+uWQZ54TR4Uq/45ROYgE9iHKWqGh9me/XPaWsVYeTupZumJujnZ4n/PCyB2VdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=PQDADLkm;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A0C60A6F64
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5A0C60A6F64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=PQDADLkm
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49355a50d11so140705f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1795076115; x=1795680915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SbD58ugfokxPZmAa+sr28GhjcGo78uQBy/eh0bnkppE=;
        b=PQDADLkmig1UB0qWSA/TIcTTyx7AJJGYESq4GRUMdjB/1kdiF0oN1HGPu0uelP8Geq
         xiyRIuSQzsvselPCmQy+aeRzgWjdmALrKfqv+U/+66B+kz19UrievEb71WpVFv/KGpop
         bDgk5rg8KztJ1MwBkWmrtKsOsYmpuhP93GAooPSrWLk876SJRpU5ntBkoq8Z63UFpm7n
         C0H6PF7eNDPfPBNkm3sPvT30yX9xJc3hsvoFar05aQstrEkfBXshjSlEBPGV2D1Jiv/L
         Z2zZaCErRkAECTHe9JUCpy+JZzEue+M24D5VZwwcPPnD+hP6EzpMcY3AGzMFe9MgXR3h
         CjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076115; x=1795680915;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SbD58ugfokxPZmAa+sr28GhjcGo78uQBy/eh0bnkppE=;
        b=eLFptU3s3xIcVyHhndHpxRNrGyoY/ullxa3Z2bZb8oQjuaV/u0+Xnkd1MexaRWSk4J
         wYa2mRYcnumR5+foOBwWqzUJysHbJbyuDkdmMq2vBMrbUaPlfZE4wDhclHlhMt+X1W9d
         mF++7x3fusVtnR2dW36GLWzGqKwVljmrIaIzlOwrR656f6lOhpye8Z7LxnUnGxBm44bh
         w9EuHHKuDZCuKLbdxNVaxkyW3ktLV9uGqr63C1P4m7RkV/vef5cAt/c61twMZqIy21Rh
         lIZPasWIzXJJx7SvkaRko9FXYrBCg5WmLCEKYgMClCv6f680XZ1gu2f3K5vkSjQDJpqB
         xkMA==
X-Forwarded-Encrypted: i=1; AL+hErF18u7ZdpugDzVgBaxP7nJF65QBKgXmxvSJECd6PqfeMuINgK1qFmHPhQYPvFiVcsHoAG0rYwi0HCe2EME=@vger.kernel.org
X-Gm-Message-State: APuU4Z8leIA1TT5XpPpk7jj/i/KorA4wMsHvpTMWvLEJKHcR/SoMdOlc
	W1kfi2jVkirLn3Z8cTiLswReqIG5r5Ek+VtF4lbxX08Fw0h7+mAq5yMcc5ap7mGrpp8=
X-Gm-Gg: AZFdTZelCACiWPf2xceZmPiKCxqHIyhMmlVOJFQpfGdt4/W2b4F4WSoASlpSfFajApR
	iatlwk83zvj8atVEXSeeIoxIaHzfqlNPEhFEiYJ55rUY1clayLaLmiyDb4PkMuj6sL6sum6A2Ex
	GTA0pVaRuCrNchy9HelNxzEDxwliZNOs2jYYGqIHzZO7d3WVtOC22UfmwtDrsSO4mqwAiwQVH0b
	XEdPFm6JsvX9CmwiwPonR3TAJx7k5N7b255eW5wNDn9fYRDFsbsKibJPGa+6gqJlR9ow41DI3PT
	/qIu09lskOMPvBLtCdGmjtQVXwwuW4vM9NhkvY5qds6Cm9LrrCowuHhkC0p/mOSbraCcXm8o4RZ
	MaKIHn3Hy4u2HtksHkgMqaZUB0P3gtG6HqOA+eZzkTmgJ9r4LfXSmM040vnYCJ/qW15rKbl9eMy
	QFPNyXlyzlW5un4ierLZbmn9fSDC0KMAN4jFkvI8HsREbCctGDSV1R60G9UEsMSdgDbBs1v4Vop
	1VQn3QcJTueg/XrpO73kvuAWBn37sPRCugJgNwctO9FoJHpO+cwIWQZEvhrZGZO3LYMYPY/0erY
	9MmNDKtUdt/fBHVBTjb3JRIqZri4GqfFM9nrDNPD2miT+RkY+vBA6P5IehExf8vO5JwI6q6GvXe
	Xfi5T/KKQcnGMqe9d0/6BGS5SHC8=
X-Received: by 2002:a5d:64c8:0:b0:48d:f4e6:7b2 with SMTP id ffacd0b85a97d-4a63aa7f7edmr11571422f8f.3.1795076115084;
        Thu, 19 Nov 2026 00:15:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100bf42sm8710432f8f.1.2026.11.19.00.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 00:15:14 -0800 (PST)
Message-ID: <5681e42c-f8f6-4993-a8f8-78be39776a86@6wind.com>
Date: Thu, 19 Nov 2026 09:15:13 +0100
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
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net v2] net: zero the tail of ha->addr when allocating
 address list entries
To: Henry Martin <bsdhenrymartin@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Yuyang Huang <sigefriedhyy@gmail.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Daniel Machon <daniel.machon@microchip.com>
References: <20261119040153.158372-1-bsdhenrymartin@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261119040153.158372-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 19/11/2026 à 05:01, Henry Martin a écrit :
> __hw_addr_create() allocates entries with kmalloc() and initializes only
> addr_len bytes of ha->addr.  The dump paths emit each entry using the
> current dev->addr_len, so an entry that was created with a smaller
> addr_len is dumped with uninitialized tail bytes.
> 
> dev->addr_len can grow after the entry was created: tun's TUNSETLINK
> changes a device from ARPHRD_NONE (addr_len 0) to ARPHRD_IP6GRE
> (addr_len 16).  On v7.4-rc3, with 64 entries armed on a down tun device
> and the link type then set to ARPHRD_IP6GRE, RTM_GETMULTICAST returned
> 16 bytes per entry of which 37 were non-zero and 21 started with a
> kernel heap pointer (e.g. 0xffff8188_04857ee0); /proc/net/dev_mcast
> exposed the same bytes.  This discloses stale heap contents to readers
> of those interfaces.
> 
> Allocate with kzalloc(), so the tail is always zeroed and a dump can
> only emit bytes that were written or zeroed at creation.  This also
> makes the explicit ha->sync_cnt = 0 initialization redundant.
> 
> Cc: stable@vger.kernel.org
> Fixes: a748ee242681 ("net: move address list functions to a separate file")
> Link: https://lists.openwall.net/linux-kernel/2026/09/10/320
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
