Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515898;
	b=S31JFgw35fyRHDhM5fnAjBCQlhUHM6syD4YHYQx9IiasVqI8X+kP/bkCdYU5ptNWmNrC
	 LNP/nEtJkI09N0cKZ0Ui+y71EKluhjne1qpIn4EaUxaj2WeXUHZU80vf/ujFTVWuDoE7r
	 HPtPYVBHWbDl/gKYmcnIVECzMJHrSa6eYbGuoCDg7AQbywbmEfxQgf3odPQA+iou94fBj
	 EkREm+QzrJ1dfcgu+KZY1nSwcJIhsjmGQ2lfZp+yb1VCugtQp08vzn3iq7UR351Qi0uOI
	 rfSA6OZjhpBADhCyhgq8ddXMXzEv19tREbJgMPGoWUVJOu5LMkSkx8pTdHVJCKFTkOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515898;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=19SYUS/urZ0pN6WEr2EFT0U5X/oBT0AS1zyrFfZsqLM=;
	b=v1KgkOurRaVKJ1tuwQudaJQzg2OoXd0I4ZUM/6Hx8GD8NoRcbujuJdteqZqWsor+5m0t
	 m9gJTQjvNKv606LzNZB2KVjGuxbdrJhkkDrf6RrbVPIo3f2vcYOvvpXtisaDibBpWOvR9
	 wWEpid5ZSsMeOxVBsuKNsFyaHXv8n3SInctbgVddzAK67YCZTJ3mZ8+fxsf4ezgyxMVNE
	 4YfwBzO+Gehxe1kvuYOdynMDdErLTLJjFwhLiyTLuCtWbyUQgn8saLm7HDOnIDs7vbVhB
	 g7Gs4A2IasCNdkezb1kpULD1UOdy3mYvCe0l8tzUp0RUw0KmiuRhdXvc7q+AqwTyQ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ce6WQRtL;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fXvxJAxn;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF23F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF23F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ce6WQRtL;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fXvxJAxn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795515896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=19SYUS/urZ0pN6WEr2EFT0U5X/oBT0AS1zyrFfZsqLM=;
	b=ce6WQRtL/BS52cF5ocUHvmkj505KCyBQVBAd4cWwNGerGf6EtzImp+zPr7nsw0jlmpb1F3
	9zPxtccgktBxgEx/SC6GqpHLxWI2tAQVYSGHEF5m8y74s9ooK+71blmW4x4wmVxPGUJyAS
	fzn+onOg3spzvPQVmIJz9LnnNznACHA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-2P7xTMraNgyy1n1tEFe0xg-1; Tue, 24 Nov 2026 10:24:54 +0000
X-MC-Unique: 2P7xTMraNgyy1n1tEFe0xg-1
X-Mimecast-MFC-AGG-ID: 2P7xTMraNgyy1n1tEFe0xg_1795515894
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so42017295e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795515893; x=1796120693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19SYUS/urZ0pN6WEr2EFT0U5X/oBT0AS1zyrFfZsqLM=;
        b=fXvxJAxnjpJafLUq4apNnhmL9JJUoCebglg6scGnwXO21ZpDmwRTf9BQK36Y5IJFYF
         2EgNyKX8+wGQoVxgJmWfADFh/cSdo0ebzr0PlhYuc7eh3d2Vym4JG40WE9ArqWHN09c/
         koWbonJ4lTD+pE/vuchRpQLhZ3CiF2QUM97PKgc5mrShzsVbBYR5SGRk6L196IkEd4ol
         rH3YUZbb6Z3lNm2aWVPVwWUgv3ZOtGSaqrH0vnp/R1dUiCjNOXjaKPKSjmqg5nr5qqhT
         OiLmxUDx5bgIYodrVteUud3o4OaKeoD7Uf7q7NmASeDMLVUHIy2VSYerDIQBjeWWIOWd
         RLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515893; x=1796120693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19SYUS/urZ0pN6WEr2EFT0U5X/oBT0AS1zyrFfZsqLM=;
        b=q2wlzS29FsblBFmpQpA2aGGd+YS9xbIlRPZKeToCBmBb0fr+hNgiKnBdWfyU7BXoug
         nxQGSnWZl8JGdiWKob9GUxeqnYpsxnesZP/BOf5hWhAXwSyO3uOHFVPV50mX/9a9KdvX
         NE0vMdxtj++7zQUOnJr6mp+1Er3a6kY2Ak5AFY1y4EzoZ/qre+K8pFwlCJC/jovRyuCG
         uOaWv1DJ/71sNExxGXH/rfYnyS289hTjPuOcNzmByiJ96JrVStNXffXEA8/dMPU1e4DR
         eJ1dYdkDvKbVMdTgkuNTOGBFLWwH+9Xko5BNcKQuDzzk+Df1DYY3zifPey2VZfOTZqQi
         XJ2A==
