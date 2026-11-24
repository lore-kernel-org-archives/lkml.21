Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491749;
	b=Efe6CPvqVoE2cHNPCnrZA5q7QGSUjRZxh2zJU9UJIPPoDPi45J7qUwYgUUBiJRi2wNnO
	 Q9UdciiecCqfHrd2GkesxIU4ZafRrgpWLsSbQNzi0xNBI1xzx8pek19R+GUomZPdG7Upx
	 v9hONnPE//Jxct6P03jtKNCj0bY0IjcSuBbIVtqZNv7x3SicrUdu6GztaT31AsE9BpH/o
	 jSZMJroRAcDFpVromlGzvvIrbugZAOaKdoul0rKpHlzoX8MnOATcPWjUKztF8/0e3h/x2
	 HBnTrskniOHhg+2AWw+NAgt3gekscmo6zDMzYZWizDc9qP+FMxRfT2WsnIc5qUGRtnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=S/F+MCw7bR6+e+AVQ1jkNmq1hmwkFF7J17ST4v25tIY=;
	b=kM1M18AcrNn3Z42+dsEnPGo9eh9ORSdVk/6vvq/jKXFyLF7bVKHbdy8xDeENq2UEwSFe
	 xTI62ibD50/NthY7PWDYJZEgnjUf8ZkdOVcZm1V/LxZWmpUwKzhva/DNZ4b+zvcnDmnCT
	 ym2fwyDXarcAMkDsFfl26oCmUfwaL6fqgCjmuJ/U1Q9Mm6sHPTzk2LU7WicIvm+MjuwQq
	 8Csq8ijRHXYx0p5yag9OSVqGOJcY06Ad6i5STAhvxwQA1EiTxVLYhW8WRIi000hd9sG3k
	 oSaSU38yee0fnklu7HGv/TKrhNnwH2yD+Q3KAU15AihLUAcyG7opqi0T/WS/e2BbPeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sM8DjqUp;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA99E606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA99E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sM8DjqUp
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1880443b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491748; x=1796096548; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/F+MCw7bR6+e+AVQ1jkNmq1hmwkFF7J17ST4v25tIY=;
        b=sM8DjqUpPjrUveXjBFI44W75N4yMd77IwfvFPmztqoSFwCm+AIvmAaWkqlIDo78S3f
         XWUWdHeLQf1pqkfegkTPM7T38bJHayJukaV9c+iZd4FJpnwcZSypDbRGsowjzTMqQ9Wx
         opfBgxF0L4oDgb7B4fBKRrz1YkgCLPG8hpmSxftHYRWd/OUpgQfm81H1EPVICw6mU5l1
         qZCTlT7H6Ac5YKaG5ZONE8nq5T9NbRZ6SDIsrf/jspiapcRkA8qrhFy/cMLqLxPcY6I+
         dZPrWCzWk76rLM7+TEm9/HOKaI+0X1tknMhUrkOXjpxaU7FpavrZuXVJFkDyVw2+41Ty
         c5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491748; x=1796096548;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/F+MCw7bR6+e+AVQ1jkNmq1hmwkFF7J17ST4v25tIY=;
        b=LzAwF5SHwFfqLmQXFeNooB8oZ7rs6eeyzxvR5HJZqH8dY//hrCSIlULPitnIklf8j3
         Bw9PU+te0IAsXbt5hzYNLE5U4q24lMPk9gKJPA5S051Ypzr4GVX5fbOahPgENGXdIc9P
         Jp0XRP3bQe0NWWKJ9g/eAafgWBIpAaEYzRh3V4KMh1YGILFnooSoDS8xvZk8W3gYlVBP
         2JcgiZWH/QCZ234pDx+g8XvaXjCtYlQ5YmrW/1P4V6L+Qb86TIzVdpoIsH4jNCBNA/v4
         KPWgUlT4mRvzHOAyR1Y6c63Lp/OkBFBXu5sOK8SUbVwmFabdO0bOh9LVFbClsehmPSFd
         7gTw==
X-Forwarded-Encrypted: i=1; AL+hErGhYu+F9gKfHeeuN/AlBTs9iEUEWqyqv233G5r5WkDc93YXLlOfwUTdXmB6ReYkU0JTHYTCHtMO0ej6pPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gv5ajM0SiasFR4l+EJ7ShPFt8TDB+BixcDR0ll4nki/YEjWg7
	a/I+WLwiltwOG1NpdiahSerk52nflxZxHvfHTyW5MigadXuRjfPR8+vK
