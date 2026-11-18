Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032766;
	b=ISyL39QT5d1VWAbNJwH7KP1DRPs8wRAkio1zF7T7emT2cDD8RwR9C0Nk+Kqs6aTkUtSi
	 vqdHohXZrWQw1dni2REhjO4rDSzUewVwhbaA04FUps5qkJ7ZJKxRXEdPpdHB7IIhce795
	 PayzZtbTQ8ypO3CVOSGi4VaxCu58HY97Q2YksehCU8yE+zMdozc0sKbZmdAjprU/UIlhw
	 oTbhxOFU55eNFpeg0N/RluYAKFDmSxRbuIsF8oVPr5SmDJ8bq8lP0DoPqQcPc1M8YrfxO
	 WWzCUH8FTjRoeCTHvBLnH/6z3OuiCNWEAD71p4TwCeyHf4yWwwPBjnL00xf471tJ7PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Pjuff7q7uzbEL6ANRmv3ID5+cImAFU4IO3TNfZpMezQ=;
	b=Bx1NUn8gd/mNwT1/1GIt5Z2AwuLLCnmX/Hfr09PpATSUEPp4jvcr9+YEMhSlO8vCAv9y
	 U9vvN+haJXa6opKFfM5e6otuLTu/Npl6WY3KgaIe737utLIt7DLjGOFaGQBNDKh6X4Nan
	 LMKOpDR/XTi4dgfRyJJzgxhbyM1OjItvNhMSVvMb+AWH8DYdMYgSU8pdn/MmHj76O23vF
	 +9Ir4g5+ONKOIqUC+JPgcBI78niwv9c9cU0ipKHNk+VydWJaVKmWHmmoM8+zXBUkQfXyd
	 530ZTwkJgqhphwZCh3grHB+bXObENeGlXUTlsvb5v5YK9N+BwRksNmBZAuwNPf56TKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YZ7d3lcY;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF87C606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF87C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YZ7d3lcY
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-490d838b425so767373fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795032765; x=1795637565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pjuff7q7uzbEL6ANRmv3ID5+cImAFU4IO3TNfZpMezQ=;
        b=YZ7d3lcY633MpPdzjWfeEyddVT+G02tld5QoTSdv291wxWB0jwFPK6qsBfYsuUz9cX
         kAkzP3LUouv2tijYjJr8sJHC4NjR5gdQsOpn7qWo+6lPhvfvcrw03ejYxDZEH4Qoaj1E
         RNiNTK0iXxczAY7HrtLO+bVjz6OOX+BM/PNjokwUt860VRPz84en7wkjjhhDbx3F9pX3
         w6Yh/fYPUTTL5naOyUHHAu1UBrc2k1NL2FrhfcmUIJPSRgHJznmsQZIZd3Buanai17Jp
         OgDO+LiHyBJp13h4BnLLXG1ojjUnUNoxNhdRWQw+8khp2DEx1JaEO95Dv4tx34KBKU0i
         Ym1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032765; x=1795637565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pjuff7q7uzbEL6ANRmv3ID5+cImAFU4IO3TNfZpMezQ=;
        b=H5nhGSvTBTg1zVAQKBjJqDzsShHYDs3CeLrbkMGZgBFrTOZh3hz2rnYUVKsfvlGHw3
         h+pbZRsV1+CnHae/bUWTiC9gvAXWFCITT6mK9M1z+dT9LQkboJKcHxuFDIRT8+Ti6VJy
         JZURLNk3giWYhvtQ2he/EeT2oUIYLTkeKWfLh6tPoYZbvCZEcFIBTw2Sv3c33igUydkQ
         JqGedoQp2evC4xGCOiIFh5INx9OdvQwYorPbvX94L24YoAndf4wFk6ZnZAxikXOeYfN8
         z8mf7tOyoGXFqVgCmBRELz0YSomX8c75hVffyVUNFaOyUh1dT0gcGpxypjkotNMhsgx6
         vvnw==
X-Forwarded-Encrypted: i=1; AL+hErFUiNc/XxIiAevyonhDMi0xAyfw2arB+mHPherIWpuYG6eO6qcAg8KWQ7l1cWM4bqGfyPhS6HT+AjMN5YY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s2p2SxFBQOuP+yj9K0IY7rQJHePeYoipfzY5s0IRkWGjelv7G
	bkW/a9SULdYbkuwU2gkWANnUM9jkPudzCF5pprVWAaTHV9euXH2i62nRIlbEGcHMZhWezldx1zo
	zN/87L+A=
X-Gm-Gg: AYBFou2a9jEygef8RuvKOU6fSYIHHvAmS1rQodp0aALFNRavUvVaZql0A2xtJrrrIB/
	DIdLw/l1O4zupuatCRwoxIybdPfe3OlBJ92inauKaBecqqjGnqaZPnVM7lsyeC2SecaXFlfaBFr
	FqBo2Ijx0dGkNvJPbwsnJQKh0k2wkzZ3EG6eg8GyHC6AHhZZ7exWyx2a6xfiQqcuLaI1SoeEezJ
	xcuFNjkU7e2OvWVv/5QiBNiO1DxbLVgoleYFxqEYV4AT+AzQPwkBM4wpIDSckLKdlOlMhXsJ5As
	hP05uMMuX5szKVsgj0S0DT6lwBnfaISbTQzhtsNWEAQs1Kni2pfR0IzFFN5NeqNubFVbYq6L1hX
	MOaOFbfP+CfCMQmfjAvuOZepQEU7R65vcXaaxke4Ite46ciHnyDA6+9H1oTyrynaPipkXoVsUBL
	SPko0/JcE2SIc1u4uW+gPgMAwJS3knzL0cKLLs+Ka5BFvx0noThWveCP3JU8r5MoqGaCnR77rW/
	zvahoete/KL7nVN789M2u6Cag8CrXSbcbwy6zPCYaiy51JBDt8gkGeORpVBjRNNdKaqv+b/g5IH
	+8Y9Z2/BEJXG18Ck/hT/cgckLScU4ehnxy39+8UcEthGzXEmZszaBERFdfssRWfJ0hjmQWKuxSB
	E6do1jiL6ZSMLaLqtCwTelLFiHNDMuTaKNud8vqMSH1mbTYY=
X-Received: by 2002:a05:6871:5826:b0:494:75ba:c6d2 with SMTP id 586e51a60fabf-4b75f1206c7mr3688243fac.13.1795032764761;
        Wed, 18 Nov 2026 12:12:44 -0800 (PST)
Received: from [192.168.0.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b74372cb6bsm2987383fac.4.2026.11.18.12.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:12:43 -0800 (PST)
Message-ID: <17a2244d-010e-425d-acc7-ce8601982a10@kernel.dk>
Date: Wed, 18 Nov 2026 13:12:42 -0700
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
Subject: Re: [PATCH] block: Fix NULL pointer dereference in
 blk_mq_complete_request_remote
To: "Srivatsa S. Bhat (Microsoft)" <srivatsa@csail.mit.edu>,
 Daniel Wagner <dwagner@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org
References: <20261119-fix-blk-mq-null-ptr-deref-v1-1-9bcbcfcfaff8@csail.mit.edu>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261119-fix-blk-mq-null-ptr-deref-v1-1-9bcbcfcfaff8@csail.mit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/18/26 12:28 PM, Srivatsa S. Bhat (Microsoft) wrote:
> Add NULL pointer validation in blk_mq_complete_request_remote() to
> prevent kernel crashes when block drivers pass freed request structures.

Please stop this nonsense.

-- 
Jens Axboe

