Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952317;
	b=V7um84wbHvG1b5PZu8D2C7x+Y3yJBo86Y2xc3RoaTpehxe6Eon6bBBHVZjLNO5i1aOeX
	 73+EIfKgdsJEblD/rQj99v2vp3hhDShV7EdDn2RRjImgAX4d5Wzeh5OoKBV5V+0Kbnxgv
	 8gbODv+nqmHw/pbV1+9GRfhwthEjGrI4dGp2ZkEBQCptwXqt0P+pXyt1cc2KCQALWyhya
	 0KeNEovFs7zZX8OGoct7QDX/fgH1ruat6ssS394VXh4r+8BijH2k+teqgceSmwQD+YYK8
	 T9v+qRrVjJHZwJMkdxw6RsW5/Bt86Y/Ckvy68refQ2QhQxZnr6JFxjnEOY0LMShs3LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=od7whLjYp5CgaE7fiVH0EHWEg2I7Xd9uLKWSaqIJaMI=;
	b=DbyQ6UnmGKYsx7QYPOq5O1lp+gLyvSU0Q/4sUxC6/kkluQIpNuv/uqOJu0BFV4cIqRXI
	 LQuRxih3NUjii7FOCxQ6KAQcAIivEPZMn40VVK+LVLs7sMGdNYSEQAyi5ngffP4zY6ebq
	 AltBaovNlHJtQNSIsm7I81jMz/bODWddWyzZ8Th3VhCXjIzJrUK099UsDdxNrU6Obgm/G
	 HZ9tqMP3q6hxUt/n7hdtD3MFhuwjQz++HYyo5yOZ56mOzU0+w95hcgWbF/tJ97ixUEndM
	 IfdhxMCcWGY8KvxJbT2gF12r242BXsUxkdeZdxlUnZZ1mNRIcyyVzqv8wOR72eAnP9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vyPRIsbv;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEF1606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DEF1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vyPRIsbv
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so1697415e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952315; x=1795557115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=od7whLjYp5CgaE7fiVH0EHWEg2I7Xd9uLKWSaqIJaMI=;
        b=vyPRIsbv/m0RBukdtMXOPGZeyUhMweLxcCjziu/fW2S1RdvGfR/z0u0PDceojIEwD0
         FfTwrFQ8/GAXqBGxwG80ywbRpqj3huoIhcqxtrjnECZfy+EuzG+/weUZWWb8v6MkSlFV
         PVxtH7z4HvtjASPNNqmBUYWiBkCT6D6FJqXBztCjpoDdVdNmBHvoT+l4LWaM34z4poTR
         4MhAAzDjn/InfZo85lhNoFUwFh/zoClp+FnzCE7FE5PQ1j8CkPJNFqWRF//BmITxbbWg
         jQQFugy3GoNBm79MJOOZ6Y+ugqnUXzU0dIf7LAjbxFo0OHXxQzVPxEixpxeaaMkjlzwK
         u+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952315; x=1795557115;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=od7whLjYp5CgaE7fiVH0EHWEg2I7Xd9uLKWSaqIJaMI=;
        b=T+g/EfyAxEfhkWx4OOjN7+1lGAfr1sPkOGwscyVRR2xlR+Yx1hImVgKTvCdxqlct5y
         5jsK6iVuYG/fbux1wjTRDfDBzODuigKaaNAXHarbA096zPwQ9b4mzT4HEHtSUbXkJz9x
         64Eow5rbMHQrOrM2F/JH/PJ22ROjlNkHTPNLJ/yVxyhq6o4YWKMy2ik3ZHkUTbKHV2ZQ
         4QtN2CTfLd/jYCVNTwEIDptZ0h1KtAJs8Z+zwPcA3ssSOUcQ0ZTE1MU+u4wImtQxsKF7
         IQW4MbkPq9YjSCKR7nK1rU97TEpZgyq9UaN79YdyGa073wMkQafHnbJE0aWDcFU3y5xW
         j6iw==
X-Forwarded-Encrypted: i=1; AL+hErGPV2sQU6okEW/Xz+U66Z1DoOxsg/SBsXhAGsitvUEj8sJpiNqDgvi10pF9QJbaYZNco7KnlrL/fgBEuZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EWRCxpn0C1MtGLpbDbBBu9tovmXuwvr4S8ucYuu7FpLby/WGE
	d5CsK/ydPSbRIQS108pHAc+aBSKFRl7BJBrHn5cwlvaGkIE7vooiyoi68hlmkZPI
