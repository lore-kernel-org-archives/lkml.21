Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516139;
	b=snyjGCTZO+KFyGSqv3cApbk5I0JHtJJo370tLz/+4DcsJt7uQ6X1Yshp7d9LpiYTAK+Y
	 yIEmSP+MKqeZfLmmGHz0yio5dpkC2mIKnVzhxTB9wGrgjcimXBilUswEcDpRXEC6NwjQq
	 0kQtwDGFhDj3SOTGRGVkiHhtKe4e/DGoEmgUs3xw4gb7Uu/9H7LfqWO4WCmcaIxMAMri8
	 eehmemIVsYvz9L0xZWh1Hlnpn7WaunooiQpeZQaiNTDqPteNxgFEjsbWAKZ1Fuum+t+n/
	 7njJorSU28bMGZeU3p2YRpGkjjJiDgfzThhc9orWOyZLVRaXN2sLcSWIV73o/rk6ohQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516139;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YvVos/w2bO5cHdAxwgGtEk1DQ0vvOaudIAzQaAlwIIk=;
	b=Lw8aBACyY00UaWFIDpfkQAxCEr3rUM8WeffaHl9FkI14kSpxF4krthNbDoGifGKIokZa
	 vzQVkuX0k4LL/wVqgLmMd2SlJSDvfXyrvLqrrpYN2e9keRfmkqlM22uFqhEaMQoMpZ6aR
	 zhoUy1KW2LsqiE6pplcEMgFyryBWjPpaY0eI6OTmhnleL3i5d9rtQbc9aGNkJCdFC7bLz
	 Ej0hLGE0UkGbdv0faxvqR19pwYqn2jJFI/E18k2S7YiHoNFh+G3FIOb+gYQi/6EGzPt7K
	 MxN2mwhuyNw2yDYpZURUEaQrYdpJAHIRCN7bG6kVwngiEjbUFJPJVXbLxPhMNXkmwEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gEIbS5br;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YI2xnQ12;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179D3606A335
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 179D3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gEIbS5br;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YI2xnQ12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795516138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YvVos/w2bO5cHdAxwgGtEk1DQ0vvOaudIAzQaAlwIIk=;
	b=gEIbS5brK4L2GcXWb1XbC0+Map/xuITlPK/88cgE3KFXAsu8jFe1Q4a4gJTrSpZ8IAbipi
	wqpu0Ly63rD+jXvAsAm9hZuTjTHKa0KIr28nsxXwczQZQNUeRx66Kr1oHeiooUNc6pZABf
	wfIgwarmrA9+ouZimMFLRTf7UFpD3D4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-vkhRfKnBMzKoeHoB4sjgsw-1; Tue, 24 Nov 2026 10:28:54 +0000
X-MC-Unique: vkhRfKnBMzKoeHoB4sjgsw-1
X-Mimecast-MFC-AGG-ID: vkhRfKnBMzKoeHoB4sjgsw_1795516133
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-490c1867460so2633329f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795516133; x=1796120933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YvVos/w2bO5cHdAxwgGtEk1DQ0vvOaudIAzQaAlwIIk=;
        b=YI2xnQ12auOqt+7nCCBXb8APJLJPOGIevpGDrGSOfQPMA4zXIiZNYtu8tJkmV1j9GU
         4tavdjFfV9wckOv4540cxESkynrrdrzIMI5ShDWMZbi06jSiM7qx9wRobcuAIECAuYjv
         aHTBHc7um6S58scG9vhv03QLrENSGYWjtWj+6C8OmBvWQ7Aby7HqKKVstLoaauZFkmOG
         AyzIVZNp7OEmJP18HsEeG/B3kWmY6UHMgmeyyZhfqXkjUgQdl/7HeSnL0RIIgLCuaZ13
         WuGBqnP/BjAz3Aza7btOoc+IhNJo6d7WbIkBPhcACRaTdNio/E0ZQlxBo0jPQHj+Gj2C
         z7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516133; x=1796120933;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YvVos/w2bO5cHdAxwgGtEk1DQ0vvOaudIAzQaAlwIIk=;
        b=HBgusbIpVQryheaB0jAb1J599pSWG+mKzzElYZTRJjI2uDZ4mAIxYmfRxN0JRxmecj
         SRRotPiF22jikeWef8dTnfFMFocEjAJegBNGQF/qNXUS2sAjNK4QgJ5ZUTE0t8jHtzBr
         HS6wcHW2TCplncjLe9MDVytEOFzJRw2PniOHxSyxN3bnd6QfStfN77RXRtafS/42giMb
         uEmLb3FY2VoC09ptrv/Bt4tC4jfJ9/PPE+huLbHjrquta1V1JuN2VL1Vb6v42iWLmzD8
         A+dmk6vgwe3ty2l2NE+goiC1TlcZ4fzguLu4JEfPz6wt9sVXiohsWQEl3VgtwjUvfqXv
         qv0w==
