Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795308565;
	b=xLg6UcLWAOjUpOGlyLAyXF2+yyi/xrwbG6MHBUBylzKax/e6xTMLbVOzQSw4uBJxeqz7
	 i4EdSAQhMEzSP0CeqOmsXcdVwoerk8SueecXs2k7dy98WDIbqTj9Wh3EFwwLzKE3I01Xu
	 8w3GEx8KXr92W9smiGQSemZYDF4JdPWnkhDznojgoF7jGP/Vkc9uXeVqU8PFz63+2fuLF
	 OZIbhxbxuojXnc/XrtFGw/NFzaghuHpl1uSVB10/kwHkX1N/OQ9vnSMfb9k2u3MAjEt8Y
	 OQTmPY1Gl8aaeZoJegqc1NMGvoe0wDTsHy1ATowL6eTd+nCWzgaN7R54TSwTLwlzv0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795308565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HB4GGGiTx/77gkcgbtZkvnLnAdHz3bFsq58nhMt/PIc=;
	b=snvS4BgM+m0F1fMkHxrTUfxZpj2LXipKjII0IZrKArKkdYw4gVA8VbskLjHxnhnKQF08
	 BOPzqQTALT9R3aHNMrFMTtqYNX7ClGGObrGyB3xwacsViPDOel2V2W5qyBhWle+lRZ1eF
	 NB002tWCPSp9cqnhJ39a3x1XSWBlDnqrFoRwUdvgLfjmf+zWtFDx/XXDwmF/+0BN7AEK7
	 a2O28xm9WUuOlafiR/AZrLQM0ZlqGY+K9GX/4jqiwGnN8sf0c7Bh3aOtZ8E5A7XcDSzpg
	 IwrGyCW5ulNeEkiZK/f6e3jrXd8t/xMDSV67Nw/Z5XHb6SavsshYAbiZKC/yVlFFtsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=a+0K0Nob;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59016606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59016606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=a+0K0Nob
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so5870212eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795308563; x=1795913363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HB4GGGiTx/77gkcgbtZkvnLnAdHz3bFsq58nhMt/PIc=;
        b=a+0K0NobGtz8B+Z6ohea3+PQBOuq9f9JzKTQBspnxU9MlUKd23RHrnQ/U63zDmpNXa
         310pYIZWMhbPXR3V9v3T3E9gb25EjGUCgo6dUZU6lcQpR2i2Qb00GqIqPVp/c1eY/iq9
         DVeEUVw2ftb1AYegSyT3Ty9tvWpglgfj4lj72H4b2e7qEZ8H2w3VVWUcpHX20DmyO/P2
         BpLeGSUMhO6tPClhvvY1wCdP6Q/s5Cz47oA7Qp6V91+qa7DpxuzS+Ig52i4Aou/ydtN1
         VzdYp8mXweVEJ0vBNovXjjjcjuxWXGZUeevBExCzYsvcoqBEQ8K8GDplaPpwxPICCWuM
         PTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795308563; x=1795913363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HB4GGGiTx/77gkcgbtZkvnLnAdHz3bFsq58nhMt/PIc=;
        b=b5MtL6CtG7EFnoutAyWPUBZC0NVoxch4Hm/2ICl0w12AZJQdN+sUE6roorOZ1JSA3a
         JAsAj0YIlkzGzvdH1Mv+2OvenV7pcJ98vMx9lGDF7MOQYTkgNm4aIslm3/CqD2xIEoht
         C8CwrgrXSakI5666NayHgUYjewfW2yWk/zdlrd9czNqYJTSUnLmoeuu3N4LF55ah5/m2
         j8ll2U7EhMqkKqA3bfOYKpQB3oYpI098UHajKT2qGOaFUYJ/kzbCzPeMSD5RZcdOA5bn
         unE3/tGFSQZG3iGD3DlO9p1vHVoe2UhcIog+iumpmdYdxqnCdby/FFcBBP1D+1fGsuWl
         R3Xw==
