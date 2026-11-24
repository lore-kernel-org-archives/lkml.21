Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549041;
	b=P4ZzCGxa57dXgHRhnZfucWCPoIaeOsRciTY6CDCTiyt7tFGk8kGkXkC3IuGiO5AxGmHc
	 jirx1G4lFaUS2f38Xm1jfextJ/IMxA1sAJT2kacOOPn4T/Mvx24TrxpYB0FltBj6idPKp
	 u6dD+sevPnjoALZcztPbun2N26/adIzaOsnUkYtNMMMKQTZKjkX2pOFYJXRaCRfQ4XC9w
	 Jxo6QyyzPnheE1m0Y7iQyHCBV7Mrgp/Zq4OooUAG2N4T54I5x8qlpC5fx3jKAE4urgz1W
	 EX2tJgJgOfFPs8fIoFRy0nlCwjnj2Zx8u/VSmGhs1h2w5K8UIgSFdV7Gd7rcEpM/pLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OMjgnMOdm5LC9Ve7tJbATj56ZsHM2zVs1s6tMJ9jz2Y=;
	b=xbf3Y+gnruSZIFnNEFgf/B7Q4doOS0oW9zpesXR8LjVMWO/tSyw3duLi639Q4xh9rxLl
	 T/4Kxh4cJqiryCyBkLOSNtbgXeFjTBnHJ6Tt+N/yKmv6erZKn8kj8L/jfU3EYaMWF81li
	 Sd52lk5UcdQ4MkFaDuHZQM4EIQmLQEW1yHc99j5SMBdf2CL6jO0QG/9pLauhCMNZZyNRv
	 0BZJTNSNFo55UJQyY56Y5ChX7V4ZJTkx33nJu2Zb9KeOZsI2ZK8wH9jsdlZdLAiXyZIAg
	 K+Wg4OrrwkoPGYGtuf9XYq038A0EfearCYm/jP4yXtv5nXiDqCggoxzad96mNWKKudg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ArQqb01A;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="b7CR/Rfv";
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFEF606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBFEF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ArQqb01A;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=b7CR/Rfv
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJYQ1q3474038
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=OMjg
	nMOdm5LC9Ve7tJbATj56ZsHM2zVs1s6tMJ9jz2Y=; b=ArQqb01Alvqy+ezQ3O+b
	wFGaLKLkRPslDfTTnR/1n3YHEnzFvpSAXsSLtAema3OMBGvQTr8MjsfnQdizF1DR
	Y35c9K1YbdbrokVp6lJBFIYVrUHqLLS3WYYBtEDDKg/6m1bODWncA+LZwiNP1MH8
	Z3bx2LUxG6sfpmxDdUI+/kyZI7guQlRgIUWOBYQ6reZ57nqjYw3JFREOmJXGhsy0
	5UyyJqrfI8VjX2MlX1xqtk46jQix4pqRNZv16i1aL2PIz3aAJytU8fQlN33iF7Uo
	xruvXaD2EFNKvtzNiOaeLj7AUiUNlwagsbKMIv+l5TRcoparlTssaELubPi31AEG
	DQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j5dqcj8r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:37:14 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536778a8137so87210751cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795549034; x=1796153834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OMjgnMOdm5LC9Ve7tJbATj56ZsHM2zVs1s6tMJ9jz2Y=;
        b=b7CR/RfvfQFhd7RLSUV7lty/ZLnME/O3SIVBqogZpBKc5kWbTS6XOXLLtHAdx6qPnr
         GLx9wIF4Ww4QBBzLi1rfOBnuxr0JAv1yTnG4pUXExvThtMqTc97cKp+Z1h+pCVB4nXRo
         tgx8ds6qPdyVt2BG0hZu7Js1CUMYgRQoXbcHZ2L8eyOM8lgOjUJPCl7yqCAjRMmEMl8w
         7yEG3GKOnP3k9k9ABIteGqF13sEWTiupKHLO7WWmzv6jE6HmUFHqQtTtep4guibr4fvN
         fCeMtXZBo8LG9rK/kdXoR7e8/Boax5ngkEHQ2+xMkquXqR4MIvpygOuBEgr7JOmObhVL
         QKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549034; x=1796153834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMjgnMOdm5LC9Ve7tJbATj56ZsHM2zVs1s6tMJ9jz2Y=;
        b=MLyAkJhbPk9aHEPP1aHNCwOmi5hTj+/RlmRUonVFFinloSPOjvNGLp0CgQPK4HoRes
         /dloGTrUD1JEBCEJLEzcoatDd2hljrDRLKrt7Kw0SmyQhjQ+U8cr0qU3gVJoMkU1WloO
         sd4vi6vXnfe6m2UiRyoekl5PkrbFvfBLVTDyJrhq2tPteaE708FSzHetqxb3VFfy5qLT
         o4hA3kic2Uxqo6cMmmBUsY0AHXBugQWKDIfFKg76VvuqtmsIrSnKNT4CdLPCnwCqzAMT
         w34WAGS3bX33Cea0zeVl/1gK9N3PWW6qisjr51dqZAY99OXT0gZBixogl9HSqNhgRlIM
         nUew==
X-Forwarded-Encrypted: i=1; AL+hErH8I7VC/Ja04iPv1kwW7/AE8kmFT0ByO+5gfXwqSFfsVwPZ+AaiBMfYpX7A2TWIR0M7YnMZE3wGNN9O35o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9NmyeC9QPoWlgr7thUuu23L3udcVwzs7FrGumI6ITYa+30t5q
	1ie5loJnJ/QB2QURxD6zwDbJ7EtARhcQ3eaLyv3RZX4VuFbH0K6wb13jX5qhJeArQF6ThzzkiZi
	iu3T0X9K5/4HGulVXDUei8+H5/rgUA7j2x+PJBBh8fSDDrT056kKgAJI7JxKzfQ==
