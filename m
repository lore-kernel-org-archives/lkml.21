Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031434;
	b=RJz41Ls40GGQpvSvGj4fz8/BNwMhEtvDiag4D/Uk6eTBMHKZumWobjxKr803Fnf5Lxbq
	 7KLycGA1ajb5ZHLV9HHkixuwTr8VbMv3xnBEYv2Jd9HVXGi5TbwyQdc/5cWcOAYl5n8o1
	 c0dz4Sjg3hp17hlHLVJ3Sm5m+VHNVvhQygaguRw6z8J565JDHIHBTwu6K9BIZJplikVw/
	 Kwht4eQJjVIFni7iBo7q7lI2GDGhThEBTBLVIska/Gg1PG9CUakCroJX4PNDYWiMe2MsM
	 SWpyzlH+W01ELkd13qAx6sm0lIr0t5m7qzlFZ91iyAOsDW54FWeJpBvDc8uB5Ybh4nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031434;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r7xQEq0S5madAXrgChKTKdPfHb7gKwfhdlAPY6R8vGQ=;
	b=pODTBu4UMupqkgENQtrURo6sKdckErx9Yomg/p1OaCC9J0Q41+OH9fEFZh8epxAxwwvT
	 fK7P4CPMhNAzeImYXLaMU0MSyv3x/gwgwB1ma8Jbbnlpsm4O92WXtLOE+so6gDNsyoMHQ
	 x59mFO5zKHHTJjz7Xtss3XKhVGIzqoyZEtKzTrOZgTSo+SeenHBa87YVFrzDyKJhfMCz0
	 pSnNZ39vRVLZLk0oDlzJM4X41rvjZxFfaRPHMgVfw8F/HXA02pBalhs9v1JYT8eY8tg2T
	 3qwWADjqQV3eXRVLeiMc5PnrWaWaYPMHW2QSNwyT9L0C/TSyLzVtPY/u/MywvsBbKdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=AvcKfCxg;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=YHVVVoWA;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6826A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6826A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=AvcKfCxg;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=YHVVVoWA
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJYVN21749910
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=r7xQ
	Eq0S5madAXrgChKTKdPfHb7gKwfhdlAPY6R8vGQ=; b=AvcKfCxgh2FO1dLQ8zx+
	4vXb/ToMs6lkdoSyUzHR7J5mA8oTJ80Evn6C7DQAcQmCKyyCXCcVPXC1AY2BPV+D
	PrxnrOdal+rGAkWkiyrbM+AqOwlZAQ1nJhZU5MP+bzgPUyn08QXjS82Qla/J+pPH
	iCcg3Jt/KcqKZ5SUTzgJwHBANnntnyE+Pl4ScFWubQmhtGSgKuvD11x55l/MrryD
	qpYkODcKqypwoTWy8gK5UZs7YAS4kt/NOgHbNYfZYGtlH43Z2m+cRpG1dhxCVAtF
	QizC4R1HjcRvzV9dgt1KKEHn2w9dfl+PcmY3Jg7zuQba4dl/aGh85fAhkp4sBQiD
	SA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j1fkg20bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:50:32 -0500 (EST)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55bf3e01e65so33329511cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795031431; x=1795636231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7xQEq0S5madAXrgChKTKdPfHb7gKwfhdlAPY6R8vGQ=;
        b=YHVVVoWANcVc83FlR+/D5H6u0kCJP7B/v0FdTstDGgjgb0pwh232znaxg7S4pKVFWq
         nJ0Zs8nMR+JMfcLnfTnICG34bvhannwOXI+kHG/izds4p7Mg6WoCoMhSeKa1UMHqGqAO
         BOZkbvRckKzDqyqxLB4IUfOSuCNpX+w/YsUmvSmnrqYiqyn5qs6YqITbcji6w0AtixWi
         kLPS8JKO0pNIzIokc6iGXxUe1JjOsGh14cufcqzZ/l5e1P0+dpuf/3oW1Y1wDxbgF3Hc
         a3IkbkHKTdYYlXlvhmxArcBhbHpQuuPH9bINVI0tpH7x8vZalR4N1k2PE+4zwfwgOK9j
         fbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031431; x=1795636231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7xQEq0S5madAXrgChKTKdPfHb7gKwfhdlAPY6R8vGQ=;
        b=P80/XEXUgVrVP5OpofxnUHgfgQoxRdixpocxwyS3sfUFU8teMNDyD9QOlHkn2dX0/L
         y9YRL19JeZ0YJOMOGjS494g5vGglF1M5spRvLpMqqV2ztyi1I+G4NgWG+Dd2KX0eqI0f
         uKNrdv9edZzDraAPFMNfJVSnCgTJ2vl8vD0QZJqskVfDpAeRKGatnjS/BhYTcgxAK/Rv
         uu4QYXrKoQSiT6vATSUHpmef5U800DrNKWPflRkp9FZpC2qehGwwznTbbqK7HH2l52VB
         eMz6ZbVnDxXexaNyvihkG81cYW3I6oNYU6aJa7Gfy8Gl5wf57nElo6kV3PhlIM4EyIoj
         Xn8Q==