X-Forwarded-Encrypted: i=1; AL+hErFXoGqAXsXPJ/8W8ErYiksTk/Tx2nAnK9Jd3Q3Ew49DgTbx/0WLUOgdUpwloGCV03nRPDbu37466S8BG/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z9FRpabHtYZhjBXZVbIXGldnvHuMUk3pPsl//2wcvacnbyN97
	vpysxeEjV/gUYo5GMkEutlPMxdYM5K8brIyk+W3KwR/dcS3phdVcy7pEu7lvbP49XgE=
X-Gm-Gg: AZFdTZddW6s42s1dsr7K90GKLWbN4QXwbGyCBUQX7flkj67bCCS76g5FoUEJX0kIFTG
	LV6EmAt2784Mn0VX8mhdfdy9kwZMf8M/KY5CSrTjDk/ql7zJF17ZSSPCeIlaPaWtkY5TSJdASW9
	XtZnMdDbJWHzXSkq7IEyrEzopWY6HuHN/i1NTXmT7lZr5EvnBcbU9Edl2HWDHa3Kp6I9CTl6pYI
	AzEMva1qbYpEVRDC2VWcqE9dhTZlOdu2IYqNtgzWHTWQ7Q4DBUfljT3tWXaMWWug/d4iUtHNA+z
	8b6FjK62NH7l/Ykjc+xd3Psc19Ue2EuUY+JtTFRHd6Rls1x62Kolh+EE/5xyWdVBRQ6wCNIZvZo
	bKUr/k45+z9ygzm8/5KkDbiDQ4qIiYrQoUjd9DByseobWhtT65RYQUEVg8BbYVhjvOrmaPXkPOI
	yax6FzIdpHjyt0yHukzLqjTBLONqj4ld54dU2ZSZm2YNs1/U5D1hrPTVZ+R4vjEnpaULQZuEu3I
	RORfy/5+K9f8ragib5i4uc/je2gkDa8aigNxf9aDR4Lrk25kkpBInnDke/zIlr8M5dDzdC2NwTY
	4pZDrnUDxTYQDGNmTehJf0BEHKBa/5VxRE1jHoXpWW0SLV9qOaSkMspZYCDxjvjCizv4a/1d0R0
	p65A4e0JmAPlXJ0fo4NhqjKYUb+Qyxd5gjofEI29/OiMWiYmI
X-Received: by 2002:a05:7022:ea54:b0:193:9aa3:474c with SMTP id a92af1059eb24-1b56d7cf637mr883791c88.21.1795308563262;
        Sat, 21 Nov 2026 16:49:23 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm17621494c88.12.2026.11.21.16.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 16:49:22 -0800 (PST)
Message-ID: <35aef1da-2277-4d9c-9bf4-cbc6094be4cb@kernel.dk>
Date: Sat, 21 Nov 2026 17:49:21 -0700
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
Subject: Re: [PATCH] dma-buf: fix leak of ctx and dmabuf reference in
 dma_buf_io_ctx_create() WARN path
To: Falconet3 <Falconet3@proton.me>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "asml.silence@gmail.com" <asml.silence@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <htm5h9oaY-vk0g9JVYJmz5XCaKe_nPoWkUJYJqDulyNvv_sAWfzSMp0T6GWt5okc8R4SyvXXpJQ3VGhetKnjEa2KGem5uCYdxpmdzUFf6XA=@proton.me>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <htm5h9oaY-vk0g9JVYJmz5XCaKe_nPoWkUJYJqDulyNvv_sAWfzSMp0T6GWt5okc8R4SyvXXpJQ3VGhetKnjEa2KGem5uCYdxpmdzUFf6XA=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/26 5:05 PM, Falconet3 wrote:
> (leak of ctx + dmabuf ref on the WARN_ON_ONCE path, new file in v7.4-rc1, patch attached)

Please see how patches are usually sent - not a huge deal, attachments can
be applied, it's just a lot more inconvenient than a properly sent
patch as you can't comment on it in email. The bigger issue is your
From and Signed-off-by - that needs to be a real identify, not some
leet handle.

-- 
Jens Axboe

