Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147881;
	b=tzsv9ZVzWQDmm6c+KsrndeUkCiBhiSkwlHtK+UoYXYUVibou1L2ZqoAcn8VtU7qyLGbi
	 kVUAO+0u2zYcKOgGosQsxe0YfWafgxqo80LWEL21MAJ7AR1tV1D7jNQ6sM8HXp/4tGdKy
	 yGdRybSxJgtsSc+wGChe+6kXXIEtXwaFbMfl3GJeyq86/tsXaYQx08jSzU02LoXqfojKO
	 Q55kT4Gg2G4C/HDtlkdHkqzEnChh52c4X8Ua88VhcaHz9NrAk4cJO9Zs8ZBUGRqXWtejL
	 G0692E1ZemsF59ryI61n6sbDeIP9EoEHk+1U0MvHolF9qX2+vKY8+VvJd/jgoD6OqVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=Pj003ayJ7Nhn8ncb6ekHETw8t8DvYn5mtqcaYdxA9gY=;
	b=n2qDX31sOwtWtRBNrRK8fXT67oPTU+8jbpCwdsmXkwcTRTBALXB3VRNS2MEtbuuOtD6Y
	 tMKC5oUJltGIE48vr2Cmk+3uxleZaibrIxGGZf/GoN/KWaGvf6+NLIY6JBcAmN2KZtS6c
	 MyZF5wFOwbovTRR6cLJVp+yp3m7HSQoxM++NYCLfk1EzVw+0ssBsSKIwO86n+2+wiw/xS
	 DP0W1cdo5cXOu0PJPZBjl0ZPpK6RvZrK8sfp49LouyeARLEGuj7VgMpcGm0D6z3ON9sdT
	 auHpcxGqsp4Jt2DuZWRpRM/m8qA86tORJq0X9K1Vqze6P3pqCbC31DXiVRt+fvGRcjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C5NrcUzz;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAF6606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EAF6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C5NrcUzz
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a315ed211so489653eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147880; x=1795752680; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Pj003ayJ7Nhn8ncb6ekHETw8t8DvYn5mtqcaYdxA9gY=;
        b=C5NrcUzzjEeh5N5b7MJ1ysemqZIEWwGi/rQnUUquiOK/UZiz3N9ayMe1qHV7/3hIhK
         lGlarHUH5G5QU4e3sssyJirIPNqXEQaUD4hr6kxHy2z7fImPMeKYvxkHH/zCZo+iXaOC
         POsghlSsyX8bw6cCS6UYsgmd9kCqKOr03rPuFpZTAp0SRSUgF3XG48O3IJXFaB1dT/X+
         vHLGqVVcn0RKgP/PFsKGN45lPVN6y18bq1EsXHhtsYbId65hyIDzPxPRha3kdPYxmBEJ
         DkFdiH/SUvVbBj7UFpoDRoF+VGNNPDo+bxRABaKkekSt451YS0LtRX/EuSmVuEv3CNXr
         2izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147880; x=1795752680;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pj003ayJ7Nhn8ncb6ekHETw8t8DvYn5mtqcaYdxA9gY=;
        b=bj8RVLY9weOCdztFMvzO+o3SM+zpXR2gccuTymX1X+av7HpVpv80JXNQP5svc4ZLlJ
         2SZGAKkwJke9JgIKzzPaKEXSOJ1qlFwfQvdU4c3JQVt5FJH5c/3jVwui2xRGHwYtLdE7
         aFimXZPjKMAtoaEGIc8+Rx2ip8VLey/hsnaZyC2tpqVHaJcqx6w5QxL08/v2D1wmMzW6
         TqrNmjiVxljC2WG491/4TFqrO2OFheEbNPoO9TeSjk0clE66I1sZdyRbPoVKrvTlOuDc
         T8eHTY1dZVFeUCGF/JCwPM8xc3MI8eXJAzkSIss9dUkETxjYGCj1psBTnuwRGB16+8xl
         OcVQ==
X-Forwarded-Encrypted: i=1; AL+hErHOa9JLvtv20yEx2thuvZ9mCZ4FMsEiB/kd4UvJwRr3dD5FWFcR8oa56585g8z6FP8i1QbvYa9YWqUE7Mo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yhwuHBKZ+ETpPQG/cu877x8v9LRHnpz14iBC8YmmZKo+q+Kph
	b8Div25TrAFTQufAjB1eAE8WqOHSBeoD8v1QKJS8kgsNp8ZiqrA87xAF
X-Gm-Gg: AZFdTZeAAlc8gcaBU4Zuidhz9hFwHUpNBxhusZ6OIVYGKOO9ZOsAIrV5j1+NXCNs0v4
	cJNTm5GTzBVs+KOdZAXH2Go3UACXufIbuWI+Fl5JdJXYkckJTPxZbi+6PPapr67v3iPinQRhtxr
	pkNEga1pHtrYnQkT/p6PCqz9yDbj8NC0c/yo5cDoMb90Uub3wVZJQwkGOw1bVI+NY6Dpe+sl2hf
	hypuXHrUUxJa8ERvmLN5fayvQQbiL5JvDOiSdNednz/oy/vnnU1d35Tr2PRzEOjVOxi/Ye84FgE
	IOwOGZ31nnJOh5Sb6/O9eYBaZlAiuHQqkNsceLJFGIvQhp2oYMMySlhp8zArSM40nyXiBDGtao3
	y2BfalHBtnFxoQbth3e/7Y5MpkjMyG3IEUrGpZT++DiFYN3p/PIHQVmwzpZUFdDSCjANvLdXILN
	XHnFgxPXmGOHRxKRZv8Ir29f5s4YtGiLYGMeAe5iZ9kGatKvHUjwXxYEqb9E8wE3R7Wc4khRNqB
	HAiBwEiRWAtx7v9aktBT82BN5Grrf1uayHDZfLNNcqSLV7NJVfaeyL7TiWLbLt31vqkEh16S998
	+GTxkZqtPb6+vTWmfX+wYNHZ7PI=
X-Received: by 2002:a05:693c:25cc:b0:369:f17d:efb with SMTP id 5a478bee46e88-384b3e77699mr4201476eec.10.1795147880077;
        Thu, 19 Nov 2026 20:11:20 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646632b9sm3322697eec.1.2026.11.19.20.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:11:19 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Hyunjung Ko <hj351016@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Hyunjung Ko <hj351016@gmail.com>
Subject: Re: [PATCH] powerpc/papr_scm: initialise metadata_size before reading it
In-Reply-To: <20261119034745.1460361-1-hj351016@gmail.com>
Date: Fri, 20 Nov 2026 09:39:33 +0530
Message-ID: <zev4jg8y.ritesh.list@gmail.com>
References: <20261119034745.1460361-1-hj351016@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hyunjung Ko <hj351016@gmail.com> writes:

> papr_scm_probe() reads "ibm,metadata-size" into metadata_size without
> checking the return value, and the property is optional, as the comment
> right above the call says.  of_property_read_u32() only writes the output
> when it can decode a value, so for a device tree without that property
> p->metadata_size is set from an uninitialised stack value.
>
> p->metadata_size is the bound for the metadata get/set commands:
>
> 	if ((hdr->in_offset + hdr->in_length) > p->metadata_size)
>
> so a garbage value decides which metadata accesses are accepted.
> Initialise it to zero, which makes those commands reject every access
> when the platform does not advertise a metadata area.
>
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> Cc: stable@vger.kernel.org

Fixes: b5beae5e224f ("powerpc/pseries: Add driver for PAPR SCM regions")

With that LGTM, feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