X-Gm-Gg: AYBFou1pjkTOPfRoAQsyNZc0zYpnVS3exUFZD+rn/j0HR1CRDnXm44fGoczYQ4Ukpir
	S+S++EBtxOAEzjONlb6tr1VJ09Wq0Yc1SfKM9H/WpyHRbA2ZEnxJxaIpRjLoYYoNjxBkbI+NsWg
	VEPJwu2VnaBG9T4Me4HmBiyet0Z4/Sada+7cOt4S9jMCTWEnM7Q3qIBxFf11aIJxFDwHYa30acM
	PkryujjzAqHFjCLt30XbQAOQfHxj+reK3uYzgGVRbgI/QgJzQt49usvbaRcdBOaK++q9Tc3XeLP
	bBQ1GZri+KSNYQJ5pgUMVPCryeijnnXFGEJUVoPDDYq9g/viUy/pTUwFeH8esIm/JeTq4oPdOtQ
	o3PXsbzKeIJerMV22TODcqfNrJKb8SJJU6GFyPGRATfgEauS8SqrYVakEGe7i53yiLHHOuWRTvC
	ah8J6TewD2n6JU1ECBVjm1LixrMr+U2byJE+U2lCuwcYufu6pa2B9XQpmpJz/s3bhIvM823IL3H
	0QK5MG4VDIde8vuLPQIZLj23ASB7UgQEaQz+QfAVh2SAvm+NxrM4/gXmGVLw6R3ho2ADMY4kb2R
	cgqPf1n6UhfHalKjM8ub9DWk
X-Received: by 2002:a05:600c:a54:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb7da30033mr11230145e9.15.1794952314685;
        Tue, 17 Nov 2026 13:51:54 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d256f64sm14627035e9.1.2026.11.17.13.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:51:54 -0800 (PST)
Message-ID: <817544cd-8b7e-4193-bd3a-c270284f6c8b@gmail.com>
Date: Tue, 17 Nov 2026 22:51:52 +0100
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
Subject: Re: [PATCH v2 3/4] mm/memory: do not report OOM if insert_pfn() races
 a huge fault
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Alex Williamson <alex@shazbot.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Roman Kisel <romank@linux.microsoft.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>,
 Naman Jain <namjain@linux.microsoft.com>,
 Michael Kelley <mhklinux@outlook.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Eliav Farber <farbere@amazon.com>, stable@vger.kernel.org
References: <20261117-huge-pfnmap-fault-races-v2-0-276007e73bcb@kernel.org>
 <20261117-huge-pfnmap-fault-races-v2-3-276007e73bcb@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261117-huge-pfnmap-fault-races-v2-3-276007e73bcb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 7:31 PM, Lorenzo Stoakes (ARM) wrote:
> A driver that implements both ->fault and ->huge_fault must anticipate
> concurrent use of both.
> 
> This can happen, for example, if a user calls prctl(PR_SET_THP_DISABLE)
> concurrent with faulting, as that only holds the mmap write lock and thus
> does not exclude faulting threads stabilised by VMA lock.
> 
> This is not currently safely handled by insert_pfn(), however, which
> obtains its PTE entry via get_locked_pte(), and treats a NULL return value
> as an allocation failure, returning VM_FAULT_OOM.
> 
> The issue is that get_locked_pte() also returns NULL if the PMD entry is
> not a page table which can happen if a concurrent huge fault installs a
> huge PMD entry between __handle_mm_fault() observing the PMD entry to be
> empty and insert_pfn() being invoked.
> 
> This can result in VM_FAULT_OOM being reported incorrectly.
> 
> Fix this by introducing and using __get_locked_pte() which returns -ENOMEM
> if a page table allocation fails or -EFAULT if raced.
> 
> This allows insert_pfn() to return VM_FAULT_OOM only when an allocation
> fails and VM_FAULT_NOPAGE otherwise so the fault is retried.
> 
> The same change is applied to insert_page(), which only impacts DAX (which
> has its own locking).
> 
> This means that insert_page() now propagates the returned error, so -EFAULT
> in the case of a race. It's not possible currently, but guards against that
> changing in future.
> 
> Similarly, update walk_to_pmd() to return -EFAULT if it encounters a huge
> PUD leaf.
> 
> Target the commit introducing the first driver able to do this.
> 
> Reported-by: Eliav Farber <farbere@amazon.com>
> Closes: https://lore.kernel.org/all/20261112051440.16140-3-farbere@amazon.com/
> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
> Cc: stable@vger.kernel.org
> Suggested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
