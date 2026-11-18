Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019901;
	b=cAfcfpDgv+y0UBMFIZ97J3eY0rkfK3SzxH1646y/n/R8ka8fCjlp1qaZOoyskPCMxfVc
	 mcWzvroRJbdLWiV8Xjg9fqWsvsXzN5ksygGp+laZpcRlFIDPSBo/argKyq8BwuhclLrI1
	 hCxEorS/LIx2qgZVfC5VQNU66Bu6TAhbDgRSufIfU7E9liFGPxc2O9OUBd0J2/jFsTKw/
	 BnxVR7cVRNxOSqRhjm+H9EUzPz7+qIt4nE+Fp8jphSz9wOyweS6nEQNID6FRGIPaFVlAT
	 wD1aNSERnJ3IYxL5lUjC/LPBZ7FdW0ZeweeV6ShIdN6ClMFO7xEb7aa0vZYxuBJt29g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LYnPwXVs5q7hiylo9HLvXwft8EbUR8+QNtfkEA01owo=;
	b=NEvCvoph68+eBEu4LVUP69RY4zEBnxx/Hu3ax1wfuhhY/YUyc8jsK90Qd+ELUApggKhh
	 4nOIt8MvinEZjautM4W5E//RvfbzdLbofwM1wJ1+W+M5VEvT9qVZJNOQZda4TrBmnoWuf
	 JyfpA64te1Hs3sFUGL/caT/uS8c/TYjQyRjk+Pm7sy175AhSkzHIw1I1hluSZYuc4PJxM
	 Gsj3LOqznGdXNioYkg89xSw2+yh+RWe3SGcdWDl9uOMTGLdeUV0Vzcc/ywOuZNTJUnN9+
	 yxx9T7w4YJJl4mL8YaskWdv/FEYV37abrO0B6riqhKntHQpCnj1NQ1AKiMFpp1Z9vww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=QPGxmnC1;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D854606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D854606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=QPGxmnC1
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2ccd3c7a2so444866137.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795019900; x=1795624700; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LYnPwXVs5q7hiylo9HLvXwft8EbUR8+QNtfkEA01owo=;
        b=QPGxmnC1MIKGvE/vzRa1zJVCw1yF2DPdCEjwi1OiyfqWVdjQXoQaqq4ZpovebRrelq
         US17RpTZ+Uzfo3OWCyd5YMD8bq52PJZD2Muct7K0eAIFNeFfXu6wgru+UBA6sgKtaRZS
         0b9MVDRgr2VxKFnpEMOLMgFYNq9iOOVRaT35J9gyp4Yaa5FkyTY4CkmwXmfIQ8WBZlwh
         FbWZ2NGLN9S2mivv77OafDgT1NOUggehsiq6xLEzEgC7ZwoXatqJLJw+t+NPJ3FkUwql
         2Ljnfuv2qvRrtHouHRaEPTZMC3Dkt5KLw10WpNnWS31sgR1pDdCheRklJg6bhyuXsgui
         5eCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019900; x=1795624700;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYnPwXVs5q7hiylo9HLvXwft8EbUR8+QNtfkEA01owo=;
        b=lGvPKidXNnYOms6xty32wHvBvxYxL2APcBjvZnukdZ4SY+2+3iPzfxFJtW0tU76y5i
         0nFIne4I6Ezn8V+INrfvJwm+tfFJHrKgsvd5rp7a7cKoKeGW8AsUKxLi6AmlikvAg4a+
         e2ksKhoFShtqzaiwfEYHd+UGM2Vtk/qUp/0cTPiWQvQtCoRscsEnUt1zvjTQkb5UCS9C
         SrLG7OS/VoBFuwhzmzWDmESJXFwsyxSqQJFfeq39wCX91ABFCpf8lamRc4rYTAAb+zMc
         Zp8HdIHw9VmH3u/fqGLhh+yVLd2sXCibJR1vHpe27Qw0VKW2xtkiqsaBJ8Y/2phuSki3
         aDTQ==
