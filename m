Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834402;
	b=EDcTnt5/DjKtMQnIqiVaKzXmiSmgGrni7CFg0nMaw48VfL/Lq2ELvP0O0jv5/sSXpnl9
	 HLYhUd32YTfClvTXjbtyzMgW7Nfu1NN97BepHKtenpL7Xy6Xmdlz4lWOEKQHA4ic1ORy0
	 25oMwA6fWyR54tC22H1jtLrhjwU/LRXxe05BFLKu43eJ1ErxFGFF/kV2SGjTCK2SHuKds
	 0JIdqkC1OlcdkjD7HlIzYWyvDlkh7Q2KJi00rKhe4HZMGZ+CKSnuLXh7UHF0BeSWyqWW+
	 JIGPwUfQLkP4fjkD1cskZJkgH4ipQg/1/3ifI+doyaqvQv6IqNwGCh9Q4k6TRg8tSmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=R0kCwO2dA78O9IErWGqjxytV2TbDnWKV61Iue3IYRdw=;
	b=30UYKopNHoY40AifUIEgqhu/sGq+1HKa9O0r+UYoBqhCa7uS+KH9jQQT5FAsdFblzYK6
	 jvihaZ+Lx4aDM5Zn6sgxOu3/+VniuymEUlEnI9GMsF9BOyM+FYrXVL5ZdwUVCTs3b5oNg
	 5XRHTK/9yIewKqkjSupx62OHH6PmC7Y1qb281Hb99HeP/uwMhA8HqYoOtCV2VdP3JxCBm
	 DWPjMTV7uboNFm/d08V7AV7NsABk3e38TjjcP9+xHKd6m0z7UtXFH4rM6O1kU/SZDmESN
	 UbY0pW6gLaprx1Ckwx2HsRXAuhpRBPQXsX4lLOCL5HcCJnI+GGMNBsgfb1nlts2kr8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xz8iIQwP;
	arc=none smtp.remote-ip=74.125.231.201
