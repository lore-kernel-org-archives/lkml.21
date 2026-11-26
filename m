Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795659929;
	b=x4KrOx8e7KzBmTLpTUnst4EXXG36P7NkT0au95zV/2oLcmgTF0PtuS7UXXnWTcLrYuTT
	 bGZN//VcOAyE3NCdUvpY6v61LXQk+YxMq5be1X56yzBnKyraAE+vTsACHu7hxm9kv/cji
	 UdepNCL5qEOxWBZIGFlbZvD6spNxGlEjhV1M2xEM+luCkjhQ5/15m1fypE4xGhIdsnkzy
	 ptD3jqKWD9/1748n902P1iwAUXJxC4OHMcwu3stBOkYvhZI3EgAjguqr6nOGpJ08+izia
	 38mjfqLtrU4LhAeyzVzurAWUnlEdEyI9u6ecb4qYRp5fIzsCajZTe4HxsOloqnATHVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795659929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bq5K8Z87IavuvaaKNiqMth7LGJ8zdX5mtp1Bwcp67Uc=;
	b=Fjkg/jxQ4a9cnJldiFMK2yDDxzJEzNheIcPVlFNgfgDjyeuCGE+Lz1I905JQLeTFoKkw
	 92kV0GCPmgll3j+rMsL+f8Ktf6b+ruUDU0pHyLd+vKioZ5dKOabPpOnKAt5YGcPA86ZhF
	 +4MBFmV0b1xZAzQ8YGf3//px4nShhO/ylD4TKgJtOQo7q064yg5yZWKqG4bBJh+ZBfTlg
	 xb+Vf+cbbPwdL+D/V8wVX7ez3km5rKnhiXCRGdFsDLwDof1L2Fci5nXbm6G6DSy6djoJf
	 sCtI0VhEfQDcd1YrzoXWdqygdxcTrL1zpfRXYl08dYc01hNzJ/q4/g1lN2IvxmkCLfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=azAUGPgc;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Ki+KHe6M;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BF2606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3BF2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=azAUGPgc;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Ki+KHe6M
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ1Y2Jh2561884
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=bq5K
	8Z87IavuvaaKNiqMth7LGJ8zdX5mtp1Bwcp67Uc=; b=azAUGPgcRU1jSI5UcEdk
	lX/Oam7hV0qSGuaoRoZ76iTO+yUv1p2TSRxSWqw/GV116U6mifykV1LTK1RDVF4I
	iKOPSY3PSz8vfny7Ha9obUkbMW6zmIsYItSxjLycctsWrDJ2rP2Qa4yaT+QQ9KqU
	+4dz298p9gibceQ5lCgFjd5gQzpe1qreD1yq7bVWWajVHsF3DL8u2w+MyeG6JCax
	6uARcxrpY97cBRd9pD/9MBjtHydvImyxeSEwdpM3USUiXBCQARMKKoJ4GgI1FvmR
	xUwASOZFEFsMGQAO+s7arILwa8QlmuqSFhjk/ZCiUMSZ1ZhwWwfuQrgDVwgAtLqi
	3w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j68c8h31g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:25:21 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131befso938702685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795659921; x=1796264721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bq5K8Z87IavuvaaKNiqMth7LGJ8zdX5mtp1Bwcp67Uc=;
        b=Ki+KHe6MDEgfProqRIGk0un22f7ITJdGDVR8RFLPbBwg0ny1Bmym8YPhpeZ5n8UlJd
         uG7LtT0XBxXgDmmNj5VuE8pkpIlTsmrOYMww30ypNhH3jQGBmDe/EyrlIGJ7jfYGlEL4
         7qYCGuERLyRh2UNAj2kvUeVApVok7C9JRl8404UQg3FXcsPs+CyLH4KFqOWFLRL3Ll7q
         ARh/AYUGKeJJuaXrpWt34OkALRiyTeYrlsd84E/N4Fe1r6aiLKwda5YULwMZWtlFQtI/
         bCN5U4LkQ4Tf7erCDpoVEO1+B3yiqWYQ7ntypEgKTJuWN2IyZs1VtR/yv8W48b1FM+wm
         eTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795659921; x=1796264721;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bq5K8Z87IavuvaaKNiqMth7LGJ8zdX5mtp1Bwcp67Uc=;
        b=UkRbs91LmF6h8fsAEqRwD+E6oIV3X0LOMf2fdh49PfMw2ngLf6LOSmo8YX0xrWCFto
         3Q0bSxffyE/q2MdSQBlv95S0g/rEqEZAVHK1Gu+oRp/96BRf7XGwLjb6FBTf/fD3+fwP
         rQ4hVtQNy+kkfdxGgP2x0JdCUxrqPXA7zm2YQr4F2o7RlBCmowF1KdVeTQVnBZL2W9r/
         nvq68SF1UWU2tcKvLwkI2tt6f7+ZtIL+PHodiVCpqyz1+vnnq3W6Xl24kMoqLs2+4yGI
         qlC5HFaMMbQhrqPbcTPu1MlI5xQq8sNTyg8kGofe1T8V0fdHu+QhGOCAHQfYVl0EN5fh
         N0DQ==