X-Forwarded-Encrypted: i=1; AL+hErEzzQdEU3aDbz8C8N4PGnWo6L4gLMnOpgJo3ivhrFFMNQnV6xnDM4Pl0flFFyfgWa/Nfdzmusf2Ng+jIvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zwZXChnGEx1CuuDaSrfQ5X3OJG+URCA2azFRI3eWxX6vwZ2Yz
	6cLWpSmubEDHmgoxNTEMblFr1cpNJaQwW153U7EyqMw89wxbBdLM5D0pN+W+u46A2eQ=
X-Gm-Gg: AYBFou3DPw770KjW8q4pzS+DhCKzDAor4+PgOYCNLidIIE0bIPadYHUi+M7IhCVTwis
	zc3vADlrTEMsEQy9YJDvqtkeFVz931lWVjK8RyQBWgdTPO3nMs+HN1gkMj6m/bwHLpTkOI0GH9I
	aWXMMQt44ojoPPM7ktXHq3401q36mBv9ahd9E8MGK0cVmUMX2GycfwTj4P8STi6wA5ZJvWJaEIK
	jEz9G5rSG8oUsJtZAKuGcSwAZ0hTzJ+k/Udby6YD0vWSEYNWI6MeMhOD2DjBOswXfgW0zHhIHoD
	ThOUudKOa2RF0iRyu22hHu1hx2qRTqy9xbMo4arS1vQnYXzxaf/HB6wgXGWY4v6gNWKn43+XKa5
	BoET11EsKBCS1knGsbcTM/Y3KreIAHRi7NGaO9q9Df60Aw4qLhfUU3CoizCDJVErt1XOkusP6Qa
	BSZd4IiItPURzuvJSgyhWJY/ONu3AQH02quRL/zKrko+Rqm/GCdtFBs2ApHKiIZYxIAQRUu4jPm
	zkFnktH8GvTjfdYm9hqVCE9K5FOpa9n/DUQ6ZrHuLUijM3JflC/K3TSXRH3XUTMSBySaIHyrkJY
	Rs2zbRJgxFNo73XLK0zhxkCOqtLFiSKE/Knn39Ag/msF8Gt003wCLyCY56KQDVhQraznuJ064wa
	zMQ0BjUBn+sEURHhRrHpfqLJApF6eOjPV9BocSfaFZmqfnMw=
X-Received: by 2002:a05:6102:91b:b0:7d0:9587:1b99 with SMTP id ada2fe7eead31-7d6b9ee48fcmr1231586137.0.1795019899949;
        Wed, 18 Nov 2026 08:38:19 -0800 (PST)
Received: from soleen.c.googlers.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9318565sm2190742137.9.2026.11.18.08.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:38:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] kho: expose incoming sub-blob metadata instead of
 contents
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Long Wei <longwei27@huawei.com>
Cc: rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
 akpm@linux-foundation.org, graf@amazon.com, leitao@debian.org, 
 corbet@lwn.net, rdunlap@infradead.org, linux-mm@kvack.org, 
 kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, hewenliang4@huawei.com
In-Reply-To: <20261117092951.4017931-2-longwei27@huawei.com>
References: <20261117092951.4017931-1-longwei27@huawei.com>
 <20261117092951.4017931-2-longwei27@huawei.com>
