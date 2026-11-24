Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795545923;
	b=lF6k5u8/zK0XxU351GDCfa3Zq7fuWjaQybzuoFKCgLxHmNzb4fwxmncfCtSwQReSizSR
	 PNDrZdCvAV0whVovUSEDq7JihYIVYf4gPO3CpHu4pi0M1MPWLUMLHZO1l5LxwVkEHfv3g
	 +OSEgUMzcKLdjfJgV0iVzrPl6HOeMVvVHH5nHZ5mn5m9XX43CUIhYxtxOyvp7Gv9l77k8
	 09xDBhKLCSu2YCUecI1mD7/IH1LsUr5WtTH9ZrYSF6kLrecxN6aEXbblO51lkpHi4gE05
	 OINKP4GtF8Kz/glIjPoNzkWGh2gnGpzcebOLaHhGtTEtZHorvQkAcGXUcYZgfjyM1AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yTtmFC9qSzyqzhkMZ+nRiaHuo2O22TiUVuXKFLL5NIQ=;
	b=E+QQWhlUzsnp6yPTrpgavDv4rSe6xzSQ2cvnK9O8vyIDDvVcVn1QAAd2+zn2Ye4X7uYY
	 JBz3tCm6eC4SudoPbffa8upADXQZJe9tZsMunokOGmLei5+m8UQGbS1cmFxnDwB6+E17G
	 XLNJjbwkM5ztphImpzB3L33NmfD3IAO+x0/gqX/YP55uNJHJlU4LQElBuz7m4gbZW21mD
	 GXi4i+i7dayibmhKaqalTcUoeS2YPCSM6iF0pJaC2FzKQEOl92F64e5aetK3KPy3apknO
	 fykLxhGXptnzFjVicNyTmarFH42v33+h2PnEEebAZU17K2cJPJzUM3lLEp5Ez1B3BEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EVc0Idzc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919FC606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 919FC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EVc0Idzc
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb5b33e2ffso126745e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:45:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795545922; cv=none;
        d=google.com; s=arc-20260327;
        b=o6d4JIKSwpKwrC2W1JkYDvkzG8YfH+ojWSBLWgbo/mgmk73LDSRispoCX4ewT/ct0x
         wcwBYkRtpa6KYg0nwQePtsf0szHagSIypSqvgU9dhWlMLWMOmb8Cn5eJQO2/A/y/VcMs
         SRKQ2KdAEvmKzEin3PLHvXsdESL1tVPHOv5bXVPV13HefrqSUgu0NmhDdG7Lbwt8eAxz
         7hcI1qsbrbqJm4KY1gu2AdkwHZVQuNQ7o/QnmT6sFYhYs3Z20+6lVXgfv9ohPtZv633w
         UA37cueybhPzrsWs0j61eHCPwzDtcqEUzZ7PMmbCnsGAiZlLgrKmEHcqIESVKPQ6SMD+
         qUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yTtmFC9qSzyqzhkMZ+nRiaHuo2O22TiUVuXKFLL5NIQ=;
        fh=RyxZ8MFL4BUvl0yIifmDB8c9hjq0H55EZMbD0KN/tP8=;
        b=TTYtYnboSGZZ6UOKfYSU5wPyV/nsq69ar/KcUrJVmV1aP2/s2rNf1Xfg3mLgnZKAlT
         2Z7a2FsMSFQR588IRq6yUVRF3pUN/vgcDhgtS3KZuOH6qjq051wxUSiBo9YqDxU6I2mQ
         2KndiozM2vRQVYcaFVh0MEaxuEDN2KBU0bp0fBa13d5okLi3L8f3CKSy6VNhmQgqbtBq
         TIttUACzrButNO323WwQBUMGS8hl804E+8Wc3l7HrjqJ243a9TspIIiKzvuWmrM7D4Nh
         vwMalGVRSkYxCjLgPP4/QOlScbChLvdz3EI517rcFch4A6kPHqtgNC/0B7c9cfUYQyOF
         UULQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795545922; x=1796150722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yTtmFC9qSzyqzhkMZ+nRiaHuo2O22TiUVuXKFLL5NIQ=;
        b=EVc0IdzczLGPm/v2iU4n6hBwE81QsJ8zWG+yjfbboj4t5N8hTiOE88NKhVmJi2crtR
         HTXndKx4NydBQeufRJk8PsIC/q9Clfe8wcxX2IMKisD8MckBSGi4QA0f0kjKZTLytFDo
         sYNo0OnMyYwTcH2VqcD/FEtFlzIHABB17UKW7QKVuF454x/QcOHfBPIXEkv5azRuW00X
         i2+CQUYNWlmCKVBuIvlS+WryE6UKIqemHi4Q47djEbPNhXxsxa7+TqDozJxDxmVE9jys
         iNI5C2ahSuqb24t8mTZZwrpfkVPA054RYqPSVfONF5BUbX4rp/35PHmzO/gwEDN6ptZp
         etIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795545922; x=1796150722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTtmFC9qSzyqzhkMZ+nRiaHuo2O22TiUVuXKFLL5NIQ=;
        b=mLW+VTRZ3G3hKucjro57KPk42GxEGeP2tcx9mXy75fUkEcQb81mSrsOXv/63PW9Poj
         B6ZGWCie6PYUsVZHHB+K+u7Iz2LoyEDbYp/b7hj7MBSFZwAJti63cGQ/duwJ3TIgP9fe
         DrIADHgGdIgtx6RQtgc15Xb7dh4xVMm0koPetKV7mUSNQpytC9qOHaqvRNOdJDTudcXb
         jGZs3vpH97M+clEYkQzkprun/QWsQgYDhVLdmH9XjXWXjJ8goBjTb62oQ+POl3lrQtMb
         0kgXxR57+kBECCW0vMAMFTNakV5uJ2HhdZratknv6MqnGTN19t/Axavv8uz+ILzQyyCv
         EBkw==
