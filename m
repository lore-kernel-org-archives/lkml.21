Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795851452;
	b=e4nAlDueZZXcSubbLLOET4Dl9bKP2D3ns1bR0pIEhwsGSwL909cueH2Y0MDMndfjiI2T
	 Byv6HpU6vMZXr9B+C2xfk9f0wXzOhs24YMwWkWs3M7hQMSw3+PEwnkkhbLNi7VLah8hGq
	 Uc5cSzIASO33jlZC/0t7bwoUjBwijtVbAoEKfVxMPfs/HBxa+S/gwBsiK8VqrH0bMlFXp
	 u1pVC29EKvbF7bUvPKZygirixkkdQpHKaiZpxkKT0QgbtXIpeiIXT6uIp272/gUcHyN/L
	 Oc44fQhJkaoo7DvueiswBj9mJ2RtI4K+wTzkyE0x4A4b9uVV/3fJyLt1ZgZ9v0FdKRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795851452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lL+jKdd4J7vQfapOu6Q28lbNCK5lQEUpkixYLsmn0KY=;
	b=wL6QboN3BV3DF2XBHcRdsz56RT87rdt+1xg6GrtUv11UT91oezgwLIoUmYu1jACUf+Fm
	 i5R9EjvL9hTQcTBfNVYcohmJmgoA/GAEz2VW3OUxqvu+j8ha8tyLltEipwLf1D9axX5h4
	 8Iv4aM4BCpUREFpKwVe7r1WFenYOxSfZJVvkt6+ltKvVa72B8CJmsdDmK6DydENE+PZNk
	 Zd2MIHNd47iK0gv3qguAmUxWWscYJcffcGXBr2FtpgLUFF44r47LLtXEiBwBaHSxw1P/n
	 Lg6HHvl/O9w7w1iJEGMPOjnso9pv6f6FJKywkdRWRufCQE+kGMif5Zh+XfPMjDLmibA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DRwLAdTx;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850AE606A32F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 850AE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DRwLAdTx
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so13121024c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795851451; x=1796456251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lL+jKdd4J7vQfapOu6Q28lbNCK5lQEUpkixYLsmn0KY=;
        b=DRwLAdTxfhtXOEYCPHlkAS1WoK8xeQ3sQujKeRacoK9fs+WswCSFeZfJ8bwpyoLznS
         EUXp6gUKqLD8pNaSs3oKxOljZoL/z5nDk0WC0ImZUIqS66U+4hTocOROd4MZ2ovV+EbV
         pInyiNuDvtfkdIReVldBO4znzQdsFWHtum4Hiv4wV5RfyCj0++m5LAc7Hxz3o5qYeltE
         PEVH59haCyuCSSANH7ifnqnxvQgkhIGrYqEjWaBvyT28c6FwGFtxqKe1Dld+UIU/earP
         UxODcillAskJWpSIbGHTGHn0jjxhhc/gtXOtRmeQOi8B0HxfMfKctzCGXlGH+gMiR+dJ
         8btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795851452; x=1796456252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lL+jKdd4J7vQfapOu6Q28lbNCK5lQEUpkixYLsmn0KY=;
        b=tuEz9yqXJNKmmfpoi1GlmX8QoCR8PO4m88GeV8RIpTfb5/dU/yZwxsXq6r0Qx5Xe3j
         mFuT0zSHFUEgfeoc+O1hdG9x1PaFD0rNee5yFfaz6mAFvAGw1qb9KLdO3lwjSAuKsza/
         OA/uRGlYhXcNMRJwoDgJqXNVMvnjLCUT8oS/XZV72ElVFfdPWGU9fThLSCCh84o1pt+D
         1K3C5YsvZCauczYrjS+18qW3V9VqT+oJJozTBO3PYmu+8FJPR4K7TT/kCar74Xp/L0Dt
         X22fQuAfnp8355LJ4AqZa7YYIwrGKJy2L1O+oytMcFEUQFsqFls8tm0puKf5odwVtoG/
         ivuw==