X-Forwarded-Encrypted: i=1; AL+hErGSujL+yTTq6KDFwzhPVLfKrdPFOhemnJDKttlU5SxLrQOTXRO6eROI9LLWxVRecNmRSE2gW5E5pNP+wtI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BPwj2LxqdoyZ39/YKuW3tXjeYylt8ShE6Ru94NH9K2MI80Shf
	PCFpiEVIQ9mvOk9xlnDkrHie85nuhR0IBgZx3gOs/8vAi/ZYI/oNOI9TBKFOrl/v0Q3loJplwFr
	X0T0Ngu52ZcafWxiHcFi+4YfM2Fp5rZPqRgTNC/BxCRR5dDegBdebqGA+dWsloQ==
X-Gm-Gg: AZFdTZfA8M/aI/UIyKmCxyvz+E0+3c85c3Y/ax7Kdaiaocbi1xmI34i2ZZBVYbnBAY+
	6kbAA/vx2jC9s5x1Qb0VnsEmHItFS1NIqCzGLF2IiUNVv/k5uXuzJGr8CfR6p+K93F4+Yw4PAHq
	RjC7/samb/aEWXw7kkX0JOr3C+jpBi7xNjl2nVpMi1/dgtzzlNisGlRbSKmJAvizhAuGeD3cZrL
	tsQPP4d6xboyGa9o8ntj8b3GJXZIr3xVEWXR+mjDfSup1AiwinBhepcqoIaFP6sidb9330Lo4Wq
	D3Bc2scL3P2KC086/KEJ8yN+MwSLb/3VINDDmN74eNH3RqdiL05T43WtVOvfsliLnOZfayJW/7r
	3VXgRv9GonBHyIs8I4avVwtFQ4n1eGc766uSLM8aeTW7b2Scs/CJBZBF2vXpe+TCJpCRivX/77N
	ZzqZLRcW4F+0omBv5QcCC92KHNuBbYpa0=
X-Received: by 2002:a05:620a:1b8c:b0:949:7920:9d09 with SMTP id af79cd13be357-949ba99fdd3mr3499403885a.35.1795659921395;
        Wed, 25 Nov 2026 18:25:21 -0800 (PST)
X-Received: by 2002:a05:620a:1b8c:b0:949:7920:9d09 with SMTP id af79cd13be357-949ba99fdd3mr3499401185a.35.1795659920987;
        Wed, 25 Nov 2026 18:25:20 -0800 (PST)
Received: from localhost.localdomain (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ae74sm1452063385a.8.2026.11.25.18.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:25:20 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev,
        Pedro Falcato <pfalcato@suse.de>, John Hubbard <jhubbard@nvidia.com>,
        Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>,
        Zi Yan <ziy@nvidia.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Peter Xu <peterx@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>, linux-ext4@vger.kernel.org,
        linux-nfs@vger.kernel.org, "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Kairui Song <kasong@tencent.com>,
        Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        Baoquan He <baoquan.he@linux.dev>, Michal Hocko <mhocko@kernel.org>,
        linux-fsdevel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] mm: GUP dirty + ->release_folio() fixes
