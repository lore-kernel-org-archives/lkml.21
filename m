Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201148;
	b=PsrzgmcyIb/j13iSjgnEenXPX1DR6dMmCKDwBUO+207YCmZhKVcWWSuDRtAn2S0cBksb
	 C8pfTAaxrtdo0tghBOGZ8PCTyThUIRChYUp3Fnc3jsA/lPmEEIfImE9GrLHA4XBs8DFAa
	 Yg8X7ZFaWiVMEJP6FR2QMFk+CCwZcKQrRyjerNhD6IsviCOCHiX/i2U2EU4du9i8S6VPI
	 d2Kc2BxmqpQ3BaLxeRAY2Bob+H00IGjXg+0DEkAE/+n8M+AjICY2obkt4f2jqRNuah7D0
	 lU+yUlip1fzHYVd0miP/DP5OIzhi7JsbVIHyIeWuzucir6cCXbpEOkxremqnbbdLFfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=QpjWV7nVPK4jNL88HvKbtHJ/44FkOvQPFo/KHrxl1Aw=;
	b=vZm/J1Wnmp3EmGut7sPC3wQBG8h5+xgKnv9JZxE+b4LqOn9c2lRvWCKmBaRO29arlRSu
	 sjzouh6rSHrn8tNI1QrGPWY7WItRDiG/AEQMLrt8plqMPYs/7WCm7AqDPiCr0He3q2RkD
	 Oj3q4a3/ACH4DAbzyEuD+W70bQ/vxBCRhvm2IrmTQXzOYkyjTxdrPFA0tNsW0IvAOU7/o
	 A2p2vWg9WDrCidBmdoKBhIvWAitbus3yP/F1x5qf4yAwhUvjX/FI3WEw810+1kT31lFzU
	 G+3scOf5jY1EbojU7m9vZvOsSlpbS37yLfQnLj5DNC1RkTwzsxmly619biAyuGx0UYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Na8SXjJd;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1D160A2617
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE1D160A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Na8SXjJd
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53644b28706so19849461cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795201145; x=1795805945; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QpjWV7nVPK4jNL88HvKbtHJ/44FkOvQPFo/KHrxl1Aw=;
        b=Na8SXjJdGUVWDeqxqwuMR3Udnc3JNjfyk3MTxe3QTRK6WZ76d7I+8tS90Y0CdUuXZA
         ozFtgrB8we5s3tBqJqZcDv80Ku/wbh/GB4PCsBMGwkvpKkzwa34jt1f6hdT26CVXC5UP
         CqXkNaWn5gwOSbAvxEed0NE1PQJozJiRIR7CWvSazN38YSX1t5MjQC7PqbHfNae4SLU2
         cRYRjbxZdeSI2Yb8n7W13IJok9pj2aMDEqWhp8T3dZvqoUOiu0H8ebtzuoxe8RQRnyoe
         2tmTqqK0Yz+5RXyD+Ed2jDx8IyB6oTTNJ8Tf0OYn05H7iul3Rs9K0jNoFETg+lTdYUmT
         Z6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201146; x=1795805946;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpjWV7nVPK4jNL88HvKbtHJ/44FkOvQPFo/KHrxl1Aw=;
        b=ijUwT36UaWpNhr4GyNqNK88qYJkwQRtP5bH/tW8iZP0O2Hy0wdEZgZ88AOQWttLPrA
         UcUsAw9vnguTtalYNZn+NJZPd0x9bENc5CP/lMqpjqTsE3Lm7Bs2QrOUXXeeOZj4MDa8
         qFWDS8Cdm5ylcJ5mHRJPqJvcb6VF0NN8+p2s0bKQ21vpKUcBU3ZXhhs3FXYlztoU2nQo
         ytKipZABlV6F3ypbhV4LaWGxE7MAbnXHhVqlesmmAHhVLfaEBNiairOdnuFb8fnJin0r
         9yR0bDOweVJ7YzkKjlzAnUAhwpzgbvv7Gxf+CbSAvkEHhUpajiz0XxX98KSqMdE9NBhZ
         5ECQ==
X-Forwarded-Encrypted: i=1; AL+hErG/6zBEDsG3clEHja5NMymRyabiTwK0WZb12R8K76SXLMfCkBPJ327db2TAbmMvVoQ9/u0C5F+ENqDuLuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NA7njQsDKJqM6I3BY8jVI4NCr/roaTrf6Ao4OborUGwZcvsZM
	u0sb4tkcGTyiceUYEo810EUevOv89DqswGQ87DmCWujTMSwGuRNgHXPKM3Rr+wNVmGs=