X-Gm-Gg: AZFdTZcrNXCDdoleyO8vlLQhKL36qAy+nHjdkfmpXD6TI6Y5TibY6qIWLvNLMyh2Q4L
	he36W4s8BZJVuhDiCrlISmTzTM5pIaVUgqEaS2qQfX4+HKRBS4DbdFfpyJoowIggG9BoFtJ5gnP
	0hk7SnRw7Nf8R0FmgS+W6lBca4KGyf3CZMGpaaDu38TkLAoHjaXfNCkhyqfIu0HUtofZ8Xw9G1x
	ERroZ+ljfnhRAq8cMg8ofvv+a+MaLjbTXjMS6MNGTDWYXLrOqUhp3c51OUpvgC3z5DBHcm3C6p/
	jTO1uwtrVzcSsgo5kr07PmiGAf6jzcVSmmQeG401Yncary9oA/D2pk6q8p27WZGh1DhrIZEixFr
	JyOtgWP37wicIGamk6Bme13s64lJbjcUV0cXqTcK1uAEkZQ5E3tV7tt9c0BGndWht7A==
X-Received: by 2002:a05:622a:313:b0:55d:1944:a2ab with SMTP id d75a77b69052e-55d76a5af8dmr288718481cf.49.1795549033829;
        Tue, 24 Nov 2026 11:37:13 -0800 (PST)
X-Received: by 2002:a05:622a:313:b0:55d:1944:a2ab with SMTP id d75a77b69052e-55d76a5af8dmr288717631cf.49.1795549033344;
        Tue, 24 Nov 2026 11:37:13 -0800 (PST)
Received: from [10.206.101.158] ([129.236.231.128])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm140631006d6.41.2026.11.24.11.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:37:12 -0800 (PST)
Message-ID: <3ebb01ea-fe77-4467-a1de-7f30a91593f3@columbia.edu>
Date: Tue, 24 Nov 2026 14:37:11 -0500
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
Subject: Re: [PATCH v3 0/9] userfaultfd: assorted fixes (part 1)
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
 <4f23b0bc-b89a-46c1-b8cd-853e7815b7ac@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <4f23b0bc-b89a-46c1-b8cd-853e7815b7ac@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Na9zRGD4 c=1 sm=1 tr=0 ts=6b05e76a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=LNQXEAmb7IHcZyFqmLK0PA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=Z7cX3StJxvrjZLnT-lEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3NiBTYWx0ZWRfX+K+YvS6qzfoK
 58iei9L3Xmao8jv0Po3gPbrS9tC3POqnztOYskRqLasWHFWvcs96Qre5JHvAK2gxxptJ6uGs0+2
 N1FnTgKdho0WLvXa5OxX7eNZKhpZzjQ3BPCkgURk5MPtH+v2FPgL
X-Proofpoint-ORIG-GUID: A4Fg_ByE_HSZ7EOyMwk6UOqBzTIy1oUd
X-Proofpoint-GUID: A4Fg_ByE_HSZ7EOyMwk6UOqBzTIy1oUd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3NiBTYWx0ZWRfX4IMoGRDgBde8
 y2TXH3bs2wu8ofn+KNYnpSNxhlW+OJiu3IKalMtHrgN83ZIMOoXYVYd9GbgcStTKAtAsUIBbCIu
 qPymKwNF11YKhrpCKwB9uO4ddQm+21nPULJPQBVMad4S4XDNNa1ujS3PHxyKcUFaFkhs8TFqTkk
 D0cnvRJomr3mhQZBpgaUvW0ZcBFtV+BtUsrEx45Nz1C3cMNpAdKKdjTUl59odCMx8eMbIwo+2Oh
 ovPydO5tgUj8YM+t4GK0SGNkKS68LacgFRnsqL/XjpoyLRMnwyQCmlaeK6EJq4jt9KhIV1MNgQX
 omvdE15gD02QNDGFabEZNnL0TiiCZJ6HrTYPwk8BjqtSax5hQVMfsTQf4xrMDsN8HIL6FU44kpO
 ks1ESYHw0f5nuLaW516LK7MaDBz7GfK6NqetZztOVRE9RTsHKmo3ZtXXtDeO7ZsMsIN4KUW0Wov
 KadZpnRk8zzM4v2VWLQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11976
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=10 priorityscore=1501
 impostorscore=10 phishscore=0 lowpriorityscore=10 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240076



On 11/18/26 4:41 AM, David Hildenbrand (Arm) wrote:
...
> 
> So, I would be picking up ...
> 
>> Tal Zussman (9):
>>       userfaultfd: use anonymous memory for UFFDIO_ZEROPAGE on private file mappings
>>       userfaultfd: refuse UFFDIO_MOVE into a non-present huge destination PMD
>>       fs/proc/task_mmu: downgrade writable migration entries in PAGEMAP_SCAN write-protect
>>       mm/migrate: warn on a writable migration entry with the uffd bit set
> 
> This
> 
>>       fs/proc/task_mmu: write-protect device-private THPs in PAGEMAP_SCAN
>>       mm/huge_memory: build the moved huge zero PMD from the destination VMA
> 
> This
> 
>>       mm/mremap: resolve uffd state when the context is dropped, not during the move
>>       mm/migrate_device: do not migrate a uffd-protected zero page
> 
> This
> 
>>       mm/userfaultfd: check the hugetlb alignment of every VMA in the pre-scan
> 
> 
> After waiting a bit longer for more review. Andrew can take the rest.
> 
> 

@Andrew, could you pick up the rest of these (everything but 4 and 8)?
I'd like to send the next batch of uffd fixes I have on top of these.

Thanks,
Tal