Date: Wed, 25 Nov 2026 21:24:18 -0500
Message-Id: <20261126022418.3620783-1-tz2294@columbia.edu>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <d088452f-1118-4a06-bc16-1942e523e0fc@kernel.org>
References: <20261119-gup-dirty-what-v1-0-236d69f25c24@suse.de> <4f096d70-6f94-4148-8f47-242b8551e5f9@nvidia.com> <awWNyDZT2SVu2Zp9@pedro-suse.tail5790ac.ts.net> <55114986-0ba1-4a80-8498-bf674d64e01b@kernel.org> <away88BuU8ibcTA5@infradead.org> <d088452f-1118-4a06-bc16-1942e523e0fc@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwOCBTYWx0ZWRfX8PgEdiXbDED4
 HOdPV5zpqG1qTyqQEpe2s6P+aLAu3pi+aSQ9o5hpEo7Vfoha5Wp76i/+2HU4WpUrFF5TOPyBYzL
 HxvL4OXuNLC0bu+R8yk/B/vraG6OU7FvCeV10RckJv2IM2Hwn8llNDD1ReYmOS1N9gwhS3qxhrI
 Fq5syojVLdQAqr1W5WxON4YmehFp+GEfySY03Ea/aOdyX/pFYVgXAeIj1JSQspZVmHLhmwMi77r
 tW5pSJVJFpp/yUUtzwB54d+I28Z1mk2OpSY1YZzjaQ7+HoUBA3/b9jPdLPcDu9J5LzzUUiJRNn+
 E8AoxhM2rhjf5U9MXsdr4WFGCSn08nQdUXUfoolA4QOxbDH1lwWwSLAufg1OFq9+thMaMZ0eqYa
 /3gYWQorthEln3x/wQ5pM9ELEYCe2Pj/JIpB3Khl142jIdq5SeB/KyKUKNyCMKUQ7R14eRKYzSe
 SJ2/mZOVFvKnkICTpXA==
X-Proofpoint-GUID: LB8stTAmyonNils4Md0pX68dWQp1d7As
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwOCBTYWx0ZWRfXw3xzpDTmMKk6
 gwhqyRLUjQj3WGi66vv9rCBYt1N/k/WqXyjJV7FAiM+aHZnUh117F61rXFErcx4T7NogYYkFPgv
 TXLhPh1XCK6KWMKJAltiW4fW+fZWJcfJP2h2GrLjIBc+eeToAlq6
X-Proofpoint-ORIG-GUID: LB8stTAmyonNils4Md0pX68dWQp1d7As
X-Authority-Analysis: v=2.4 cv=dcoVTnXe c=1 sm=1 tr=0 ts=6b079891 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=VwQbUJbxAAAA:8 a=X-ZpGw2H3ZcMOUJhEmsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11977
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=10 spamscore=0
 lowpriorityscore=10 bulkscore=10 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260008

+CC Miklos

On 11/25/26 5:19 AM, David Hildenbrand (Arm) wrote:
> On 11/25/26 11:05, Christoph Hellwig wrote:
>> On Wed, Nov 25, 2026 at 10:50:42AM +0100, David Hildenbrand (Arm) wrote:
>>> 1) We fix all such cases now where unprivileged users can trigger this,
>>>    converting to FOLL_PIN.
>>
>> We need to, if not for this series then for all the other outstanding
>> issues with GUP writes.
>
> Cool, and I agree (that's why I placed it at 1).
>
> But who is "we"? Because I recall that "we" wanted to do that a while ago.
>
> (I won't be "we" ;) Pedro, can you take a look? I'm afraid the fuse thing might
> be the harder nut to crack)

Coincidentally, I sent out a patch to convert fuse_copy_fill() to use
iov_iter_extract_pages() a few days ago in order to remove its usage of
set_page_dirty_lock() and address a different race. I think it should
address the fuse side of this issue as well.

https://lore.kernel.org/all/20261120-fuse-copy-fill-pin-v1-1-72a0d888f140@columbia.edu/

Thanks,
Tal
