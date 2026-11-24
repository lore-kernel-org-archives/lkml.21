Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526666;
	b=s4tFQP3kDdmVODXjq+zgDy/uL7JGhiKq3Am1z1Hxcx3PjGJJgh8VqddEO3Hgud99tF2e
	 hUJirZyErNABpfXyg6ZjdVYD/ZcvIiqfYfkZ+zZEAdVU1Xx+3qvseyaPfngNpugQAQ+GK
	 SaKT8PIN9LNxUICiuqkvjCaaywKOrs7EvC447Lbg2D0461mgacPDZxnU2GtkwIgjqZ4Lc
	 V7YqFlaNsbhCbSPRAP/g/CLSgU8WPbnyhfhx5MgMiV9Qru2MWH9xXSoXazIY7ExJIlBXr
	 pgdtMPggkYfDpADgwovZEr7hYPbXRAPqyZmqxiWwXxjVZHjntnVeh2Uwn4goyZgZWTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=j2lGOfpuqWA9c5CeS3NsQ/3TJJfRuyj6wTBADsS42iU=;
	b=3G7TgscTCKe22M/vpLxDOtlxDGFs2Kx5SwD0uuPHMOXpMBsSIZhigbiTmOvU4C5bpXuD
	 F2lgpSBwj1XjLp8dd/eSuQcr23xI2LhMcRMEF7WehqaVVchWlNJQJiU0/LA4xX74xMiD5
	 0IPOR2IerMxLwB9LsejxLi0ools7yFanxAMgCJsziYtxgfeIJ+UrJoDilsOHqcsZEEdkb
	 +uYF0L650i9mTHCZ/pei4hXlj2afH1pEaBEj7xuYUP+ci5Ko0Zsn5kMPYMx1YiReweu8p
	 IsimjUjE2IU5kxotBnbeEzySgn552nJeHQo7L1bYubjrAoszoEggt2MoUk2Cm6tIu+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e2qVYdC/";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59D7606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A59D7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2qVYdC/
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso54918055e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795526664; x=1796131464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2lGOfpuqWA9c5CeS3NsQ/3TJJfRuyj6wTBADsS42iU=;
        b=e2qVYdC/mXdjFACrZz+884sYdtZuVnERtWgcQhcsucfmOtRPjnYpcroO1cl9kYtRrz
         Ipz+u4I+zinaMDaKG9o+E5noYTt992UI3Ana8d998e3XOlokRkou7fZ4YKzI+NvFFgvJ
         ASYWizXvFH2Lu0l3xKj/mpyg9xKlN/tOvjqKNh/0CBlOpFU4EgIKn9guL186RrGdMWwn
         HDkLXY1jUcMNWSZDxI+xwV1UQ022sX1aX3eigoLqFxqR67l/iUKRPgVZNsap7uuOrrVa
         4vN8Gw8pKQMm+mEP/GB4J3/mlMyYNCZehrYM+9PNIwihO8Abe6FaR/dLZbGVXccuFaLd
         yL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526664; x=1796131464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2lGOfpuqWA9c5CeS3NsQ/3TJJfRuyj6wTBADsS42iU=;
        b=fBS66uqwIhFn4YCWDeumcE88eZBqz55Kqhh0wvTtiZbxtb1I/U7zZq6ZEctdbqjtvd
         N+6lY3y7+YJOj7DH7iWdtQwBcQ999oji3PWEIGiZC/U3H4zDc6uAjvJEWAbuTk+lh0d3
         nwh99+CxGxjmOXS+mn94AWgnpqPho4ZujhtcafC8npHjYfn940A6PSiR/h+vHc7pG/x+
         HYXiYzYni9Q7HJHNmRraD2LHdX8d/dJmKGwa0dC/ezZU7VuJJsjhHstXlm7JuQfCVvq/
         TG6HvIHDYNoP32RBW3uoRiCL34bkk6KOEpAoycBbTXCxAbHmRDtYR2U0hQ6JvZUXuQv+
         BMYg==
X-Forwarded-Encrypted: i=1; AL+hErG+aRvoKl5AMJuDY6sI23seS4bO+ciD2/59AYhF16yfuyegRJLOyYOr8l1GJNd/pI54MUdz+Bv56qPX5tU=@vger.kernel.org
X-Gm-Message-State: APuU4Z88bUZCfn9KspJ1ycs3vckXiRKguAmwEbJqhH1iMnqNB4HvhKfX
	wMfhHj509BI+GzEWfEqkt2tSNvvDntInZ65dxNWFhlXxangp0ZrwtoKu
