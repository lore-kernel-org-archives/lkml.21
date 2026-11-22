Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365710;
	b=FuBpgF1NBcIR4BqkLwcfzZSH6Z3vvGX71Vuqi3wgNGFg5lbLjvitYBtlU72nSzSRL64h
	 eKkxmnV+Jo3hlnBvSx85bhWhOI94EcaaBkX8RH5fdTGUJSPxJBsA/5Ia9MGObkef/dxVB
	 zjaiAuhcMfSCyAgQrBITE1zjqXWo3kdgWccFUuXRvmhDhHUUCnKjRxDB7OCVEmj70I3nY
	 ND5a1zgBPW6J+yP9Ah8UlPc9UkCWghfTRIEQV1GATzX1XE83GHFwifCMGPNt7MSvT8gWo
	 PwMpW2wUAWAkYFIBdmyNdgWJ+rulC1S7OG5P+g34DjY2A+HXhMTxcKrkXDWp8zIPBtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365710;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LL3qYOVyI9czVO79Zu0V4wotcvHDG47da4SE8/8wYVY=;
	b=JONTe9Uw0OUP/HanIXn+cepFkV8sFLNVWMH7WuZ5GraUhm5KbMmJXN0CT3BpM9keLQUm
	 G+kzT+vhFu25DosXOmQvtdWjK5f+dLCRq/7X6qh8qBcfD7/RKo5NwcZl5c9iV+quIE18O
	 3DS+oQpFgfoyjIJG5wm1TzDRs9xrkDgRpfdIjm9nQu680rVDrwGujYVP974r7L0J2gB/N
	 VtZL2793rpuFGRMyuUjNBRE9E3sBpblO5LyBNyZkfl9JGILetkMzEVVt0W4VI9nKsmyaA
	 1jHK8X6olNZ4Km+e7JCMzbDR0+UasAgUIm7zbcwlS//1MMIbP79G64Y2rh72Pnfezbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d0qJHbp6;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FrwMa6L2;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F12F606A332
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F12F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d0qJHbp6;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FrwMa6L2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795365709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LL3qYOVyI9czVO79Zu0V4wotcvHDG47da4SE8/8wYVY=;
	b=d0qJHbp6L5dQuimJEgI5OIYRSUSSzhkzcVfxfpaGF5b81U8zbDquHzjnUV89kMo1xWdXLZ
	CEVnghXYK+4PdjP9XwE2dJGMaA4QSqBtcfe1VNwYKNt1xzMwNVHTUmbY5VoylPKWn5gUcQ
	VEWR/Rl5IMyAsfOxxLNg7gCJNUjoIZY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-S4hRSBmRPzqmL0o6GDq1xg-1; Sun, 22 Nov 2026 16:41:43 +0000
X-MC-Unique: S4hRSBmRPzqmL0o6GDq1xg-1
X-Mimecast-MFC-AGG-ID: S4hRSBmRPzqmL0o6GDq1xg_1795365702
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e011829easo1450213f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795365702; x=1795970502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LL3qYOVyI9czVO79Zu0V4wotcvHDG47da4SE8/8wYVY=;
        b=FrwMa6L2qiLczFZ0yut6IFDT4zQHsuCoT+8k2n5GCF45F/zwar9QM2kbuqU4EZwUng
         oZQKDJagaQ5m9OprQkVZHkqLQ8KDIKnIc71T6iCxamYYcPBUhuPz3w8O2yvjj4dgFJqq
         uLNlxTStZ8nOb1l2RJMi2XPAFzeB0x2wXkWkQYcU1RxeysP1YElYGiS5f6pvznz3vj5C
         BpgyzKamIQjvt9Xijld3i7eOHV6G0S8XWabuRXkG3pKCXoKC5gsfrjKqwQQDusE2KwDe
         YBJVG/YatRXO2qgnO2vQVw8FuYAOk5vyIB9rSDrYf58F85xxPTtOMBHO4V6oKLfDb5Aa
         JEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795365702; x=1795970502;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LL3qYOVyI9czVO79Zu0V4wotcvHDG47da4SE8/8wYVY=;
        b=ZF0477iEPz3oOZ173LiOnrn4o5G5O9MzAUh1XecwkKfdoG7stAeQCN0mkYYsISB7kp
         dhxu2oP5Kz1oUR+2Eivs+Pgi/J3INRM2LZs9phEbAGxfQZyHQ4LzE0Hv01EKyy4pJPvV
         9nExwB2kuSIqXLTNWb8dXK3fvCOTJHy2EuN3hs3CTLh1WdPgbTpffkzYtl+UW0Eid5T0
         BejBcjBvpWwNNNtN+cTxPunpvjvCmo+dVXM++Aannnn6YhG77JBpxJzg0fc58DVBWmUe
         DOtisDECor2tfx7u3+tIUqi4hEUM8b59LQA8JVq/H0W9St6XRhNOQcvytBm/iK0N9idC
         +7og==
