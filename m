Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795114788;
	b=qMtVLC5X5g58GPHA/eUcr3o+piZ1phABz/sJKv9P3M13O3hnw2tIqeTeygHHgYXAfYwW
	 V8LIBf/pg3/XgqyOC594CWNNETTEAchtTDks+msvgNDkfRYwWGdm+9jpDVhMDU79dc/ig
	 3VNCCjCuJ3pEOO64/xxnlmzudYm+W9GJpS/A4Xr0HL8kAepdZ8+XjTd4MLEzJewRH4bkF
	 ZujiK91+kDF3NJBFaEfDtYk8epEGLRZTqiXAjpo6/ViT1/+mvBjtGGW6vDP3ll8qIhEbJ
	 5ksJFxQsTE50sDAdU3zcVDBvbtKl2oL78NQRAzzLZ/V1ZNlEQBB2+kWQYaQmULCphjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wbxe7kLubw9u1wufA+gD9vxLgwISeFpqRh3SSGVI7cw=;
	b=L/GvSva9biVd09jsC5s6OQN/IHmybLWbbyH0Q8KYFcoXJvKwcz6O/VrlP9BSYpFEBE1d
	 lrfxt2yKcBioq3GkC+lHddVxgIHgz9I2gLQxbS68t/2Ax1xIfUWNE/8tNHR1ApyGUDID5
	 lN+rpdVXHc2ITiQ1HbQ77vz7tkiEbltXsltnP6IGtsGKMbhit2ukK69iSQVh26AlfLECl
	 o40TSjeG1nc28zlW0G/KAMrmnSWizKBKcmE9JuVU35qEadTS/lbjlJ8ChcCwzGoCN/t2a
	 CzLBtGy1JK5MXCWUWts2RJnIKSbznA1GoiGGK2fY+jo4ATcwJVJp57KpJ3PDT4zfc9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b06SVsdc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5932606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5932606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b06SVsdc
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso75940eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:59:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795114787; cv=none;
        d=google.com; s=arc-20260327;
        b=g7BNQp5/ejLCibyLOhP6wVxSnO4ijGtVwpPXITU8EwtRIe9Ot1ZqqqMDjT/y+859zl
         oS7iYWJvYRer5CmC/255YrhBTB3KshKNFctD18WMhWxyrKB027YDPDlMHcvmwos+5Irw
         AbyYY5TMGuOVoc6xfZFmNLH/oJ4vVcBzXiJvXptVvBXlRgp/MdgI1GfsmYOFWTOoBHgh
         iXm4zJwKtU0u+BvKlCliKc59R6OKAaiH6x0JiT/ZzhW8dhs4N39WRR3FkwxjN3PTR9fk
         Vhe/LPFo5vxnR8ad3TORnF/C1sjnaUVIu5123bL+ufZvLRqhumPNyak5wsxEii0Pfxor
         xfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wbxe7kLubw9u1wufA+gD9vxLgwISeFpqRh3SSGVI7cw=;
        fh=PPpVtxsjwkCw2Vm8NCBvMPaOen5zC5eqFJG8mjUpx6M=;
        b=aBflSWF3yMgWIHrf/DwSVEHyNK3pQ8gmk+ME9FD1f4maUptjKj/zUxeNc09a18lR6l
         zeozZvfmWHFOvoOW+3Ehiiae3wtzDlfkjNzopTpR6TqLCaKSdosF+485s/CF2PvvXTOU
         5wjoDy9kp8+KQTcbKbzyuvNHNMuWWondSfdlKaxTijhkmpp+9e8eqRxbBS+5vHGk9WG+
         QFnIQv9EXtzK3lLTyutqxxmC1ykgq7ZiQBUz/IG7R/36hX1Bpk/OoSMdODXxYCf/XXsZ
         BujqniYWJp9XJOQle9mPIY+7xxygPYLCs36rejUbaSvMZsqM1M4dtz7uQpZ3UqeJKjU+
         osLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795114787; x=1795719587; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbxe7kLubw9u1wufA+gD9vxLgwISeFpqRh3SSGVI7cw=;
        b=b06SVsdcaDcUIiqLafzT/utdQ/iCjsDIoPHheymBP14C9oVM+Nij/QnTatPmo5MLd7
         VWBwzL6foEyhbglKHqywrYsDot3ltlNUz3u3/RxZcXrSwaQqK0r7pphL3G80HqysQJOr
         RwuwmOjSc3g4F9xMvGEAuyWvzy3Ttht94JwG3wRz1UyFb0Yoehvd14U3X/FaQHODbnNz
         UbH54uyTHEJIi3O+qLH3rX689h1ixmJHiGMEmfZGg0ICYydBD9ccP+r2c39K7hFPbzWc
         IrNzaT5Z2aJKpIyzCz/I6Lj5uMjJ3JPS/SEhCliplYtOTnP13itNDhlUdUiBB7kCz7L/
         Cm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114787; x=1795719587;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wbxe7kLubw9u1wufA+gD9vxLgwISeFpqRh3SSGVI7cw=;
        b=w1Cr51tLeZS9gTv1xhIrd6o387NiUdAPSvMpyUwY+T0aoFSC55xIaNeoVrVqV5S/Da
         CkUQ8EpHL97Hw68b/RG3WSCp9scndKHp3mVPrcsitMbY4D4bqJqOG+3FxvEb94FgHlu8
         +Lp/DkeUVvTruDOng4uJ645vGAEWSiUPM5chzw6gpgq53979UA0Ca1ecvbzUUWF0C0gf
         kFQHwe2Nmd3EfhDxCUw5iQYTU7Bw/KV/9mhzkSbxBYiaviVZLMD/KEmeRw4qCAx12VNE
         mhnsoRUKOk6YuCfJIMYbUpPOwmHpoPBEZYw93KIw/E7zU7KdbF5NRkXeDrUhZVsUrLHT
         WyCA==