X-Gm-Gg: AYBFou2ZSSwN63luDGSK/WZcC+ILZRjjCaLPqYNO8mYY4Lin1l2N/2JQP2Bwz3Zyt5i
	9v6IF35iwJ+Lj94ImCUchuppD12NgmTRya5jvUcGiGoUMtjsNyT8Tx1o1EDOkHYnvfRUPuT/959
	xCP0s1GiNukQu0S74TMCcjzZKJgBoKrLscQNM4mJy4T5bqeFk2bvaSwn19CTAdNHfx7NFGfhV3V
	NRMaTJirB/lYo496NR8+iO5nfsXbfBluS4uUnf9Y0JVaDNIkExu1ve7kig6nyYA1HRU0Bm/FUQm
	9fNzNCMgfrpNtAAGf/UksPPRAk/DfVbGBkQS722iKf18Epjrv6ErpY/J0t6V6rXyPtGdRB+m2BL
	3C5A5Q9mBtfVe8OcEHR8h786AIycPe/Xtm48POAqFeoKkXSwryjtTU+8IEn7Eom/YVa4smDmuDv
	CWSTjG6Fvo3PZBs3xK1vO/bOhkxGbmxJmd10BWtw8m7B/CQMTW8w4x5b2DkwOSwVPLuL163SC7I
	DphYxxGsMbvQfeXu5ZHYDkaN+2LrSkBrJRsMNz041vo7bNDRD8WcGOKKRdObqcGaf/0bp54nZa3
	fbsKpNS7X3Xttuhn4Ykk/CCv2rrdUwmvgfleWMsTE+x4DReZf6z81CvQVcgbJNPW98nZk7O/FoC
	JCN2sXFo=
X-Received: by 2002:a05:622a:1a89:b0:55d:2c9a:3776 with SMTP id d75a77b69052e-55d76a811c8mr74428711cf.65.1795201145651;
        Fri, 20 Nov 2026 10:59:05 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7884d01csm30305771cf.21.2026.11.20.10.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:05 -0800 (PST)
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
Subject: Re: [PATCH 00/60] Private NUMA nodes
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Oscar Salvador <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Matthew Brost <matthew.brost@intel.com>, Byungchul Park <byungchul@sk.com>, 
 Alistair Popple <apopple@nvidia.com>, SJ Park <sj@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, Kees Cook <kees@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Michal Hocko <mhocko@kernel.org>, David Rientjes <rientjes@google.com>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Pedro Falcato <pfalcato@suse.de>, 
 Jann Horn <jannh@google.com>, Chris Li <chrisl@kernel.org>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
 Youngjun Park <youngjun.park@lge.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>, 
 Tejun Heo <tj@kernel.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, 
 driver-core@lists.linux.dev, damon@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 cgroups@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org
In-Reply-To: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
References: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
Date: Fri, 20 Nov 2026 13:59:03 -0500
Message-Id: <179520114342.412063.6068641130948664600.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-20 13:08 -0500, Gregory Price (Meta) wrote:
> This is v6 of the Private NUMA node series. The series falls into four
> parts, each building on the one before:
> 
>    1-18  mm: introduce N_MEMORY_COMMON
>   19-26  restrict folio-walking MM services to common memory
>   27-44  N_MEMORY_PRIVATE, kept out of cpusets, mempolicy, accounting
>          and the page allocator's ordinary paths
>   45-61  private node features, memory hotplug of private memory,
>          dax/kmem private mode, selftests and documentation
> 
> Patches 1-26 change no behavior on any system and can be reviewed and
> merged on their own. Without private nodes, every path in patches 27-61
> behaves as before.
> 
> The full stack is also available at:
> https://github.com/gourryinverse/linux/tree/scratch/gourry/managed_nodes/private_nodes_v6
>

Apologies - my b4 prep dropped a commit from the stack because I made
the mistake of filtering on author (myself) and it stripped out this
commit:

https://lore.kernel.org/linux-mm/20260923211041.3127588-4-gourry@gourry.net/

The commit is one the branch listed above, and should be otherwise
indepedent of the series (can be pulled in ahead of everything else).

Sorry for the noise / compilation error, won't happen again.

-- 
~Gregory

