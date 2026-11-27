Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769889;
	b=U582K3pzPi8vDuHT4na5Fv9ChEJnhXqkalIAhUpH4kiktD3RyNxcdg5iomqoPAQMDavT
	 abh/A0xsRLdbsMnRb247bScvGjog2DolHf42Q/LoZEgxc/sJIS/Xo1kHxstL8FiRgaUto
	 bj0Y/lM3aWkF6rHzeHS72ivlb6/T/9ZmQugoIVu0IrNSXBxuS265W2IHFQM5TelpBSNk2
	 Blu3PmrPv1yBYoiLBO2HVOTE3X+yjqfghSAVDBIVMWxRJzCsENyhMjLdqAlB66cZUE0cS
	 SmrcyQAw81nPjf7niH1Nfuehp3QTxJp+gqWV1e0bwuQPSevmhbfIiLenY/ZYlT0Sl5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769889;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gqtKqYuhEKkVXP5KuUjOf9oJJFaxsoPI83OvUiPpv98=;
	b=a4WYpRYJZRVgNUsxN00Ojln3dpFXAYp9c+BJEVAnUBfOZpCM1VQlgNGuRf2hQ/c3Qseu
	 2YqoO3mKtHMisJ3tyL5rV34oKwbBB4HxZXqYUrR7n5iBbzubnRsFVq72w7HamS8SYq6AS
	 CE6ngKtaZHufSI0zvAUNTRb/kGU5GflYPKCQ6KN6fi5aWlYhQoC6luwZd6ZrFUROGve1r
	 6FGKvWROodROar0qIHEkruE8SeVqyG48XCXu3UOI65w4P4LXkgDuxKrEiU1wQPG+UcQiS
	 Hm1vV2XVl8x4+b//ljV3P9v4seuHaD6IE7flNryWpL1nF/TCYe8OgYM6v681+8V1Z6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=id1tQkOm;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="Z0zmo/Oo";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EF9606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30EF9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=id1tQkOm;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Z0zmo/Oo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795769888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqtKqYuhEKkVXP5KuUjOf9oJJFaxsoPI83OvUiPpv98=;
	b=id1tQkOmS9IYdwhsbkjThmM6c7LoJd/MT/cKBKixh+SBb3ssiMsI7XZKS5PUlZ6RmDcCkT
	cjBU6VAtx6twZNJlI+/Ygzi66+WxaWeIv4tcs2ftWGfjInJl8Hav+4WZ2VBF0sZ74q68y6
	IZOZnY7IRes82flFlOB+E5b0nfUl4HI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-gKI9-pSFPAygJAQZJ-S2ZQ-1; Fri, 27 Nov 2026 08:58:06 +0000
X-MC-Unique: gKI9-pSFPAygJAQZJ-S2ZQ-1
X-Mimecast-MFC-AGG-ID: gKI9-pSFPAygJAQZJ-S2ZQ_1795769885
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4925ef75fc4so4701536f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795769885; x=1796374685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqtKqYuhEKkVXP5KuUjOf9oJJFaxsoPI83OvUiPpv98=;
        b=Z0zmo/OoLAB7+wLuLfw59wbGqclB3cZBjktiiv+AImnEftSTS//Mk5OynPZ6lHx0Hf
         lvh2lMM9PiOLSR4FrchS7V/qeuxtjO+AbzKneCu0sEPSAFwjE5zh8b4KvSJDUxFpEoe8
         acZw2kJS7MCget3RniUg6dUYchLHcRB2zV+d4Gt2paJrgBs16sS4guDKXO6kLvPzW3Tl
         WGaDyjGbdsm9TZHRJ6PBJ7GLm7zm0mWWWzNkZgSqJGx1Co/7tZSdks23DAADz8OJhIHH
         Sf7Ycgc5cwL9yex0Kpeq1pimhRiYiIPuxYuut5G1y5MlZY2fHKcXN9GerYKXyM0Jbg78
         vM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769885; x=1796374685;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqtKqYuhEKkVXP5KuUjOf9oJJFaxsoPI83OvUiPpv98=;
        b=kh8nKi8hMGGVB3UnsxXT2/CaZHSPSuH9iEMVXCD5qd9hfNl1aL4RhChHpsXuc1ztRV
         2/Vz9nw0di4nwQiIfdkhsWjk7J3fEDH20GLy21aQbIi/8KPXhlwTJptMyTMgq/hNf9qo
         dcbToxOudjVyuBk/ZLPmaec/G88ICrxPjqfzdyUK74vzwIBEK/LRPTovZKheIL95DQCU
         zLjndrjMeIztQ6X0QL3kxuS1cYfHVcsKdaqdfr4N7rSkvCo8JYwb7JSnvK9K2MqTKeHp
         bkpaokxaR5CeYLgGfT1AbXJqbmtGWM6DKI9SDgInEk01hBnpgLOZR3E1Y+IeVF1dEfbu
         Sk6A==