X-Forwarded-Encrypted: i=1; AL+hErH+lxdqhIiTYHmy3T41GCl4Fp815sEX9j0qJPTKZPJcHkpJvgrbKcpUOxlY7ZsnhpS7ovgdP5pwauW4RWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HXNvYKc9k/bHLd9LQHtWk7Mvg//n5RCB50WqvXOkj7MxfNSx9
	u8mA45S6GezW2Nh5CZX831mVGqj+Ka2aFuxqd7xURhPyUUbRaUz7CdZFD/6YYiKwXhch0LNZfAu
	7K/XagYgtQrj8dzF59BouKXv9aF+7s5BLUXxpx9I5v+jrgdzqz4BI6dTC5iMhPA==
X-Gm-Gg: AYBFou1AaddRLnGDchjnDvRrCsOyn5jy+EZUBB+tIPzNNh1TDI0ao6ETYXszhQu2d4q
	Uh5kiZXTECnNNa55F9/+95lUhqOslX6weBvPgZoa9IVKWfU2mo9M1htw1J6XY3r6JznJe3Pn3U4
	S8s4TcSQxNHWIZhc1MLMXX5fzmTwO0OcIgn7srnozzcYJu0638wrOgYpBtNUcwcZPRnw0eaQMIK
	NlWyjKoqKDSo3IhZkJCVCkunUx7L0Lxhg/4rwgj+X2eS7mPUm6wVsUh7NnRMHek/ot5nq7GFL4W
	9mI+Qh8bhCw2siL1kdZUQ9t8ZfQCQV5gUhFx3VHvWfuFWjnUEFjqqHMrqeGBqtXEgZSvo6sz6ah
	StCQtM1yhNOCybOvLE04pgOO2J9rCbgkV7j7nFWfO3bcOPCr75ySYv7kbA6CtoQ6QXSUGTjrMjj
	3cMZ8wRkBnge8vMSy73Ig8Xg==
X-Received: by 2002:a05:622a:5807:b0:536:252a:dbf8 with SMTP id d75a77b69052e-55d5a537991mr56617321cf.14.1795031431369;
        Wed, 18 Nov 2026 11:50:31 -0800 (PST)
X-Received: by 2002:a05:622a:5807:b0:536:252a:dbf8 with SMTP id d75a77b69052e-55d5a537991mr56616931cf.14.1795031430933;
        Wed, 18 Nov 2026 11:50:30 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-176-14.net.columbia.edu. [128.59.176.14])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c24503sm7189751cf.20.2026.11.18.11.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:50:30 -0800 (PST)
