Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414786;
	b=BAD+HEeUc5lAYxI051+TiOcyPFCSa3IgdKPaG79aYBkLXREor+b1Bouh7qlAZY1HhixK
	 mmyEXXMQKOsPu1eW7H7tFIpmwEGpJm4/NR9WQV4MXO+hTb9I0ad6g/iAv6kOcucb4Qf2k
	 KC/JdNg3oGQlRW5dHLI7falpruJdByhiIADp7ZILfj3T6CcJnttPBQ2jcmpLjABRR+koC
	 aQ3YKwOIEZyQO9q6Jbr1WVvIIEQ5zjCg0c0lTIZMPMSqarTRSbA97PHLCazD354o3GS0m
	 JlcPA3heZV7jjhU++D3XbcQ4SEICT7TbnhfhhDGfNEFazU0soOxzm4Ej9jpYrQifoRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414786;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BF/0+ZUXITScNNxomDscQG5wnwCmvZaai5xQhO9sUeM=;
	b=aBdj/7LliJCdnvoZWZd5wyDXSK/uUKhczf7IeJbHCtwoVWoDhi3vto1Z0C1aY5IPzqbF
	 ZNMsyyhVPCOyaOS6b+aHsBC9XV7i79AYXm36dGBtQsPHKHYYpjtR9tpGBPzemNBay3w+I
	 xZbfnM6zIUwixvS+SxyvCmGDheK/4swUf/X2q+9R7jfKsv1zTGtwIc9R6Goy18aa+MY0i
	 GlsX956eeixH1z/jSNU+IV6Mvho/gthv2SJ6YywJS4WIPEWYeVkFBdhllQl2TmuTEW52t
	 018D5uopk8zxS00e1t+j3SBe9TSeHBi3j/qXlkqPVLAzYLJB/wFn6dhNTx9ByxhPVRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=aJErLLce;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=m5sveQ6A;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3C5606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C3C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=aJErLLce;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=m5sveQ6A
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6H2x91527318
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=BF/0
	+ZUXITScNNxomDscQG5wnwCmvZaai5xQhO9sUeM=; b=aJErLLceONn0l2Dq54F8
	As1H9x/izFTp9OY57U5Faobi5tUkVGFaIiEJtK82FRCiYOLAr3g+rJ3/bb6KTriB
	kk1Wxv8CHIO3PWNtpJQ0ANxzXDaJPXZONLl7yBH+EE9lwHN91IwcRGTQQuZCk5Ni
	Ex6by1+1odkwG4CdEQpKg1sVk0z+dYMPxHFsdHMxBZBrO5RYl8duZVlfuBh6Uyd0
	E8edBG2cRGRi3laQXQdbtlOv6CKhgl3TKoTcbiLU791TjZoUkXugdK/8N/XTXhJM
	yIxZkpa4HUYNiBVb4zC7q+2hya++c5fbM8W+OHOlZpEBqeC4eKtUE9le/5N/WAU4
	AQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j42cx3cs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:19:44 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961ed97d6so534022685a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795414783; x=1796019583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BF/0+ZUXITScNNxomDscQG5wnwCmvZaai5xQhO9sUeM=;
        b=m5sveQ6A86gTPz4ilE0VM1nIaOKtF3frM/MDVA0C7wFc1+3jA87zITWnHBz2E43Dmi
         67BWw7DFBSUvmaBKvV4tFLaGu+fXfbWJGiNVYKebKM3gP4ET+wFZb+TyLRKSC6Wh+UaZ
         6KP0v5LyCTVY5/pOQEhzYwFGsdYiTw10Sei4eH6vGlpZE4Ek3v1bHG/9ONnpkdZfYrlr
         Z1E/RALwoyvYCBRP1ZJjZGOIc6AuamE2lrl/E4G2aMChboJCRi/I3SEGhoDHIbBftPIx
         i2QiPy2+rQCzrUhOONz8nEjlR/Dg6/Wcih3JO9VCshnXpCXHIE9Q7c2ZG/4WuMZBLcb4
         22Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414783; x=1796019583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BF/0+ZUXITScNNxomDscQG5wnwCmvZaai5xQhO9sUeM=;
        b=YYarKhqZuCoA9kCAsmk3lr4yjE1/S5QUqn+LUVkq/N1m5Ph2Tkc3OMXF/GDJHhJ6c7
         cc/BBKfvaefgtTUSzs4Rxq/YoEWXfjq6Po+n4g0zmfdih+lmBjUJBKyIWPWRDtANioBl
         jaGFilaF6R84CPFjOY3pZZ9CLGQA2YS4zQbeHedzSREfHUJUCOAGrUkKKh0fAG65LHhb
         lPE/ukJ38j4yBpQysJs3IculhM0LaagUl0my7HIubRjhTfMga/klIM71pqGGzeQ6+GVX
         RLmqLHK2mRAUbHzL4Wo2bGyrvnZYCGwHWUKVANaR6qFQcliezzqmnKowDC66PUPgvEyx
         9h8A==
