Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000554;
	b=RtWEKTwEMKRJSEKws6xtz9YVnJVODqNi0LCI7KHi8WlmUzMXxy1q7rADw7G4CsZEk7mM
	 IGMS1robj6ffVXVPAqOLDW8ra4I/5EZNNbmJ/aGKOWPqujPDEMq5RWmQkpwy5cY0o90jb
	 sEbDbNJbUCDdtsNHGxDZUBtpraEWiWj3A+Q0WJQyruWJiS28NuI5g5KyT8R+vjp3tC3L4
	 OA4ftPA0TQlKCPzwC4965RWE7QYWfaXkirztoyOgabmP0t/YWX4KKrPrWY9oqZZQ57YD0
	 Hl/Tw3UsYrSTe7zNFfGtcimy70cUDcWpslDEKZOISo1Y02UHXY2dYvJG4sx16gKEcrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=dxJkUC24im2bGryNLkAlqWRfHL6XOBwDY6Gegry7bnQ=;
	b=UTreW0sBejnH4NKo4VdyO/pHGfRq3J6gUi5YgKT1y5mdggb+wsjNpNMwTivfXt/vYGr3
	 8Yt6/01u84X20n+WK9XJam6HetwNBMzQAhC1UrveLImdVIZP99HZbJWm7vrk7gr9npujx
	 4ILqZDg6AKL2Ys1vMUShPoR3J3+Umabo2EGZ0msZViyTJcGZE7lOdxzOlAGcEbSEj5ikz
	 cnEY90mYrD/Nrl8VGKBV2IIf+QuB6HwC3HdLPyO5u/9fSEWerXwx6Tj5w20XiADYjpohv
	 dUuMeXHALHYuk1xItwW7kMoeFIeOdb+qxxLbMHy8JC7i7NrxkPntanG5U5b975vV7Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uaOzwvJl;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6345606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6345606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uaOzwvJl
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-382c3c9671fso855276eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795000553; x=1795605353; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dxJkUC24im2bGryNLkAlqWRfHL6XOBwDY6Gegry7bnQ=;
        b=uaOzwvJlXdLXRb5c3IRYdXU/DOmkiIO6NOQBOqasbjI8XCIEoWbvLTrdaN7bTuEPlO
         2rWC1tssxCYoMzYBmxPsy1zQ7g8YZOW4z90dICP7PJdtMBAK1ZQ7MUQ7jJNM6kERY7Br
         PIaPsg0Bubj+y7n7Xd01xZuLPXZICusjVAIgeoRiZK1kqPLWHugOcXIMYH3rfPZJREvi
         JLfEfS79UjMmYnk++Iw80BQ/34XknetnUNAoUUR+j9peJREOFWLKhfdG/38JNp7q0O63
         pIT5EIAtx5gPR1w1T+zMsgUYQ+c6A/IjwR2v+VQ+By3rcFDzBWAHkSy6vWdG6QsYJvnI
         YHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000553; x=1795605353;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxJkUC24im2bGryNLkAlqWRfHL6XOBwDY6Gegry7bnQ=;
        b=rJBy2t7rb9wS3d+BAp1TeedtZ4Cq0ph6Ayfdt+WFy6EdQwPF//Cvbu77j6hBPyvwb0
         gSLq7hTdr0Irq+gPdmRUjJtbc2PpbK/h6P3mTygjqm9s3iTdXbCOGRxSlqTr3SNuW7Dn
         SKpST/OVdPwE5CtxkslXkofM3sRWhmh0fA+YA1ptewYs1grSnpjq1QhKJvFt4znXIVKf
         FpqURo9t8n05VGdR2MzCCGt001YyfqF73hbUIZfHq/KhWRo9AiSvcKv1i/vQrQHckjG/
         9rmp3ExCIfxYht54bWMVPsYyufhP/9MascLvVPnBH71nlEXEx2Lq6G/5VxdkMp1JJbdc
         00rQ==
X-Forwarded-Encrypted: i=1; AL+hErHi+UCGllQN3h2EusxMVf519cqaSCRATOuBQxinQxqFJlr9em3WurT7kqTCaQd1wfwzr5rGuyx9O0USo3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GgoK1euQPVleIoMTRB674InPkgxcFmlPZll68Ga7Tj1nfEGIL
	4il4o61B8LyXIy6wV8PJMmutZOdHAZ/iXFrO+/j/hEjx9+y9vSzb2lhL
X-Gm-Gg: AZFdTZc4SqxpdiAtJZgLASWPnegmlAVUnQXpEB5HyU4Ii53q/dYp/3B5aumYqfahK/J
	ik9NBjql2IuKZQQo6QerM0hISI32YbVoU0S7nqaNEMj6QqiDTVsZ1i7yjD2kb6jeZiViIyQUc0r
	Y2rVYWSZPjT1VuWHAlObufJd17Nzno0XGNr6chSqxCwKXrkRGey0Z8PRcSJmZe7p1moCJQz/hXs
	MYTjxX6ON3Z/UZdgQyyNa3EL2xqIvCJwufZ3AkpUHl1c75be32KKTvmJZfgbGHIWPNtGzq4Fmxi
	zrZmtALg2Hx9rBd7338BPTveVrck8eOHafOYfajXQv3L/hnECEaQgRPeVP3sIW+ZNthc2A6wTiE
	pAPYN/HHhtocq62WDTqwIOZR71LwAFpkBzjA1oZQoRsSsvD+yVqxyK6Tjyc5VjegRk6c3Tu6xjb
	dVyApE2vPwiGlvR3Vfc1AV18EfMIc78sa7nMo7QtyF4FMuZ0d9hOGU1aPCLCPOzVQ2lf9gbBv5f
	LHMqNcpvUo1dj1pn5wSyHePcST/4jSv9ml4j+uYVPF8NcWfCsk0xD7CeetVL2su29e33nJH1mO/
	3FBlPugz7eRA3wBHlcuEHNdnHcI=
X-Received: by 2002:a05:693c:3881:b0:36f:83e7:fb7b with SMTP id 5a478bee46e88-38281cf6999mr2106174eec.40.1795000552950;
        Wed, 18 Nov 2026 03:15:52 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a80bc19bsm7085645eec.29.2026.11.18.03.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:15:52 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Haoxiang Li <haoxiang_li2024@163.com>, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, sshegde@linux.ibm.com, farosas@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Haoxiang Li <haoxiang_li2024@163.com>
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV: Clean up on uvmem initialization failure
In-Reply-To: <20261118102012.2252221-1-haoxiang_li2024@163.com>
Date: Wed, 18 Nov 2026 16:44:01 +0530
Message-ID: <mrr675om.ritesh.list@gmail.com>
References: <20261118102012.2252221-1-haoxiang_li2024@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Haoxiang Li <haoxiang_li2024@163.com> writes:

> When kvmppc_uvmem_init() fails, kvmppc_book3s_init_hv() returns
> directly, bypassing the existing error path. Jump to the existing
> error path to clean up before returning the error.
>
> Fixes: 175be7e5800e ("KVM: PPC: Book3S HV: Free allocated memory if module init fails")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