X-Forwarded-Encrypted: i=1; AL+hErFcN/tZtgOq4PdNsLKbgy79w/87poyZkdWvYmKUYw1u2VxdN1UaXKilVkMbIbqyYr6R3ldCz5nxH6dYfGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xvvKh0h9uYTZfWWmIBJiipZbkFKZVu6MVQesU1zK+m858hAVG
	UOQ5U9wL6W4JGwTbeCFf0WEZVDaNcY74eDrKn1ZWdmgQfBUr2mfpDfo4aK3tP5rHdiGIpGT8/yK
	C/wbAXbCkgrsko9xqfOEKs5cdLjhYH+o=
X-Gm-Gg: AZFdTZeCjlT/i4t4GGY+BpOzbPObd9jLhk/A8J5hDqqLR741mIsda7+No4N6cO4bBEa
	SbxnnASZoAobBBMxx1SubX64rcb//zthWNR9gOCc56TnVoVIXlmYOV+sF2FuSAHOug0p8fZVV5T
	do7o8dp8YSPOl4onIuuGiPkWPivioSUB0CH39fgBDJ7oNM5q9GXssuOtYb0PpoWhOXAFOF6tB5A
	G6LDlxSj0ZEkvNOdSDHM6BvmF4SW3xvVuke9MPnne19D2u/9wiA89qoIQnif8K04nDfOv0yxB6V
	JIyVIgEbuddDXAO4fIXbTkO1WKQH3YZBTFU2QiJ2NznOFYtssC0m+4+sFOL4RGbK+pdeRrazD2/
	gdebTHMRxQ5WAUWQcy5dkSWZq8JENazegB2a4wqeb4MZAdah2yBBhZmQYbKkfswsETvuqHtzQzA
	trW4D5Vqtd5p8mE7G0xw==
X-Received: by 2002:a05:7300:f491:b0:37b:7bba:8199 with SMTP id
 5a478bee46e88-3856fd5cc92mr183443eec.6.1795114786784; Thu, 19 Nov 2026
 10:59:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119012707.555494-1-lcy8047@gmail.com> <7e94f48f-f352-4809-a96e-d5363b8be273@nvidia.com>
In-Reply-To: <7e94f48f-f352-4809-a96e-d5363b8be273@nvidia.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Thu, 19 Nov 2026 13:59:35 -0500
X-Gm-Features: Aa3M54po2B1r57yvjEB-PRSHSy7gIA46Bx8WGdBCs9hXYwC8qE8ue_MB7q0s0UE
Message-ID: <CAKefsHt0MC47dMy++wZS7SJ_yZVYeOMdKmG8RvkNtqCoGn2_qA@mail.gmail.com>
Subject: Re: [PATCH net] net/mlx5e: Skip hairpin entries not ready in debugfs dump
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Gal Pressman <gal@nvidia.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you for the review and the corrections :)
I will send a v2 patch with the fix tag.

Best,
Changyul