X-Forwarded-Encrypted: i=1; AL+hErHavJ0WeijCs6tFiJgEhdqrpL+7VDo9c9sqNtRsPrKfxaVg8hMaKgwPxSa/Y7ArjPoOF/Ejud0DiQIf8tc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nh5Jn5uTPJQe/MGEsaS8CYnCaTZiWIYkHKCKmYNRszjcF+8a+
	7FzD1flZJaJOC596NsqUpu+trkjlTfGF3kh1h8tzwZxzwD/ctBG7G8TNxACig2v6KWE7247m3om
	X/frEhf/Lc8zw0LC197KrJPcvfKK7//Cb+bdBbibCskGe6H1dwwaMJCDns0WdLw==
X-Gm-Gg: AZFdTZe2PY+gCZ5WAWyWQi74TScB84E6yqPyv9YdJEAU1njL3Ahb7AUyYhJ2O0tuCG4
	/oK/0kgh44uxn9i1iZRMVpe1y1c3E2R2ztGik5R+bPgiRMpqGkgiDG7307txNq2LpxY7SAO5uX+
	g1jVd/tGGmA23pzz5QxV4OVNc8KIJm2nJV42mYn4KWiuujNdwn0guDJIYbVqhPQSGnd0A9UH1W1
	J3Cwuda7c+i+jEsnG5g+iDB1d6z5EHonW4t+2seA5o0dXL64H1kMXSP61/mdoyx3VMh/NNNyPSw
	+HnWDBbl41iR3nS/YzQrJ6ALiKQOdyLp4MaAny8ish9sbqm5dtvJSERJbbODprA+S1HVHhSoMZq
	n3wPiJhR/SE4ti6j1FiAypmCP56/O+3hBqGfp6FJURqLE3O5QtLgg91iI1Z9cNCKKetVDhLVKSH
	uvHTjBKGjq+GxwqhxqOrMNNYbwNWEziC39dTJBLe94ssMQMFnguCrLylyEniCNFPq83xw1gZfnj
	yPk4APV3PEni9v/n/vCFl4ub4qaM1h0Ri2ZHWOZcUx27DaiDxX2Niexe+rk/aCqB8qJgKOpZlR9
	uYrGZM83Rfr5DoXXkAGQKTA=
X-Received: by 2002:a05:620a:3c8d:b0:949:b99e:1d6f with SMTP id af79cd13be357-949b99e22ffmr1153850585a.0.1795414783572;
        Sun, 22 Nov 2026 22:19:43 -0800 (PST)
X-Received: by 2002:a05:620a:3c8d:b0:949:b99e:1d6f with SMTP id af79cd13be357-949b99e22ffmr1153848885a.0.1795414783255;
        Sun, 22 Nov 2026 22:19:43 -0800 (PST)