Date: Wed, 18 Nov 2026 11:38:16 -0500
Message-Id: <179501989658.250261.5046056769256366161.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=s2TgceZsirNjgZI66wNzdrJjtsGvWS0+fdcYU2Wc8h4=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq/dR6HI5GpH/4iewvFIx9U9up3jTt1CD0OiBfM
 tAYaHZwb4eJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCav3UegAKCRC7dyhM23N6
 3kzeEACFJCS4M3n+dkgQTJYjctdNWWkW46rsV15OpDqGSLVsafiGK5V9DqS/YbDDUzAIL82H8ek
 ad5sQrHuBJHAawArjrrZvPvZzsjJ7BoW0DhpOcm/qpi9kWBcHFsENdJnsNI+sEKtS7RbbYWQK9j
 vUVdUL11miluOI0kgYxpgF5qaZ4UwPGOft9U1q/ZL8XoMA/wEeCWMJjAzYczqn5NlEwwa+0AB2q
 6rV9wl/qqH3k5YypOi1mJyaSbV5EkYQGGi5oaRrSDgGgUPPySAGgd2qpPcV4/nA19UkULW5+Ytn
 maeDoReb2TGTx071O1D61DRaAQroMbESBa98ybnPDi7kYDDQ8CLtcbsoJT531hV/Rb9vSyMfua0
 WYp/jw8p6CI8ckRZakilQLC6NoROctxmAW8dgqsN7qz7E8zFTylOcMwvBnWCVv/OmeVNt//PGSZ
 4pvr57QAYJHdwmcY+nTXPkmo8Ah6AewPJfQdfcObc/6kbkiKd/1d8lPhhzK25hDvF00YlLVIPNR
 9tWH7znV/vhJaE8IssOJda4n+3fjfU5Kdq/BeEciQ7PR4m3bZU3IgMli5bnUzkHVn/orX7MMm3Y
 Z7klzrAJ9WeT+Ujk7U5HYuOOt2IHqPSL3QETXW/TOkr9Z1Ev36XHxJTep93cKMnaV5yhNLmn8bY
 /EvS9/hwGM3L8Hw==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> Incoming sub-blob pages are owned by their consumers and have independent
> lifetimes.  Some consumers, such as LUO, restore and free their state in
> early_initcall, i.e. before kho_init() (fs_initcall) builds the debugfs
> view:
> 
>   early_initcall: luo_early_startup()
>                     -> kho_retrieve_subtree("LUO")
>                     -> kho_restore_free(luo_ser)   /* page is freed */
> 
>   fs_initcall:    kho_init()
>                     -> kho_in_debugfs_init()
>                          -> phys_to_virt(luo_ser_phys)
>                          -> debugfs_create_blob("LUO", ...)
> 
> debugfs therefore ends up pointing at a page that was already handed back
> to the page allocator, and reading the file triggers a use-after-free:
> 
>   # cat /sys/kernel/debug/kho/in/sub_fdts/LUO
>   ==================================================================
>   BUG: KASAN: use-after-free in _copy_to_user+0x37/0x60
>   Read of size 32 at addr ffff88810309c000 by task cat/27436
> 
>   Call Trace:
>    <TASK>
>    kasan_report+0xb9/0xf0
>    kasan_check_range+0x100/0x1b0
>    _copy_to_user+0x37/0x60
>    simple_read_from_buffer+0x77/0xd0
>    read_file_blob+0x75/0xa0
>    vfs_read+0x12d/0x520
>    ksys_read+0xc3/0x160
>    do_syscall_64+0x97/0x4b0
>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
>    </TASK>
> 
>   The buggy address belongs to the physical page:
>   page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x1fd
>   pfn:0x10309c
>   flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
>   page_type: f0(buddy)
>   ==================================================================
> 
> The page is already in the buddy allocator (page_type: f0(buddy),
> refcount 0), which confirms it was freed before the debugfs view was
> created.
> 
> KHO does not own these pages, so it cannot safely expose their contents at
> all.  Drop the in/sub_fdts raw blob nodes and replace them with a
> read-only in/blobs metadata file that lists the name, physical address and
> size of every incoming sub-blob.  The FDT itself is reserved by KHO and is
> still exposed as in/fdt.

I suggest we simply remove in/sub_fdts without adding in/blobs. All of 
the metadata you are proposing to expose via in/blobs is already present 
in in/fdt (and can be parsed from userspace if needed), so I do not 
think it warrants adding another kernel debugfs interface. Keeping this 
to just removing in/sub_fdts (and updating the doc) also keeps the fix 
minimal for -rc.

> 
> Fixes: 062dd306d99c ("kho: fix kho_in_debugfs_init() to handle non-FDT blobs")

This UAF has been there since in/sub_fdts was first added, so I think 
this should be: Fixes: c609c144b0e8 ("kexec: add KHO parsing support")

-- 
Pasha