X-Gm-Gg: AZFdTZdLR5U9sfUxiLEdfZ4OLxu25vH3cyTW5dewtHDgzg+K265g1vVIpAVT1J63iGQ
	iOMUxfog/8VJGF/ljG/3eeEMR7HjJyUs/CCUCrVxYXTrBoIrJCz6zB9X3nzR46oGnt1FbN/R3BO
	bRneg+glPm0WR3lVJWGOLDoQ3G/TD0oK3KAnVu8bv3shGAPvqCY1QmALQhpT7bmuh0DYoapnlna
	9oG+00WcHy4yEhR2JJPZMJvGuo+kYQ3/GbFsPiCOQWx9IGG4Ttd4jejPlUDwDS9SKkPYkd8aqM3
	OsKxASL5vh7Je4abSjWpp5/t5K16QFG+K3qDIyfnKWZqaeyAVtzhed7poj5zX2LlbssZQDCOnHy
	ButR/XqrLkAOyhZ/+AkHmjiwzIX+n1qrk5RPSb16mJGOhdzUROFYs9r+6ij8b/xwVq6+Jii1ZGt
	hd2kvCFyrnCLZiJj8fsg+LxcenTQsI9iBLjzT5NIge61xdOc/KLBggaWWrsf66vYK1+bh/sP12U
	7gGAQ+R67QvgItEFEAqOH0us7Bd/5QxaV1f1nW3+JQUrSkqG1ZKg1dnaiC3NTFBeEEpIYZEi1EP
	nlsb3f/uPLCBVgoBdWOxQWHeu3vQ/00b4M8L0Or1KxDicw==
X-Received: by 2002:a05:600c:64c6:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4bb887c2c98mr274938815e9.4.1795526663725;
        Tue, 24 Nov 2026 05:24:23 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm26298695f8f.22.2026.11.24.05.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:24:23 -0800 (PST)
Message-ID: <7465de57-8d97-4952-9daf-d95bdb4b7e78@gmail.com>
Date: Tue, 24 Nov 2026 14:24:20 +0100
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
Subject: Re: [PATCH v2 0/2] mm: fix deadlock on the folio lock when migrating
 and splitting folios
To: "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 William Kucharski <william.kucharski@oracle.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, "Lorenzo Stoakes (ARM)"
 <ljs@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
 Chris Mason <mason@kernel.org>, Chris Down <chris@chrisdown.name>
References: <20261124-migrate_reclaim_deadlock-v2-0-03cc147e1e36@kernel.org>
 <66e5f9e3-17d4-4635-8919-c67ed562f9f0@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <66e5f9e3-17d4-4635-8919-c67ed562f9f0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/26 10:47 AM, David Hildenbrand (Arm) wrote:
> On 11/24/26 08:56, David Hildenbrand (Arm) wrote:
>> Whenever we allocate memory with __GFP_FS while holding folio locks, we
>> can deadlock on the folio lock when triggering direct reclaim or
>> compaction.
>>
>> For example, evicting inodes with a populated page cache takes folio
>> locks, and if we happen to need one of the folio locks we already hold,
>> we'll deadlock.
>>
>> FUSE makes this example easier to trigger, because it evicts inodes on
>> the last reference. A similar deadlock with FUSE was recently fixed in
>> FUSE [1].
>>
>> Let's handle folio splitting by simply running in NOFS context. We only
>> perform small allocations, so it doesn't really make a difference.
>> Interestingly, this also fixes one of a handful of possible memcg v1
>> deadlocks.
>>
>> For page migration, change the code to allocate destination folios
>> without holding folio locks, which is in any case the right thing to do
>> to reduce folio lock holding times.
>>
>> Some of this might also be fixable using Jan's work on deferred inode
>> reclaim [2]. However, that is not stable material, and not allocating
>> folios while holding other folio locks is an improvement on its own.
>>
>> Unprivileged users can trigger this deadlock with FUSE and
>> mbind()/migrate_pages(); however, it requires multiple NUMA nodes and
>> quite some luck.
>>
>> I reproduced the original deadlocks with FUSE and made sure they can no
>> longer be triggered with these fixes. Further, I ran the usual migration
>> and folio splitting selftests.
> 
> @Jose, could you find and fix other cases where we allocate under the folio lock
> with __GFP_FS (and direct reclaim enabled?).
> 
> I think at least do_set_pmd() might have a problem when allocating a page table
> through pte_alloc_one(). And I'm sure there's more.
> 

sure, I'll look into it :)

-- 
cheers,
jose a. p-a
