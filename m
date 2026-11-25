Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795633171;
	b=zwOgbzI2b/SVEofmFZRs54fiLiqZ/VHVMLOBkxSrt0hPgyeBxWHdKaHte796Ax4l9b+N
	 4ERzuClBwpxmHWb+DUSWmPVRjaK8tyI38OCkolKtOxov6nsbjVyUa9QIpImkEwnwdOaAv
	 QR50KEtKGrwJDIcJA2hEhWid7U+XZva7D5uZ5rRQT5Ldy8Xd0/qrKl4O6J5pPx1zuER8p
	 NxlCXMNzuTMUy50iuA1505HcI5oBOfBXFancJgi/Oq5i0v2bUd3BVSKLxJ5GtOq8xlDEN
	 oZa08zeGxEW/zXZOj/7sMDjqdlDXE3+LaK8rOd6ITGMRluusuJ0xEvk/1XedlFIZRcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1+zx8F9i7Ddd71HeQ1FN4vj1dLIYYZqL1wTxgwGVmbw=;
	b=bKy2cJaC2AADLUmf5ZBH968XXNSxBirXdvdLHtXhBGASFIx5WmEOwlUVJRY2ffI8h3AT
	 FIQPDBR5byYxSB6Qk5Vicv40cINgK0eQVc98Ppg4KTEO2qN/N7aJBcKB/5Ix4BOo2+1Rp
	 CB8KmCg0cKhbUQWZq+AaNccdpK7hj+cyOULQms9aJsqacOd7qAvOBDkQakeVe6q/G2itO
	 HvWLzg7uvCLE8SQa7E+P2bGvb0CoilM46HhsJztmAfNMYsgU54tsauHH0c+m+KTnEAqKZ
	 iluBp8+yhNtwubZ5iP3AA6HbmKKLwmd3W/Z2XzTf0NogbdG6TzRGc1/yOJPXSi5jmgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjJTtk8T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97217606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97217606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjJTtk8T
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-380c28f9e35so7248084eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:59:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795633170; cv=none;
        d=google.com; s=arc-20260327;
        b=X0uBAKYibnNDV04RzUnLLiO9X2t0FsSX+3PuBXXPQlOgf7ooLEhyJnGtlU87md8Nfa
         whwl9l+0jvwqmoMGZ8xjrxsyTHmqcmVhlIxYb4ZgqjZdWWF/3zXa5QbsNaz388GUKpyQ
         m/yRaFhE7TpQGUrtMdiCKij/cdOLMVdEZaJXUp3lLH4F2RrFhweZ1kDbdHX8WLjpi/ie
         pRXLQlG+1q2eJhA78WSxbzebU6cImDOdfPn6ALVvRZccm7FaZp0tUws5WpKsRfHCv1NR
         Q1nfWCNl96WRIDRlCWKD9JE0bbxQDZMc9yZr80hJGruKTX3sXwOTZzp4eON/hWjVW0p9
         FKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1+zx8F9i7Ddd71HeQ1FN4vj1dLIYYZqL1wTxgwGVmbw=;
        fh=7TzN24F9YQJ59i8ogWuOckkh/QWhNQeZ9Cu+inZ+6LE=;
        b=Efpm8I2wETzHW9tUPTorpmec7I3/WPZr3/1hUF2TGg9qg3JjkFu6+4A8rqRqSoLp/7
         qMEKHy5OaqgO2Mf0CUUN6/STWW1HywNf99Y+8mm4ENMCCmEHuT2hM2tzmI+mgpIGHM48
         bk6Tv3XZ8oHvLS6ed8IWAthdhSjcbgIZQ9bhuVjHPWsd4sSeBrr7ikUJBBnIJmM60kEn
         xQSnqw1JJtn4dTPsB6TkLnT74K5u4xQ2ryHZdumY3mf50vmclYp+SgRluX79/N/V2IRl
         bIQY3M4r4JEqLCc+tgaFfUFq6P8rxaULQt4Ykbv7xe908zrutJfVdKMX3V5I+pPQY0Ki
         hqEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795633170; x=1796237970; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+zx8F9i7Ddd71HeQ1FN4vj1dLIYYZqL1wTxgwGVmbw=;
        b=RjJTtk8TTp196CJdPmKbRnLMWCfP85ERCGB7ftBRwpAYbqd648Iqa1OEGINVYG+Xm9
         YhK/24TynMRvXb4eK0haauq92FuoR4cki66oxR/zazBu1bq173k4FgvS2RzzqEcuk+2g
         Ve6jXAKYRgvkmeopmNxOpnW89rt6xpt7OgQrw5tdihJFgOrAP0fa6WD+uFWXyfUzgxP9
         oNG7tDPIfKEcPvPEDaDOcYN0azBEHEtuC1oPKR1mn3aVIrILgh7mNrMs02m/AqGYgWQN
         7cFEZBZHKzdIh11PHX8R4UvIlx7bhkPlJErwZDVwYhGBEVMl8HZbtihUTcfefqg40SjB
         rVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633170; x=1796237970;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1+zx8F9i7Ddd71HeQ1FN4vj1dLIYYZqL1wTxgwGVmbw=;
        b=vLtsj7RGB8vltq3vFGPxroRJ7oiFLDgEZZ50/u5v775562xREN2MqxU4iq7BNWWVlO
         40t05boAqEtwcYYG0O908HslzSQYNQCQ03hsVUMJk/c0WReqDj+fIkAsjowmIHokr2o/
         iIvETRQlSDkio8EkEwNMAKnSUzlWwbUl2o/jKj79QmqGPG1HHigiuFsn5Iy07d3go+GZ
         zGCznVIhOHyhdHNbDjMMzPIKRAWNc6HQ/P+MiOUL9Rpnv4A6WLyY07bnsiq28aMgTHKH
         S1gwliNhBNN51uE59L85+Hr5E6kU1aA3lR8t15gMM5GyLxa95SqSFjXwplbvQ7asF9Fz
         jehw==