X-Forwarded-Encrypted: i=1; AL+hErE3kWt7yPPK8iDZOfuo1D43rrEQLJQfQU6RTY9WPleOFLkDYo1M6bj8J5WV/sEIBLUuVgUzIfMsxbmkEqQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AhnJkOZeZfw7Ma/I647oDI4rzV6VrJx/Bjfylin/B7gFwxKWx
	uN3FF4gID7B9hcNjLQjo4Sm2KgmYcxxjfeHkGHko1CanpKAbnTMXAFKoejMEdqxpKkuZ/hcwDCq
	1NCI/Afh2dzZgAgLcZ9zkkp3924q0x3fkWfEwvdAB
X-Gm-Gg: AZFdTZfWgxASHP6efRkJHaCZIL8nGcTgf7yYMux0SXXW8MNzJEI62hpWNC6fwzAY94j
	oGfE06UUpGY6XbqdfCuevRE4mv7/5+unQrac6zGGaSg0MKorTICh67xoaCwU3y0FGQJXv7x9jpJ
	QWSFSUo48lQRjLHVRyJOYbVfnAF9YDPhgswf0vXslTRj1CdWk6Z3IZrI9i37goRCWa8SUPS6CYE
	A2Z3yI9OiHwE5mv2law9RemWCb6OWIOA8zlsDoawHGA2Iz+G3/qBHH+PrMFRtpmALp5YR4i0sZI
	2+NJ3YASYvlwmRTYPqe1t6rUcdqd/FaO7V0EoY/QVxJl/iJ/apbzEBvGXDV56AVQOpQJqeIJo6o
	BfC3BWuP6eEXNc4xN/eIqZQDa4zPmk106iNJP4Q42AHdrks15sKibVU2gSSuOJODD7/7bY+8n//
	C1xs027cfqwTinji7+UlBfvLCRacVMtm5p5x238G46CfNU
X-Received: by 2002:a05:600c:470d:b0:4b6:24ca:8848 with SMTP id
 5b1f17b1804b1-4bb9169c773mr3294835e9.11.1795545921491; Tue, 24 Nov 2026
 10:45:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-huge-pfnmap-fault-races-v2-0-276007e73bcb@kernel.org> <20261117-huge-pfnmap-fault-races-v2-2-276007e73bcb@kernel.org>
In-Reply-To: <20261117-huge-pfnmap-fault-races-v2-2-276007e73bcb@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Nov 2026 10:45:08 -0800
X-Gm-Features: Aa3M54pkUi88VYe-fpktO26ba_xgIBRMnt9i_jgdkEnyzZZvFIfmSEN7jCPiH-0
Message-ID: <CABdmKX3ZihvsJfPGDhg+tmjn+xVfhKkZUshr8NbO5T1BmVcOPA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mm/memory: remove racy huge PMD assertion from walk_to_pmd()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Alex Williamson <alex@shazbot.org>, 
	Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Wei Liu <wei.liu@kernel.org>, 
	Roman Kisel <romank@linux.microsoft.com>, Saurabh Sengar <ssengar@linux.microsoft.com>, 
	Naman Jain <namjain@linux.microsoft.com>, Michael Kelley <mhklinux@outlook.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Eliav Farber <farbere@amazon.com>, stable@vger.kernel.org, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>, "Gregory Price (Meta)" <gourry@gourry.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:32=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> From: Eliav Farber <farbere@amazon.com>
>
> walk_to_pmd() asserts that the PMD entry it returns is not huge, but does
> so without holding the PMD lock, so the assertion is only valid if nothin=
g
> can concurrently install a huge PMD entry in the range.
>
> This is not the case for a VMA whose driver implements both ->fault and
> ->huge_fault and which invokes vmf_insert_pfn() from the former.
>
> The existence of prctl(PR_SET_THP_DISABLE) is problematic here, as it onl=
y
> takes the mmap write lock and faults taken under the VMA lock are
> unaffected by this.
>
> This can result in two concurrent threads faulting the same thing
> disagreeing as to whether to attempt a huge fault and thus ->fault and
> ->huge_fault running at the same time and triggering this assertion.
>
> So just remove the assert.
>
> Target the commit which introduced the first driver able to do this for t=
he
> fix - vfio-pci. DAX also mixes fault orders within a VMA, but serialises
> them using its own mapping entry lock.
>
> Link: https://lore.kernel.org/all/20261112051440.16140-2-farbere@amazon.c=
om/
> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> [ ljs: rewrote commit message ]
> Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> Tested-by: Gregory Price (Meta) <gourry@gourry.net>
> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
