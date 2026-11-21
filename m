Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795283680;
	b=GecLr0l9m3OXjWFOd0o6OoFZGrhcaljFtZgnrx3AC7ROEAA5DFM5K4jPOMe9p5L4Wppp
	 yLLPDJPqK++UOECvC11d4AaQnnZecOLj6p3ObGF623ENC4Z+9xQuLg6w3qy+NjE9/LU8a
	 HMhmQEVaYGNCce5J7ESFMVXXfd8mjSOkPyUcdTQ3PDRZAWvVpmeSEcS0OywnwXMsubRnB
	 +HMcOHjR19DAjqiHbL5a/0XT8HxY7Eibw5bl31OeczfsvB0s+z0pxPouLySgObWuZH2iS
	 TM/O/GuruL28tvEmZQZ/tx61Sng4YUy3zSGxRHsfuBy/zJhoM/ueIzhA0ei69g1Ry3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZkJ0e/W/n/O5onpPBZJsAZoVPMj2UkOY9Tvk5edCPPM=;
	b=JNPdaeiyVcduzv3HM7ojVzC4Y1JOqWjyNyfgykz5dem+7ABMcer2cQrO2GbVTdJ72Dzn
	 DXcowix50tVyFVk2ZcjfZc9oeAE+wLSTLgVfUvdakfyB4JIRekEkCkmRltyBkmvTY9evp
	 8gX18oUwehNAYL8+AgUNZZp45BwGSh28CxOSdohCuGECR0kvZqdFQVPB6HJsMOSiyBZOA
	 IeIKObNsIgZGd4LBXETh+AIh3tAK5CAPBnf1JqFAnjAGcBMKev/1jsL4f21GG9YwNhZgW
	 HAWwQuzbNvAVTPCbsMEO070RE35FNiKgTOqZGMc5s2m/6YHwDxX0vO5L9S5PYwdbWfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=w7YMfurZ;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A24606A335
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A24606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=w7YMfurZ
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so360150466b.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795283678; x=1795888478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZkJ0e/W/n/O5onpPBZJsAZoVPMj2UkOY9Tvk5edCPPM=;
        b=w7YMfurZY/rK8hrr8RSamu6tow1zgVjhLVjEyzxMuQS9kCpt+b2VysZBGUuURdXQsN
         hpz77FcVNlDZ2ZcfgIQiGk2x9SrxN0EsqyGa6zOKnU8sps1RnnSFWvhCGQHqBpdjEIcs
         AV/pM8QQTVdynp0IK9sVvq3r2RnG9hWBgGBVyXDIeoGv9ybPmEvB4SIMXyY2FWpNDN8N
         nsHaojyv34BVbvc4x225BHtcrxjpu48bO+h3KZI6oTm2k0ASo0ZW3/6Aw+YslqETsR1/
         wQlE7IBD7jmfob8ozeg+6nZaNQ5vfZbXlixilzo1FU3VKLObRR2M97FW52i7HqI7bPAA
         ws0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283678; x=1795888478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZkJ0e/W/n/O5onpPBZJsAZoVPMj2UkOY9Tvk5edCPPM=;
        b=rSCk5+4ocmUiU+jkP9QxgMfoy+8iB8zzUhr9DIs6OZsRJFQ4Ar5eLOW626xrzS4M06
         /0G4S5+hNRlIQ2QcTslcpiHQooowquteAGPMYEJzHj0Ug+R6QueEED8I/34d6N3WE4d7
         OuqNE5IpGBi8AxkdDOg6m0CHnZjk5qrGRQz4j0gMPY1tQ/VRiVTg7ANJfRAzcDJ6F0Ef
         tb6Uha5SpkSv7F7FOLB33itoVJAqoEt8/FTM92GgsxqJvcGo4OkJwqOzeq4hNNJLsB0D
         Iq0LGlHW4SYB8eF3votCbSzl6Wf4EQRjgBS4uXKnBkvaX26NwFgXG2az1Eo6Mu05J92l
         tPPA==
X-Forwarded-Encrypted: i=1; AL+hErGcLD12saJR47owP9a9euSBvVjBVtjcaG85nC++N1la+w7HDCN8vn0EK5JhW/4Sn6PDoZWak6LW45QuRyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WjKLQKNC2A3jLAKCC6mxN65YtHfMgf+gWeuIweCVsAbG5iq49
	0TaR33hcmfB4+zhP2c8MA535EDblNgmDI8ZvogG65omDlcx+ZTPXnZwbw4WWJPKaOw==