X-Forwarded-Encrypted: i=1; AL+hErEBtLyTD4GHnZbZxV5CZo+GioovMbJNLONpRC59tulm8BxWgIli5HeQGX9GfuiPC+MQ5nsedoHzFnGTbl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ugBZylI6moQwVsx0iq/POCI5fGMAUCZZlyLy3dCJOX3wu67/d
	eMT6OyWfP2VRN6FVnMH894Sbc0LOaNVcoXImc+ZHbqflJWCFiwKGDK/GpkChkJj9oGB2yAItCt5
	V/Y3+NyAX9BNZNx2NArpKCb1/3MlveTE=
X-Gm-Gg: AZFdTZdyYkvdHOV8aEv+TKaHw1opST1flRexsB0hkYGexd2dV7O4VKlbSfqyv9VyI+G
	T/8ZYI2HOXQJZolgNV+mRof7Or8C3BOZbxkTCmSpA0cpCx3JiPmQWZRTDwthkpF6yPcM6Go+xzk
	/uQBjkcQN0mGF0L4qneWQqG4bXYExv2IjVg7KAEZ9j2jCp0Q3jVwNvn2Gq0eAhCOm0nB7f69jZ/
	uAopRri88oYp5XCvF7Z/DNJOLCMnGhIX2LiCllmRJJO1A4yk+ZpYdig2KIH8/HZnCnoc0XEEjym
	Y9vnGuPXtiZslBmeHN0fhqU6OQe9jFabcEgQV9qPd6fEvfATkb8ZtpiKhQimU55ejRtXR1SloRe
	7ECjeNvNo6dL07+XLFi7tgqBl52E4SGXxKJo59uQ=
X-Received: by 2002:a05:7301:182e:b0:386:1901:d994 with SMTP id
 5a478bee46e88-3861901db11mr17194026eec.5.1795633169382; Wed, 25 Nov 2026
 10:59:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <9a97a64f7e7aabc668499c426a2417a77d13a2f4.1795587203.git.zcliangcn@gmail.com>
 <4ffa6613-119b-4eae-abbf-26134bd60177@kernel.org>
In-Reply-To: <4ffa6613-119b-4eae-abbf-26134bd60177@kernel.org>
From: Zhengchuan Liang <zcliangcn@gmail.com>
Date: Wed, 25 Nov 2026 10:59:18 -0800
X-Gm-Features: Aa3M54pzbYFgnke0SAVivzQ8DqG6uemznWha_SeQH4FCp0m7Qoj90E5d4jnuXgo
Message-ID: <CAOny8psx408zqVv1xt7DHN8yYkQksjKZFDQCJ+AGFB-CDN9SmA@mail.gmail.com>
Subject: Re: [PATCH] mm/hugetlb: stop hashing address_space pointers for fault mutexes
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Davidlohr Bueso <davidlohr@hp.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I'm not sure we care about this problem. I'll let other speak up.
>
> Attacking hugetlb users is stupid. This doesn't matter in practice.

Thanks. To clarify the threat model, this is an exact kernel heap
address leak. The attack does not target another HugeTLB user or their
mapping. An unprivileged process creates and operates only on its own
no-reserve HugeTLB memfd, even with an empty huge-page pool, and recovers
the exact address of its embedded address_space. Since that object has a
fixed offset within struct hugetlbfs_inode_info, this also gives the
exact address of the hugetlbfs_inode_cache allocation.

KernelSnitch (NDSS 2025) demonstrated why the address of an
attacker-created object can be useful. It recovered an mm_struct address,
freed all objects in the corresponding slab, reclaimed the slab pages
with msg_msg objects, and thereby learned the addresses of those
replacement objects. Here an attacker can similarly allocate and release
hugetlbfs_inode_cache objects by creating and closing HugeTLB memfds. I
have not demonstrated full-slab reclamation or cross-cache reuse for this
case.

https://www.ndss-symposium.org/ndss-paper/kernelsnitch-side-channel-attacks-on-kernel-data-structures/

> Can't we still end up with the same problem, just slightly different,
> afterwards?

Yes, the timing channel may allow the per-inode seed to be recovered as
well. That does not recreate the address disclosure: the seed is neither
derived from a kernel address nor used anywhere else, so recovering it
reveals only this inode's bucket distribution.

A simpler fix would be to replace the mapping pointer in the existing key
with mapping->host->i_ino. The inode number is stable for the inode's
lifetime and is already exposed through fstat(). This would preserve
separate per-inode distributions without adding a new field.

I understand if this particular address disclosure is not considered
worth fixing.

Best,
Zhengchuan