Message-ID: <9a6599cc-f47a-4a27-ae8e-91c8a1a523b5@columbia.edu>
Date: Wed, 18 Nov 2026 14:50:28 -0500
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
Subject: Re: (subset) [PATCH v3 0/9] userfaultfd: assorted fixes (part 1)
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
        James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang
 <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
        Breno Leitao <leitao@debian.org>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
        dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
 <179501525761.13527.5348420494097607881.b4-ty@b4>
 <d05636be-5a37-46e1-b6d2-30950b7778b5@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <d05636be-5a37-46e1-b6d2-30950b7778b5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIdlOr9m c=1 sm=1 tr=0 ts=6afe0188 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=2zM0HjzktFauw5hoOd8SpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=VwQbUJbxAAAA:8 a=b7hxIIQ5yigvctP09d0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: FnOoGaS7oPtf3R2yfKb--1IDTKsu7Ugy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NiBTYWx0ZWRfXybAFRpcCzXw1
 I+kQCSiuQ+ltqe3f6CySOL/jvAoxvqKvfzVJurxX2itSGM9KbaED7IXmfwXeauIbnRdwy8Y1mnq
 G95yYJbj7Jcu40Vs2qbpNZSa1FfHFfHcbuB3nBmx7l4rNGhUDIJ0
X-Proofpoint-GUID: FnOoGaS7oPtf3R2yfKb--1IDTKsu7Ugy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NiBTYWx0ZWRfX6MIdqzG1vASN
 JDQ3J97IQrFFUOJc4+KX5/g1lePpiVPibiB1OOVVDDQz4tvBf7w0sAOxId502iRcPun2GO5gqs7
 T5AfogB5Cb4baSYZBUPls/ZAEE7ygH46pMTW3t3vlPITJjdTkEQcUcqtj+UXFSR/Nbz1I2plMg6
 sdw5GPQOyhApM6epkH/40Xux9V6TCN7BfOSbqETSBihcY2t94z2eMM+s5XwfmtsmYI3Iu1LI+VD
 3cwY5IUbglLC5G6wk1RFDUXZM4yZrSflb6oJOXYA4cIGAORrboUPUaldEW4VJ8ApoiSQOrlHFMv
 1uXqDzK5uoewtYq0cT9895UT9DuH/B9ySZ5F/x59PM2/MmxHFVhx5l/8ny23z2bRJNxA0sgiwQ3
 CMPZsB2DBiL07XxWjCrcH+TGare6gKYo4RB1DK+W90cRKiNBHmffG1ZytYTSOQkYLJYsT35kYbs
 C9vLKw8fMc4QpXuLibQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11970
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 adultscore=0 phishscore=0 impostorscore=10 suspectscore=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=10 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180076

On 11/18/26 10:37 AM, David Hildenbrand (Arm) wrote:
> On 11/18/26 16:20, David Hildenbrand wrote:
>> On Tue, 17 Nov 2026 23:28:40 -0500, Tal Zussman wrote:
>>> This is a first batch of userfaultfd fixes, with more to come.
>>>
>>> These were found by a mix of regular old LLM review and by having an LLM
>>> write a TLA+ model of uffd interactions with PTE bits and other state
>>> and seeing what issues fell out.
>>>
>>> Most of these fix places where mm code loses uffd-wp or RWP protection
>>> while moving or migrating an entry. Userspace then either misses writes
>>> and accesses, or gets pages reported that nobody touched.
>>> There is also a hang in UFFDIO_MOVE, and UFFDIO_ZEROPAGE modifying a
>>> file through a private mapping.
>>>
>>> [...]
>> 
>> Applied, thanks!
>> 
>> tree: mm/core.git
>> branch: thp-7.5.misc
>> 
>> Applied patches will appear soon in mm-next, followed by linux-next.
>> 
>> Please report any outstanding bugs that were missed during review, so we
>> can either drop the patch series or decide how to fix it up.
>> 
>> It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
>> though the patches have already been applied. If possible, patch trailers
>> will be updated.
>> 
>> Note that commit hashes shown below are subject to change due to rebase,
>> trailer updates or similar. Further, this is not a guarantee that the
>> patches will go upstream. If in doubt, please check the listed branch.
>> 
>> [6/9] mm/huge_memory: build the moved huge zero PMD from the destination VMA
>>       https://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git/commit/?id=ec36bf72
> 
> 
> Aaaaaand undone. :)
> 

Thank you David!!

> -- 
> Cheers,
> 
> David
> 