X-Gm-Gg: AZFdTZf5WsM3QNL8hDsQEDPGy7o2/zeynpavBLDmiZLO0PyxmU99DilFt5TyM2UYpKb
	O6xN1FUMUYGJfjKY8mAr+BS/07Z02irA7UyfIy1gtCaLWVDSaKE1XvEe3m2zwWDYZWniudNuIvf
	ooSscjv7zmGuPEmwmYFbGgegDnzEj3DvV9bOG7Tf7/k57wdynTFIF9/xpBmvphLbW/PFworbpxY
	9So2YkCgODAhEI5d8xO89gn7/1/QoJpxO0heNEeZHxb52O6t83nsMLUmkYwcDeSIKQZoVSDQfeV
	NcVTLnsHePfiGB25+wdTgTaLbMm7BHp16+6oUvmYNK60kZx/7l3gMUVqWnsZB9w6DwtDMboCpiH
	1C0ioIiFaMM0RL0QtxZqduyaVyxd+QqFWf4qdUho0gxps0FOGJml+MtJo3hGPm9iBB08PXQCI+k
	pfBbHJULIAWyqnLVP01GfjtuU7yreBRRJAN1jXwzMZ5I1DibvfCHZSrd7/VvL/MfO9kVLSEcZFd
	O8dPwM6b0bsRmKztvEatvI5D/lL8VwaVS9qEgaHGMOgJaMJBBZZuCiGnWmMq4nfvMcuyFOA/dWS
	tOYH+P9QONPH9/BQn41tZO7kjqtWCsVUAdeAmQQmTD+QJif3oAIftfyNG1gKsS/JUYRVmqD6Hd3
	lSycd8oGVQlMyGWSUASj1Vj58lruu/alNgwGFXKJS5KS6+PIFiWlRO8WZ
X-Received: by 2002:a05:6a21:4d8e:b0:3fa:10b3:c8f1 with SMTP id adf61e73a8af0-4014d25ddfbmr11385972637.41.1795491747709;
        Mon, 23 Nov 2026 19:42:27 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde9bb05981sm1025698a12.26.2026.11.23.19.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:42:27 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 03:42:26 +0000
Message-Id: <DN34PDK3NDWW.7JWY08DGJX89@gmail.com>
To: "Tobias Philipp" <tphilipp@gmail.com>, <bpf@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Daniel Mack" <daniel@zonque.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: Ensure 8-byte alignment for lpm_trie map
 values
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261119155317.11469-1-tphilipp@gmail.com>
References: <20261119155317.11469-1-tphilipp@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 19, 2026 at 07:53 AM Tobias Philipp <tphilipp@gmail.com> wrote:
> In particular, for an IPv4 LPM trie (key_size = 8, data_size = 4), the
> map value base address is always 4-byte aligned (4 mod 8, and either 4
> or 12 mod 16). The verifier accepts 8-byte atomic operations

Only on 64-bit. On 32-bit that value is aligned today and this patch
breaks it. The node comes from bpf_mem_cache_alloc():

	return !ret ? NULL : ret + LLIST_NODE_SZ;

LLIST_NODE_SZ is sizeof(struct llist_node). That's 4 bytes on 32-bit.
Offsets from the kmalloc() pointer for data_size == 4:

                        64-bit        32-bit
  --------------------  ------------  ------------
  node                  8             4
  node->data            32            20
  value today           36, 4 mod 8   24, 0 mod 8
  value with the patch  40, 0 mod 8   28, 4 mod 8

arm32 JIT doesn't support BPF_ATOMIC, so the interpreter calls
atomic64_add(). That's ldrexd on ARMv7. do_alignment() doesn't fix it up.
So a 64-bit atomic add on that value is fine today.
With the patch it's an oops.

> A standalone reproducer is available on request.

Pls add a _small_ selftest and target bpf-next.

> -	u8				data[];
> +	u8				data[] __aligned(8);

This changes nothing. data is at offset 24 or 16 already.
The node itself is misaligned. BPF_F_NO_PREALLOC hash and rhash have
the same bug on 32-bit.

> -	return found->data + trie->data_size;
> +	return found->data + round_up(trie->data_size, 8);

dev_map_lookup_elem() has the same problem on arm64.
It returns &obj->val:

  offset 48   unsigned int idx;
  offset 52   struct bpf_devmap_val val;

The map is read-only, but the verifier accepts a 64-bit load-acquire.
The JIT emits ldar. It faults without FEAT_LSE2.

pw-bot: cr