X-Forwarded-Encrypted: i=1; AL+hErFbYKSwYexxDCH4HVFYQmggmtcHIPYrbvRGvIkCP5euIKVvgl29oM/N2UrgDLtVWaRdwXNpAaC7iRPsMJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z81HCtcyM6K0hgGpBOctC2JKwAitX9KMeEhMXFl2boQILEf6C0S
	pmBY+c7sb8w7ljXt8g7hJFYuUbz7zk5uxNoT4pCPMBWATFhDwBA0x/R2
X-Gm-Gg: AZFdTZd5YJw5o7lDxqJunGTeid5WHOcuphLM//gOXp4cOaja8D8bw24LR3ZEPxXMCbe
	A0cn0SUxHIKKHHbSp4mZ0c3rxtjmGOK5AZu+BuyxwjXViy/FP7Iu+taDE2Wsam68KZmw/NAN2SP
	N66O8S8wE2ZKROketWnBTp9YmuHb7CAZ0owcbBis7Krnyo8wDqtcYOJo4kAmo3RhQZy3bgx7ezU
	0Gx8HSR3UiX+PCH9CJ6JaeMPzO1apPJ/VEcoM4uDoJjsLeURTwmqHxnbtxr+btqQ25ECmcZMAqU
	ZcBCPN/H8ok7LnUJC2z75Gy4IzQfp4i4sl5FCQKNuAdxk2wAdNHezACRBzVmTaf7FlCWYKsepeG
	zRS17W4/qzTlfaZ6yXChv0/mnewGa8lInA1ksqm47hId/OJgUay5U7ZR7XCTe6izMm2Kg46omBH
	WusGnY9W5Gh+jc2at8aoOf7SiqV/fcmLD6CDBXhpv9btTefUR8ckScoQj36QgJU84/k8rBUnhoh
	sy/MnKd9jOPuuFk1AkS4StHgbO/LNTzinLK6LRwDriyZ5pj02iTaiLU7STPZJF9JhtIMKhb2P+R
	k92BkiL2BLswF7n8Bym26rOSQbchmYJKZCyIgn+hnGaJTLuuPyTYsNpdTL9HAciWcWmK
X-Received: by 2002:a05:7022:23aa:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b55688dd29mr36586570c88.19.1795851451449;
        Fri, 27 Nov 2026 23:37:31 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm58146062c88.0.2026.11.27.23.37.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 23:37:31 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Chris Li <chrisl@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 04/19] mm/swap: introduce swap device iteration helper
Date: Sat, 28 Nov 2026 15:36:45 +0800
Message-ID: <20261128073709.33602-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CACePvbU2cg1EVBjONWjYcsanDM0JS4eLXgX9aGYeEaXu4zZ2-w@mail.gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com> <be6ef058f4a6babd3562270daa5b61c4ff9a6a50.1795439990.git.lianux.mm@gmail.com> <CACePvbU2cg1EVBjONWjYcsanDM0JS4eLXgX9aGYeEaXu4zZ2-w@mail.gmail.com>
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

On Thu, 26 Nov 2026 09:26:29 -0800 Chris Li <chrisl@kernel.org> wrote:

> Nitpick: Suggest have a internal version of "int _i", then sync to
> "int *i" at function exit.

Thanks for the ack. The macro passes its own local index, but I agree
a local int in __swap_iter() makes it clear that the bounds check and
the lookup use the same value. I'll write back the next index on exit.
I'd keep it an int for now; this iterator has no other state to carry.

> You don't need this WARN ON. When i < nr_swapfile, the swap_info[i]
> array can never the NULL. If you are paranoid you can continue if "si"
> is NULL.

Agreed. The pointer is published before nr_swapfiles is incremented,
and the descriptor is kept for reuse. I'll drop the warning and use
the _dev names you suggested, with a comment that the unfiltered form
also visits unused descriptors.

> I think for_each_swap_info() requested flags as SWP_USED |
> SWP_WRITEOK. Is this intent here to catch the race that SWP_WRITEOK
> get dropped after the for_each_swap_info()?

No. It's for_each_avail_swap() that passes SWP_USED | SWP_WRITEOK.
for_each_swap_info() passes zero, so the flag check in __swap_iter()
short-circuits without reading si->flags. In si_swapinfo() the
READ_ONCE() in the loop body is the only flags load. It counts usage
on a device that is still marked used but is no longer writable; it
doesn't depend on observing a change between two reads.

Thanks,
Lian
