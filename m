Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000062;
	b=w4IWAmWZNQqG5E4edsLNMWSVI9vH1NWveFigjRVr9d7cL8CRM3cFATBQ8VZ9w6WPGNiF
	 n1N9ZrfskQj8WxzUmVaCoEKmAIMbuPWVrTp6UaXBrDXXPxIdckadehuR89Obsc9i9mjnO
	 j5bdZ44Z0vLsZblw9pPmp/7KHnf1xkbkJy8ObuOsUHTytBLq7bgT3Y+wFUGgu+aQt02Na
	 NbLrcP8oGvzZNc780JUSaHm3Dl6DbY7iaPWM9YE55SmZbMrswu3kEYTl8xbhja3phjuB5
	 3SPfAfU/X5P0PIuHsxO76kTJ9p2+xwlOBkodtBfYJFjpuSWkVqwnh58ZmFgn8KWHbww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=2Pa6D5jNmLHkxjKk3dgAW9SP7lKs94RaoWLtgWbGlqU=;
	b=cV0zlcClXb4UoHIIoiEbArOLrwuIYUyzNiP5X21ChRhZavQTxzXaQdm6wi+JhCxjB2cT
	 /q6W2UNg3Psso2GSCECP6YuDBhgEsuIFDoKn+cbgx+ndPfKDsYgcYATlm/IB2sHSyu6lz
	 VWjCLmLsAceKgXsrIcoYNkLvuGJooWf40QKHQu+11L22rpk3fb3J+PAwr95yBAFlKIS3E
	 AfS2kzpltUZFMcYpfWfvUYprX7f5P7CSF7AwfunqgyOE6Mh9gGrzlCPtGNolxUDkTPLhT
	 IBHDTy4bMXmUhDmkQLUnljpjm19slLX1Qmn9T4wlZf7Ia0Ff12yjRbRQNDlv/yvgwbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihbZp0kn;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5B9606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE5B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihbZp0kn
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36f8cdd30beso244563eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795000061; x=1795604861; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2Pa6D5jNmLHkxjKk3dgAW9SP7lKs94RaoWLtgWbGlqU=;
        b=ihbZp0kn1hi/160Ef8aO8WEjkDW0xfx4dHHZBrSC4ft9WJOgGZYLrGjCwz5RsI3Zmc
         bCaOMNKUslPvT9UeZlH1WA1VrLyPszR4474lABqlrJzNg+gIBnnxkn8vAgOviQfMttla
         CIvVKjT5377ww28/due7WbJdWyURLc1f+fLqYzrPU8HH1AYc7F4ppjAGsJnKRwWME/TQ
         xsoM38tnsmRerMqHYCAeHDhk+vhfq82bDWDVUkhpCrT9UOXbYiYqIiHSlN57uYelFsII
         JSMCVFpWzxh2CdxI0mheIVN40Lv9C4phl/PiWUgUSu6lTsmnllSCTDI6ptwp6IS0TE+U
         DshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000061; x=1795604861;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Pa6D5jNmLHkxjKk3dgAW9SP7lKs94RaoWLtgWbGlqU=;
        b=LJw1i6mVKHOljRu5SovF7OunW/GdqDOIdLrYXC0pHS0BgRPvMcQro4QusOeRpGHqUS
         7pF87xPfBCHbVu3zm7F5p86gEJ4B7Licx0MWPNCrdl8dhOsZcAi4yeJUBuCbDBywy6Ay
         lQJmv5tq2lzoloS0joEL2BU9nIYfaxOHEQFseTjfrU2sAdk7QYM5LYPqWDnIS5dHtlA2
         L8wUgrBS8Xhow/Xj+4goUJytgK+yZfbCFM9vet8GWZipMi/P1oeqKwSD+65K9J7Re5yK
         6hJ8hxVyXi/LzM5JJ4W1+9UdIZMtmvtKLXvJ6s2l2DZvwfB/4BYmPyPn9Q9rzM/zUIOu
         7OQg==
X-Forwarded-Encrypted: i=1; AL+hErH6xzGWVHtPLSwAlD4A+tV1tzCKMWye8siAY50KhiQvAfpNMsY/4QSRhuTKs/+xqUjXz+7zhUEOI+vscTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D9eapefv2J+An7DbZmjmiZeBJR1nvM4RsnR21yaH+s7vcJaYS
	XL4XEEgvBm6LpEcv633ziyjPGkmE9HYn6Iv3kagubvoqvlpuvBYaRGxJ
X-Gm-Gg: AYBFou3YA+nF+ixycb19b5LCLCA+8jVuLB65iv+E28MMbLJGBXB7P9HuRkbTbzb7y7i
	x42Vm2Npcbi4EcDUNNJ6Bi3b1ZZE40XDK4XtbsTtzRYwJJRu4E6Zi+hX9GYBch4EqP9zabl6Cyo
	LrNFph7uEwok6cOGOS+qKFmYPG5iVmWz/mk0veWWApG0W54dZwGTeMr8Mn+4IAbxuOQD79S7Zyx
	tKw7vmPTwvgajzxbcbAId4ru1WfXJ1N5qOOP2QW/yzH7GAiZFEK2QbcknEvG6QxobbRWP209a+E
	J9HUFuH6/wlZgxtTIoRD4Ovt15bJxDBL5E8MP2i4aKi2f/C/jQtlX7pFamfOwid5l/rM0tG+zvN
	PM5bHYWl2ogBvQNviskuJvJerg9HRF16BazDmNhARfWUig7uGhljWccCj/BWTY+XqOQo4JwaWWs
	SHYtA/EjCQM6uUsy0bQyFCVIDOlmDRIK2XaoKY/vz/dec65zJY9EQdFYk8quam2kKnPCzitOZJp
	9nEw/uoQBGlsRyCn1WYUfEI4IArOB7WJiNvviA33wjfSPaxQLIZzmQhA9tBmJ3NJvNPw9f6Q1CR
	Z0oDt+9ivYeZzEpuQ7WBY0OEzkA=
X-Received: by 2002:a05:7022:ea8a:b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b543be9b64mr2272814c88.12.1795000060528;
        Wed, 18 Nov 2026 03:07:40 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c1193sm5805783c88.7.2026.11.18.03.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:07:39 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Haoxiang Li <haoxiang_li2024@163.com>, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, sshegde@linux.ibm.com, jniethe5@gmail.com, gautam@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Haoxiang Li <haoxiang_li2024@163.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Free nestedv2 state on vCPU creation failure
In-Reply-To: <20261118101008.2242596-1-haoxiang_li2024@163.com>
Date: Wed, 18 Nov 2026 16:33:48 +0530
Message-ID: <o6bm765n.ritesh.list@gmail.com>
References: <20261118101008.2242596-1-haoxiang_li2024@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Haoxiang Li <haoxiang_li2024@163.com> writes:

> When nestedv2 is enabled, kvmppc_core_vcpu_create_hv() allocates guest
> state buffers and messages through kvmhv_nestedv2_vcpu_create(). If
> the subsequent vcore lookup or allocation fails, it returns without
> releasing those resources.
>
> The caller's error path only calls kvmppc_subarch_vcpu_uninit(), which
> does not free the nestedv2 state. Call kvmhv_nestedv2_vcpu_free() before
> returning from the vcore error path when nestedv2 is enabled.
>
> Fixes: 19d31c5f1157 ("KVM: PPC: Add support for nestedv2 guests")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

The fix for this is already posted here [1]

[1]: https://lore.kernel.org/linuxppc-dev/082c338c69773a73a48cd4e0d0885ee0f6ef5326.1793546707.git.ritesh.list@gmail.com/