X-Forwarded-Encrypted: i=1; AL+hErEm3Km8EjIUlQK4bubBhZfbAEnAZdvsfklI/zDpPuw8bycDUTECwAThkUqXE2ycuo0okbuJDmV7YsxubMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qvC022L152Dy6slPlP6WEkFGr1hZ3E+nGf0CDjcX4vWhvb6we
	Y4cX2uwRhAH1hncaMJO88tHgtjlxNolNaJr6z9kC7cKEcPaeiCKZEg+y1K2aiG64DC6RloZpP9O
	Lq8u1cQe97SPkd5hAvHE4WtkwyRL9vbAXh6+Qp31ufWfiAQ2RzTh2YG0vKYV6P37WZQ==
X-Gm-Gg: AZFdTZexUuJaYUUr+BeLrC/dnLqpU3jiX4q5kQwhT/ChWgXVCpJsHSZHRGts2fV0x3S
	TvJMQN4UnLYhKIz4/fgUychPQ38OdFSPoBgrskxZqNhSRCXyxmc5sbhkeS1RHgLLf7W8kLMgXdd
	7UT0M0NpnhI7z1YFsjQxTRYd0pD6CV2j2wOay8sMCm/fVsG7Sc2+rsoGVKmjVswko/jWHGRKGFa
	Rzu67BC9ZKecvqDfY/oyq59wmbXCkSNpUuNuC8e5PIaSyPy0jRvN77DDhHJPzLZ6WiKOHwqWJJC
	9vIDUZJuArdW64mkCN83ouyXQtDFq1TAkqL6dXluP1EjgxeJDj4rXYN9nR8ToOXmw0pNnV6Hx5W
	0v8sLNN7mzwRXDZyn2Z4sluvtvvN4zweffcfQiT1NKMX8RNa6tTlHaLeKV8njNXhkVc2iq7Ji/N
	l4XRP/WGkz2w5+ONEv8gU7qYwUReQngJTXmE+fIrK1ql2z
X-Received: by 2002:a05:600c:4f53:b0:4bb:68cc:7b94 with SMTP id 5b1f17b1804b1-4bb8616516cmr379707405e9.18.1795515893656;
        Tue, 24 Nov 2026 02:24:53 -0800 (PST)
X-Received: by 2002:a05:600c:4f53:b0:4bb:68cc:7b94 with SMTP id 5b1f17b1804b1-4bb8616516cmr379706855e9.18.1795515893225;
        Tue, 24 Nov 2026 02:24:53 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm27252394f8f.51.2026.11.24.02.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:24:52 -0800 (PST)
Message-ID: <0a4e96b5-e3b6-49d9-b630-e7ff77abeaff@redhat.com>
Date: Tue, 24 Nov 2026 11:24:51 +0100
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
Subject: Re: [PATCH net v2] gve: mark the flow rule cache out of sync when a
 rule update fails
To: Zhao Li <enderaoelyther@gmail.com>,
 Joshua Washington <joshwash@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Willem de Bruijn <willemb@google.com>, Jordan Rhee
 <jordanrhee@google.com>, Ankit Garg <nktgrg@google.com>,
 Ziwei Xiao <ziweixiao@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Tim Hostetler <thostet@google.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Matt Olson <maolson@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261119044537.57936-1-enderaoelyther@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119044537.57936-1-enderaoelyther@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 05:45, Zhao Li wrote:
> gve_adminq_configure_flow_rule() marks the flow rule cache out of sync
> only when the device accepts the command, although a failed add,
> delete or reset can leave the device state unknown.
> 
> gve_reset() sends the flow rule reset command from
> gve_teardown_control_plane_resources() and then frees and reallocates
> the cache buffers. If that command fails, the cache keeps its nonzero
> rule count and stays marked in sync, but its entries are now zeroed.
> gve_get_flow_rule_entry() then finds location 0 inside the cached range,
> since every zeroed entry has location 0, and reports an all-zero
> TCP/IPv4 rule that steers to queue 0, whatever the device holds at that
> location. Queries for other locations fall outside the cached range and
> read the rules from the device again.
> 
> Mark the cache out of sync whenever a flow rule command is attempted,
> so that the next query reads the rules from the device.
> 
> Found by an AI code review agent; not triggered. Compile-tested with W=1.
> 
> Fixes: 57718b60df9b ("gve: Add flow steering adminq commands")
> Suggested-by: Harshitha Ramamurthy <hramamurthy@google.com>
This is not 'net' material, applying to 'net-next'...

/P

