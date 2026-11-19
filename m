Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094215;
	b=wpuYtEgh6VX7Ubd56Nhn8KFvNtAh43kDJ2lz+cUURcp4v91EBx8tNyNUxMRhSC4moKKN
	 zdlKnj9MxI6jPtlf/+7kf+uhlbibPMWTzILwN/4W4P4C/b6mbJ1BeuUc2OUsnpNv6JVmw
	 KlsFT8z2wKdu0GQl+lejrZV2AiWtuQI12B60YsDGwANcWx96a0Ar7QhSfg4o1BOtl31VM
	 VptlQ6Yl+e7CMWqmSyURRrDWvQFGtqrngGwBhh9ppfmz9HRDUT/lIN6BCaUm4NVkGaHoz
	 nHIGt2cvdT71Vklq/QQ3Jh53blZXylDlzXx9CX7i9pzj7ysub2AAqOlrKikNTewAFPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xp16DMasSnS+RYN1dXhyuGf4ecNuv1+Asdv6vIA9BOw=;
	b=SPi4qunQW/TsZJ8aajIbGr54FfUKKEm/6RTSEuPzQnhfy44qlkivBAK+Fr4ZRBNrfG8h
	 kPn1VqEy1I/rxXpV/QXvdpw2ptnTaByxDjASU1Jh5hjno0Hvmz+4WSW10OKv7462fEHrx
	 5ghfW0BqXXap+cC8Ne1Vee+XaQGN3LOXSL5zYAMRMbEEaOC7a+wyMrez9JW9GF/mWGiME
	 nLdmsZFszjxtmu2eQ0HHTk2vNhrvSj4Y4Fp8OkI0yOsKT7sjCdNpQDi2McfIfaQsmDuGJ
	 dFzNCdKfRILXaMm4CIyGTNxA07ENGvgL4eIdLW5KuGnB17ksQ4uN95/+MMYqXyhU5Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h0OUjn+z;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B46606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B46606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h0OUjn+z
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso1423254f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795094213; x=1795699013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xp16DMasSnS+RYN1dXhyuGf4ecNuv1+Asdv6vIA9BOw=;
        b=h0OUjn+zhoDQPLy2QjFZvhuAA08t9e8id7vx9JZ+zpe2vEFuypuEyoi94Jek6405hm
         5g51OnaBKIbXOhEk6PIfjn0Aku/Uxq0v3gHIIq3R4x60BQsGATBy5iUz/58T9HiPmzAC
         KTrvdGwlm5/cMZg7afeYb/Df9jvLwyqZDf3en3aARrYduyyj6mWZsJW5bcYpaah++KZN
         q6d/evb1D+38OdViKhHRv5BeMYmV1elUtdPDjmJDgxv8WlfvAcRGQir8EEZHwGgnPYo8
         cExUI7pdoF7+y49RGmh+2EBw/zxTWiY70V/x5h4kPLw2E9kTfQwoBZL25dhJhYFq/Wmr
         1vQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094213; x=1795699013;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xp16DMasSnS+RYN1dXhyuGf4ecNuv1+Asdv6vIA9BOw=;
        b=YxaakSvUn7a8IbVZO9xaUi3FGeSqxgN+ps0EXloiE3A70stLBM6R9DPo0vu5syWJvh
         bLEifSstQftTAtdI/gLG5VswNNFRG5Muk9NtXMO9fSZtWiXeYoWMDmpd31GUPCjTLK4T
         o+UiN5D2TFrRN0Is+Erj1GSWfunO1Uru9ACA/Dsst+tVwSOQHVVAFXAl+gn5ozyOM3f8
         /Lp63QuHXEmv7EmIHw2zGVkAKHcFYr4c5uxwzxBOeOLoh6Ng8Grbdx9kNVLGuwHPu6Yt
         GNIzjeTIozjbsS6/GWseC0T6oS26VCNO8GGiowQEwTP03XzJqNq7MQoG71woScoDURCy
         ZIbA==
X-Forwarded-Encrypted: i=1; AL+hErEFTQFQ6x9+OIxL4By7W8LbWdIaHr3CJEAS5vZHYXVWzfOS3ZAuIpquloh/dY8EBZX1EPzKOIrE0QCeqtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N30+YnH42Zql6a3uYN1QBGMq3Cl8GiCH3mnA3L2F6Ea4n4Z6O
	feBXWmHOy07OOYarIH/e9AmSPy3X/25+P7C21sfqCw6DunlqnsAgKs/Y
X-Gm-Gg: AZFdTZd+svNmyQ+YU6w/83I8GBM1M7inv6942fnSWAHjbpITwO3hJkwB8tmCqxFd74Q
	sP1naP+YXSAf6rCDTuZa6FiVNOv9IvWZn4mTwCsRxK0iDubEkz3GAs0Y3VC8K8QJOrEG5yfhpmt
	fEaCFsWNIVtWeqx8OEgy+MvMucr5obatIU5y9uEtrK0awAzH4xoe2xXgVskdEmQlLoG7RbTY3oB
	e9mV5rtfZVGvNweb+VMD3ru7UZhsHRSwnP/kj06s7ZLH233rmYYMaJ9/LS/j/MV3LQuA3q0WT6o
	Vqs27pEgOdpGl8q3D+JE3oGucjGgnDxtQi4B7z4unVc92M9J8rbcCp+njYaa5bDMoXBE2GNTWZu
	hl0HCaLDjciEREhB8hvVzTsyIk7cxAeJlj6LJYiwlOUgqht6r6dEtfPqo6EEsx6gBT7JHzkr+AX
	AjYE/wrPtlVf+xKPSt1mAi7Aee4Ntefw1zWCn2od1cl70lH97WQWV+x/Ons5W1vmHUqCUvchKAz
	zUWgZ3nXKgNs9NIkNLm/CFnko4Ypu5TqJTsK9XvYz5zi9Jz7LJKV20SNMeslWprUANrEifjSM7P
	qwYKSeixFPwSc1Rboj1sJrCJcrjFGcpxgH44gVcF1QGApRVD6wie04RZ4EiGu0Jq3BYPUTevV28
	FTAAACCzrwtxRVpq9Iz//v4fr3eIKa1iQHPEYIiH1kQkwu0beCLbahVvFhQmL2UrsBc8=
X-Received: by 2002:a05:6000:460c:b0:4a3:976e:27a2 with SMTP id ffacd0b85a97d-4a63cb246e2mr12573377f8f.34.1795094213110;
        Thu, 19 Nov 2026 05:16:53 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65499752asm10015676f8f.11.2026.11.19.05.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:16:51 -0800 (PST)
Date: Thu, 19 Nov 2026 16:16:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Peter Zijlstra <peterz@infradead.org>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] cleanup: Suggest using IS_ERR_OR_NULL() in cleanup
 functions
Message-ID: <av72wAOkKPOnp0c3@stanley.mountain>
References: <d5054be790f6980107cca32cf1e71f1df08d2a24.1795093760.git.geert+renesas@glider.be>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5054be790f6980107cca32cf1e71f1df08d2a24.1795093760.git.geert+renesas@glider.be>

On Thu, Nov 19, 2026 at 02:14:29PM +0100, Geert Uytterhoeven wrote:
> Commit cd7eb8f83fcf258f ("mm/slab: make __free(kfree) accept error
> pointers") already hardened the cleanup functions for kfree() and
> kvfree().
> 
> Update the recommendation and example in the documentation, too.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