X-Forwarded-Encrypted: i=1; AL+hErEF85sB4eHZ2agOzGMMnT+KmJtpJXo/sze9NtLXrQX+QKjkD4UZdl7JJ+GL3hpXxQBxgP9ksfuThY9Rm/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7d6KfmNAcx/noJH4JNxM4O/pZmkZlP98HndfRV8uNdSpaGZQx
	jtGDl5Yn3dR+GudiV1B9ci2uT3MYRsq6FK4ac6Adz+2IhOVLrXg2afFDMC0TAryh0t1/5A36rlk
	fjCHXof6+HiPrsoPyGwJqOZ1JHnXAnduhBXLVZ+NcQxH7/XkH0iRF5qs7MZf3MAGjuA==
X-Gm-Gg: AZFdTZdNDDepZ79JuvC5GZuOx6rihl2aEMzERlvTkMiwe4wFmeBXLK0UTK6qZ6pzOjR
	4k6XdMTd9FlLJ6/atLnb3K5rlYdSkeAqhFe4Kmwr8gOcQuc64UGG4zsF2WpZV2VfP8gBpDdkPBU
	feOyQOloKIlhJJYXi0t8OUo9KYhU6aacHvsu7/JtAyWZhSYmFeoo105mZ/9r/tlejch1naq5E54
	6FP/HI1r+X/XPCS2dUBrc1ZNdyjWrVFIGf+nnzUATjDezTXixm9PJoM5fRlTwTJyvgH5GuRsgBq
	GuhL/m+UFh6MMoPVvVT2aa7MXTN6iHX0cOXYdAlzObraAoPjcltnBw/7f47pQWqVLaqT6OKs+4Q
	oyt+Mrp2p/gLc0Rb8ZgZiLTao5taBwohDC68zpgGS+qAAZKiGtnx7o7kORYGs4DiJHz7JXbPAgF
	ohs9xqoEDoTf8omAgSZqScUDKVNCgDqs9Ma64XHu9WLrS2
X-Received: by 2002:a05:6000:4a10:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-4abb47b1bb6mr45714800f8f.43.1795769884943;
        Fri, 27 Nov 2026 00:58:04 -0800 (PST)
X-Received: by 2002:a05:6000:4a10:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-4abb47b1bb6mr45714754f8f.43.1795769884536;
        Fri, 27 Nov 2026 00:58:04 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm47550239f8f.11.2026.11.27.00.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:58:04 -0800 (PST)
Message-ID: <1536daff-bfb1-47fa-9f77-cefc1c32df37@redhat.com>
Date: Fri, 27 Nov 2026 09:58:02 +0100
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
Subject: Re: [PATCH net-next V3 1/5] net/mlx5: nodnic: Introduce the
 mlx5_nodnic driver
To: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: Carolina Jubran <cjubran@nvidia.com>, Gal Pressman <gal@nvidia.com>,
 open list <linux-kernel@vger.kernel.org>,
 Shahar Shitrit <shshitrit@nvidia.com>, Simon Horman <horms@kernel.org>
References: <20261126182448.707782-1-tariqt@nvidia.com>
 <20261126182448.707782-2-tariqt@nvidia.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261126182448.707782-2-tariqt@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 19:24, Tariq Toukan wrote:
> +struct mlx5_ifc_nodnic_clear_int_bits {
> +	u8 reserved_at_0[0x1f];
> +	u8 clear_int[0x1];

For some reason coccinelle is not happy here:

+/srv/nipa-builds-contest/testing/wt-cocci/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic_ifc.h:140:4-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

[...]> +struct mlx5_ifc_nodnic_gen_cfg_caps_bits  {
> +	u8 revision[0x8];
> +	u8 hardware_format[0x8];
> +	u8 support_receive_filter[0x1];
> +	u8 support_promisc_filter[0x1];
> +	u8 support_promisc_multicast[0x1];
> +	u8 support_protocol_filter[0x1];
> +	u8 reserved_at_13[0x1];
> +	u8 log_working_buffer_size[0x3];
> +	u8 log_pkey_table_size[0x4]; /* IB */
> +	u8 reserved_at_1a[0x3];
> +	u8 num_ports[0x1];

and here:

+/srv/nipa-builds-contest/testing/wt-cocci/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic_ifc.h:271:4-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Both look like false positive, but could you please have a look?

I removing the series from PW, we want clean CI output, otherwise
patch validation becomes more expensive.

Thanks,

Paolo