Received: from mail-oi2-f9.google.com (mail-oi2-f9.google.com [74.125.231.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE90D606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE90D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xz8iIQwP
Received: by mail-oi2-f9.google.com with SMTP id 5614622812f47-57391a89682so2490073b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795834401; x=1796439201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R0kCwO2dA78O9IErWGqjxytV2TbDnWKV61Iue3IYRdw=;
        b=Xz8iIQwPrz3UXXC7kRWAAxzvKVj/HU7EAdERFZunkGhTxzrDkFsAWIqJM0+E4/k7Vu
         yjDrWroAYQ+pKfzA17gl6LuEHH0huBIide5ecTQEc9tu7W592QR6Rvvob7UcoGVFV1VS
         Jhz/HjFsmHeRgwzHzhK5JhZYOwWY0nPw+HWcMxff7G+L/OLkc9bjJ4XmUwiHYoWlndUs
         ehplCIK6cWT7AUo/TyY2ADJLkg0dhxfcKQFxfas9/pK0aQHCiL4UU1FQ1Zs4ILwJLdU3
         aMkWa3w/krHXD9qsSFnX+fY636idLG1l11mf4Ymm1C3E0EdUhHJysCvBGuVw9zKT6f5m
         XQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834401; x=1796439201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0kCwO2dA78O9IErWGqjxytV2TbDnWKV61Iue3IYRdw=;
        b=ilxcuup3LZPVjHHpJWQE2e6AXapD6dLKd2IbDvCJ/MbxDwWBRcvxwCJhfGrA0LbP1s
         t+AKe4vFtC0kj/g7iZlPB3LR3HNJO4jT5EcCHwgKfC0ca7KTTLqNKgck34MzMXZpgQrQ
         gbbFTB0r9/g63UXJuNyzxvgT5QYx/WemCPIfrP2sfYZo61QfWZDd0rOfM103pINa3jp/
         1ggxZxlM6vqriTmushSt9PFIVELzJFldZo3F8H/ZYkYIGQi+Y3vl49JY+QXahDuIUwY+
         oNnKWhP0OYJSnn51zERUIuqvVb4ncLzA/YTSPKNpTGwRw2ZJM3tE7V/CUO5PnNP4jBCm
         ObFg==
X-Forwarded-Encrypted: i=1; AL+hErG4eVfIw8ySz+d6sYp/QcsqNBCFuFcRRAOZtMp8OVgdpq4KxBLMgTsRwj09TiR7E7gvJ/vkEQRsU8H+w1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z84XXAsKIBzVSs2tLlx6NmZFGX6uqIjf1YYHGvnmw/AGAFtjUcN
	KTOSgDkEDB2KcDpMj3hRj5UWKHVPTBYCErd5kBBC5muuKzR8aMfXIw+o
X-Gm-Gg: AZFdTZeg6Q6oAAkprwwaSZmMaLuQwBPYRX+OGGU36VUz+Zpk8ylglB+I+9KAvC4DVpF
	gYQZfTDDzTva41f6KU00WkItcolI6XD/XP5+h8N+sD2pCcURCYIDJv4VMYxsvgKjqsQmENG3DWf
	5VfqCSkR09Daywkog3mQXDv4QKc5dZwNW+SN14vZWuaMklQLtHfB56+ATlKNQlkqDpdeP6OIN5Y
	gtME8U93mhp2bnyUZwdxbI+zbOhNObCQxlqGo8szejj2PYbsVyoJxWdppIwwpF9dK8Ym6Jlt/rh
	sXATDNqPrFOJc4S0Hw+7bbOLHFq3DvQjrzfdoWfHaeNh9WVAlykhZQ3A+i8h7dBYPW8m2koHTGu
	0PirhNselIZmjbqN4oO8aO/F0vmuuJVyr4NE/Y17xbQnuH4RQHc8gXve0CMjHZvNXwA/f9jtUnc
	Y+aXMJg7Ju/oT+xHbLY0noYXWp0nKqM0vkq1Yj5GdTw8tT+o9ejJOeSJd1tR/SNGywvo119xkso
	X06wHUHFfww/r3EnooGK3cOXZq9XshIRxoR3x4Nl1wF94XSuZ/ozzICb6Ta4tVV7gr3/c1qL4Il
	56foui154MBBDG6hS7/YmeACg0qOy3XnH7YtbmvK/hNepEWg/wMajhBqdtVJ1fb+0IMEyuT2RO5
	x7LrTFD1D7HpzLfVxUOodgKfEgZK7m7udMIrO
X-Received: by 2002:a05:6808:c3ee:b0:54f:c850:fa53 with SMTP id 5614622812f47-57a0891786amr30906094b6e.17.1795834400878;
        Fri, 27 Nov 2026 18:53:20 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:44::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc55895b9csm21381575fac.0.2026.11.27.18.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:53:19 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	kkd@meta.com,
	kernel-team@meta.com,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Puranjay Mohan <puranjay@kernel.org>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1 0/3] bpf: Do not follow __iomem pointers
Date: Sat, 28 Nov 2026 03:53:14 +0100
Message-ID: <cover.1795834380.git.memxor@gmail.com>
X-Mailer: git-send-email 2.53.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373; h=from:subject:message-id; bh=7KRdKeGEPtd7wqWnWHL9bmdrZHoQfk3ywZxqsxMmWK4=; b=owGbwMvMwCXmrmtenRyi38x4Wi2JIZvLiWflNaM5dXPXfZC1q0sP3/x98X674yvORjz5+tF/8vaF M3mkO0pZGMS4GGTFFFlK/u9jMj5R+TvQdhk3zBxWJpAhDFycAjCR9bkM/2N3/EmqMNwWHGQjc0ry2B cRz+kb3t+ZFGjTrcCqd8nqSC4jw4ZZWiJe8d2zfTZ3as9+KFbY8p6PteTrY02n6E+/u1o7OAA=
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=B34BD741DE8494B76E2F717880EF20021D46C59B
Content-Transfer-Encoding: 8bit

A BPF tracing program can read a device register with a plain field walk,
for example mdev->common->device_status through a
struct virtio_pci_common_cfg __iomem *. The load is a PROBE_MEM load of a
mapped address, so it does not fault and reads the register. Such a read
can have side effects. This came up in the discussion of [1].

Patch 1 gives __iomem a BTF type tag, as __user, __percpu and __rcu have.
Patch 2 makes the verifier hand out a scalar for a struct member, function
argument or return value with that tag, so a program cannot load through
it. Patch 3 adds selftests.

  [1]: https://lore.kernel.org/bpf/DN6GS9V7A3HS.1COD0JUQQDHQ@gmail.com/

Kumar Kartikeya Dwivedi (3):
  compiler_types: Emit a BTF type tag for __iomem
  bpf: Treat __iomem pointers as scalars
  selftests/bpf: Test loads through __iomem pointers

 include/linux/compiler_types.h                |  2 +-
 kernel/bpf/btf.c                              | 15 +++++
 .../selftests/bpf/prog_tests/btf_tag.c        | 55 +++++++++++++++++++
 .../selftests/bpf/progs/btf_type_tag_iomem.c  | 49 +++++++++++++++++
 .../selftests/bpf/test_kmods/bpf_testmod.c    | 15 +++++
 5 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/bpf/progs/btf_type_tag_iomem.c


base-commit: 71ad211eb086d0f8fc7ae595a37943bed58cad6f
-- 
2.53.1-Meta