X-Forwarded-Encrypted: i=1; AL+hErEQ27Kr2Jqn/zXpM+VpQvtjMisEqVlRj9QdhTINJ2qh5Lj1v0Ae/kK0U85tKNk+snJHtZeojKM11WsEeR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bOocnr+GzP8FEJoIDX/6z6PRvC1pEmXhHLrAAUeqOROjg1dpJ
	g8Zv1jwDty4M6AIhKTHcB2rAWyS2U3NsIoaD9/WUXOPRECLWKOiN6dZoe/ptth81UFlw46a74G6
	husMsKfZ+XA2rBsOPSkdgue6AAsoItX0ianplOuYGoXlTQlzfdNI7709rassr/gdx2g==
X-Gm-Gg: AZFdTZebsLgun085nvZf77OL5lEYj3WLo1OVD4IW/7HkLXBGXrjJNwPoFyJ9uRf+/eA
	RVhe67Bk+7Ih5N/3cw5iQMgbYqoOCJdiyFqZghELbCuozkX/m1VERX3asi4MvThC7jizYxkObHk
	4LacI+YjXOjL/XIvMFqS3f2cuGO54xh7l3B/5bPsQjNBYsPW8JF6o9VUW7jJb1UWH9axAIinfcC
	p3IoRwc+fV1uEzt4GGoFlettKVpr+IkMBiR9n1bNh6+tMbwKASf6Il6ZrOFMLeo0LWgTKYmJbpw
	aI2tAqNY/OX3cmkUMGDR5TjaefxcFv0nrM/+afjNdegzy4tf03+RJBiqaGogWTUcMUhy26Tj6FK
	sNItUUu/Mev9SOpsdoZR6VnxZjtjiMDnmRngD07nI/3sAdZKrth5oMPkopTyDZ0y4ASjdHPvPCS
	7i1OEuevyZHjrs3L5YsUwkSUVgvvPY63a11Hgu32NjcGuY
X-Received: by 2002:a05:6000:490f:b0:492:a72:9303 with SMTP id ffacd0b85a97d-4abb47b242fmr27035648f8f.22.1795516133352;
        Tue, 24 Nov 2026 02:28:53 -0800 (PST)
X-Received: by 2002:a05:6000:490f:b0:492:a72:9303 with SMTP id ffacd0b85a97d-4abb47b242fmr27035607f8f.22.1795516133023;
        Tue, 24 Nov 2026 02:28:53 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm27405743f8f.5.2026.11.24.02.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:28:52 -0800 (PST)
Message-ID: <ca4c7d17-681a-4d28-a4a4-eea6f123fd9d@redhat.com>
Date: Tue, 24 Nov 2026 11:28:51 +0100
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
Subject: Re: [pull-request] mlx5-next updates 2026-11-19
To: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: Chris Mi <cmi@nvidia.com>, Edward Srouji <edwards@nvidia.com>,
 Gal Pressman <gal@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 linux-rdma@vger.kernel.org, Mark Bloch <markb@mellanox.com>,
 Mark Bloch <mbloch@nvidia.com>, Michael Gur <michaelgur@nvidia.com>,
 Moshe Shemesh <moshe@nvidia.com>, Parav Pandit <parav@nvidia.com>,
 Patrisious Haddad <phaddad@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Shay Drori <shayd@nvidia.com>, Yishai Hadas <yishaih@mellanox.com>
References: <20261119121123.2211400-1-tariqt@nvidia.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119121123.2211400-1-tariqt@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 13:11, Tariq Toukan wrote:
> The following pull-request contains common mlx5 updates
> for your *net-next* tree.
> Please pull and let me know of any problem.
Next time please co-post the whole patches with the PR, so that the series
can go though clashiko.

I manually run my local instance on this PR, and it looks sane, but this is
really a one-off thing.

/P