X-Gm-Gg: AZFdTZdKKV6hBL/7KnQXm5Wfp9pEu2gXw19rrzEIhCvvYkrALBAOYPgJGikm5Z8fusb
	xn3b6aTqHgTWFQ4hOD49IELnV7/U6EUvblC7W6qGkgZWfPnAe/67/JfoWa5yhhxyTMh0YbF6hRM
	dlziwKvNCdcZJVKuSZ/2jx0PokponpCtxSV5wPsgh9n5KoHokBYXWOd52vVPK8uJW816e58f//Z
	vm1cTVScKTlQzb9OtKw3C0KU4jn7DB6sXuu2e52EMWPd2gRVeEFzC/BuIL4AyKKcVhIHodKD5RC
	J5jRljlBoIDWNWmKB5GxfSFbyEnJFn/eSYdN2MYaAReFb46sHbpfCBIbrbalON7Zo1f7vCCXEZV
	jAtvTX5RN5P161oiPXk8iiqlOA097MkULGIjVJEXSZKbqGleZDFrQNO2EZz4hq21xEmICoPfv1c
	T+SC/lrURYkxEHfvYRn6dDsQg3gFsnvXOVV78j9L6rwTf+ZyK3+JlCvDInSUHeKJQDeOAkmwaDI
	7/Wdi5jVdq2RGLBn6DZ9/A32Q+v5hzs91pIxihxop8wSOWK8fdCjAe5rm5MuNgiUfoXUiVkLaGg
	zao89Wp85Uf1W+0uCs/0qMJ2bFovKWzxhwkIVFRvEneY1MgUyJWHgErBZE8AO1IYrfsMH88xlEy
	QvvUz1sS9w5o5nEioAPx3+/Wm7MD/YBUUfHLanHAYUNogDoSeY7Yaydf8Q2e3RGGtR1v8A2jN44
	rbAyrLA68kMFcn1qXnnFpbNxG0900SVYajmaKM5RMFnCG0+N4HQETwUrDmDEOetv+aRUAGX8PcL
	j9v43FXVlYbi3D5l9eVj05XgpfkQV8WvAd9itzJqUja8vqJfcQMR9y1Y6x3okVVhLJDXPIC7ZWb
	QFiMVCC0oh2NxFItj+KCyoROqn6m3G6IkQlfqrdsNaY+1atquSYPbr7FGYzcZRmwg6B/QLvwe6K
	O
X-Received: by 2002:a17:907:6e89:b0:c51:59c8:a4ec with SMTP id a640c23a62f3a-c5159c8dc3bmr179230966b.1.1795283678143;
        Sat, 21 Nov 2026 09:54:38 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3537sm213191666b.36.2026.11.21.09.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:54:37 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: loic.poulain@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sat, 21 Nov 2026 18:54:37 +0100
Message-ID: <20261121175437.648605-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAFEp6-0nEWKrKXx0A7dHuzFU_=NZfzjNZQzKp2nfk+gr_SDvag@mail.gmail.com>
References: <20261101164247.258200-1-julius@bairaktaris.de> <CAFEp6-3iq_Pc0UgeCi7x16w6J-VwgGQ37QaP=dXp_OaTEi+esg@mail.gmail.com> <20261114210506.787342-1-julius@bairaktaris.de> <CAFEp6-0nEWKrKXx0A7dHuzFU_=NZfzjNZQzKp2nfk+gr_SDvag@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 16, 2026 at 4:25 PM Loic Poulain wrote:
> So, from what you say I understand pci_alloc_irq_vectors_affinity() is
> the wrong API here because it sizes the allocation around CPUs,
> whereas your goal is to size the allocation around device
> CE/capability (8 vectors).

Yes.

> Can you mention cfe9011a05a8 ("ath10k: remove MSI range support").
> And why we re-introduce MIS support and how is it different from
> previous implementation?

Agreed. The v2 2/2 message names it, gives its reasons, and says that
its per copy engine handlers and tasklets do not come back: every
vector gets ath10k_pci_interrupt_handler(), which schedules the one
NAPI, so only the CPU of the HTT copy engine's interrupt changes.

> Also, you should update the comment/kdoc for
> ath10k_pci_per_engine_handler() which says MSI interrupts are not
> handled there.

Agreed. That function went with cfe9011a05a8; the stale comment sits
above ath10k_pci_interrupt_handler(), and v2 rewrites it.

v2: https://lore.kernel.org/all/20261121175402.644803-1-julius@bairaktaris.de/

Julius