Received: from [192.168.0.76] (dyn-160-39-51-212.dyn.columbia.edu. [160.39.51.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41c105sm746775285a.39.2026.11.22.22.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 22:19:42 -0800 (PST)
Message-ID: <08b18b88-3ab4-4681-bec8-f4564fe9f1dc@columbia.edu>
Date: Mon, 23 Nov 2026 01:19:42 -0500
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
Subject: Re: [PATCH v3] mm/memory-failure: set PG_hwpoison of a non-hugetlb
 page under hugetlb_lock
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: David Hildenbrand <david@kernel.org>,
        Naoya Horiguchi <nao.horiguchi@gmail.com>,
        Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, tz2294@columbia.edu,
        stable@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20261106-hwpoison-hugetlb-ro-v3-1-c11186963647@columbia.edu>
 <42a60f57-5323-f981-8ef3-2e5d67623902@huawei.com>
 <a87cbd92-0e07-4f84-9a6f-8db0b1778fcf@columbia.edu>
 <b0f30561-aabf-2bf5-2204-20907c40ef43@huawei.com>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <b0f30561-aabf-2bf5-2204-20907c40ef43@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfXyB8D3WXZKzIY
 ntYHH3yvSg1KmZCyVwsv2fbWd/o1MajUHBsIIaujZXVqDzd2r/xolllScZR1ktTXduj+6MHTpez
 srMvTg9aQE/T2N70NpFrhprLM8drozpaPz4mIud2tpH5vPc2Ijij
X-Proofpoint-GUID: ucU75_8SnYOQbqncDzJW9ZzXH8GWTgDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX/z37qcOwC9c7
 3qzODef2tEYex2ykyF2N9uA60xKICKSaNopdYK5m/8I+FZVwca7XZGJJVfv0TTsU7pOzmUmFrSR
 WLJTigd5h+awDwwqhuFy3y97yj0npcxTI5CgVtVKq51pPDGAGQrxgtSAp939zMXzW0IoAGn6zO1
 ZEzjv77FRYzX9u63sngVGhIWBXhGeEqK+Yjjfzn8USt6ENGv/mN04ioWweL3mtxwmiwBjWDpnpJ
 6m2avUT8INIYVz3Qu0/nh3TuoaDcmLhGes3aAHwDGydUhS41O/w8Rq2YyImbK5IBPAelcL5aSAv
 KCVZnamfl5bUTyFkXFoRq+zhPfjdNbF705+kYSs3Hi84iMhfbuK3nPqZxmX9R9Gxjndu88M0km2
 1k8TIPcSQX1JpBFiLwuGrIhGh3hh60Ad/0tz3VSpK85jbDhstB1heTvO2Lxqggp3w1975OmDcIu
 DAxc0ViXd26AEZNz1qQ==
X-Proofpoint-ORIG-GUID: ucU75_8SnYOQbqncDzJW9ZzXH8GWTgDz
X-Authority-Analysis: v=2.4 cv=GNOdgeNK c=1 sm=1 tr=0 ts=6b03db00 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=l9izRfKDRJJ6Wn/vzKnQSA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=ZeqcaTA9yHy8FKGpf-oA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11974
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=10 priorityscore=1501 lowpriorityscore=10
 bulkscore=10 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230024



On 11/17/26 2:01 AM, Miaohe Lin wrote:
> In both cases, will the hwpoison flag be lost? If so, would TestClearPageHWPoison work?

Only if P's struct page is past the first vmemmap page, since HVO frees
that one. In the first page it's copied, so the flag stays. And
TestClearPageHWPoison() is still an atomic write, so it'd fault on the
read-only tail (e.g., 6.6) the same way.


> If the page becomes hugetlb, should we skip the retry path? try_memory_failure_hugetlb
> can't handle this case?
> 


It can, the only problem is the stale flag from the first round. With 
it, hugetlb_update_hwpoison() thinks the folio is already poisoned if
P is the head, and unpoison_memory() drops the folio ref twice if
P is a tail.

Now that Muchun's vmemmap_remap_rwsem is in mm-new though, I think we 
can just clear the flag under it (unless HVO already moved P's struct 
page to the shared tail, where it's gone anyway) and always retry. 
That'd also let us drop the hugetlb.c part. WDYT?

Mani