X-Forwarded-Encrypted: i=1; AL+hErG3eOwDpfJFc5oU9Ve4I2pWJlTTe72TVlAGIKpAj2eaTk1QBlJXa/tJLEde6funu27VeA+Sjo+wxl9nwYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y395MrlXtjEMQ7TZRs1+0IfFpwlCXc7l3s2L9uTLbEpgVrQjL
	KrFGjyWd9GSvNzWIQ6DgrHYu0wyKPbQYptQ9Z5QOFbjnT6Srz6S4Snk+CJkSAoL4jJ5Z/VM7Xfx
	cw95IRvukAUjlJyetZMYH/4aFUc31lRobOzBJCtmTSZzTNnW00ILvhZYN5LDWwmUq
X-Gm-Gg: AZFdTZfCC7ix6r2mq+BZqlLFYhiHPBUsfwFKdPtOA7iN+6iUz8Ehv2VwP5DGbgslOvw
	Jq7GX32FrliMHDFWLeVS1tOtNqKS9NoFBcpAPfS7EBv1esMlNB/GL/3Ud15oaoMx5al3b09nrxe
	eK0k2jd2zc5/DHqiNIC3F9BGL5aYA0OkeqVe3jsz6Kt4wMRXZmEjDWvj6duvHXIwG2bFzcVNwG7
	lert5t1Iz6nVL0t896HxIwYqUPK0/VAM+49ZriNuH1B54LCBJlrStqm/WRf/p3mf7DoO10NqqLS
	X6UPrRAP7PpRGAyp3tNQET23DseZDnh9sLIrhZ70ux3J63zt1LVWFk+VdVt8VPOSYmOd5ELdIHz
	b05UkubUxz6tFIrDZWOOPQ/EnYQUzbwAnry/tY+zVpbib4Mz0xHWzBQsCVUlf34hZ0Snfb6T0BR
	Wq2ed7
X-Received: by 2002:a05:6000:400b:b0:4a8:dbbd:69ab with SMTP id ffacd0b85a97d-4abb4f58c75mr17629603f8f.27.1795365701960;
        Sun, 22 Nov 2026 08:41:41 -0800 (PST)
X-Received: by 2002:a05:6000:400b:b0:4a8:dbbd:69ab with SMTP id ffacd0b85a97d-4abb4f58c75mr17629591f8f.27.1795365701633;
        Sun, 22 Nov 2026 08:41:41 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm18809912f8f.13.2026.11.22.08.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 08:41:41 -0800 (PST)
Message-ID: <af91d4a7-11ca-4f84-b8da-33ee1a585916@redhat.com>
Date: Sun, 22 Nov 2026 18:41:39 +0200
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
Subject: Re: [PATCH] mm/hmm: account for subpage offsets in device-private
 PMDs
To: Aveline Noir <jm5905938@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: airlied@gmail.com, apopple@nvidia.com, balbirs@nvidia.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 jgg@nvidia.com, jgg@ziepe.ca, leon@kernel.org, leonro@nvidia.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Brost <matthew.brost@intel.com>, mm-commits@vger.kernel.org,
 Patchwork <patchwork@emeril.freedesktop.org>, Shuah Khan <shuah@kernel.org>,
 SeongJae Park <sj@kernel.org>, thomas.hellstrom@linux.intel.com,
 Vlastimil Babka <vbabka@suse.cz>, ziy@nvidia.com
References: <179342234355.4.16705453209886955762@gmail.com>
 <20261121160037.1a479f3c8b4e860bc23c106d@linux-foundation.org>
 <36be0904-168d-4813-82ff-27ecced464e3@redhat.com>
 <20261122015246.d8b6b98ff5a8157168156339@linux-foundation.org>
 <179535872126.34.4789080961796247940.b4-reply@b4>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <179535872126.34.4789080961796247940.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/22/26 16:45, Aveline Noir wrote:

> Hi Andrew,
>
> On Sun, 22 Nov 2026 01:52:46 -0800 Andrew Morton wrote:
>
>> Store the corresponding RAM backing page instead.
> This avoids the oops on the first read through the second descriptor,
> but leaves a stale backing page pointer after CPU faultback.
>
> Since the mirror XArray entries don't take a page reference, they rely
> on invalidation.  When the CPU later faults the page back to RAM,
> dmirror_interval_invalidate() skips MMU_NOTIFY_MIGRATE for the same
> mdevice, and dmirror_devmem_fault_alloc_and_copy() only clears the
> migrating descriptor's entry before the backing folio is freed.  The
> second descriptor still points to that freed backing page.
>
> Reading the same page again through the second descriptor in QEMU
> triggers a KASAN use-after-free in dmirror_do_read(), and the read
> returns the stale data instead of what the CPU wrote.

I think this is right, but a fairly artificial scenario: it needs two
descriptors open on the same test device in one test, a migration through one,
a read through the other, a CPU fault back, and then another read through
the second descriptor..

The fix lets the device private page content be read without an oops
in the context of one fd which is an improvement. 


>
> The second descriptor's entry probably needs to be invalidated before
> the backing page is freed, and it'd be nice to cover a second read
> after faultback in the selftest too.
>
> Thanks,
> Aveline Noir

--Mika

